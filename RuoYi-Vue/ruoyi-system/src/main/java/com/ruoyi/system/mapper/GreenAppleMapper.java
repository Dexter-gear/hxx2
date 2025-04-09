package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.GreenApple;

/**
 * 青苹果Mapper接口
 * 
 * @author hxx
 * @date 2025-04-01
 */
public interface GreenAppleMapper 
{
    /**
     * 查询青苹果
     * 
     * @param id 青苹果主键
     * @return 青苹果
     */
    public GreenApple selectGreenAppleById(Long id);

    /**
     * 查询青苹果列表
     * 
     * @param greenApple 青苹果
     * @return 青苹果集合
     */
    public List<GreenApple> selectGreenAppleList(GreenApple greenApple);

    /**
     * 新增青苹果
     * 
     * @param greenApple 青苹果
     * @return 结果
     */
    public int insertGreenApple(GreenApple greenApple);

    /**
     * 修改青苹果
     * 
     * @param greenApple 青苹果
     * @return 结果
     */
    public int updateGreenApple(GreenApple greenApple);

    /**
     * 删除青苹果
     * 
     * @param id 青苹果主键
     * @return 结果
     */
    public int deleteGreenAppleById(Long id);

    /**
     * 批量删除青苹果
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteGreenAppleByIds(Long[] ids);
}
