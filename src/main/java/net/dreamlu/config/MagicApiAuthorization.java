package net.dreamlu.config;

import lombok.RequiredArgsConstructor;
import net.dreamlu.mica.core.utils.StringUtil;
import net.dreamlu.secrity.SecurityUtils;
import net.dreamlu.secrity.auth.AuthUser;
import net.dreamlu.secrity.service.SecService;
import org.springframework.context.annotation.Configuration;
import org.ssssssss.magicapi.exception.MagicLoginException;
import org.ssssssss.magicapi.interceptor.Authorization;
import org.ssssssss.magicapi.interceptor.AuthorizationInterceptor;
import org.ssssssss.magicapi.interceptor.MagicUser;

import javax.servlet.http.HttpServletRequest;

/**
 * magicapi 认证处理
 *
 * @author L.cm
 */
@RequiredArgsConstructor
@Configuration(proxyBeanMethods = false)
public class MagicApiAuthorization implements AuthorizationInterceptor {
	private final SecService secService;

	@Override
	public MagicUser getUserByToken(String token) throws MagicLoginException {
		AuthUser authUser = SecurityUtils.getUser();
		if (authUser == null) {
			return null;
		}
		return new MagicUser(String.valueOf(authUser.getUserId()), authUser.getUsername(), token);
	}

	@Override
	public MagicUser login(String username, String password) throws MagicLoginException {
		AuthUser authUser = SecurityUtils.getUser();
		if (authUser == null) {
			return null;
		}
		return new MagicUser(String.valueOf(authUser.getUserId()), authUser.getUsername(), StringUtil.getUUID());
	}

	/**
	 * 是否拥有页面按钮的权限
	 */
	@Override
	public boolean allowVisit(MagicUser magicUser, HttpServletRequest request, Authorization authorization) {
		AuthUser authUser = SecurityUtils.getUser();
		if (authUser == null) {
			return false;
		}
		// 查看权限
		if (Authorization.VIEW == authorization) {
			return true;
		}
		// url 鉴权
		return secService.hasPermission(request);
	}

}
