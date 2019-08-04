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

package net.dreamlu.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.AllArgsConstructor;
import net.dreamlu.common.DreamConstants;
import net.dreamlu.common.result.Tree;
import net.dreamlu.mica.core.utils.StringUtil;
import net.dreamlu.secrity.auth.AuthUser;
import net.dreamlu.system.mapper.ResourceMapper;
import net.dreamlu.system.mapper.RoleMapper;
import net.dreamlu.system.model.Resource;
import net.dreamlu.system.model.Role;
import net.dreamlu.system.service.IResourceService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 资源 服务实现类
 * </p>
 *
 * @author L.cm
 * @since 2018-01-29
 */
@Service
@AllArgsConstructor
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements IResourceService {
	private final ResourceMapper resourceMapper;
	private final RoleMapper roleMapper;

	@Override
	public List<Resource> findByType(Integer type) {
		LambdaQueryWrapper<Resource> wrapper = new LambdaQueryWrapper<>();
		wrapper.eq(Resource::getResourceType, type);
		wrapper.orderByAsc(Resource::getSeq);
		return super.list(wrapper);
	}

	@Override
	public List<Tree> findAllMenu() {
		// 查询所有菜单
		List<Resource> list = this.findByType(DreamConstants.RESOURCE_TYPE_MENU);
		if (list.isEmpty()) {
			return Collections.emptyList();
		}
		List<Tree> trees = new ArrayList<>();
		for (Resource resource : list) {
			Tree tree = new Tree();
			tree.setId(resource.getId());
			tree.setPid(resource.getPid());
			tree.setText(resource.getName());
			tree.setIconCls(resource.getIconCls());
			tree.setState(isResourceOpened(resource));
			tree.setOpenMode(resource.getOpenMode());
			tree.setAttributes(resource.getUrl());
			trees.add(tree);
		}
		return trees;
	}

	@Override
	public List<String> findPermissionsByRoleIds(List<Integer> roleIdList) {
		String roleIds = StringUtil.join(roleIdList);
		return resourceMapper.findPermissionsByRoleIds(roleIds);
	}

	@Override
	public List<Tree> findAllTree() {
		// 获取所有正常的数据
		LambdaQueryWrapper<Resource> wrapper = new LambdaQueryWrapper<>();
		wrapper.orderByDesc(Resource::getSeq);
		List<Resource> resources = super.list(wrapper);
		if (resources.isEmpty()) {
			return Collections.emptyList();
		}
		// 获取所有的资源 tree形式，展示
		List<Tree> trees = new ArrayList<>();
		for (Resource res : resources) {
			Tree tree = new Tree();
			tree.setId(res.getId());
			tree.setPid(res.getPid());
			tree.setText(res.getName());
			tree.setIconCls(res.getIconCls());
			tree.setAttributes(res.getUrl());
			tree.setState(isResourceOpened(res));
			trees.add(tree);
		}
		return trees;
	}

	@Override
	public List<Tree> findUserTree(AuthUser authUser) {
		List<Tree> trees = new ArrayList<>();
		List<Resource> resourceLists = findAllByAdminId(authUser.getUserId());
		if (resourceLists == null) {
			return trees;
		}
		for (Resource resource : resourceLists) {
			Tree tree = new Tree();
			tree.setId(resource.getId());
			tree.setPid(resource.getPid());
			tree.setText(resource.getName());
			tree.setIconCls(resource.getIconCls());
			tree.setAttributes(resource.getUrl());
			tree.setOpenMode(resource.getOpenMode());
			tree.setState(isResourceOpened(resource));
			trees.add(tree);
		}
		return trees;
	}

	/**
	 * 统一判断菜单是否打开
	 *
	 * 如果有父亲
	 */
	private String isResourceOpened(Resource resource) {
		Boolean opened = resource.getOpened();
		if (opened == null || opened || resource.getPid() != null) {
			return "open";
		}
		return "closed";
	}

	@Override
	public List<Resource> findAllByAdminId(Integer adminId) {
		// 用户角色
		List<Integer> roleIdList = roleMapper.findListByAdminId(adminId).stream()
			.map(Role::getId)
			.collect(Collectors.toList());
		if (roleIdList.isEmpty()) {
			return Collections.emptyList();
		}
		return roleMapper.selectResourceListByRoleIdList(roleIdList);
	}
}
