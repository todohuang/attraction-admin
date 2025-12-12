package com.ruoyi.attraction.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ruoyi.attraction.mapper.TourRouteMapper;
import com.ruoyi.attraction.mapper.TourRoutePoiMapper;
import com.ruoyi.attraction.domain.TourRoute;
import com.ruoyi.attraction.domain.TourRoutePoi;
import com.ruoyi.attraction.domain.PoiPoint;
import com.ruoyi.attraction.domain.vo.TourRouteDetailVO;
import com.ruoyi.attraction.service.ITourRouteService;

/**
 * 游览路线Service业务层处理
 *
 * @author ruoyi
 * @date 2025-12-11
 */
@Service
public class TourRouteServiceImpl implements ITourRouteService
{
    @Autowired
    private TourRouteMapper tourRouteMapper;

    @Autowired
    private TourRoutePoiMapper tourRoutePoiMapper;

    /**
     * 查询游览路线
     *
     * @param id 游览路线主键
     * @return 游览路线
     */
    @Override
    public TourRoute selectTourRouteById(Long id)
    {
        return tourRouteMapper.selectTourRouteById(id);
    }

    /**
     * 查询游览路线列表
     *
     * @param tourRoute 游览路线
     * @return 游览路线
     */
    @Override
    public List<TourRoute> selectTourRouteList(TourRoute tourRoute)
    {
        return tourRouteMapper.selectTourRouteList(tourRoute);
    }

    /**
     * 查询路线及其POI列表
     *
     * @param id 游览路线主键
     * @return 游览路线详情（包含POI列表）
     */
    @Override
    public TourRouteDetailVO selectRouteWithPois(Long id)
    {
        return tourRouteMapper.selectRouteWithPois(id);
    }

    /**
     * 新增游览路线
     *
     * @param tourRoute 游览路线
     * @return 结果
     */
    @Override
    public int insertTourRoute(TourRoute tourRoute)
    {
        tourRoute.setCreateTime(DateUtils.getNowDate());
        return tourRouteMapper.insertTourRoute(tourRoute);
    }

    /**
     * 修改游览路线
     *
     * @param tourRoute 游览路线
     * @return 结果
     */
    @Override
    public int updateTourRoute(TourRoute tourRoute)
    {
        tourRoute.setUpdateTime(DateUtils.getNowDate());
        return tourRouteMapper.updateTourRoute(tourRoute);
    }

    /**
     * 批量删除游览路线
     *
     * @param ids 需要删除的游览路线主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteTourRouteByIds(Long[] ids)
    {
        // 删除路线时同时删除关联的POI
        for (Long id : ids)
        {
            tourRoutePoiMapper.deleteRoutePoiByRouteId(id);
        }
        return tourRouteMapper.deleteTourRouteByIds(ids);
    }

    /**
     * 删除游览路线信息
     *
     * @param id 游览路线主键
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteTourRouteById(Long id)
    {
        // 删除路线时同时删除关联的POI
        tourRoutePoiMapper.deleteRoutePoiByRouteId(id);
        return tourRouteMapper.deleteTourRouteById(id);
    }

    /**
     * 添加POI到路线
     *
     * @param routeId 路线ID
     * @param poiId POI点位ID
     * @param sequenceOrder 序号
     * @return 结果
     */
    @Override
    @Transactional
    public int addPoiToRoute(Long routeId, Long poiId, Integer sequenceOrder)
    {
        TourRoutePoi routePoi = new TourRoutePoi();
        routePoi.setRouteId(routeId);
        routePoi.setPoiId(poiId);
        routePoi.setSequenceOrder(sequenceOrder);
        routePoi.setCreateTime(DateUtils.getNowDate());

        int result = tourRoutePoiMapper.insertTourRoutePoi(routePoi);

        // 更新路线的POI数量
        if (result > 0)
        {
            updateRoutePoiCount(routeId);
        }

        return result;
    }

    /**
     * 从路线移除POI
     *
     * @param routeId 路线ID
     * @param poiId POI点位ID
     * @return 结果
     */
    @Override
    @Transactional
    public int removePoiFromRoute(Long routeId, Long poiId)
    {
        int result = tourRoutePoiMapper.deleteRoutePoiByRouteIdAndPoiId(routeId, poiId);

        // 更新路线的POI数量
        if (result > 0)
        {
            updateRoutePoiCount(routeId);
        }

        return result;
    }

    /**
     * 更新路线中POI的排序
     *
     * @param id 路线POI关联主键
     * @param sequenceOrder 新的排序序号
     * @return 结果
     */
    @Override
    public int updatePoiSequence(Long id, Integer sequenceOrder)
    {
        return tourRoutePoiMapper.updatePoiSequence(id, sequenceOrder);
    }

    /**
     * 查询路线的POI列表
     *
     * @param routeId 路线ID
     * @return POI点位信息集合
     */
    @Override
    public List<PoiPoint> selectRoutePoiList(Long routeId)
    {
        return tourRoutePoiMapper.selectRoutePoiList(routeId);
    }

    /**
     * 更新路线的POI数量
     *
     * @param routeId 路线ID
     */
    private void updateRoutePoiCount(Long routeId)
    {
        TourRoutePoi query = new TourRoutePoi();
        query.setRouteId(routeId);
        int count = tourRoutePoiMapper.selectTourRoutePoiList(query).size();

        TourRoute tourRoute = new TourRoute();
        tourRoute.setId(routeId);
        tourRoute.setPoiCount(count);
        tourRouteMapper.updateTourRoute(tourRoute);
    }
}
