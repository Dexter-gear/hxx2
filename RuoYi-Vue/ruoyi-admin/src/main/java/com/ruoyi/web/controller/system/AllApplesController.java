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
import com.ruoyi.system.domain.AllApples;
import com.ruoyi.system.service.IAllApplesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * VIEWController
 * 
 * @author hxx
 * @date 2025-04-01
 */
@RestController
@RequestMapping("/system/apples")
public class AllApplesController extends BaseController
{
    @Autowired
    private IAllApplesService allApplesService;

    /**
     * 查询VIEW列表
     */
    @PreAuthorize("@ss.hasPermi('system:apples:list')")
    @GetMapping("/list")
    public TableDataInfo list(AllApples allApples)
    {
        startPage();
        List<AllApples> list = allApplesService.selectAllApplesList(allApples);
        return getDataTable(list);
    }

    /**
     * 导出VIEW列表
     */
    @PreAuthorize("@ss.hasPermi('system:apples:export')")
    @Log(title = "VIEW", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, AllApples allApples)
    {
        List<AllApples> list = allApplesService.selectAllApplesList(allApples);
        ExcelUtil<AllApples> util = new ExcelUtil<AllApples>(AllApples.class);
        util.exportExcel(response, list, "VIEW数据");
    }

    /**
     * 获取VIEW详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:apples:query')")
    @GetMapping(value = "/{productType}")
    public AjaxResult getInfo(@PathVariable("productType") String productType)
    {
        return success(allApplesService.selectAllApplesByProductType(productType));
    }

    /**
     * 新增VIEW
     */
    @PreAuthorize("@ss.hasPermi('system:apples:add')")
    @Log(title = "VIEW", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody AllApples allApples)
    {
        return toAjax(allApplesService.insertAllApples(allApples));
    }

    /**
     * 修改VIEW
     */
    @PreAuthorize("@ss.hasPermi('system:apples:edit')")
    @Log(title = "VIEW", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody AllApples allApples)
    {
        return toAjax(allApplesService.updateAllApples(allApples));
    }

    /**
     * 删除VIEW
     */
    @PreAuthorize("@ss.hasPermi('system:apples:remove')")
    @Log(title = "VIEW", businessType = BusinessType.DELETE)
	@DeleteMapping("/{productTypes}")
    public AjaxResult remove(@PathVariable String[] productTypes)
    {
        return toAjax(allApplesService.deleteAllApplesByProductTypes(productTypes));
    }
}
