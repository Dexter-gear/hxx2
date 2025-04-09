package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.RedFujiApple;

/**
 * 红富士苹果Mapper接口
 * 
 * @author hxx
 * @date 2025-04-01
 */
public interface RedFujiAppleMapper 
{
    /**
     * 查询红富士苹果
     * 
     * @param id 红富士苹果主键
     * @return 红富士苹果
     */
    public RedFujiApple selectRedFujiAppleById(Long id);

    /**
     * 查询红富士苹果列表
     * 
     * @param redFujiApple 红富士苹果
     * @return 红富士苹果集合
     */
    public List<RedFujiApple> selectRedFujiAppleList(RedFujiApple redFujiApple);

    /**
     * 新增红富士苹果
     * 
     * @param redFujiApple 红富士苹果
     * @return 结果
     */
    public int insertRedFujiApple(RedFujiApple redFujiApple);

    /**
     * 修改红富士苹果
     * 
     * @param redFujiApple 红富士苹果
     * @return 结果
     */
    public int updateRedFujiApple(RedFujiApple redFujiApple);

    /**
     * 删除红富士苹果
     * 
     * @param id 红富士苹果主键
     * @return 结果
     */
    public int deleteRedFujiAppleById(Long id);

    /**
     * 批量删除红富士苹果
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRedFujiAppleByIds(Long[] ids);
}
