package com.ruoyi.attraction.service;

import java.util.List;
import com.ruoyi.attraction.domain.PoiCategory;

/**
 * POI分类Service接口
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
public interface IPoiCategoryService 
{
    /**
     * 查询POI分类
     * 
     * @param id POI分类主键
     * @return POI分类
     */
    public PoiCategory selectPoiCategoryById(Long id);

    /**
     * 查询POI分类列表
     * 
     * @param poiCategory POI分类
     * @return POI分类集合
     */
    public List<PoiCategory> selectPoiCategoryList(PoiCategory poiCategory);

    /**
     * 新增POI分类
     * 
     * @param poiCategory POI分类
     * @return 结果
     */
    public int insertPoiCategory(PoiCategory poiCategory);

    /**
     * 修改POI分类
     * 
     * @param poiCategory POI分类
     * @return 结果
     */
    public int updatePoiCategory(PoiCategory poiCategory);

    /**
     * 批量删除POI分类
     * 
     * @param ids 需要删除的POI分类主键集合
     * @return 结果
     */
    public int deletePoiCategoryByIds(Long[] ids);

    /**
     * 删除POI分类信息
     * 
     * @param id POI分类主键
     * @return 结果
     */
    public int deletePoiCategoryById(Long id);
}
