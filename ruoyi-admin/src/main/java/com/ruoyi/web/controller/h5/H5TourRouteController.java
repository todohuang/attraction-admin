package com.ruoyi.web.controller.h5;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.attraction.domain.TourRoute;
import com.ruoyi.attraction.domain.vo.TourRouteDetailVO;
import com.ruoyi.attraction.service.ITourRouteService;

/**
 * H5 移动端 - 游览路线接口 Controller
 *
 * @author ruoyi
 * @date 2025-12-11
 */
@RestController
@RequestMapping("/api/h5/route")
public class H5TourRouteController extends BaseController
{
    @Autowired
    private ITourRouteService tourRouteService;

    /**
     * H5 - 获取所有已发布的游览路线列表
     *
     * @return 路线列表（按sortOrder倒序排列）
     */
    @GetMapping("/list")
    public AjaxResult getRouteList()
    {
        TourRoute query = new TourRoute();
        query.setIsPublished(true);
        List<TourRoute> list = tourRouteService.selectTourRouteList(query);
        return AjaxResult.success(list);
    }

    /**
     * H5 - 获取路线详情（包含POI列表）
     *
     * @param id 路线ID
     * @return 路线详情及其POI列表（按sequenceOrder排序）
     */
    @GetMapping("/detail/{id}")
    public AjaxResult getRouteDetail(@PathVariable("id") Long id)
    {
        TourRouteDetailVO routeDetail = tourRouteService.selectRouteWithPois(id);
        if (routeDetail == null)
        {
            return AjaxResult.error("路线不存在");
        }
        return AjaxResult.success(routeDetail);
    }
}
