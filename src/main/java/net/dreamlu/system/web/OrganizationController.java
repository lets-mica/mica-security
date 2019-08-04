/*
 * Copyright (c) 2019-2029, Dreamlu 卢春梦 (596392912@qq.com & www.dreamlu.net).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package net.dreamlu.system.web;

import lombok.AllArgsConstructor;
import net.dreamlu.common.annotation.SysLog;
import net.dreamlu.common.base.BaseController;
import net.dreamlu.common.result.Tree;
import net.dreamlu.mica.core.result.R;
import net.dreamlu.system.model.Organization;
import net.dreamlu.system.service.IOrganizationService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 组织机构 前端控制器
 * </p>
 *
 * @author L.cm
 * @since 2018-02-05
 */
@Controller
@RequestMapping("/organization")
@AllArgsConstructor
public class OrganizationController extends BaseController {
	private final IOrganizationService organizationService;

	@GetMapping("/manager")
	public String manager() {
		return "system/organization/organizationList";
	}

	@PostMapping("/dataGrid")
	@ResponseBody
	public Object dataGrid() {
		return organizationService.selectTreeGrid();
	}

	/**
	 * 部门资源树
	 */
	@PostMapping(value = "/tree")
	@ResponseBody
	public List<Tree> tree() {
		return organizationService.selectTree();
	}

	/**
	 * 添加页面
	 */
	@GetMapping("/addPage")
	public String addPage() {
		return "system/organization/organizationAdd";
	}

	/**
	 * 添加
	 */
	@PostMapping("/add")
	@PreAuthorize("@sec.hasPermission('organization:add')")
	@ResponseBody
	public R<Object> add(@Valid Organization organization) {
		return status(organizationService.save(organization));
	}

	/**
	 * 删除
	 */
	@PostMapping("/delete")
	@PreAuthorize("@sec.hasPermission('organization:delete')")
	@ResponseBody
	@SysLog("删除组织")
	public R<Object> delete(Organization organization) {
		return status(organizationService.removeById(organization));
	}

	/**
	 * 编辑
	 */
	@GetMapping("/editPage")
	public String editPage(Model model, Long id) {
		Organization organization = organizationService.getById(id);
		model.addAttribute("organization", organization);
		return "system/organization/organizationEdit";
	}

	/**
	 * 编辑
	 */
	@PostMapping("/edit")
	@PreAuthorize("@sec.hasPermission('organization:edit')")
	@ResponseBody
	public R<Object> edit(@Valid Organization organization) {
		return status(organizationService.updateById(organization));
	}
}
