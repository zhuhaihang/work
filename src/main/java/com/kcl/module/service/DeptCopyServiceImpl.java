package com.kcl.module.service;

import com.kcl.common.support.Convert;
import com.kcl.module.domain.DeptCopy;
import com.kcl.module.mapper.DeptCopyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 部门 服务层实现
 *
 * @author kcl
 * @date 2018-11-19
 */
@Service
public class DeptCopyServiceImpl implements IDeptCopyService
{
	@Autowired
	private DeptCopyMapper deptCopyMapper;

	/**
     * 查询部门信息
     *
     * @param deptId 部门ID
     * @return 部门信息
     */
    @Override
	public DeptCopy selectDeptCopyById(Integer deptId)
	{
	    return deptCopyMapper.selectDeptCopyById(deptId);
	}

	/**
     * 查询部门列表
     *
     * @param deptCopy 部门信息
     * @return 部门集合
     */
	@Override
	public List<DeptCopy> selectDeptCopyList(DeptCopy deptCopy)
	{
	    return deptCopyMapper.selectDeptCopyList(deptCopy);
	}

    /**
     * 新增部门
     *
     * @param deptCopy 部门信息
     * @return 结果
     */
	@Override
	public int insertDeptCopy(DeptCopy deptCopy)
	{
	    return deptCopyMapper.insertDeptCopy(deptCopy);
	}

	/**
     * 修改部门
     *
     * @param deptCopy 部门信息
     * @return 结果
     */
	@Override
	public int updateDeptCopy(DeptCopy deptCopy)
	{
	    return deptCopyMapper.updateDeptCopy(deptCopy);
	}

	/**
     * 删除部门对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteDeptCopyByIds(String ids)
	{
		return deptCopyMapper.deleteDeptCopyByIds(Convert.toStrArray(ids));
	}

}
