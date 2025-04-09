package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GreenAppleMapper;
import com.ruoyi.system.domain.GreenApple;
import com.ruoyi.system.service.IGreenAppleService;

/**
 * 青苹果Service业务层处理
 * 
 * @author hxx
 * @date 2025-04-01
 */
@Service
public class GreenAppleServiceImpl implements IGreenAppleService 
{
    @Autowired
    private GreenAppleMapper greenAppleMapper;

    /**
     * 查询青苹果
     * 
     * @param id 青苹果主键
     * @return 青苹果
     */
    @Override
    public GreenApple selectGreenAppleById(Long id)
    {
        return greenAppleMapper.selectGreenAppleById(id);
    }

    /**
     * 查询青苹果列表
     * 
     * @param greenApple 青苹果
     * @return 青苹果
     */
    @Override
    public List<GreenApple> selectGreenAppleList(GreenApple greenApple)
    {
        return greenAppleMapper.selectGreenAppleList(greenApple);
    }

    /**
     * 新增青苹果
     * 
     * @param greenApple 青苹果
     * @return 结果
     */
    @Override
    public int insertGreenApple(GreenApple greenApple)
    {
        greenApple.setCreateTime(DateUtils.getNowDate());
        return greenAppleMapper.insertGreenApple(greenApple);
    }

    /**
     * 修改青苹果
     * 
     * @param greenApple 青苹果
     * @return 结果
     */
    @Override
    public int updateGreenApple(GreenApple greenApple)
    {
        greenApple.setUpdateTime(DateUtils.getNowDate());
        return greenAppleMapper.updateGreenApple(greenApple);
    }

    /**
     * 批量删除青苹果
     * 
     * @param ids 需要删除的青苹果主键
     * @return 结果
     */
    @Override
    public int deleteGreenAppleByIds(Long[] ids)
    {
        return greenAppleMapper.deleteGreenAppleByIds(ids);
    }

    /**
     * 删除青苹果信息
     * 
     * @param id 青苹果主键
     * @return 结果
     */
    @Override
    public int deleteGreenAppleById(Long id)
    {
        return greenAppleMapper.deleteGreenAppleById(id);
    }
}
