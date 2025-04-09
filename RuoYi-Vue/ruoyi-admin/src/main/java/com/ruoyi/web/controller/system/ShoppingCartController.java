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
import com.ruoyi.system.domain.ShoppingCart;
import com.ruoyi.system.service.IShoppingCartService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 购物车Controller
 * 
 * @author hxx
 * @date 2025-04-01
 */
@RestController
@RequestMapping("/system/cart")
public class ShoppingCartController extends BaseController
{
    @Autowired
    private IShoppingCartService shoppingCartService;

    /**
     * 查询购物车列表
     */
    @PreAuthorize("@ss.hasPermi('system:cart:list')")
    @GetMapping("/list")
    public TableDataInfo list(ShoppingCart shoppingCart)
    {
        startPage();
        List<ShoppingCart> list = shoppingCartService.selectShoppingCartList(shoppingCart);
        return getDataTable(list);
    }

    /**
     * 导出购物车列表
     */
    @PreAuthorize("@ss.hasPermi('system:cart:export')")
    @Log(title = "购物车", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ShoppingCart shoppingCart)
    {
        List<ShoppingCart> list = shoppingCartService.selectShoppingCartList(shoppingCart);
        ExcelUtil<ShoppingCart> util = new ExcelUtil<ShoppingCart>(ShoppingCart.class);
        util.exportExcel(response, list, "购物车数据");
    }

    /**
     * 获取购物车详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:cart:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(shoppingCartService.selectShoppingCartById(id));
    }

    /**
     * 新增购物车
     */
    @PreAuthorize("@ss.hasPermi('system:cart:add')")
    @Log(title = "购物车", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ShoppingCart shoppingCart)
    {
        return toAjax(shoppingCartService.insertShoppingCart(shoppingCart));
    }

    /**
     * 修改购物车
     */
    @PreAuthorize("@ss.hasPermi('system:cart:edit')")
    @Log(title = "购物车", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ShoppingCart shoppingCart)
    {
        return toAjax(shoppingCartService.updateShoppingCart(shoppingCart));
    }

    /**
     * 删除购物车
     */
    @PreAuthorize("@ss.hasPermi('system:cart:remove')")
    @Log(title = "购物车", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(shoppingCartService.deleteShoppingCartByIds(ids));
    }
}
