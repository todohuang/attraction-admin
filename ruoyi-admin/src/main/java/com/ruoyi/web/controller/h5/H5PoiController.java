package com.ruoyi.web.controller.h5;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.attraction.domain.PoiCategory;
import com.ruoyi.attraction.domain.PoiPoint;
import com.ruoyi.attraction.service.IPoiCategoryService;
import com.ruoyi.attraction.service.IPoiPointService;

/**
 * H5 移动端接口 Controller
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
@RestController
@RequestMapping("/api/h5")
public class H5PoiController extends BaseController
{
    @Autowired
    private IPoiCategoryService poiCategoryService;
    
    @Autowired
    private IPoiPointService poiPointService;

    /**
     * H5 - 获取分类列表 (只查询启用的)
     */
    @GetMapping("/category/list")
    public AjaxResult getCategoryList()
    {
        PoiCategory query = new PoiCategory();
        query.setIsActive(true); 
        List<PoiCategory> list = poiCategoryService.selectPoiCategoryList(query);
        return AjaxResult.success(list);
    }

    /**
     * H5 - 获取所有发布状态的 POI
     */
    @GetMapping("/poi/list")
    public AjaxResult getPoiList(PoiPoint query)
    {
        query.setIsPublished(true);
        List<PoiPoint> list = poiPointService.selectPoiPointList(query);
        return AjaxResult.success(list);
    }
}
