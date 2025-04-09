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
import com.ruoyi.system.domain.GreenApple;
import com.ruoyi.system.service.IGreenAppleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 青苹果Controller
 * 
 * @author hxx
 * @date 2025-04-01
 */
@RestController
@RequestMapping("/system/g_apple")
public class GreenAppleController extends BaseController
{
    @Autowired
    private IGreenAppleService greenAppleService;

    /**
     * 查询青苹果列表
     */
    @PreAuthorize("@ss.hasPermi('system:g_apple:list')")
    @GetMapping("/list")
    public TableDataInfo list(GreenApple greenApple)
    {
        startPage();
        List<GreenApple> list = greenAppleService.selectGreenAppleList(greenApple);
        return getDataTable(list);
    }

    /**
     * 导出青苹果列表
     */
    @PreAuthorize("@ss.hasPermi('system:g_apple:export')")
    @Log(title = "青苹果", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, GreenApple greenApple)
    {
        List<GreenApple> list = greenAppleService.selectGreenAppleList(greenApple);
        ExcelUtil<GreenApple> util = new ExcelUtil<GreenApple>(GreenApple.class);
        util.exportExcel(response, list, "青苹果数据");
    }

    /**
     * 获取青苹果详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:g_apple:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(greenAppleService.selectGreenAppleById(id));
    }

    /**
     * 新增青苹果
     */
    @PreAuthorize("@ss.hasPermi('system:g_apple:add')")
    @Log(title = "青苹果", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody GreenApple greenApple)
    {
        return toAjax(greenAppleService.insertGreenApple(greenApple));
    }

    /**
     * 修改青苹果
     */
    @PreAuthorize("@ss.hasPermi('system:g_apple:edit')")
    @Log(title = "青苹果", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody GreenApple greenApple)
    {
        return toAjax(greenAppleService.updateGreenApple(greenApple));
    }

    /**
     * 删除青苹果
     */
    @PreAuthorize("@ss.hasPermi('system:g_apple:remove')")
    @Log(title = "青苹果", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(greenAppleService.deleteGreenAppleByIds(ids));
    }
}
