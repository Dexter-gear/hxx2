package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.PriceRule;
import com.ruoyi.system.service.IPriceRuleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 价格计算规则Controller
 * 
 * @author hxx
 * @date 2025-04-01
 */
@RestController
@RequestMapping("/system/rule")
public class PriceRuleController extends BaseController
{
    @Autowired
    private IPriceRuleService priceRuleService;

    /**
     * 查询价格计算规则列表
     */
    @PreAuthorize("@ss.hasPermi('system:rule:list')")
    @GetMapping("/list")
    public TableDataInfo list(PriceRule priceRule)
    {
        startPage();
        List<PriceRule> list = priceRuleService.selectPriceRuleList(priceRule);
        return getDataTable(list);
    }

    /**
     * 导出价格计算规则列表
     */
    @PreAuthorize("@ss.hasPermi('system:rule:export')")
    @Log(title = "价格计算规则", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, PriceRule priceRule)
    {
        List<PriceRule> list = priceRuleService.selectPriceRuleList(priceRule);
        ExcelUtil<PriceRule> util = new ExcelUtil<PriceRule>(PriceRule.class);
        util.exportExcel(response, list, "价格计算规则数据");
    }

    /**
     * 获取价格计算规则详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:rule:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(priceRuleService.selectPriceRuleById(id));
    }

    /**
     * 新增价格计算规则
     */
    @PreAuthorize("@ss.hasPermi('system:rule:add')")
    @Log(title = "价格计算规则", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody PriceRule priceRule)
    {
        return toAjax(priceRuleService.insertPriceRule(priceRule));
    }

    /**
     * 修改价格计算规则
     */
    @PreAuthorize("@ss.hasPermi('system:rule:edit')")
    @Log(title = "价格计算规则", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody PriceRule priceRule)
    {
        return toAjax(priceRuleService.updatePriceRule(priceRule));
    }

    /**
     * 删除价格计算规则
     */
    @PreAuthorize("@ss.hasPermi('system:rule:remove')")
    @Log(title = "价格计算规则", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(priceRuleService.deletePriceRuleByIds(ids));
    }
}
