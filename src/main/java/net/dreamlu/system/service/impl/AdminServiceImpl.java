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
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import net.dreamlu.mica.core.utils.BeanUtil;
import net.dreamlu.system.mapper.AdminMapper;
import net.dreamlu.system.mapper.AdminRoleMapper;
import net.dreamlu.system.mapper.OrganizationMapper;
import net.dreamlu.system.mapper.RoleMapper;
import net.dreamlu.system.model.Admin;
import net.dreamlu.system.model.AdminRole;
import net.dreamlu.system.model.Organization;
import net.dreamlu.system.model.Role;
import net.dreamlu.system.service.IAdminService;
import net.dreamlu.system.vo.AdminVO;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.*;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author L.cm
 * @since 2018-01-29
 */
@Service
@RequiredArgsConstructor
public class AdminServiceImpl extends ServiceImpl<AdminMapper, Admin> implements IAdminService {
	private final OrganizationMapper organizationMapper;
	private final RoleMapper roleMapper;
	private final AdminRoleMapper adminRoleMapper;

	@Override
	public Admin findByName(String username) {
		LambdaQueryWrapper<Admin> wrapper = new LambdaQueryWrapper<>();
		wrapper.eq(Admin::getUsername, username);
		return getOne(wrapper);
	}

	@Override
	public IPage<AdminVO> finalDataGrid(AdminVO adminVO, IPage<Admin> pages) {
		Admin admin = BeanUtil.copy(adminVO, Admin.class);
		LambdaQueryWrapper<Admin> wrapper = new LambdaQueryWrapper<>(admin);
		LocalDateTime startTime = adminVO.getCreatedateStart();
		LocalDateTime endTime   = adminVO.getCreatedateEnd();
		wrapper.ge(null != startTime, Admin::getCreateTime, startTime);
		wrapper.le(null != endTime, Admin::getCreateTime, endTime);

		IPage<Admin> page = baseMapper.selectPage(pages, wrapper);
		Page<AdminVO> adminVOPage = new Page<>(page.getCurrent(), page.getPages(), page.getTotal());
		List<Admin> adminList = page.getRecords();
		// 如果查询数据为空
		if (adminList == null || adminList.isEmpty()) {
			return adminVOPage;
		}
		Set<Integer> adminIdSet = new HashSet<>();
		Set<Integer> organizationIdSet = new HashSet<>();
		for (Admin record : adminList) {
			adminIdSet.add(record.getId());
			organizationIdSet.add(record.getOrganizationId());
		}
		List<Organization> organizationList = organizationMapper.selectBatchIds(organizationIdSet);
		Map<Integer, String> organizationMap = new HashMap<>();
		for (Organization organization : organizationList) {
			organizationMap.put(organization.getId(), organization.getName());
		}
		List<AdminVO> adminVOList = new ArrayList<>();
		for (Admin record : adminList) {
			AdminVO vo = new AdminVO();
			BeanUtil.copy(record, vo);
			vo.setOrganizationName(organizationMap.get(record.getOrganizationId()));
			// 处理角色集合
			List<String> roleNameList = roleMapper.findListByAdminId(record.getId())
				.stream()
				.map(Role::getName)
				.collect(Collectors.toList());
			vo.setRolesList(roleNameList);
			adminVOList.add(vo);
		}
		adminVOPage.setRecords(adminVOList);
		return adminVOPage;
	}

	@Override
	public boolean insertByVo(AdminVO adminVO) {
		Admin entity = new Admin();
		BeanUtil.copy(adminVO, entity);
		boolean r = super.save(entity);
		// 更新管理员角色关系
		Integer id = entity.getId();
		String[] roles = adminVO.getRoleIds().split(",");
		AdminRole adminRole = new AdminRole();
		for (String string : roles) {
			adminRole.setAdminId(id);
			adminRole.setRoleId(Integer.valueOf(string));
			adminRoleMapper.insert(adminRole);
		}
		return r;
	}

	@Override
	public boolean updateByVo(AdminVO adminVO) {
		Admin entity = BeanUtil.copy(adminVO, Admin.class);
		boolean r = this.updateById(entity);
		Integer id = adminVO.getId();

		LambdaQueryWrapper<AdminRole> wrapper = new LambdaQueryWrapper<>();
		wrapper.eq(AdminRole::getAdminId, id);
		List<AdminRole> adminRoles = adminRoleMapper.selectList(wrapper);
		if (adminRoles != null && !adminRoles.isEmpty()) {
			for (AdminRole adminRole : adminRoles) {
				adminRoleMapper.deleteById(adminRole.getId());
			}
		}
		String[] roles = adminVO.getRoleIds().split(",");
		AdminRole adminRole = new AdminRole();
		for (String string : roles) {
			adminRole.setAdminId(id);
			adminRole.setRoleId(Integer.valueOf(string));
			adminRoleMapper.insert(adminRole);
		}
		return r;
	}
}
