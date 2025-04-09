package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.CartsMapper;
import com.ruoyi.system.domain.Carts;
import com.ruoyi.system.service.ICartsService;

/**
 * 购物车视图Service业务层处理
 * 
 * @author hxx
 * @date 2025-04-08
 */
@Service
public class CartsServiceImpl implements ICartsService 
{
    @Autowired
    private CartsMapper cartsMapper;

    /**
     * 查询购物车视图
     * 
     * @param cartId 购物车视图主键
     * @return 购物车视图
     */
    @Override
    public Carts selectCartsByCartId(Long cartId)
    {
        return cartsMapper.selectCartsByCartId(cartId);
    }

    /**
     * 查询购物车视图列表
     * 
     * @param carts 购物车视图
     * @return 购物车视图
     */
    @Override
    public List<Carts> selectCartsList(Carts carts)
    {
        return cartsMapper.selectCartsList(carts);
    }

    /**
     * 新增购物车视图
     * 
     * @param carts 购物车视图
     * @return 结果
     */
    @Override
    public int insertCarts(Carts carts)
    {
        return cartsMapper.insertCarts(carts);
    }

    /**
     * 修改购物车视图
     * 
     * @param carts 购物车视图
     * @return 结果
     */
    @Override
    public int updateCarts(Carts carts)
    {
        return cartsMapper.updateCarts(carts);
    }

    /**
     * 批量删除购物车视图
     * 
     * @param cartIds 需要删除的购物车视图主键
     * @return 结果
     */
    @Override
    public int deleteCartsByCartIds(Long[] cartIds)
    {
        return cartsMapper.deleteCartsByCartIds(cartIds);
    }

    /**
     * 删除购物车视图信息
     * 
     * @param cartId 购物车视图主键
     * @return 结果
     */
    @Override
    public int deleteCartsByCartId(Long cartId)
    {
        return cartsMapper.deleteCartsByCartId(cartId);
    }
}
