package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.HongxingApple;

/**
 * 红星苹果Service接口
 * 
 * @author hxx
 * @date 2025-04-01
 */
public interface IHongxingAppleService 
{
    /**
     * 查询红星苹果
     * 
     * @param id 红星苹果主键
     * @return 红星苹果
     */
    public HongxingApple selectHongxingAppleById(Long id);

    /**
     * 查询红星苹果列表
     * 
     * @param hongxingApple 红星苹果
     * @return 红星苹果集合
     */
    public List<HongxingApple> selectHongxingAppleList(HongxingApple hongxingApple);

    /**
     * 新增红星苹果
     * 
     * @param hongxingApple 红星苹果
     * @return 结果
     */
    public int insertHongxingApple(HongxingApple hongxingApple);

    /**
     * 修改红星苹果
     * 
     * @param hongxingApple 红星苹果
     * @return 结果
     */
    public int updateHongxingApple(HongxingApple hongxingApple);

    /**
     * 批量删除红星苹果
     * 
     * @param ids 需要删除的红星苹果主键集合
     * @return 结果
     */
    public int deleteHongxingAppleByIds(Long[] ids);

    /**
     * 删除红星苹果信息
     * 
     * @param id 红星苹果主键
     * @return 结果
     */
    public int deleteHongxingAppleById(Long id);
}
