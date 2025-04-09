package com.ruoyi.system.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 价格计算规则对象 price_rule
 * 
 * @author hxx
 * @date 2025-04-01
 */
public class PriceRule extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple） */
    @Excel(name = "产品类型", readConverterExp = "r=ed_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple")
    private String productType;

    /** 品质等级 */
    @Excel(name = "品质等级")
    private String qualityLevel;

    /** 基础价格 */
    @Excel(name = "基础价格")
    private BigDecimal basePrice;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setProductType(String productType) 
    {
        this.productType = productType;
    }

    public String getProductType() 
    {
        return productType;
    }

    public void setQualityLevel(String qualityLevel) 
    {
        this.qualityLevel = qualityLevel;
    }

    public String getQualityLevel() 
    {
        return qualityLevel;
    }

    public void setBasePrice(BigDecimal basePrice) 
    {
        this.basePrice = basePrice;
    }

    public BigDecimal getBasePrice() 
    {
        return basePrice;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("productType", getProductType())
            .append("qualityLevel", getQualityLevel())
            .append("basePrice", getBasePrice())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
