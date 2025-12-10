package com.ruoyi.web.controller.attraction;

import java.util.List;
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
import com.ruoyi.attraction.domain.PoiPoint;
import com.ruoyi.attraction.service.IPoiPointService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * POI点位信息Controller
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
@RestController
@RequestMapping("/system/poi")
public class PoiPointController extends BaseController
{
    @Autowired
    private IPoiPointService poiPointService;

    /**
     * 查询POI点位信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:poi:list')")
    @GetMapping("/list")
    public TableDataInfo list(PoiPoint poiPoint)
    {
        startPage();
        List<PoiPoint> list = poiPointService.selectPoiPointList(poiPoint);
        return getDataTable(list);
    }

    /**
     * 导出POI点位信息列表
     */
    @PreAuthorize("@ss.hasPermi('system:poi:export')")
    @Log(title = "POI点位信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PoiPoint poiPoint)
    {
        List<PoiPoint> list = poiPointService.selectPoiPointList(poiPoint);
        ExcelUtil<PoiPoint> util = new ExcelUtil<PoiPoint>(PoiPoint.class);
        util.exportExcel(response, list, "POI点位信息数据");
    }

    /**
     * 获取POI点位信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:poi:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(poiPointService.selectPoiPointById(id));
    }

    /**
     * 新增POI点位信息
     */
    @PreAuthorize("@ss.hasPermi('system:poi:add')")
    @Log(title = "POI点位信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PoiPoint poiPoint)
    {
        return toAjax(poiPointService.insertPoiPoint(poiPoint));
    }

    /**
     * 修改POI点位信息
     */
    @PreAuthorize("@ss.hasPermi('system:poi:edit')")
    @Log(title = "POI点位信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PoiPoint poiPoint)
    {
        return toAjax(poiPointService.updatePoiPoint(poiPoint));
    }

    /**
     * 删除POI点位信息
     */
    @PreAuthorize("@ss.hasPermi('system:poi:remove')")
    @Log(title = "POI点位信息", businessType = BusinessType.DELETE)
	@DeleteMapping(value = "/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(poiPointService.deletePoiPointByIds(ids));
    }
}
