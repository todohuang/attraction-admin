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
public class PoiPointServiceImpl implements IPoiPointService 
{
    @Autowired
    private PoiPointMapper poiPointMapper;

    /**
     * 查询POI点位信息
     * 
     * @param id POI点位信息主键
     * @return POI点位信息
     */
    @Override
    public PoiPoint selectPoiPointById(Long id)
    {
        return poiPointMapper.selectPoiPointById(id);
    }

    /**
     * 查询POI点位信息列表
     * 
     * @param poiPoint POI点位信息
     * @return POI点位信息
     */
    @Override
    public List<PoiPoint> selectPoiPointList(PoiPoint poiPoint)
    {
        return poiPointMapper.selectPoiPointList(poiPoint);
    }

    /**
     * 新增POI点位信息
     * 
     * @param poiPoint POI点位信息
     * @return 结果
     */
    @Override
    public int insertPoiPoint(PoiPoint poiPoint)
    {
        poiPoint.setCreateTime(DateUtils.getNowDate());
        return poiPointMapper.insertPoiPoint(poiPoint);
    }

    /**
     * 修改POI点位信息
     * 
     * @param poiPoint POI点位信息
     * @return 结果
     */
    @Override
    public int updatePoiPoint(PoiPoint poiPoint)
    {
        poiPoint.setUpdateTime(DateUtils.getNowDate());
        return poiPointMapper.updatePoiPoint(poiPoint);
    }

    /**
     * 批量删除POI点位信息
     * 
     * @param ids 需要删除的POI点位信息主键
     * @return 结果
     */
    @Override
    public int deletePoiPointByIds(Long[] ids)
    {
        return poiPointMapper.deletePoiPointByIds(ids);
    }

    /**
     * 删除POI点位信息信息
     * 
     * @param id POI点位信息主键
     * @return 结果
     */
    @Override
    public int deletePoiPointById(Long id)
    {
        return poiPointMapper.deletePoiPointById(id);
    }
}
