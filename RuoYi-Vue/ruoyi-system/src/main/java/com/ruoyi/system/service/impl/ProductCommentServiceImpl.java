package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.ProductCommentMapper;
import com.ruoyi.system.domain.ProductComment;
import com.ruoyi.system.service.IProductCommentService;

/**
 * 评论Service业务层处理
 * 
 * @author hxx
 * @date 2025-04-01
 */
@Service
public class ProductCommentServiceImpl implements IProductCommentService 
{
    @Autowired
    private ProductCommentMapper productCommentMapper;

    /**
     * 查询评论
     * 
     * @param id 评论主键
     * @return 评论
     */
    @Override
    public ProductComment selectProductCommentById(Long id)
    {
        return productCommentMapper.selectProductCommentById(id);
    }

    /**
     * 查询评论列表
     * 
     * @param productComment 评论
     * @return 评论
     */
    @Override
    public List<ProductComment> selectProductCommentList(ProductComment productComment)
    {
        return productCommentMapper.selectProductCommentList(productComment);
    }

    /**
     * 新增评论
     * 
     * @param productComment 评论
     * @return 结果
     */
    @Override
    public int insertProductComment(ProductComment productComment)
    {
        productComment.setCreateTime(DateUtils.getNowDate());
        return productCommentMapper.insertProductComment(productComment);
    }

    /**
     * 修改评论
     * 
     * @param productComment 评论
     * @return 结果
     */
    @Override
    public int updateProductComment(ProductComment productComment)
    {
        productComment.setUpdateTime(DateUtils.getNowDate());
        return productCommentMapper.updateProductComment(productComment);
    }

    /**
     * 批量删除评论
     * 
     * @param ids 需要删除的评论主键
     * @return 结果
     */
    @Override
    public int deleteProductCommentByIds(Long[] ids)
    {
        return productCommentMapper.deleteProductCommentByIds(ids);
    }

    /**
     * 删除评论信息
     * 
     * @param id 评论主键
     * @return 结果
     */
    @Override
    public int deleteProductCommentById(Long id)
    {
        return productCommentMapper.deleteProductCommentById(id);
    }
}
