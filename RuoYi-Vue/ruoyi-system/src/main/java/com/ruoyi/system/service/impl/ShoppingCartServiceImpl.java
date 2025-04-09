package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ShoppingCartMapper;
import com.ruoyi.system.domain.ShoppingCart;
import com.ruoyi.system.service.IShoppingCartService;

/**
 * 购物车Service业务层处理
 * 
 * @author hxx
 * @date 2025-04-01
 */
@Service
public class ShoppingCartServiceImpl implements IShoppingCartService 
{
    @Autowired
    private ShoppingCartMapper shoppingCartMapper;

    /**
     * 查询购物车
     * 
     * @param id 购物车主键
     * @return 购物车
     */
    @Override
    public ShoppingCart selectShoppingCartById(Long id)
    {
        return shoppingCartMapper.selectShoppingCartById(id);
    }

    /**
     * 查询购物车列表
     * 
     * @param shoppingCart 购物车
     * @return 购物车
     */
    @Override
    public List<ShoppingCart> selectShoppingCartList(ShoppingCart shoppingCart)
    {
        return shoppingCartMapper.selectShoppingCartList(shoppingCart);
    }

    /**
     * 新增购物车
     * 
     * @param shoppingCart 购物车
     * @return 结果
     */
    @Override
    public int insertShoppingCart(ShoppingCart shoppingCart)
    {
        shoppingCart.setCreateTime(DateUtils.getNowDate());
        return shoppingCartMapper.insertShoppingCart(shoppingCart);
    }

    /**
     * 修改购物车
     * 
     * @param shoppingCart 购物车
     * @return 结果
     */
    @Override
    public int updateShoppingCart(ShoppingCart shoppingCart)
    {
        shoppingCart.setUpdateTime(DateUtils.getNowDate());
        return shoppingCartMapper.updateShoppingCart(shoppingCart);
    }

    /**
     * 批量删除购物车
     * 
     * @param ids 需要删除的购物车主键
     * @return 结果
     */
    @Override
    public int deleteShoppingCartByIds(Long[] ids)
    {
        return shoppingCartMapper.deleteShoppingCartByIds(ids);
    }

    /**
     * 删除购物车信息
     * 
     * @param id 购物车主键
     * @return 结果
     */
    @Override
    public int deleteShoppingCartById(Long id)
    {
        return shoppingCartMapper.deleteShoppingCartById(id);
    }
}
