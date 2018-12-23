package com.kcl.module.service;

import com.kcl.common.support.Convert;
import com.kcl.module.domain.VersionControl;
import com.kcl.module.mapper.VersionControlMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 版本记录 服务层实现
 *
 * @author kcl
 * @date 2018-11-22
 */
@Service
public class VersionControlServiceImpl implements IVersionControlService
{
	@Autowired
	private VersionControlMapper versionControlMapper;

	/**
     * 查询版本记录信息
     *
     * @param versionId 版本记录ID
     * @return 版本记录信息
     */
    @Override
	public VersionControl selectVersionControlById(Integer versionId)
	{
	    return versionControlMapper.selectVersionControlById(versionId);
	}

	/**
     * 查询版本记录列表
     *
     * @param versionControl 版本记录信息
     * @return 版本记录集合
     */
	@Override
	public List<VersionControl> selectVersionControlList(VersionControl versionControl)
	{
	    return versionControlMapper.selectVersionControlList(versionControl);
	}

    /**
     * 新增版本记录
     *
     * @param versionControl 版本记录信息
     * @return 结果
     */
	@Override
	public int insertVersionControl(VersionControl versionControl)
	{
	    return versionControlMapper.insertVersionControl(versionControl);
	}

	/**
     * 修改版本记录
     *
     * @param versionControl 版本记录信息
     * @return 结果
     */
	@Override
	public int updateVersionControl(VersionControl versionControl)
	{
	    return versionControlMapper.updateVersionControl(versionControl);
	}

	/**
     * 删除版本记录对象
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteVersionControlByIds(String ids)
	{
		return versionControlMapper.deleteVersionControlByIds(Convert.toStrArray(ids));
	}

}
