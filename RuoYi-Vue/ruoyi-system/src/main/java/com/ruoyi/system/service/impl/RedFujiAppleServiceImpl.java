package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.RedFujiAppleMapper;
import com.ruoyi.system.domain.RedFujiApple;
import com.ruoyi.system.service.IRedFujiAppleService;

/**
 * 红富士苹果Service业务层处理
 * 
 * @author hxx
 * @date 2025-04-01
 */
@Service
public class RedFujiAppleServiceImpl implements IRedFujiAppleService 
{
    @Autowired
    private RedFujiAppleMapper redFujiAppleMapper;

    /**
     * 查询红富士苹果
     * 
     * @param id 红富士苹果主键
     * @return 红富士苹果
     */
    @Override
    public RedFujiApple selectRedFujiAppleById(Long id)
    {
        return redFujiAppleMapper.selectRedFujiAppleById(id);
    }

    /**
     * 查询红富士苹果列表
     * 
     * @param redFujiApple 红富士苹果
     * @return 红富士苹果
     */
    @Override
    public List<RedFujiApple> selectRedFujiAppleList(RedFujiApple redFujiApple)
    {
        return redFujiAppleMapper.selectRedFujiAppleList(redFujiApple);
    }

    /**
     * 新增红富士苹果
     * 
     * @param redFujiApple 红富士苹果
     * @return 结果
     */
    @Override
    public int insertRedFujiApple(RedFujiApple redFujiApple)
    {
        redFujiApple.setCreateTime(DateUtils.getNowDate());
        return redFujiAppleMapper.insertRedFujiApple(redFujiApple);
    }

    /**
     * 修改红富士苹果
     * 
     * @param redFujiApple 红富士苹果
     * @return 结果
     */
    @Override
    public int updateRedFujiApple(RedFujiApple redFujiApple)
    {
        redFujiApple.setUpdateTime(DateUtils.getNowDate());
        return redFujiAppleMapper.updateRedFujiApple(redFujiApple);
    }

    /**
     * 批量删除红富士苹果
     * 
     * @param ids 需要删除的红富士苹果主键
     * @return 结果
     */
    @Override
    public int deleteRedFujiAppleByIds(Long[] ids)
    {
        return redFujiAppleMapper.deleteRedFujiAppleByIds(ids);
    }

    /**
     * 删除红富士苹果信息
     * 
     * @param id 红富士苹果主键
     * @return 结果
     */
    @Override
    public int deleteRedFujiAppleById(Long id)
    {
        return redFujiAppleMapper.deleteRedFujiAppleById(id);
    }
}
