package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.JinguanAppleMapper;
import com.ruoyi.system.domain.JinguanApple;
import com.ruoyi.system.service.IJinguanAppleService;

/**
 * 金冠苹果Service业务层处理
 * 
 * @author hxx
 * @date 2025-04-01
 */
@Service
public class JinguanAppleServiceImpl implements IJinguanAppleService 
{
    @Autowired
    private JinguanAppleMapper jinguanAppleMapper;

    /**
     * 查询金冠苹果
     * 
     * @param id 金冠苹果主键
     * @return 金冠苹果
     */
    @Override
    public JinguanApple selectJinguanAppleById(Long id)
    {
        return jinguanAppleMapper.selectJinguanAppleById(id);
    }

    /**
     * 查询金冠苹果列表
     * 
     * @param jinguanApple 金冠苹果
     * @return 金冠苹果
     */
    @Override
    public List<JinguanApple> selectJinguanAppleList(JinguanApple jinguanApple)
    {
        return jinguanAppleMapper.selectJinguanAppleList(jinguanApple);
    }

    /**
     * 新增金冠苹果
     * 
     * @param jinguanApple 金冠苹果
     * @return 结果
     */
    @Override
    public int insertJinguanApple(JinguanApple jinguanApple)
    {
        jinguanApple.setCreateTime(DateUtils.getNowDate());
        return jinguanAppleMapper.insertJinguanApple(jinguanApple);
    }

    /**
     * 修改金冠苹果
     * 
     * @param jinguanApple 金冠苹果
     * @return 结果
     */
    @Override
    public int updateJinguanApple(JinguanApple jinguanApple)
    {
        jinguanApple.setUpdateTime(DateUtils.getNowDate());
        return jinguanAppleMapper.updateJinguanApple(jinguanApple);
    }

    /**
     * 批量删除金冠苹果
     * 
     * @param ids 需要删除的金冠苹果主键
     * @return 结果
     */
    @Override
    public int deleteJinguanAppleByIds(Long[] ids)
    {
        return jinguanAppleMapper.deleteJinguanAppleByIds(ids);
    }

    /**
     * 删除金冠苹果信息
     * 
     * @param id 金冠苹果主键
     * @return 结果
     */
    @Override
    public int deleteJinguanAppleById(Long id)
    {
        return jinguanAppleMapper.deleteJinguanAppleById(id);
    }
}
