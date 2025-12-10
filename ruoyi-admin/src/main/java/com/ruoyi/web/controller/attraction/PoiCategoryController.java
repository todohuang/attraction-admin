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
import com.ruoyi.attraction.domain.PoiCategory;
import com.ruoyi.attraction.service.IPoiCategoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * POI分类Controller
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
@RestController
@RequestMapping("/system/category")
public class PoiCategoryController extends BaseController
{
    @Autowired
    private IPoiCategoryService poiCategoryService;

    /**
     * 查询POI分类列表
     */
    @PreAuthorize("@ss.hasPermi('system:category:list')")
    @GetMapping("/list")
    public TableDataInfo list(PoiCategory poiCategory)
    {
        startPage();
        List<PoiCategory> list = poiCategoryService.selectPoiCategoryList(poiCategory);
        return getDataTable(list);
    }

    /**
     * 导出POI分类列表
     */
    @PreAuthorize("@ss.hasPermi('system:category:export')")
    @Log(title = "POI分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PoiCategory poiCategory)
    {
        List<PoiCategory> list = poiCategoryService.selectPoiCategoryList(poiCategory);
        ExcelUtil<PoiCategory> util = new ExcelUtil<PoiCategory>(PoiCategory.class);
        util.exportExcel(response, list, "POI分类数据");
    }

    /**
     * 获取POI分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:category:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(poiCategoryService.selectPoiCategoryById(id));
    }

    /**
     * 新增POI分类
     */
    @PreAuthorize("@ss.hasPermi('system:category:add')")
    @Log(title = "POI分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PoiCategory poiCategory)
    {
        return toAjax(poiCategoryService.insertPoiCategory(poiCategory));
    }

    /**
     * 修改POI分类
     */
    @PreAuthorize("@ss.hasPermi('system:category:edit')")
    @Log(title = "POI分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PoiCategory poiCategory)
    {
        return toAjax(poiCategoryService.updatePoiCategory(poiCategory));
    }

    /**
     * 删除POI分类
     */
    @PreAuthorize("@ss.hasPermi('system:category:remove')")
    @Log(title = "POI分类", businessType = BusinessType.DELETE)
	@DeleteMapping(value = "/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(poiCategoryService.deletePoiCategoryByIds(ids));
    }
}
