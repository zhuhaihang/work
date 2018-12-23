package com.kcl.module.controller;

import com.kcl.common.annotation.Log;
import com.kcl.common.base.AjaxResult;
import com.kcl.common.enums.BusinessType;
import com.kcl.framework.util.ShiroUtils;
import com.kcl.framework.web.base.BaseController;
import com.kcl.framework.web.page.TableDataInfo;
import com.kcl.module.domain.VersionControl;
import com.kcl.module.service.IVersionControlService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 版本记录 信息操作处理
 *
 * @author kcl
 * @date 2018-11-22
 */
@Controller
@RequestMapping("/module/versionControl")
public class VersionControlController extends BaseController
{
    private String prefix = "module/versionControl";

	@Autowired
	private IVersionControlService versionControlService;

	@RequiresPermissions("module:versionControl:view")
	@GetMapping()
	public String versionControl()
	{
	    return prefix + "/versionControl";
	}

	/**
	 * 查询版本记录列表
	 */
	@RequiresPermissions("module:versionControl:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(VersionControl versionControl)
	{
		startPage();
        List<VersionControl> list = versionControlService.selectVersionControlList(versionControl);
		return getDataTable(list);
	}

	/**
	 * 新增版本记录
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}

	/**
	 * 新增保存版本记录
	 */
	@RequiresPermissions("module:versionControl:add")
	@Log(title = "版本记录", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@Transactional(rollbackFor = Exception.class)
	@ResponseBody
	public AjaxResult addSave(VersionControl versionControl)
	{
		versionControl.setCreateBy(ShiroUtils.getLoginName());
		return toAjax(versionControlService.insertVersionControl(versionControl));
	}

	/**
	 * 修改版本记录
	 */
	@GetMapping("/edit/{versionId}")
	public String edit(@PathVariable("versionId") Integer versionId, ModelMap mmap)
	{
		VersionControl versionControl = versionControlService.selectVersionControlById(versionId);
		mmap.put("versionControl", versionControl);
	    return prefix + "/edit";
	}

	/**
	 * 修改保存版本记录
	 */
	@RequiresPermissions("module:versionControl:edit")
	@Log(title = "版本记录", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@Transactional(rollbackFor = Exception.class)
	@ResponseBody
	public AjaxResult editSave(VersionControl versionControl)
	{
		versionControl.setUpdateBy(ShiroUtils.getLoginName());
		return toAjax(versionControlService.updateVersionControl(versionControl));
	}

	/**
	 * 删除版本记录
	 */
	@RequiresPermissions("module:versionControl:remove")
	@Log(title = "版本记录", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{
		return toAjax(versionControlService.deleteVersionControlByIds(ids));
	}

}
