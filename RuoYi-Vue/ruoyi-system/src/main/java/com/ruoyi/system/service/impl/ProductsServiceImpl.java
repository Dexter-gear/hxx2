package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ProductsMapper;
import com.ruoyi.system.domain.Products;
import com.ruoyi.system.service.IProductsService;

/**
 * 商品视图Service业务层处理
 * 
 * @author hxx
 * @date 2025-04-08
 */
@Service
public class ProductsServiceImpl implements IProductsService 
{
    @Autowired
    private ProductsMapper productsMapper;

    /**
     * 查询商品视图
     * 
     * @param productType 商品视图主键
     * @return 商品视图
     */
    @Override
    public Products selectProductsByProductType(String productType)
    {
        return productsMapper.selectProductsByProductType(productType);
    }

    /**
     * 查询商品视图列表
     * 
     * @param products 商品视图
     * @return 商品视图
     */
    @Override
    public List<Products> selectProductsList(Products products)
    {
        return productsMapper.selectProductsList(products);
    }

    /**
     * 新增商品视图
     * 
     * @param products 商品视图
     * @return 结果
     */
    @Override
    public int insertProducts(Products products)
    {
        return productsMapper.insertProducts(products);
    }

    /**
     * 修改商品视图
     * 
     * @param products 商品视图
     * @return 结果
     */
    @Override
    public int updateProducts(Products products)
    {
        return productsMapper.updateProducts(products);
    }

    /**
     * 批量删除商品视图
     * 
     * @param productTypes 需要删除的商品视图主键
     * @return 结果
     */
    @Override
    public int deleteProductsByProductTypes(String[] productTypes)
    {
        return productsMapper.deleteProductsByProductTypes(productTypes);
    }

    /**
     * 删除商品视图信息
     * 
     * @param productType 商品视图主键
     * @return 结果
     */
    @Override
    public int deleteProductsByProductType(String productType)
    {
        return productsMapper.deleteProductsByProductType(productType);
    }
}
