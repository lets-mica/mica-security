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

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import net.dreamlu.common.annotation.SysLog;
import net.dreamlu.common.base.BaseController;
import net.dreamlu.common.result.EasyPage;
import net.dreamlu.common.result.PageVO;
import net.dreamlu.common.result.Tree;
import net.dreamlu.mica.core.result.R;
import net.dreamlu.system.model.Role;
import net.dreamlu.system.service.IRoleService;
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
 * 角色 前端控制器
 * </p>
 *
 * @author L.cm
 * @since 2018-01-29
 */
@Controller
@RequestMapping("/role")
@AllArgsConstructor
public class RoleController extends BaseController {
	private final IRoleService roleService;

	@GetMapping("/manager")
	public String manager() {
		return "system/role/roleList";
	}

	@PostMapping("/dataGrid")
	@ResponseBody
	public EasyPage<Role> dataGrid(Role role, PageVO pageVO) {
		QueryWrapper<Role> ew = new QueryWrapper<>(role);
		Page<Role> pages = pageVO.toPage();
		roleService.page(pages, ew);
		return EasyPage.of(pages);
	}

	/**
	 * 权限树
	 */
	@PostMapping("/tree")
	@ResponseBody
	public List<Tree> tree() {
		return roleService.selectTree();
	}

	/**
	 * 添加页面
	 */
	@GetMapping("/addPage")
	public String addPage() {
		return "system/role/roleAdd";
	}

	/**
	 * 添加
	 */
	@PostMapping("/add")
	@PreAuthorize("@sec.hasPermission('role:delete')")
	@ResponseBody
	@SysLog("添加角色")
	public R<Object> add(@Valid Role role) {
		return status(roleService.save(role));
	}

	/**
	 * 删除
	 */
	@PostMapping("/delete")
	@PreAuthorize("@sec.hasPermission('role:delete')")
	@ResponseBody
	@SysLog("删除角色")
	public R<Object> delete(Role role) {
		return status(roleService.removeById(role));
	}

	/**
	 * 编辑
	 */
	@GetMapping("/editPage")
	public String editPage(Model model, Long id) {
		Role role = roleService.getById(id);
		model.addAttribute("role", role);
		return "system/role/roleEdit";
	}

	/**
	 * 编辑
	 */
	@PostMapping("/edit")
	@PreAuthorize("@sec.hasPermission('role:edit')")
	@ResponseBody
	@SysLog("编辑角色")
	public R<Object> edit(@Valid Role role) {
		return status(roleService.updateById(role));
	}

	/**
	 * 授权页面
	 */
	@GetMapping("/grantPage")
	public String grantPage(Model model, Long id) {
		model.addAttribute("id", id);
		return "system/role/roleGrant";
	}

	/**
	 * 授权页面页面根据角色查询资源
	 */
	@RequestMapping("/findResourceIdListByRoleId")
	@ResponseBody
	public R<Object> findResourceByRoleId(Integer id) {
		List<Integer> resources = roleService.selectResourceIdListByRoleId(id);
		return R.success(resources);
	}

	/**
	 * 授权
	 */
	@RequestMapping("/grant")
	@PreAuthorize("@sec.hasPermission('role:grant')")
	@ResponseBody
	@SysLog("角色授权")
	public R<Object> grant(Integer id, String resourceIds) {
		roleService.updateRoleResource(id, resourceIds);
		return R.success();
	}
}
