package com.ruoyi.web.controller.system;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.attraction.domain.TourRoute;
import com.ruoyi.attraction.domain.TourRoutePoi;
import com.ruoyi.attraction.domain.PoiPoint;
import com.ruoyi.attraction.domain.vo.TourRouteDetailVO;
import com.ruoyi.attraction.service.ITourRouteService;
import com.ruoyi.attraction.service.ITourRoutePoiService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 游览路线管理Controller
 *
 * @author ruoyi
 * @date 2025-12-11
 */
@RestController
@RequestMapping("/system/route")
public class TourRouteController extends BaseController
{
    @Autowired
    private ITourRouteService tourRouteService;

    @Autowired
    private ITourRoutePoiService tourRoutePoiService;

    /**
     * 查询游览路线列表
     */
    @PreAuthorize("@ss.hasPermi('system:route:list')")
    @GetMapping("/list")
    public TableDataInfo list(TourRoute tourRoute)
    {
        startPage();
        List<TourRoute> list = tourRouteService.selectTourRouteList(tourRoute);
        return getDataTable(list);
    }

    /**
     * 导出游览路线列表
     */
    @PreAuthorize("@ss.hasPermi('system:route:export')")
    @Log(title = "游览路线", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TourRoute tourRoute)
    {
        List<TourRoute> list = tourRouteService.selectTourRouteList(tourRoute);
        ExcelUtil<TourRoute> util = new ExcelUtil<TourRoute>(TourRoute.class);
        util.exportExcel(response, list, "游览路线数据");
    }

    /**
     * 获取游览路线详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:route:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(tourRouteService.selectTourRouteById(id));
    }

    /**
     * 新增游览路线
     */
    @PreAuthorize("@ss.hasPermi('system:route:add')")
    @Log(title = "游览路线", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TourRoute tourRoute)
    {
        return toAjax(tourRouteService.insertTourRoute(tourRoute));
    }

    /**
     * 修改游览路线
     */
    @PreAuthorize("@ss.hasPermi('system:route:edit')")
    @Log(title = "游览路线", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TourRoute tourRoute)
    {
        return toAjax(tourRouteService.updateTourRoute(tourRoute));
    }

    /**
     * 删除游览路线
     */
    @PreAuthorize("@ss.hasPermi('system:route:remove')")
    @Log(title = "游览路线", businessType = BusinessType.DELETE)
    @DeleteMapping(value = "/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(tourRouteService.deleteTourRouteByIds(ids));
    }

    /**
     * 获取路线的POI列表（带序号和详细信息）
     */
    @PreAuthorize("@ss.hasPermi('system:route:query')")
    @GetMapping("/poi/list/{routeId}")
    public AjaxResult getRoutePoiList(@PathVariable("routeId") Long routeId)
    {
        List<PoiPoint> poiList = tourRoutePoiService.selectRoutePoiList(routeId);
        return AjaxResult.success(poiList);
    }

    /**
     * 为路线添加POI（支持批量添加）
     */
    @PreAuthorize("@ss.hasPermi('system:route:edit')")
    @Log(title = "路线POI管理", businessType = BusinessType.INSERT)
    @PostMapping("/poi/add")
    public AjaxResult addPoiToRoute(@RequestBody Map<String, Object> params)
    {
        Long routeId = Long.valueOf(params.get("routeId").toString());
        @SuppressWarnings("unchecked")
        List<Long> poiIds = (List<Long>) params.get("poiIds");

        if (routeId == null || poiIds == null || poiIds.isEmpty())
        {
            return AjaxResult.error("参数不能为空");
        }

        // 获取当前路线已有的POI最大序号
        TourRoutePoi queryParam = new TourRoutePoi();
        queryParam.setRouteId(routeId);
        List<TourRoutePoi> existingPois = tourRoutePoiService.selectTourRoutePoiList(queryParam);

        int maxSequence = 0;
        for (TourRoutePoi poi : existingPois)
        {
            if (poi.getSequenceOrder() != null && poi.getSequenceOrder() > maxSequence)
            {
                maxSequence = poi.getSequenceOrder();
            }
        }

        // 批量创建路线POI关联
        List<TourRoutePoi> routePois = new ArrayList<>();
        int sequence = maxSequence + 1;
        for (Long poiId : poiIds)
        {
            TourRoutePoi routePoi = new TourRoutePoi();
            routePoi.setRouteId(routeId);
            routePoi.setPoiId(poiId);
            routePoi.setSequenceOrder(sequence++);
            routePois.add(routePoi);
        }

        int result = tourRoutePoiService.batchInsertTourRoutePoi(routePois);
        return toAjax(result);
    }

    /**
     * 移除路线中的POI
     */
    @PreAuthorize("@ss.hasPermi('system:route:edit')")
    @Log(title = "路线POI管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/poi/{id}")
    public AjaxResult removePoiFromRoute(@PathVariable("id") Long id)
    {
        return toAjax(tourRoutePoiService.deleteTourRoutePoiById(id));
    }

    /**
     * 批量更新POI排序
     */
    @PreAuthorize("@ss.hasPermi('system:route:edit')")
    @Log(title = "路线POI排序", businessType = BusinessType.UPDATE)
    @PutMapping("/poi/sort")
    public AjaxResult updatePoiSort(@RequestBody List<Map<String, Object>> sortList)
    {
        if (sortList == null || sortList.isEmpty())
        {
            return AjaxResult.error("排序数据不能为空");
        }

        try
        {
            for (Map<String, Object> item : sortList)
            {
                Long id = Long.valueOf(item.get("id").toString());
                Integer sequenceOrder = Integer.valueOf(item.get("sequenceOrder").toString());
                tourRoutePoiService.updatePoiSequence(id, sequenceOrder);
            }
            return AjaxResult.success();
        }
        catch (Exception e)
        {
            logger.error("更新POI排序失败", e);
            return AjaxResult.error("更新POI排序失败：" + e.getMessage());
        }
    }
}
