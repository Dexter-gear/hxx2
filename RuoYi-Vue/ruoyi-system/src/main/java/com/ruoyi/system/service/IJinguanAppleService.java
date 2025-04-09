package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.JinguanApple;

/**
 * 金冠苹果Service接口
 * 
 * @author hxx
 * @date 2025-04-01
 */
public interface IJinguanAppleService 
{
    /**
     * 查询金冠苹果
     * 
     * @param id 金冠苹果主键
     * @return 金冠苹果
     */
    public JinguanApple selectJinguanAppleById(Long id);

    /**
     * 查询金冠苹果列表
     * 
     * @param jinguanApple 金冠苹果
     * @return 金冠苹果集合
     */
    public List<JinguanApple> selectJinguanAppleList(JinguanApple jinguanApple);

    /**
     * 新增金冠苹果
     * 
     * @param jinguanApple 金冠苹果
     * @return 结果
     */
    public int insertJinguanApple(JinguanApple jinguanApple);

    /**
     * 修改金冠苹果
     * 
     * @param jinguanApple 金冠苹果
     * @return 结果
     */
    public int updateJinguanApple(JinguanApple jinguanApple);

    /**
     * 批量删除金冠苹果
     * 
     * @param ids 需要删除的金冠苹果主键集合
     * @return 结果
     */
    public int deleteJinguanAppleByIds(Long[] ids);

    /**
     * 删除金冠苹果信息
     * 
     * @param id 金冠苹果主键
     * @return 结果
     */
    public int deleteJinguanAppleById(Long id);
}
