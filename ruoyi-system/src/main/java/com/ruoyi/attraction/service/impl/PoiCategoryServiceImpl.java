package com.ruoyi.attraction.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.attraction.mapper.PoiCategoryMapper;
import com.ruoyi.attraction.domain.PoiCategory;
import com.ruoyi.attraction.service.IPoiCategoryService;

/**
 * POI分类Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
@Service
public class PoiCategoryServiceImpl implements IPoiCategoryService 
{
    @Autowired
    private PoiCategoryMapper poiCategoryMapper;

    /**
     * 查询POI分类
     * 
     * @param id POI分类主键
     * @return POI分类
     */
    @Override
    public PoiCategory selectPoiCategoryById(Long id)
    {
        return poiCategoryMapper.selectPoiCategoryById(id);
    }

    /**
     * 查询POI分类列表
     * 
     * @param poiCategory POI分类
     * @return POI分类
     */
    @Override
    public List<PoiCategory> selectPoiCategoryList(PoiCategory poiCategory)
    {
        return poiCategoryMapper.selectPoiCategoryList(poiCategory);
    }

    /**
     * 新增POI分类
     * 
     * @param poiCategory POI分类
     * @return 结果
     */
    @Override
    public int insertPoiCategory(PoiCategory poiCategory)
    {
        poiCategory.setCreateTime(DateUtils.getNowDate());
        return poiCategoryMapper.insertPoiCategory(poiCategory);
    }

    /**
     * 修改POI分类
     * 
     * @param poiCategory POI分类
     * @return 结果
     */
    @Override
    public int updatePoiCategory(PoiCategory poiCategory)
    {
        poiCategory.setUpdateTime(DateUtils.getNowDate());
        return poiCategoryMapper.updatePoiCategory(poiCategory);
    }

    /**
     * 批量删除POI分类
     * 
     * @param ids 需要删除的POI分类主键
     * @return 结果
     */
    @Override
    public int deletePoiCategoryByIds(Long[] ids)
    {
        return poiCategoryMapper.deletePoiCategoryByIds(ids);
    }

    /**
     * 删除POI分类信息
     * 
     * @param id POI分类主键
     * @return 结果
     */
    @Override
    public int deletePoiCategoryById(Long id)
    {
        return poiCategoryMapper.deletePoiCategoryById(id);
    }
}
