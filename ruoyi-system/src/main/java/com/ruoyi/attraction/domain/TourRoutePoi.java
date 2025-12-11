package com.ruoyi.attraction.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 路线POI关联对象 tour_route_pois
 *
 * @author ruoyi
 * @date 2025-12-11
 */
public class TourRoutePoi
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 路线ID */
    private Long routeId;

    /** POI点位ID */
    private Long poiId;

    /** 序号 */
    private Integer sequenceOrder;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setRouteId(Long routeId)
    {
        this.routeId = routeId;
    }

    public Long getRouteId()
    {
        return routeId;
    }

    public void setPoiId(Long poiId)
    {
        this.poiId = poiId;
    }

    public Long getPoiId()
    {
        return poiId;
    }

    public void setSequenceOrder(Integer sequenceOrder)
    {
        this.sequenceOrder = sequenceOrder;
    }

    public Integer getSequenceOrder()
    {
        return sequenceOrder;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    public Date getCreateTime()
    {
        return createTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("routeId", getRouteId())
            .append("poiId", getPoiId())
            .append("sequenceOrder", getSequenceOrder())
            .append("createTime", getCreateTime())
            .toString();
    }
}
