package com.ruoyi.attraction.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import java.math.BigDecimal;

/**
 * POI分类对象 poi_categories
 * 
 * @author ruoyi
 * @date 2025-12-10
 */
public class PoiCategory extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String categoryName;

    /** 分类图标URL */
    @Excel(name = "分类图标URL")
    private String iconUrl;

    /** 图标类型 (default, emoji, image) */
    @Excel(name = "图标类型")
    private String iconType;

    /** 图标内容 (Emoji字符或图片路径) */
    @Excel(name = "图标内容")
    private String iconValue;

    /** 排序 */
    @Excel(name = "排序")
    private Long sortOrder;

    /** 是否启用 */
    @Excel(name = "是否启用")
    private Boolean isActive;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconType(String iconType) {
        this.iconType = iconType;
    }

    public String getIconType() {
        return iconType;
    }

    public void setIconValue(String iconValue) {
        this.iconValue = iconValue;
    }

    public String getIconValue() {
        return iconValue;
    }

    public void setSortOrder(Long sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Long getSortOrder() {
        return sortOrder;
    }

    public void setIsActive(Boolean isActive) {
        this.isActive = isActive;
    }

    public Boolean getIsActive() {
        return isActive;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("categoryName", getCategoryName())
                .append("iconUrl", getIconUrl())
                .append("iconType", getIconType())
                .append("iconValue", getIconValue())
                .append("sortOrder", getSortOrder())
                .append("isActive", getIsActive())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
