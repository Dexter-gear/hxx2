package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.GuoguangAppleMapper;
import com.ruoyi.system.domain.GuoguangApple;
import com.ruoyi.system.service.IGuoguangAppleService;

/**
 * 国光苹果Service业务层处理
 * 
 * @author hxx
 * @date 2025-04-01
 */
@Service
public class GuoguangAppleServiceImpl implements IGuoguangAppleService 
{
    @Autowired
    private GuoguangAppleMapper guoguangAppleMapper;

    /**
     * 查询国光苹果
     * 
     * @param id 国光苹果主键
     * @return 国光苹果
     */
    @Override
    public GuoguangApple selectGuoguangAppleById(Long id)
    {
        return guoguangAppleMapper.selectGuoguangAppleById(id);
    }

    /**
     * 查询国光苹果列表
     * 
     * @param guoguangApple 国光苹果
     * @return 国光苹果
     */
    @Override
    public List<GuoguangApple> selectGuoguangAppleList(GuoguangApple guoguangApple)
    {
        return guoguangAppleMapper.selectGuoguangAppleList(guoguangApple);
    }

    /**
     * 新增国光苹果
     * 
     * @param guoguangApple 国光苹果
     * @return 结果
     */
    @Override
    public int insertGuoguangApple(GuoguangApple guoguangApple)
    {
        guoguangApple.setCreateTime(DateUtils.getNowDate());
        return guoguangAppleMapper.insertGuoguangApple(guoguangApple);
    }

    /**
     * 修改国光苹果
     * 
     * @param guoguangApple 国光苹果
     * @return 结果
     */
    @Override
    public int updateGuoguangApple(GuoguangApple guoguangApple)
    {
        guoguangApple.setUpdateTime(DateUtils.getNowDate());
        return guoguangAppleMapper.updateGuoguangApple(guoguangApple);
    }

    /**
     * 批量删除国光苹果
     * 
     * @param ids 需要删除的国光苹果主键
     * @return 结果
     */
    @Override
    public int deleteGuoguangAppleByIds(Long[] ids)
    {
        return guoguangAppleMapper.deleteGuoguangAppleByIds(ids);
    }

    /**
     * 删除国光苹果信息
     * 
     * @param id 国光苹果主键
     * @return 结果
     */
    @Override
    public int deleteGuoguangAppleById(Long id)
    {
        return guoguangAppleMapper.deleteGuoguangAppleById(id);
    }
}
