package com.kcl.module.controller;

import com.kcl.common.annotation.Log;
import com.kcl.common.base.AjaxResult;
import com.kcl.common.enums.BusinessType;
import com.kcl.framework.web.base.BaseController;
import com.kcl.framework.web.page.TableDataInfo;
import com.kcl.module.domain.DeptCopy;
import com.kcl.module.service.IDeptCopyService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 部门 信息操作处理
 *
 * @author kcl
 * @date 2018-11-19
 */
@Controller
@RequestMapping("/module/deptCopy")
public class DeptCopyController extends BaseController
{
    private String prefix = "module/deptCopy";

	@Autowired
	private IDeptCopyService deptCopyService;

	@RequiresPermissions("module:deptCopy:view")
	@GetMapping()
	public String deptCopy()
	{
	    return prefix + "/deptCopy";
	}

	/**
	 * 查询部门列表
	 */
	@RequiresPermissions("module:deptCopy:list")
	@PostMapping("/list")
	@ResponseBody
	public TableDataInfo list(DeptCopy deptCopy)
	{
		startPage();
        List<DeptCopy> list = deptCopyService.selectDeptCopyList(deptCopy);
		return getDataTable(list);
	}

	/**
	 * 新增部门
	 */
	@GetMapping("/add")
	public String add()
	{
	    return prefix + "/add";
	}

	/**
	 * 新增保存部门
	 */
	@RequiresPermissions("module:deptCopy:add")
	@Log(title = "部门", businessType = BusinessType.INSERT)
	@PostMapping("/add")
	@ResponseBody
	public AjaxResult addSave(DeptCopy deptCopy)
	{
		return toAjax(deptCopyService.insertDeptCopy(deptCopy));
	}

	/**
	 * 修改部门
	 */
	@GetMapping("/edit/{deptId}")
	public String edit(@PathVariable("deptId") Integer deptId, ModelMap mmap)
	{
		DeptCopy deptCopy = deptCopyService.selectDeptCopyById(deptId);
		mmap.put("deptCopy", deptCopy);
	    return prefix + "/edit";
	}

	/**
	 * 修改保存部门
	 */
	@RequiresPermissions("module:deptCopy:edit")
	@Log(title = "部门", businessType = BusinessType.UPDATE)
	@PostMapping("/edit")
	@ResponseBody
	public AjaxResult editSave(DeptCopy deptCopy)
	{
		return toAjax(deptCopyService.updateDeptCopy(deptCopy));
	}

	/**
	 * 删除部门
	 */
	@RequiresPermissions("module:deptCopy:remove")
	@Log(title = "部门", businessType = BusinessType.DELETE)
	@PostMapping( "/remove")
	@ResponseBody
	public AjaxResult remove(String ids)
	{
		return toAjax(deptCopyService.deleteDeptCopyByIds(ids));
	}

}
