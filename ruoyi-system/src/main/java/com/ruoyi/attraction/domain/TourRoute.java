package com.ruoyi.attraction.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 游览路线对象 tour_routes
 *
 * @author ruoyi
 * @date 2025-12-11
 */
public class TourRoute extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 路线ID */
    private Long id;

    /** 路线名称 */
    @Excel(name = "路线名称")
    private String routeName;

    /** 路线描述 */
    @Excel(name = "路线描述")
    private String routeDescription;

    /** 路线缩略图URL */
    @Excel(name = "路线缩略图URL")
    private String thumbnailUrl;

    /** 建议游览时长 */
    @Excel(name = "建议游览时长")
    private String estimatedDuration;

    /** POI数量 */
    @Excel(name = "POI数量")
    private Integer poiCount;

    /** 排序权重 */
    @Excel(name = "排序权重")
    private Integer sortOrder;

    /** 是否发布 */
    @Excel(name = "是否发布")
    private Boolean isPublished;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }

    public void setRouteName(String routeName)
    {
        this.routeName = routeName;
    }

    public String getRouteName()
    {
        return routeName;
    }

    public void setRouteDescription(String routeDescription)
    {
        this.routeDescription = routeDescription;
    }

    public String getRouteDescription()
    {
        return routeDescription;
    }

    public void setThumbnailUrl(String thumbnailUrl)
    {
        this.thumbnailUrl = thumbnailUrl;
    }

    public String getThumbnailUrl()
    {
        return thumbnailUrl;
    }

    public void setEstimatedDuration(String estimatedDuration)
    {
        this.estimatedDuration = estimatedDuration;
    }

    public String getEstimatedDuration()
    {
        return estimatedDuration;
    }

    public void setPoiCount(Integer poiCount)
    {
        this.poiCount = poiCount;
    }

    public Integer getPoiCount()
    {
        return poiCount;
    }

    public void setSortOrder(Integer sortOrder)
    {
        this.sortOrder = sortOrder;
    }

    public Integer getSortOrder()
    {
        return sortOrder;
    }

    public void setIsPublished(Boolean isPublished)
    {
        this.isPublished = isPublished;
    }

    public Boolean getIsPublished()
    {
        return isPublished;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("routeName", getRouteName())
            .append("routeDescription", getRouteDescription())
            .append("thumbnailUrl", getThumbnailUrl())
            .append("estimatedDuration", getEstimatedDuration())
            .append("poiCount", getPoiCount())
            .append("sortOrder", getSortOrder())
            .append("isPublished", getIsPublished())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
