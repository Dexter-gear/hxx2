package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.ShoppingCart;

/**
 * 购物车Mapper接口
 * 
 * @author hxx
 * @date 2025-04-01
 */
public interface ShoppingCartMapper 
{
    /**
     * 查询购物车
     * 
     * @param id 购物车主键
     * @return 购物车
     */
    public ShoppingCart selectShoppingCartById(Long id);

    /**
     * 查询购物车列表
     * 
     * @param shoppingCart 购物车
     * @return 购物车集合
     */
    public List<ShoppingCart> selectShoppingCartList(ShoppingCart shoppingCart);

    /**
     * 新增购物车
     * 
     * @param shoppingCart 购物车
     * @return 结果
     */
    public int insertShoppingCart(ShoppingCart shoppingCart);

    /**
     * 修改购物车
     * 
     * @param shoppingCart 购物车
     * @return 结果
     */
    public int updateShoppingCart(ShoppingCart shoppingCart);

    /**
     * 删除购物车
     * 
     * @param id 购物车主键
     * @return 结果
     */
    public int deleteShoppingCartById(Long id);

    /**
     * 批量删除购物车
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteShoppingCartByIds(Long[] ids);
}
