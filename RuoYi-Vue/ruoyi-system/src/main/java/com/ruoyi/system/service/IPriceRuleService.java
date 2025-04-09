package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.PriceRule;

/**
 * 价格计算规则Service接口
 * 
 * @author hxx
 * @date 2025-04-01
 */
public interface IPriceRuleService 
{
    /**
     * 查询价格计算规则
     * 
     * @param id 价格计算规则主键
     * @return 价格计算规则
     */
    public PriceRule selectPriceRuleById(Long id);

    /**
     * 查询价格计算规则列表
     * 
     * @param priceRule 价格计算规则
     * @return 价格计算规则集合
     */
    public List<PriceRule> selectPriceRuleList(PriceRule priceRule);

    /**
     * 新增价格计算规则
     * 
     * @param priceRule 价格计算规则
     * @return 结果
     */
    public int insertPriceRule(PriceRule priceRule);

    /**
     * 修改价格计算规则
     * 
     * @param priceRule 价格计算规则
     * @return 结果
     */
    public int updatePriceRule(PriceRule priceRule);

    /**
     * 批量删除价格计算规则
     * 
     * @param ids 需要删除的价格计算规则主键集合
     * @return 结果
     */
    public int deletePriceRuleByIds(Long[] ids);

    /**
     * 删除价格计算规则信息
     * 
     * @param id 价格计算规则主键
     * @return 结果
     */
    public int deletePriceRuleById(Long id);
}
