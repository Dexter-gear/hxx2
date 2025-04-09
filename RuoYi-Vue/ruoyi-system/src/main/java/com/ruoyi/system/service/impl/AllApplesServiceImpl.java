package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.AllApplesMapper;
import com.ruoyi.system.domain.AllApples;
import com.ruoyi.system.service.IAllApplesService;

/**
 * VIEWService业务层处理
 * 
 * @author hxx
 * @date 2025-04-01
 */
@Service
public class AllApplesServiceImpl implements IAllApplesService 
{
    @Autowired
    private AllApplesMapper allApplesMapper;

    /**
     * 查询VIEW
     * 
     * @param productType VIEW主键
     * @return VIEW
     */
    @Override
    public AllApples selectAllApplesByProductType(String productType)
    {
        return allApplesMapper.selectAllApplesByProductType(productType);
    }

    /**
     * 查询VIEW列表
     * 
     * @param allApples VIEW
     * @return VIEW
     */
    @Override
    public List<AllApples> selectAllApplesList(AllApples allApples)
    {
        return allApplesMapper.selectAllApplesList(allApples);
    }

    /**
     * 新增VIEW
     * 
     * @param allApples VIEW
     * @return 结果
     */
    @Override
    public int insertAllApples(AllApples allApples)
    {
        allApples.setCreateTime(DateUtils.getNowDate());
        return allApplesMapper.insertAllApples(allApples);
    }

    /**
     * 修改VIEW
     * 
     * @param allApples VIEW
     * @return 结果
     */
    @Override
    public int updateAllApples(AllApples allApples)
    {
        allApples.setUpdateTime(DateUtils.getNowDate());
        return allApplesMapper.updateAllApples(allApples);
    }

    /**
     * 批量删除VIEW
     * 
     * @param productTypes 需要删除的VIEW主键
     * @return 结果
     */
    @Override
    public int deleteAllApplesByProductTypes(String[] productTypes)
    {
        return allApplesMapper.deleteAllApplesByProductTypes(productTypes);
    }

    /**
     * 删除VIEW信息
     * 
     * @param productType VIEW主键
     * @return 结果
     */
    @Override
    public int deleteAllApplesByProductType(String productType)
    {
        return allApplesMapper.deleteAllApplesByProductType(productType);
    }
}
