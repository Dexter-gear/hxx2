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
import com.ruoyi.system.domain.HongxingApple;
import com.ruoyi.system.service.IHongxingAppleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 红星苹果Controller
 * 
 * @author hxx
 * @date 2025-04-01
 */
@RestController
@RequestMapping("/system/hx_apple")
public class HongxingAppleController extends BaseController
{
    @Autowired
    private IHongxingAppleService hongxingAppleService;

    /**
     * 查询红星苹果列表
     */
    @PreAuthorize("@ss.hasPermi('system:hx_apple:list')")
    @GetMapping("/list")
    public TableDataInfo list(HongxingApple hongxingApple)
    {
        startPage();
        List<HongxingApple> list = hongxingAppleService.selectHongxingAppleList(hongxingApple);
        return getDataTable(list);
    }

    /**
     * 导出红星苹果列表
     */
    @PreAuthorize("@ss.hasPermi('system:hx_apple:export')")
    @Log(title = "红星苹果", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, HongxingApple hongxingApple)
    {
        List<HongxingApple> list = hongxingAppleService.selectHongxingAppleList(hongxingApple);
        ExcelUtil<HongxingApple> util = new ExcelUtil<HongxingApple>(HongxingApple.class);
        util.exportExcel(response, list, "红星苹果数据");
    }

    /**
     * 获取红星苹果详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:hx_apple:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(hongxingAppleService.selectHongxingAppleById(id));
    }

    /**
     * 新增红星苹果
     */
    @PreAuthorize("@ss.hasPermi('system:hx_apple:add')")
    @Log(title = "红星苹果", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody HongxingApple hongxingApple)
    {
        return toAjax(hongxingAppleService.insertHongxingApple(hongxingApple));
    }

    /**
     * 修改红星苹果
     */
    @PreAuthorize("@ss.hasPermi('system:hx_apple:edit')")
    @Log(title = "红星苹果", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody HongxingApple hongxingApple)
    {
        return toAjax(hongxingAppleService.updateHongxingApple(hongxingApple));
    }

    /**
     * 删除红星苹果
     */
    @PreAuthorize("@ss.hasPermi('system:hx_apple:remove')")
    @Log(title = "红星苹果", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(hongxingAppleService.deleteHongxingAppleByIds(ids));
    }
}
