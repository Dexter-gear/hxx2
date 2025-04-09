package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.Carts;

/**
 * 购物车视图Mapper接口
 * 
 * @author hxx
 * @date 2025-04-08
 */
public interface CartsMapper 
{
    /**
     * 查询购物车视图
     * 
     * @param cartId 购物车视图主键
     * @return 购物车视图
     */
    public Carts selectCartsByCartId(Long cartId);

    /**
     * 查询购物车视图列表
     * 
     * @param carts 购物车视图
     * @return 购物车视图集合
     */
    public List<Carts> selectCartsList(Carts carts);

    /**
     * 新增购物车视图
     * 
     * @param carts 购物车视图
     * @return 结果
     */
    public int insertCarts(Carts carts);

    /**
     * 修改购物车视图
     * 
     * @param carts 购物车视图
     * @return 结果
     */
    public int updateCarts(Carts carts);

    /**
     * 删除购物车视图
     * 
     * @param cartId 购物车视图主键
     * @return 结果
     */
    public int deleteCartsByCartId(Long cartId);

    /**
     * 批量删除购物车视图
     * 
     * @param cartIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCartsByCartIds(Long[] cartIds);
}
