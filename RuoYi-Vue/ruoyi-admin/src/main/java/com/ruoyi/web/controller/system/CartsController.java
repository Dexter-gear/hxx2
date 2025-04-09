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
import com.ruoyi.system.domain.Carts;
import com.ruoyi.system.service.ICartsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 购物车视图Controller
 * 
 * @author hxx
 * @date 2025-04-08
 */
@RestController
@RequestMapping("/system/carts")
public class CartsController extends BaseController
{
    @Autowired
    private ICartsService cartsService;

    /**
     * 查询购物车视图列表
     */
    @PreAuthorize("@ss.hasPermi('system:carts:list')")
    @GetMapping("/list")
    public TableDataInfo list(Carts carts)
    {
        startPage();
        List<Carts> list = cartsService.selectCartsList(carts);
        return getDataTable(list);
    }

    /**
     * 导出购物车视图列表
     */
    @PreAuthorize("@ss.hasPermi('system:carts:export')")
    @Log(title = "购物车视图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Carts carts)
    {
        List<Carts> list = cartsService.selectCartsList(carts);
        ExcelUtil<Carts> util = new ExcelUtil<Carts>(Carts.class);
        util.exportExcel(response, list, "购物车视图数据");
    }

    /**
     * 获取购物车视图详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:carts:query')")
    @GetMapping(value = "/{cartId}")
    public AjaxResult getInfo(@PathVariable("cartId") Long cartId)
    {
        return success(cartsService.selectCartsByCartId(cartId));
    }

    /**
     * 新增购物车视图
     */
    @PreAuthorize("@ss.hasPermi('system:carts:add')")
    @Log(title = "购物车视图", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Carts carts)
    {
        return toAjax(cartsService.insertCarts(carts));
    }

    /**
     * 修改购物车视图
     */
    @PreAuthorize("@ss.hasPermi('system:carts:edit')")
    @Log(title = "购物车视图", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Carts carts)
    {
        return toAjax(cartsService.updateCarts(carts));
    }

    /**
     * 删除购物车视图
     */
    @PreAuthorize("@ss.hasPermi('system:carts:remove')")
    @Log(title = "购物车视图", businessType = BusinessType.DELETE)
	@DeleteMapping("/{cartIds}")
    public AjaxResult remove(@PathVariable Long[] cartIds)
    {
        return toAjax(cartsService.deleteCartsByCartIds(cartIds));
    }
}
