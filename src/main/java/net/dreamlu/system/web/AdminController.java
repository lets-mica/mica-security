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

import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.AllArgsConstructor;
import net.dreamlu.common.annotation.SysLog;
import net.dreamlu.common.base.BaseController;
import net.dreamlu.common.result.EasyPage;
import net.dreamlu.common.result.PageVO;
import net.dreamlu.mica.core.result.R;
import net.dreamlu.mica.core.utils.StringUtil;
import net.dreamlu.secrity.auth.AuthUser;
import net.dreamlu.system.model.Admin;
import net.dreamlu.system.model.Role;
import net.dreamlu.system.service.IAdminService;
import net.dreamlu.system.service.IRoleService;
import net.dreamlu.system.vo.AdminVO;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author L.cm
 * @since 2018-01-29
 */
@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController extends BaseController {
	private final IAdminService adminService;
	private final PasswordEncoder passwordEncoder;
	private final IRoleService roleService;

	@GetMapping("/editPwdPage")
	@PreAuthorize("@sec.hasPermission('admin:edit:pwd')")
	public String editPwdPage() {
		return "system/admin/adminEditPwd";
	}

	@PostMapping("/editUserPwd")
	@PreAuthorize("@sec.hasPermission('admin:edit:pwd')")
	@ResponseBody
	@SysLog("修改密码")
	public R<Object> editUserPwd(AuthUser user, String oldPwd, String pwd) {
		if (StringUtil.isBlank(oldPwd) || StringUtil.isBlank(pwd)) {
			return R.fail("密码不能为空");
		}
		Admin admin = adminService.getById(user.getUserId());
		boolean matches = passwordEncoder.matches(oldPwd, admin.getPassword());
		if (!matches) {
			return R.fail("老密码不正确");
		}
		Admin _admin = new Admin();
		_admin.setId(admin.getId());
		_admin.setPassword(passwordEncoder.encode(pwd));
		return status(adminService.updateById(_admin));
	}

	@GetMapping("/manager")
	public String manager() {
		return "system/admin/adminList";
	}

	@PostMapping("/dataGrid")
	@ResponseBody
	public EasyPage<AdminVO> dataGrid(AdminVO adminVO, PageVO pageVO) {
		IPage<AdminVO> adminVOIPage = adminService.finalDataGrid(adminVO, pageVO.toPage());
		return EasyPage.of(adminVOIPage);
	}

	@GetMapping("/addPage")
	public String addPage() {
		return "system/admin/adminAdd";
	}

	@PostMapping("/add")
	@PreAuthorize("@sec.hasPermission('admin:add')")
	@ResponseBody
	@SysLog("添加用户")
	public R<Object> add(@Valid AdminVO adminVO) {
		Admin _admin = adminService.findByName(adminVO.getUsername());
		if (_admin != null) {
			return R.fail("登录名已存在!");
		}
		String pwd = passwordEncoder.encode(adminVO.getPassword());
		adminVO.setPassword(pwd);
		return status(adminService.insertByVo(adminVO));
	}

	@PostMapping("/delete")
	@PreAuthorize("@sec.hasPermission('admin:delete')")
	@ResponseBody
	@SysLog("删除用户")
	public R<Object> delete(Admin admin) {
		return status(adminService.removeById(admin));
	}

	@GetMapping("/editPage")
	public String editPage(Model model, Integer id) {
		Admin admin = adminService.getById(id);
		List<Role> rolesList = roleService.findListByAdminId(id);
		List<Integer> ids = new ArrayList<Integer>();
		for (Role role : rolesList) {
			ids.add(role.getId());
		}
		model.addAttribute("roleIds", ids);
		model.addAttribute("admin", admin);
		return "system/admin/adminEdit";
	}

	@PostMapping("/edit")
	@PreAuthorize("@sec.hasPermission('admin:edit')")
	@ResponseBody
	@SysLog("编辑用户")
	public R<Object> edit(@Valid AdminVO adminVO) {
		Admin _admin = adminService.findByName(adminVO.getUsername());
		if (_admin != null &&  adminVO.getId() != null && !adminVO.getId().equals(_admin.getId())) {
			return R.fail("登录名已存在!");
		}
		// 更新密码
		if (StringUtil.isNotBlank(adminVO.getPassword())) {
			String pwd = passwordEncoder.encode(adminVO.getPassword());
			adminVO.setPassword(pwd);
		}
		return status(adminService.updateByVo(adminVO));
	}
}
