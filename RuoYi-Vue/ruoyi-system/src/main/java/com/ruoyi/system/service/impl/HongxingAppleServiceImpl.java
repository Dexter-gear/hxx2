package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.HongxingAppleMapper;
import com.ruoyi.system.domain.HongxingApple;
import com.ruoyi.system.service.IHongxingAppleService;

/**
 * 红星苹果Service业务层处理
 * 
 * @author hxx
 * @date 2025-04-01
 */
@Service
public class HongxingAppleServiceImpl implements IHongxingAppleService 
{
    @Autowired
    private HongxingAppleMapper hongxingAppleMapper;

    /**
     * 查询红星苹果
     * 
     * @param id 红星苹果主键
     * @return 红星苹果
     */
    @Override
    public HongxingApple selectHongxingAppleById(Long id)
    {
        return hongxingAppleMapper.selectHongxingAppleById(id);
    }

    /**
     * 查询红星苹果列表
     * 
     * @param hongxingApple 红星苹果
     * @return 红星苹果
     */
    @Override
    public List<HongxingApple> selectHongxingAppleList(HongxingApple hongxingApple)
    {
        return hongxingAppleMapper.selectHongxingAppleList(hongxingApple);
    }

    /**
     * 新增红星苹果
     * 
     * @param hongxingApple 红星苹果
     * @return 结果
     */
    @Override
    public int insertHongxingApple(HongxingApple hongxingApple)
    {
        hongxingApple.setCreateTime(DateUtils.getNowDate());
        return hongxingAppleMapper.insertHongxingApple(hongxingApple);
    }

    /**
     * 修改红星苹果
     * 
     * @param hongxingApple 红星苹果
     * @return 结果
     */
    @Override
    public int updateHongxingApple(HongxingApple hongxingApple)
    {
        hongxingApple.setUpdateTime(DateUtils.getNowDate());
        return hongxingAppleMapper.updateHongxingApple(hongxingApple);
    }

    /**
     * 批量删除红星苹果
     * 
     * @param ids 需要删除的红星苹果主键
     * @return 结果
     */
    @Override
    public int deleteHongxingAppleByIds(Long[] ids)
    {
        return hongxingAppleMapper.deleteHongxingAppleByIds(ids);
    }

    /**
     * 删除红星苹果信息
     * 
     * @param id 红星苹果主键
     * @return 结果
     */
    @Override
    public int deleteHongxingAppleById(Long id)
    {
        return hongxingAppleMapper.deleteHongxingAppleById(id);
    }
}
