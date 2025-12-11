package com.ruoyi.attraction.domain.vo;

import com.ruoyi.attraction.domain.PoiPoint;

import java.util.List;

/**
 * 路线详情VO（包含POI列表）
 *
 * @author ruoyi
 * @date 2025-12-11
 */
public class TourRouteDetailVO
{
    /** 路线ID */
    private Long id;

    /** 路线名称 */
    private String routeName;

    /** 路线描述 */
    private String routeDescription;

    /** 路线缩略图URL */
    private String thumbnailUrl;

    /** 建议游览时长 */
    private String estimatedDuration;

    /** POI数量 */
    private Integer poiCount;

    /** 路线包含的POI列表（按sequenceOrder排序） */
    private List<PoiWithSequence> pois;

    /**
     * POI with sequence number (用于路线中的POI排序)
     */
    public static class PoiWithSequence extends PoiPoint
    {
        /** 在路线中的序号 */
        private Integer sequenceOrder;

        /** 路线POI关联表ID */
        private Long relationId;

        public Integer getSequenceOrder()
        {
            return sequenceOrder;
        }

        public void setSequenceOrder(Integer sequenceOrder)
        {
            this.sequenceOrder = sequenceOrder;
        }

        public Long getRelationId()
        {
            return relationId;
        }

        public void setRelationId(Long relationId)
        {
            this.relationId = relationId;
        }
    }

    // Getters and Setters

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getRouteName()
    {
        return routeName;
    }

    public void setRouteName(String routeName)
    {
        this.routeName = routeName;
    }

    public String getRouteDescription()
    {
        return routeDescription;
    }

    public void setRouteDescription(String routeDescription)
    {
        this.routeDescription = routeDescription;
    }

    public String getThumbnailUrl()
    {
        return thumbnailUrl;
    }

    public void setThumbnailUrl(String thumbnailUrl)
    {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getEstimatedDuration()
    {
        return estimatedDuration;
    }

    public void setEstimatedDuration(String estimatedDuration)
    {
        this.estimatedDuration = estimatedDuration;
    }

    public Integer getPoiCount()
    {
        return poiCount;
    }

    public void setPoiCount(Integer poiCount)
    {
        this.poiCount = poiCount;
    }

    public List<PoiWithSequence> getPois()
    {
        return pois;
    }

    public void setPois(List<PoiWithSequence> pois)
    {
        this.pois = pois;
    }
}
