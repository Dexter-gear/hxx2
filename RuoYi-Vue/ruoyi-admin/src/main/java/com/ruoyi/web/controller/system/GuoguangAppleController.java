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
import com.ruoyi.system.domain.GuoguangApple;
import com.ruoyi.system.service.IGuoguangAppleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 国光苹果Controller
 * 
 * @author hxx
 * @date 2025-04-01
 */
@RestController
@RequestMapping("/system/gg_apple")
public class GuoguangAppleController extends BaseController
{
    @Autowired
    private IGuoguangAppleService guoguangAppleService;

    /**
     * 查询国光苹果列表
     */
    @PreAuthorize("@ss.hasPermi('system:gg_apple:list')")
    @GetMapping("/list")
    public TableDataInfo list(GuoguangApple guoguangApple)
    {
        startPage();
        List<GuoguangApple> list = guoguangAppleService.selectGuoguangAppleList(guoguangApple);
        return getDataTable(list);
    }

    /**
     * 导出国光苹果列表
     */
    @PreAuthorize("@ss.hasPermi('system:gg_apple:export')")
    @Log(title = "国光苹果", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GuoguangApple guoguangApple)
    {
        List<GuoguangApple> list = guoguangAppleService.selectGuoguangAppleList(guoguangApple);
        ExcelUtil<GuoguangApple> util = new ExcelUtil<GuoguangApple>(GuoguangApple.class);
        util.exportExcel(response, list, "国光苹果数据");
    }

    /**
     * 获取国光苹果详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:gg_apple:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(guoguangAppleService.selectGuoguangAppleById(id));
    }

    /**
     * 新增国光苹果
     */
    @PreAuthorize("@ss.hasPermi('system:gg_apple:add')")
    @Log(title = "国光苹果", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GuoguangApple guoguangApple)
    {
        return toAjax(guoguangAppleService.insertGuoguangApple(guoguangApple));
    }

    /**
     * 修改国光苹果
     */
    @PreAuthorize("@ss.hasPermi('system:gg_apple:edit')")
    @Log(title = "国光苹果", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GuoguangApple guoguangApple)
    {
        return toAjax(guoguangAppleService.updateGuoguangApple(guoguangApple));
    }

    /**
     * 删除国光苹果
     */
    @PreAuthorize("@ss.hasPermi('system:gg_apple:remove')")
    @Log(title = "国光苹果", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(guoguangAppleService.deleteGuoguangAppleByIds(ids));
    }
}
