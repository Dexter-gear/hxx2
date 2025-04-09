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
import com.ruoyi.system.domain.JinguanApple;
import com.ruoyi.system.service.IJinguanAppleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 金冠苹果Controller
 * 
 * @author hxx
 * @date 2025-04-01
 */
@RestController
@RequestMapping("/system/jg_apple")
public class JinguanAppleController extends BaseController
{
    @Autowired
    private IJinguanAppleService jinguanAppleService;

    /**
     * 查询金冠苹果列表
     */
    @PreAuthorize("@ss.hasPermi('system:jg_apple:list')")
    @GetMapping("/list")
    public TableDataInfo list(JinguanApple jinguanApple)
    {
        startPage();
        List<JinguanApple> list = jinguanAppleService.selectJinguanAppleList(jinguanApple);
        return getDataTable(list);
    }

    /**
     * 导出金冠苹果列表
     */
    @PreAuthorize("@ss.hasPermi('system:jg_apple:export')")
    @Log(title = "金冠苹果", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, JinguanApple jinguanApple)
    {
        List<JinguanApple> list = jinguanAppleService.selectJinguanAppleList(jinguanApple);
        ExcelUtil<JinguanApple> util = new ExcelUtil<JinguanApple>(JinguanApple.class);
        util.exportExcel(response, list, "金冠苹果数据");
    }

    /**
     * 获取金冠苹果详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:jg_apple:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(jinguanAppleService.selectJinguanAppleById(id));
    }

    /**
     * 新增金冠苹果
     */
    @PreAuthorize("@ss.hasPermi('system:jg_apple:add')")
    @Log(title = "金冠苹果", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody JinguanApple jinguanApple)
    {
        return toAjax(jinguanAppleService.insertJinguanApple(jinguanApple));
    }

    /**
     * 修改金冠苹果
     */
    @PreAuthorize("@ss.hasPermi('system:jg_apple:edit')")
    @Log(title = "金冠苹果", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody JinguanApple jinguanApple)
    {
        return toAjax(jinguanAppleService.updateJinguanApple(jinguanApple));
    }

    /**
     * 删除金冠苹果
     */
    @PreAuthorize("@ss.hasPermi('system:jg_apple:remove')")
    @Log(title = "金冠苹果", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(jinguanAppleService.deleteJinguanAppleByIds(ids));
    }
}
