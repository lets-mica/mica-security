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

package net.dreamlu.secrity.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.dreamlu.common.DreamConstants;
import net.dreamlu.mica.core.utils.StringUtil;
import net.dreamlu.secrity.auth.AuthUser;
import net.dreamlu.system.model.Admin;
import net.dreamlu.system.model.Role;
import net.dreamlu.system.service.IAdminService;
import net.dreamlu.system.service.IResourceService;
import net.dreamlu.system.service.IRoleService;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

/**
 * 用户详情服务
 *
 * @author L.cm
 */
@Service
@Slf4j
@RequiredArgsConstructor
public class DreamUserDetailsService implements UserDetailsService, UserLockService {
	private final IAdminService adminService;
	private final IRoleService roleService;
	private final IResourceService resourceService;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Admin admin = adminService.findByName(username);
		if (admin == null) {
			throw new UsernameNotFoundException("username is not found!");
		}
		Integer adminId = admin.getId();
		List<Role> roleList = roleService.findListByAdminId(adminId);
		Set<String> dbAuthsSet = new HashSet<>();
		if (roleList != null && !roleList.isEmpty()) {
			// 获取角色
			loadRoleAuthorities(roleList, dbAuthsSet);
			// 获取资源
			loadUserAuthorities(roleList, dbAuthsSet);
		}
		String password = admin.getPassword();
		boolean enabled = DreamConstants.DB_STATUS_OK == admin.getStatus();
		boolean accountNonLocked = DreamConstants.DB_ADMIN_NON_LOCKED == admin.getLocked();
		Collection<? extends GrantedAuthority> authorities
			= AuthorityUtils.createAuthorityList(dbAuthsSet.toArray(new String[0]));
		// 构造security用户
		return new AuthUser(adminId, username, password, enabled,
			true, true, accountNonLocked, authorities);
	}

	private void loadRoleAuthorities(List<Role> roleList, Set<String> dbAuthsSet) {
		roleList.stream()
			.map(Role::getName)
			.filter(StringUtil::isNotBlank)
			.forEach(x ->
				dbAuthsSet.add(DreamConstants.SECURITY_ROLE_PREFIX + x)
			);
	}

	private void loadUserAuthorities(List<Role> roleList, Set<String> dbAuthsSet) {
		List<Integer> roleIds = roleList.stream().map(Role::getId).collect(Collectors.toList());
		List<String> permissionsList = resourceService.findPermissionsByRoleIds(roleIds);
		permissionsList.stream()
			.filter(StringUtil::isNotBlank)
			.forEach(dbAuthsSet::add);
	}

	@Override
	public boolean updateLockUser(AuthUser authUser) {
		Admin admin = new Admin();
		admin.setId(authUser.getUserId());
		admin.setLocked(DreamConstants.DB_ADMIN_LOCKED);
		return adminService.updateById(admin);
	}
}
