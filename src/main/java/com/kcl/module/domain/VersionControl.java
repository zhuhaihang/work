package com.kcl.module.domain;

import com.kcl.common.base.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 版本记录表 sys_version_control
 *
 * @author kcl
 * @date 2018-11-22
 */
public class VersionControl extends BaseEntity
{
	private static final long serialVersionUID = 1L;

	/** 版本id */
	private Integer versionId;
	/** 显示顺序 */
	private Integer orderNum;
	/** 版本名称 */
	private String name;
	/** 下载地址 */
	private String url;
	/** 版本类型 */
	private String type;
	/** 启用状态 */
	private String status;
	/** 删除标志 */
	private String delFlag;
	/** 创建者 */
	private String createBy;
	/** 创建时间 */
	private Date createTime;
	/** 更新者 */
	private String updateBy;
	/** 更新时间 */
	private Date updateTime;

	public void setVersionId(Integer versionId)
	{
		this.versionId = versionId;
	}

	public Integer getVersionId()
	{
		return versionId;
	}
	public void setOrderNum(Integer orderNum)
	{
		this.orderNum = orderNum;
	}

	public Integer getOrderNum()
	{
		return orderNum;
	}
	public void setName(String name)
	{
		this.name = name;
	}

	public String getName()
	{
		return name;
	}
	public void setUrl(String url)
	{
		this.url = url;
	}

	public String getUrl()
	{
		return url;
	}
	public void setType(String type)
	{
		this.type = type;
	}

	public String getType()
	{
		return type;
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
            .append("versionId", getVersionId())
            .append("orderNum", getOrderNum())
            .append("name", getName())
            .append("url", getUrl())
            .append("type", getType())
            .append("status", getStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
