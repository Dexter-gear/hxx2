package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 购物车对象 shopping_cart
 * 
 * @author hxx
 * @date 2025-04-01
 */
public class ShoppingCart extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键ID */
    private Long id;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 产品类型（red_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple） */
    @Excel(name = "产品类型", readConverterExp = "r=ed_fuji_apple/green_apple/guoguang_apple/hongxing_apple/jinguan_apple")
    private String productType;

    /** 产品ID */
    @Excel(name = "产品ID")
    private Long productId;

    /** 购买数量 */
    @Excel(name = "购买数量")
    private Long quantity;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }

    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }

    public void setProductType(String productType) 
    {
        this.productType = productType;
    }

    public String getProductType() 
    {
        return productType;
    }

    public void setProductId(Long productId) 
    {
        this.productId = productId;
    }

    public Long getProductId() 
    {
        return productId;
    }

    public void setQuantity(Long quantity) 
    {
        this.quantity = quantity;
    }

    public Long getQuantity() 
    {
        return quantity;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("productType", getProductType())
            .append("productId", getProductId())
            .append("quantity", getQuantity())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
