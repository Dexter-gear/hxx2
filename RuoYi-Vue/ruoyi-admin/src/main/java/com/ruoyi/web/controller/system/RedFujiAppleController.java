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
import com.ruoyi.system.domain.RedFujiApple;
import com.ruoyi.system.service.IRedFujiAppleService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 红富士苹果Controller
 * 
 * @author hxx
 * @date 2025-04-01
 */
@RestController
@RequestMapping("/system/hfs_apple")
public class RedFujiAppleController extends BaseController
{
    @Autowired
    private IRedFujiAppleService redFujiAppleService;

    /**
     * 查询红富士苹果列表
     */
    @PreAuthorize("@ss.hasPermi('system:hfs_apple:list')")
    @GetMapping("/list")
    public TableDataInfo list(RedFujiApple redFujiApple)
    {
        startPage();
        List<RedFujiApple> list = redFujiAppleService.selectRedFujiAppleList(redFujiApple);
        return getDataTable(list);
    }

    /**
     * 导出红富士苹果列表
     */
    @PreAuthorize("@ss.hasPermi('system:hfs_apple:export')")
    @Log(title = "红富士苹果", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, RedFujiApple redFujiApple)
    {
        List<RedFujiApple> list = redFujiAppleService.selectRedFujiAppleList(redFujiApple);
        ExcelUtil<RedFujiApple> util = new ExcelUtil<RedFujiApple>(RedFujiApple.class);
        util.exportExcel(response, list, "红富士苹果数据");
    }

    /**
     * 获取红富士苹果详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:hfs_apple:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(redFujiAppleService.selectRedFujiAppleById(id));
    }

    /**
     * 新增红富士苹果
     */
    @PreAuthorize("@ss.hasPermi('system:hfs_apple:add')")
    @Log(title = "红富士苹果", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody RedFujiApple redFujiApple)
    {
        return toAjax(redFujiAppleService.insertRedFujiApple(redFujiApple));
    }

    /**
     * 修改红富士苹果
     */
    @PreAuthorize("@ss.hasPermi('system:hfs_apple:edit')")
    @Log(title = "红富士苹果", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody RedFujiApple redFujiApple)
    {
        return toAjax(redFujiAppleService.updateRedFujiApple(redFujiApple));
    }

    /**
     * 删除红富士苹果
     */
    @PreAuthorize("@ss.hasPermi('system:hfs_apple:remove')")
    @Log(title = "红富士苹果", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(redFujiAppleService.deleteRedFujiAppleByIds(ids));
    }
}
