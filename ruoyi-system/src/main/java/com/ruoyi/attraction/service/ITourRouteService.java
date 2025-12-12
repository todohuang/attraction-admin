package com.ruoyi.attraction.service;

import java.util.List;
import com.ruoyi.attraction.domain.TourRoute;
import com.ruoyi.attraction.domain.PoiPoint;
import com.ruoyi.attraction.domain.vo.TourRouteDetailVO;

/**
 * 游览路线Service接口
 *
 * @author ruoyi
 * @date 2025-12-11
 */
public interface ITourRouteService
{
    /**
     * 查询游览路线
     *
     * @param id 游览路线主键
     * @return 游览路线
     */
    public TourRoute selectTourRouteById(Long id);

    /**
     * 查询游览路线列表
     *
     * @param tourRoute 游览路线
     * @return 游览路线集合
     */
    public List<TourRoute> selectTourRouteList(TourRoute tourRoute);

    /**
     * 查询路线及其POI列表
     *
     * @param id 游览路线主键
     * @return 游览路线详情（包含POI列表）
     */
    public TourRouteDetailVO selectRouteWithPois(Long id);

    /**
     * 新增游览路线
     *
     * @param tourRoute 游览路线
     * @return 结果
     */
    public int insertTourRoute(TourRoute tourRoute);

    /**
     * 修改游览路线
     *
     * @param tourRoute 游览路线
     * @return 结果
     */
    public int updateTourRoute(TourRoute tourRoute);

    /**
     * 批量删除游览路线
     *
     * @param ids 需要删除的游览路线主键集合
     * @return 结果
     */
    public int deleteTourRouteByIds(Long[] ids);

    /**
     * 删除游览路线信息
     *
     * @param id 游览路线主键
     * @return 结果
     */
    public int deleteTourRouteById(Long id);

    /**
     * 添加POI到路线
     *
     * @param routeId 路线ID
     * @param poiId POI点位ID
     * @param sequenceOrder 序号
     * @return 结果
     */
    public int addPoiToRoute(Long routeId, Long poiId, Integer sequenceOrder);

    /**
     * 从路线移除POI
     *
     * @param routeId 路线ID
     * @param poiId POI点位ID
     * @return 结果
     */
    public int removePoiFromRoute(Long routeId, Long poiId);

    /**
     * 更新路线中POI的排序
     *
     * @param id 路线POI关联主键
     * @param sequenceOrder 新的排序序号
     * @return 结果
     */
    public int updatePoiSequence(Long id, Integer sequenceOrder);

    /**
     * 查询路线的POI列表
     *
     * @param routeId 路线ID
     * @return POI点位信息集合
     */
    public List<PoiPoint> selectRoutePoiList(Long routeId);
}
