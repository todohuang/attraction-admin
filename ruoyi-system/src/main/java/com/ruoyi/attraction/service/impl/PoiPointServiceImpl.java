package com.ruoyi.attraction.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.attraction.mapper.PoiPointMapper;
import com.ruoyi.attraction.domain.PoiPoint;
import com.ruoyi.attraction.service.IPoiPointService;

/**
 * POI点位信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
@Service
public class PoiPointServiceImpl implements IPoiPointService {
    @Autowired
    private PoiPointMapper poiPointMapper;

    /**
     * 查询POI点位信息
     * 
     * @param id POI点位信息主键
     * @return POI点位信息
     */
    @Override
    public PoiPoint selectPoiPointById(Long id) {
        return poiPointMapper.selectPoiPointById(id);
    }

    /**
     * 查询POI点位信息列表
     * 
     * @param poiPoint POI点位信息
     * @return POI点位信息
     */
    @Override
    public List<PoiPoint> selectPoiPointList(PoiPoint poiPoint) {
        return poiPointMapper.selectPoiPointList(poiPoint);
    }

    /**
     * 查询POI点位信息列表 (轻量级)
     * 
     * @param poiPoint POI点位信息
     * @return POI点位信息
     */
    @Override
    public List<PoiPoint> selectPoiPointLiteList(PoiPoint poiPoint) {
        return poiPointMapper.selectPoiPointLiteList(poiPoint);
    }

    /**
     * 新增POI点位信息
     * 
     * @param poiPoint POI点位信息
     * @return 结果
     */
    @Override
    public int insertPoiPoint(PoiPoint poiPoint) {
        poiPoint.setCreateTime(DateUtils.getNowDate());
        int rows = poiPointMapper.insertPoiPoint(poiPoint);
        insertPoiCategoryRelation(poiPoint);
        return rows;
    }

    /**
     * 修改POI点位信息
     * 
     * @param poiPoint POI点位信息
     * @return 结果
     */
    @Override
    public int updatePoiPoint(PoiPoint poiPoint) {
        poiPoint.setUpdateTime(DateUtils.getNowDate());
        poiPointMapper.deletePoiCategoryRelationByPoiId(poiPoint.getId());
        insertPoiCategoryRelation(poiPoint);
        return poiPointMapper.updatePoiPoint(poiPoint);
    }

    /**
     * 新增POI辅分类关联
     */
    public void insertPoiCategoryRelation(PoiPoint poiPoint) {
        java.util.List<Long> categoryIds = poiPoint.getSecondaryCategoryIds();
        if (com.ruoyi.common.utils.StringUtils.isNotEmpty(categoryIds)) {
            // 过滤掉主分类ID，避免重复（虽然数据库允许，但逻辑上辅分类不应包含主分类）
            // 这里暂不过滤，让前端控制或允许重复
            poiPointMapper.insertPoiCategoryRelation(poiPoint.getId(), categoryIds);
        }
    }

    /**
     * 批量删除POI点位信息
     * 
     * @param ids 需要删除的POI点位信息主键
     * @return 结果
     */
    @Override
    public int deletePoiPointByIds(Long[] ids) {
        // 先删除每个POI的辅分类关联
        for (Long id : ids) {
            poiPointMapper.deletePoiCategoryRelationByPoiId(id);
        }
        // 再批量删除POI主表数据
        return poiPointMapper.deletePoiPointByIds(ids);
    }

    /**
     * 删除POI点位信息信息
     * 
     * @param id POI点位信息主键
     * @return 结果
     */
    @Override
    public int deletePoiPointById(Long id) {
        // 先删除辅分类关联
        poiPointMapper.deletePoiCategoryRelationByPoiId(id);
        // 再删除POI主表数据
        return poiPointMapper.deletePoiPointById(id);
    }
}
