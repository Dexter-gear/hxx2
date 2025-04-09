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
import com.ruoyi.system.domain.Products;
import com.ruoyi.system.service.IProductsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 商品视图Controller
 * 
 * @author hxx
 * @date 2025-04-08
 */
@RestController
@RequestMapping("/system/products")
public class ProductsController extends BaseController
{
    @Autowired
    private IProductsService productsService;

    /**
     * 查询商品视图列表
     */
    @PreAuthorize("@ss.hasPermi('system:products:list')")
    @GetMapping("/list")
    public TableDataInfo list(Products products)
    {
        startPage();
        List<Products> list = productsService.selectProductsList(products);
        return getDataTable(list);
    }

    /**
     * 导出商品视图列表
     */
    @PreAuthorize("@ss.hasPermi('system:products:export')")
    @Log(title = "商品视图", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Products products)
    {
        List<Products> list = productsService.selectProductsList(products);
        ExcelUtil<Products> util = new ExcelUtil<Products>(Products.class);
        util.exportExcel(response, list, "商品视图数据");
    }

    /**
     * 获取商品视图详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:products:query')")
    @GetMapping(value = "/{productType}")
    public AjaxResult getInfo(@PathVariable("productType") String productType)
    {
        return success(productsService.selectProductsByProductType(productType));
    }

    /**
     * 新增商品视图
     */
    @PreAuthorize("@ss.hasPermi('system:products:add')")
    @Log(title = "商品视图", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Products products)
    {
        return toAjax(productsService.insertProducts(products));
    }

    /**
     * 修改商品视图
     */
    @PreAuthorize("@ss.hasPermi('system:products:edit')")
    @Log(title = "商品视图", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Products products)
    {
        return toAjax(productsService.updateProducts(products));
    }

    /**
     * 删除商品视图
     */
    @PreAuthorize("@ss.hasPermi('system:products:remove')")
    @Log(title = "商品视图", businessType = BusinessType.DELETE)
	@DeleteMapping("/{productTypes}")
    public AjaxResult remove(@PathVariable String[] productTypes)
    {
        return toAjax(productsService.deleteProductsByProductTypes(productTypes));
    }
}
