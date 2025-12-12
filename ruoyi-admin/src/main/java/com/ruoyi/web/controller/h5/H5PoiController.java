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
public class H5PoiController extends BaseController {
    @Autowired
    private IPoiCategoryService poiCategoryService;

    @Autowired
    private IPoiPointService poiPointService;

    /**
     * H5 - 获取分类列表 (只查询启用的)
     */
    @GetMapping("/category/list")
    public AjaxResult getCategoryList() {
        PoiCategory query = new PoiCategory();
        query.setIsActive(true);
        List<PoiCategory> list = poiCategoryService.selectPoiCategoryList(query);
        return AjaxResult.success(list);
    }

    /**
     * H5 - 获取所有发布状态的 POI
     */
    @GetMapping("/poi/list")
    public AjaxResult getPoiList(PoiPoint query) {
        query.setIsPublished(true);
        List<PoiPoint> list = poiPointService.selectPoiPointList(query);
        return AjaxResult.success(list);
    }

    /**
     * H5 - 简单录入 POI (采集模式)
     */
    @org.springframework.web.bind.annotation.PostMapping("/poi/simple-add")
    public AjaxResult simpleAdd(@org.springframework.web.bind.annotation.RequestBody PoiPoint poi) {
        if (poi.getPoiName() == null || poi.getLatitude() == null || poi.getLongitude() == null) {
            return AjaxResult.error("参数不完整");
        }

        poi.setIsPublished(false); // 默认不发布
        poi.setCategoryId(1L); // 默认归类到"景点"(id=1)，如果没有可以设为空或默认值，这里假设1存在
        poiPointService.insertPoiPoint(poi);

        return AjaxResult.success();
    }
}
