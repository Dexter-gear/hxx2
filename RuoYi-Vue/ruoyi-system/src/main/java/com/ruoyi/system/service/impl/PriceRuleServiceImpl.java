package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.PriceRuleMapper;
import com.ruoyi.system.domain.PriceRule;
import com.ruoyi.system.service.IPriceRuleService;

/**
 * 价格计算规则Service业务层处理
 * 
 * @author hxx
 * @date 2025-04-01
 */
@Service
public class PriceRuleServiceImpl implements IPriceRuleService 
{
    @Autowired
    private PriceRuleMapper priceRuleMapper;

    /**
     * 查询价格计算规则
     * 
     * @param id 价格计算规则主键
     * @return 价格计算规则
     */
    @Override
    public PriceRule selectPriceRuleById(Long id)
    {
        return priceRuleMapper.selectPriceRuleById(id);
    }

    /**
     * 查询价格计算规则列表
     * 
     * @param priceRule 价格计算规则
     * @return 价格计算规则
     */
    @Override
    public List<PriceRule> selectPriceRuleList(PriceRule priceRule)
    {
        return priceRuleMapper.selectPriceRuleList(priceRule);
    }

    /**
     * 新增价格计算规则
     * 
     * @param priceRule 价格计算规则
     * @return 结果
     */
    @Override
    public int insertPriceRule(PriceRule priceRule)
    {
        priceRule.setCreateTime(DateUtils.getNowDate());
        return priceRuleMapper.insertPriceRule(priceRule);
    }

    /**
     * 修改价格计算规则
     * 
     * @param priceRule 价格计算规则
     * @return 结果
     */
    @Override
    public int updatePriceRule(PriceRule priceRule)
    {
        priceRule.setUpdateTime(DateUtils.getNowDate());
        return priceRuleMapper.updatePriceRule(priceRule);
    }

    /**
     * 批量删除价格计算规则
     * 
     * @param ids 需要删除的价格计算规则主键
     * @return 结果
     */
    @Override
    public int deletePriceRuleByIds(Long[] ids)
    {
        return priceRuleMapper.deletePriceRuleByIds(ids);
    }

    /**
     * 删除价格计算规则信息
     * 
     * @param id 价格计算规则主键
     * @return 结果
     */
    @Override
    public int deletePriceRuleById(Long id)
    {
        return priceRuleMapper.deletePriceRuleById(id);
    }
}
