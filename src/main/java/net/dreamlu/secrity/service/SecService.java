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

import lombok.AllArgsConstructor;
import net.dreamlu.mica.core.utils.StringUtil;
import net.dreamlu.secrity.SecurityUtils;
import net.dreamlu.secrity.auth.AuthUser;
import net.dreamlu.system.model.Resource;
import net.dreamlu.system.service.IResourceService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;
import org.springframework.util.PatternMatchUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.List;

/**
 * 权限判断
 *
 * url: https://stackoverflow.com/questions/41434231/use-spring-security-in-thymeleaf-escaped-expressions-in-javascript
 *
 * @author l.cm
 */
@Service("sec")
@AllArgsConstructor
public class SecService {
	private final IResourceService resourceService;

	/**
	 * 提供给页面输出当前用户
	 * @return {AuthUser}
	 */
	public AuthUser currentUser() {
		return SecurityUtils.getUser();
	}

	/**
	 * 已经授权的
	 * @return 是否授权
	 */
	public boolean isAuthenticated() {
		return this.currentUser() != null;
	}

	/**
	 * 判断请求是否有权限
	 *
	 * @param request        HttpServletRequest
	 * @param authentication 认证信息
	 * @return 是否有权限
	 */
	public boolean hasPermission(HttpServletRequest request, Authentication authentication) {
		AuthUser authUser = SecurityUtils.getUser(authentication);
		if (authUser == null) {
			return false;
		}
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		if (authorities.isEmpty()) {
			return false;
		}
		Integer adminId = authUser.getUserId();
		List<Resource> resourceList = resourceService.findAllByAdminId(adminId);
		return resourceList.stream()
			.map(Resource::getUrl)
			.filter(StringUtil::isNotBlank)
			.anyMatch(x -> PatternMatchUtils.simpleMatch(x, request.getRequestURI()));
	}

	/**
	 * 判断按钮是否有xxx:xxx权限
	 * @param permission 权限
	 * @return {boolean}
	 */
	public boolean hasPermission(String permission) {
		if (StringUtil.isBlank(permission)) {
			return false;
		}
		Authentication authentication = SecurityUtils.getAuthentication();
		if (authentication == null) {
			return false;
		}
		AuthUser authUser = SecurityUtils.getUser(authentication);
		if (authUser == null) {
			return false;
		}
		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
		return authorities.stream()
			.map(GrantedAuthority::getAuthority)
			.filter(StringUtil::isNotBlank)
			.anyMatch(x -> PatternMatchUtils.simpleMatch(permission, x));
	}
}
