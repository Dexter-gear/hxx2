package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.GuoguangApple;

/**
 * 国光苹果Mapper接口
 * 
 * @author hxx
 * @date 2025-04-01
 */
public interface GuoguangAppleMapper 
{
    /**
     * 查询国光苹果
     * 
     * @param id 国光苹果主键
     * @return 国光苹果
     */
    public GuoguangApple selectGuoguangAppleById(Long id);

    /**
     * 查询国光苹果列表
     * 
     * @param guoguangApple 国光苹果
     * @return 国光苹果集合
     */
    public List<GuoguangApple> selectGuoguangAppleList(GuoguangApple guoguangApple);

    /**
     * 新增国光苹果
     * 
     * @param guoguangApple 国光苹果
     * @return 结果
     */
    public int insertGuoguangApple(GuoguangApple guoguangApple);

    /**
     * 修改国光苹果
     * 
     * @param guoguangApple 国光苹果
     * @return 结果
     */
    public int updateGuoguangApple(GuoguangApple guoguangApple);

    /**
     * 删除国光苹果
     * 
     * @param id 国光苹果主键
     * @return 结果
     */
    public int deleteGuoguangAppleById(Long id);

    /**
     * 批量删除国光苹果
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGuoguangAppleByIds(Long[] ids);
}
