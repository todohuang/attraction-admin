package com.ruoyi.attraction.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.attraction.mapper.TourRoutePoiMapper;
import com.ruoyi.attraction.domain.TourRoutePoi;
import com.ruoyi.attraction.domain.PoiPoint;
import com.ruoyi.attraction.service.ITourRoutePoiService;

/**
 * 路线POI关联Service业务层处理
 *
 * @author ruoyi
 * @date 2025-12-11
 */
@Service
public class TourRoutePoiServiceImpl implements ITourRoutePoiService
{
    @Autowired
    private TourRoutePoiMapper tourRoutePoiMapper;

    /**
     * 查询路线POI关联
     *
     * @param id 路线POI关联主键
     * @return 路线POI关联
     */
    @Override
    public TourRoutePoi selectTourRoutePoiById(Long id)
    {
        return tourRoutePoiMapper.selectTourRoutePoiById(id);
    }

    /**
     * 查询路线POI关联列表
     *
     * @param tourRoutePoi 路线POI关联
     * @return 路线POI关联
     */
    @Override
    public List<TourRoutePoi> selectTourRoutePoiList(TourRoutePoi tourRoutePoi)
    {
        return tourRoutePoiMapper.selectTourRoutePoiList(tourRoutePoi);
    }

    /**
     * 查询路线的POI列表（包含POI详细信息）
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
     * 新增路线POI关联
     *
     * @param tourRoutePoi 路线POI关联
     * @return 结果
     */
    @Override
    public int insertTourRoutePoi(TourRoutePoi tourRoutePoi)
    {
        tourRoutePoi.setCreateTime(DateUtils.getNowDate());
        return tourRoutePoiMapper.insertTourRoutePoi(tourRoutePoi);
    }

    /**
     * 批量新增路线POI关联
     *
     * @param routePois 路线POI关联列表
     * @return 结果
     */
    @Override
    public int batchInsertTourRoutePoi(List<TourRoutePoi> routePois)
    {
        // 设置创建时间
        for (TourRoutePoi routePoi : routePois)
        {
            routePoi.setCreateTime(DateUtils.getNowDate());
        }
        return tourRoutePoiMapper.batchInsertTourRoutePoi(routePois);
    }

    /**
     * 修改路线POI关联
     *
     * @param tourRoutePoi 路线POI关联
     * @return 结果
     */
    @Override
    public int updateTourRoutePoi(TourRoutePoi tourRoutePoi)
    {
        return tourRoutePoiMapper.updateTourRoutePoi(tourRoutePoi);
    }

    /**
     * 更新POI排序
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
     * 批量删除路线POI关联
     *
     * @param ids 需要删除的路线POI关联主键
     * @return 结果
     */
    @Override
    public int deleteTourRoutePoiByIds(Long[] ids)
    {
        return tourRoutePoiMapper.deleteTourRoutePoiByIds(ids);
    }

    /**
     * 删除路线POI关联信息
     *
     * @param id 路线POI关联主键
     * @return 结果
     */
    @Override
    public int deleteTourRoutePoiById(Long id)
    {
        return tourRoutePoiMapper.deleteTourRoutePoiById(id);
    }

    /**
     * 根据路线ID和POI ID删除关联
     *
     * @param routeId 路线ID
     * @param poiId POI点位ID
     * @return 结果
     */
    @Override
    public int deleteRoutePoiByRouteIdAndPoiId(Long routeId, Long poiId)
    {
        return tourRoutePoiMapper.deleteRoutePoiByRouteIdAndPoiId(routeId, poiId);
    }

    /**
     * 根据路线ID删除所有POI关联
     *
     * @param routeId 路线ID
     * @return 结果
     */
    @Override
    public int deleteRoutePoiByRouteId(Long routeId)
    {
        return tourRoutePoiMapper.deleteRoutePoiByRouteId(routeId);
    }
}
