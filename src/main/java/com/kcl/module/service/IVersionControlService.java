package com.kcl.module.service;

import com.kcl.module.domain.VersionControl;

import java.util.List;

/**
 * 版本记录 服务层
 *
 * @author kcl
 * @date 2018-11-22
 */
public interface IVersionControlService
{
	/**
     * 查询版本记录信息
     *
     * @param versionId 版本记录ID
     * @return 版本记录信息
     */
	public VersionControl selectVersionControlById(Integer versionId);

	/**
     * 查询版本记录列表
     *
     * @param versionControl 版本记录信息
     * @return 版本记录集合
     */
	public List<VersionControl> selectVersionControlList(VersionControl versionControl);

	/**
     * 新增版本记录
     *
     * @param versionControl 版本记录信息
     * @return 结果
     */
	public int insertVersionControl(VersionControl versionControl);

	/**
     * 修改版本记录
     *
     * @param versionControl 版本记录信息
     * @return 结果
     */
	public int updateVersionControl(VersionControl versionControl);

	/**
     * 删除版本记录信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteVersionControlByIds(String ids);

}
