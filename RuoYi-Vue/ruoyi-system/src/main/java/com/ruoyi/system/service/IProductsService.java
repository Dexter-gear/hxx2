package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.Products;

/**
 * 商品视图Service接口
 * 
 * @author hxx
 * @date 2025-04-08
 */
public interface IProductsService 
{
    /**
     * 查询商品视图
     * 
     * @param productType 商品视图主键
     * @return 商品视图
     */
    public Products selectProductsByProductType(String productType);

    /**
     * 查询商品视图列表
     * 
     * @param products 商品视图
     * @return 商品视图集合
     */
    public List<Products> selectProductsList(Products products);

    /**
     * 新增商品视图
     * 
     * @param products 商品视图
     * @return 结果
     */
    public int insertProducts(Products products);

    /**
     * 修改商品视图
     * 
     * @param products 商品视图
     * @return 结果
     */
    public int updateProducts(Products products);

    /**
     * 批量删除商品视图
     * 
     * @param productTypes 需要删除的商品视图主键集合
     * @return 结果
     */
    public int deleteProductsByProductTypes(String[] productTypes);

    /**
     * 删除商品视图信息
     * 
     * @param productType 商品视图主键
     * @return 结果
     */
    public int deleteProductsByProductType(String productType);
}
