package com.ruoyi.attraction.mapper;

import java.util.List;
import com.ruoyi.attraction.domain.TourRoutePoi;
import com.ruoyi.attraction.domain.PoiPoint;
import org.apache.ibatis.annotations.Param;

/**
 * 路线POI关联Mapper接口
 *
 * @author ruoyi
 * @date 2025-12-11
 */
public interface TourRoutePoiMapper
{
    /**
     * 查询路线POI关联
     *
     * @param id 路线POI关联主键
     * @return 路线POI关联
     */
    public TourRoutePoi selectTourRoutePoiById(Long id);

    /**
     * 查询路线POI关联列表
     *
     * @param tourRoutePoi 路线POI关联
     * @return 路线POI关联集合
     */
    public List<TourRoutePoi> selectTourRoutePoiList(TourRoutePoi tourRoutePoi);

    /**
     * 查询路线的POI列表（包含POI详细信息）
     *
     * @param routeId 路线ID
     * @return POI点位信息集合
     */
    public List<PoiPoint> selectRoutePoiList(Long routeId);

    /**
     * 新增路线POI关联
     *
     * @param tourRoutePoi 路线POI关联
     * @return 结果
     */
    public int insertTourRoutePoi(TourRoutePoi tourRoutePoi);

    /**
     * 批量新增路线POI关联
     *
     * @param routePois 路线POI关联列表
     * @return 结果
     */
    public int batchInsertTourRoutePoi(List<TourRoutePoi> routePois);

    /**
     * 修改路线POI关联
     *
     * @param tourRoutePoi 路线POI关联
     * @return 结果
     */
    public int updateTourRoutePoi(TourRoutePoi tourRoutePoi);

    /**
     * 更新POI排序
     *
     * @param id 路线POI关联主键
     * @param sequenceOrder 新的排序序号
     * @return 结果
     */
    public int updatePoiSequence(@Param("id") Long id, @Param("sequenceOrder") Integer sequenceOrder);

    /**
     * 删除路线POI关联
     *
     * @param id 路线POI关联主键
     * @return 结果
     */
    public int deleteTourRoutePoiById(Long id);

    /**
     * 根据路线ID和POI ID删除关联
     *
     * @param routeId 路线ID
     * @param poiId POI点位ID
     * @return 结果
     */
    public int deleteRoutePoiByRouteIdAndPoiId(@Param("routeId") Long routeId, @Param("poiId") Long poiId);

    /**
     * 根据路线ID删除所有POI关联
     *
     * @param routeId 路线ID
     * @return 结果
     */
    public int deleteRoutePoiByRouteId(Long routeId);

    /**
     * 批量删除路线POI关联
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTourRoutePoiByIds(Long[] ids);
}
