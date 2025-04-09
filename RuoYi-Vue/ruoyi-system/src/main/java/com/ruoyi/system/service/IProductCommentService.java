package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.ProductComment;

/**
 * 评论Service接口
 * 
 * @author hxx
 * @date 2025-04-01
 */
public interface IProductCommentService 
{
    /**
     * 查询评论
     * 
     * @param id 评论主键
     * @return 评论
     */
    public ProductComment selectProductCommentById(Long id);

    /**
     * 查询评论列表
     * 
     * @param productComment 评论
     * @return 评论集合
     */
    public List<ProductComment> selectProductCommentList(ProductComment productComment);

    /**
     * 新增评论
     * 
     * @param productComment 评论
     * @return 结果
     */
    public int insertProductComment(ProductComment productComment);

    /**
     * 修改评论
     * 
     * @param productComment 评论
     * @return 结果
     */
    public int updateProductComment(ProductComment productComment);

    /**
     * 批量删除评论
     * 
     * @param ids 需要删除的评论主键集合
     * @return 结果
     */
    public int deleteProductCommentByIds(Long[] ids);

    /**
     * 删除评论信息
     * 
     * @param id 评论主键
     * @return 结果
     */
    public int deleteProductCommentById(Long id);
}
