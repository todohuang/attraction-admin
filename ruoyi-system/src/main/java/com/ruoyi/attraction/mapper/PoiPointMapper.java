package com.ruoyi.attraction.mapper;

import java.util.List;
import com.ruoyi.attraction.domain.PoiPoint;

/**
 * POI点位信息Mapper接口
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
public interface PoiPointMapper {
    /**
     * 查询POI点位信息
     * 
     * @param id POI点位信息主键
     * @return POI点位信息
     */
    public PoiPoint selectPoiPointById(Long id);

    /**
     * 查询POI点位信息列表
     * 
     * @param poiPoint POI点位信息
     * @return POI点位信息集合
     */
    public List<PoiPoint> selectPoiPointList(PoiPoint poiPoint);

    /**
     * 新增POI点位信息
     * 
     * @param poiPoint POI点位信息
     * @return 结果
     */
    public int insertPoiPoint(PoiPoint poiPoint);

    /**
     * 修改POI点位信息
     * 
     * @param poiPoint POI点位信息
     * @return 结果
     */
    public int updatePoiPoint(PoiPoint poiPoint);

    /**
     * 删除POI点位信息
     * 
     * @param id POI点位信息主键
     * @return 结果
     */
    public int deletePoiPointById(Long id);

    /**
     * 批量删除POI点位信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePoiPointByIds(Long[] ids);

    /**
     * 批量新增POI辅分类关联
     * 
     * @param poiId       POI ID
     * @param categoryIds 分类ID列表
     * @return 结果
     */
    public int insertPoiCategoryRelation(@org.apache.ibatis.annotations.Param("poiId") Long poiId,
            @org.apache.ibatis.annotations.Param("categoryIds") List<Long> categoryIds);

    /**
     * 删除POI辅分类关联
     * 
     * @param poiId POI ID
     * @return 结果
     */
    public int deletePoiCategoryRelationByPoiId(Long poiId);
}
