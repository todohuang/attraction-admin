package com.ruoyi.attraction.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import java.math.BigDecimal;

/**
 * POI点位信息对象 poi_points
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
public class PoiPoint extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** POI点位ID（用于路线POI关联表） */
    private Long poiId;

    /** 所属分类ID */
    @Excel(name = "所属分类ID")
    private Long categoryId;

    /** 所属分类名称 */
    @Excel(name = "所属分类名称")
    private String categoryName;

    /** 排序序号（在路线中的顺序） */
    private Integer sortOrder;

    /** POI名称 */
    @Excel(name = "POI名称")
    private String poiName;

    /** 经度 */
    @Excel(name = "经度")
    private BigDecimal longitude;

    /** 纬度 */
    @Excel(name = "纬度")
    private BigDecimal latitude;

    /** 详细简介 */
    @Excel(name = "详细简介")
    private String description;

    /** POI标签 */
    @Excel(name = "POI标签")
    private String tags;

    /** 营业时间 */
    @Excel(name = "营业时间")
    private String operatingHours;

    /** 语音导览URL */
    @Excel(name = "语音导览URL")
    private String voiceUrl;

    /** TTS语音文本内容 */
    @Excel(name = "TTS语音文本")
    private String voiceText;

    /** 语音时长（秒） */
    @Excel(name = "语音时长")
    private Integer voiceDuration;

    /** 主要图片URL */
    @Excel(name = "主要图片URL")
    private String mainImageUrl;

    /** 访问热度 */
    @Excel(name = "访问热度")
    private Long visitCount;

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
    public void setCategoryId(Long categoryId) 
    {
        this.categoryId = categoryId;
    }

    public Long getCategoryId() 
    {
        return categoryId;
    }
    public void setPoiName(String poiName) 
    {
        this.poiName = poiName;
    }

    public String getPoiName() 
    {
        return poiName;
    }
    public void setLongitude(BigDecimal longitude) 
    {
        this.longitude = longitude;
    }

    public BigDecimal getLongitude() 
    {
        return longitude;
    }
    public void setLatitude(BigDecimal latitude) 
    {
        this.latitude = latitude;
    }

    public BigDecimal getLatitude() 
    {
        return latitude;
    }
    public void setDescription(String description) 
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }
    public void setTags(String tags)
    {
        this.tags = tags;
    }

    public String getTags()
    {
        return tags;
    }
    public void setOperatingHours(String operatingHours) 
    {
        this.operatingHours = operatingHours;
    }

    public String getOperatingHours() 
    {
        return operatingHours;
    }
    public void setVoiceUrl(String voiceUrl) 
    {
        this.voiceUrl = voiceUrl;
    }

    public String getVoiceUrl()
    {
        return voiceUrl;
    }
    public void setVoiceText(String voiceText)
    {
        this.voiceText = voiceText;
    }

    public String getVoiceText()
    {
        return voiceText;
    }
    public void setVoiceDuration(Integer voiceDuration)
    {
        this.voiceDuration = voiceDuration;
    }

    public Integer getVoiceDuration()
    {
        return voiceDuration;
    }
    public void setMainImageUrl(String mainImageUrl)
    {
        this.mainImageUrl = mainImageUrl;
    }

    public String getMainImageUrl() 
    {
        return mainImageUrl;
    }
    public void setVisitCount(Long visitCount) 
    {
        this.visitCount = visitCount;
    }

    public Long getVisitCount() 
    {
        return visitCount;
    }
    public void setIsPublished(Boolean isPublished) 
    {
        this.isPublished = isPublished;
    }

    public Boolean getIsPublished() 
    {
        return isPublished;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public Long getPoiId() {
        return poiId;
    }

    public void setPoiId(Long poiId) {
        this.poiId = poiId;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("categoryId", getCategoryId())
            .append("poiName", getPoiName())
            .append("longitude", getLongitude())
            .append("latitude", getLatitude())
            .append("description", getDescription())
            .append("tags", getTags())
            .append("operatingHours", getOperatingHours())
            .append("voiceUrl", getVoiceUrl())
            .append("voiceText", getVoiceText())
            .append("voiceDuration", getVoiceDuration())
            .append("mainImageUrl", getMainImageUrl())
            .append("visitCount", getVisitCount())
            .append("isPublished", getIsPublished())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
