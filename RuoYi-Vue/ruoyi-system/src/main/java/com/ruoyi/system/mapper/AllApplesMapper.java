package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.AllApples;

/**
 * VIEWMapper接口
 * 
 * @author hxx
 * @date 2025-04-01
 */
public interface AllApplesMapper 
{
    /**
     * 查询VIEW
     * 
     * @param productType VIEW主键
     * @return VIEW
     */
    public AllApples selectAllApplesByProductType(String productType);

    /**
     * 查询VIEW列表
     * 
     * @param allApples VIEW
     * @return VIEW集合
     */
    public List<AllApples> selectAllApplesList(AllApples allApples);

    /**
     * 新增VIEW
     * 
     * @param allApples VIEW
     * @return 结果
     */
    public int insertAllApples(AllApples allApples);

    /**
     * 修改VIEW
     * 
     * @param allApples VIEW
     * @return 结果
     */
    public int updateAllApples(AllApples allApples);

    /**
     * 删除VIEW
     * 
     * @param productType VIEW主键
     * @return 结果
     */
    public int deleteAllApplesByProductType(String productType);

    /**
     * 批量删除VIEW
     * 
     * @param productTypes 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteAllApplesByProductTypes(String[] productTypes);
}
