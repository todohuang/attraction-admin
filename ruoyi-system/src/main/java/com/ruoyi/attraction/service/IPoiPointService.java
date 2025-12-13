package com.ruoyi.attraction.service;

import java.util.List;
import com.ruoyi.attraction.domain.PoiPoint;

/**
 * POI点位信息Service接口
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
public interface IPoiPointService {
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
     * 查询POI点位信息列表 (轻量级)
     * 
     * @param poiPoint POI点位信息
     * @return POI点位信息集合
     */
    public List<PoiPoint> selectPoiPointLiteList(PoiPoint poiPoint);

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
     * 批量删除POI点位信息
     * 
     * @param ids 需要删除的POI点位信息主键集合
     * @return 结果
     */
    public int deletePoiPointByIds(Long[] ids);

    /**
     * 删除POI点位信息信息
     * 
     * @param id POI点位信息主键
     * @return 结果
     */
    public int deletePoiPointById(Long id);
}
