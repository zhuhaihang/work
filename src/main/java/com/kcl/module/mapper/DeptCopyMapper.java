package com.kcl.module.mapper;

import com.kcl.module.domain.DeptCopy;

import java.util.List;

/**
 * 部门 数据层
 *
 * @author kcl
 * @date 2018-11-19
 */
public interface DeptCopyMapper
{
	/**
     * 查询部门信息
     *
     * @param deptId 部门ID
     * @return 部门信息
     */
	public DeptCopy selectDeptCopyById(Integer deptId);

	/**
     * 查询部门列表
     *
     * @param deptCopy 部门信息
     * @return 部门集合
     */
	public List<DeptCopy> selectDeptCopyList(DeptCopy deptCopy);

	/**
     * 新增部门
     *
     * @param deptCopy 部门信息
     * @return 结果
     */
	public int insertDeptCopy(DeptCopy deptCopy);

	/**
     * 修改部门
     *
     * @param deptCopy 部门信息
     * @return 结果
     */
	public int updateDeptCopy(DeptCopy deptCopy);

	/**
     * 删除部门
     *
     * @param deptId 部门ID
     * @return 结果
     */
	public int deleteDeptCopyById(Integer deptId);

	/**
     * 批量删除部门
     *
     * @param deptIds 需要删除的数据ID
     * @return 结果
     */
	public int deleteDeptCopyByIds(String[] deptIds);

}
