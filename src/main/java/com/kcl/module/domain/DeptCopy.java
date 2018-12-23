package com.kcl.module.domain;

import com.kcl.common.base.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 部门表 sys_dept_copy
 *
 * @author kcl
 * @date 2018-11-19
 */
public class DeptCopy extends BaseEntity
{
	private static final long serialVersionUID = 1L;

	/** 部门id */
	private Integer deptId;
	/** 父部门id */
	private Integer parentId;
	/** 祖级列表 */
	private String ancestors;
	/** 部门名称 */
	private String deptName;
	/** 显示顺序 */
	private Integer orderNum;
	/** 负责人 */
	private String leader;
	/** 联系电话 */
	private String phone;
	/** 邮箱 */
	private String email;
	/** 部门状态（0正常 1停用） */
	private String status;
	/** 删除标志（0代表存在 2代表删除） */
	private String delFlag;
	/** 创建者 */
	private String createBy;
	/** 创建时间 */
	private Date createTime;
	/** 更新者 */
	private String updateBy;
	/** 更新时间 */
	private Date updateTime;

	public void setDeptId(Integer deptId)
	{
		this.deptId = deptId;
	}

	public Integer getDeptId()
	{
		return deptId;
	}
	public void setParentId(Integer parentId)
	{
		this.parentId = parentId;
	}

	public Integer getParentId()
	{
		return parentId;
	}
	public void setAncestors(String ancestors)
	{
		this.ancestors = ancestors;
	}

	public String getAncestors()
	{
		return ancestors;
	}
	public void setDeptName(String deptName)
	{
		this.deptName = deptName;
	}

	public String getDeptName()
	{
		return deptName;
	}
	public void setOrderNum(Integer orderNum)
	{
		this.orderNum = orderNum;
	}

	public Integer getOrderNum()
	{
		return orderNum;
	}
	public void setLeader(String leader)
	{
		this.leader = leader;
	}

	public String getLeader()
	{
		return leader;
	}
	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	public String getPhone()
	{
		return phone;
	}
	public void setEmail(String email)
	{
		this.email = email;
	}

	public String getEmail()
	{
		return email;
	}
	public void setStatus(String status)
	{
		this.status = status;
	}

	public String getStatus()
	{
		return status;
	}
	public void setDelFlag(String delFlag)
	{
		this.delFlag = delFlag;
	}

	public String getDelFlag()
	{
		return delFlag;
	}
	public void setCreateBy(String createBy)
	{
		this.createBy = createBy;
	}

	public String getCreateBy()
	{
		return createBy;
	}
	public void setCreateTime(Date createTime)
	{
		this.createTime = createTime;
	}

	public Date getCreateTime()
	{
		return createTime;
	}
	public void setUpdateBy(String updateBy)
	{
		this.updateBy = updateBy;
	}

	public String getUpdateBy()
	{
		return updateBy;
	}
	public void setUpdateTime(Date updateTime)
	{
		this.updateTime = updateTime;
	}

	public Date getUpdateTime()
	{
		return updateTime;
	}

    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("deptId", getDeptId())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("deptName", getDeptName())
            .append("orderNum", getOrderNum())
            .append("leader", getLeader())
            .append("phone", getPhone())
            .append("email", getEmail())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
