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

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import lombok.AllArgsConstructor;
import net.dreamlu.common.annotation.SysLog;
import net.dreamlu.common.base.BaseController;
import net.dreamlu.common.result.Tree;
import net.dreamlu.mica.core.result.R;
import net.dreamlu.secrity.auth.AuthUser;
import net.dreamlu.system.model.Resource;
import net.dreamlu.system.service.IResourceService;
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
 * 资源 前端控制器
 * </p>
 *
 * @author L.cm
 * @since 2018-01-29
 */
@Controller
@RequestMapping("/resource")
@AllArgsConstructor
public class ResourceController extends BaseController {
	private final IResourceService resourceService;

	@GetMapping("/manager")
	public String manager() {
		return "system/resource/resourceList";
	}

	/**
	 * 所有的资源列表
	 */
	@PostMapping("/dataGrid")
	@ResponseBody
	public List<Resource> dataGrid() {
		LambdaQueryWrapper<Resource> wrapper = new LambdaQueryWrapper<>();
		wrapper.orderByAsc(Resource::getSeq);
		return resourceService.list(wrapper);
	}

	/**
	 * 查询所有的菜单
	 */
	@RequestMapping("/allMenu")
	@ResponseBody
	public List<Tree> allMenu() {
		return resourceService.findAllMenu();
	}

	/**
	 * 查询所有的资源tree
	 */
	@RequestMapping("/allTrees")
	@ResponseBody
	public List<Tree> allTree() {
		return resourceService.findAllTree();
	}

	/**
	 * 用户可见的资源
	 */
	@PostMapping("/menu")
	@ResponseBody
	public List<Tree> tree(AuthUser authUser) {
		return resourceService.findUserTree(authUser);
	}

	/**
	 * 添加页面
	 * @param model 数据绑定
	 * @param pid 选中的id
	 */
	@GetMapping("/addPage")
	public String addPage(Model model, Long pid) {
		model.addAttribute("pid", pid);
		return "system/resource/resourceAdd";
	}

	/**
	 * 添加
	 */
	@PostMapping("/add")
	@PreAuthorize("@sec.hasPermission('resource:add')")
	@ResponseBody
	public R<Object> add(@Valid Resource resource) {
		return status(resourceService.save(resource));
	}

	/**
	 * 删除
	 */
	@PostMapping("/delete")
	@PreAuthorize("@sec.hasPermission('resource:delete')")
	@ResponseBody
	@SysLog("删除资源")
	public R<Object> delete(Resource resource) {
		return status(resourceService.removeById(resource));
	}

	/**
	 * 编辑页
	 */
	@GetMapping("/editPage")
	public String editPage(Model model, Long id) {
		Resource resource = resourceService.getById(id);
		model.addAttribute("resource", resource);
		return "system/resource/resourceEdit";
	}

	/**
	 * 编辑
	 */
	@PostMapping("/edit")
	@PreAuthorize("@sec.hasPermission('resource:edit')")
	@ResponseBody
	public R<Object> edit(@Valid Resource resource) {
		return status(resourceService.updateById(resource));
	}
}
