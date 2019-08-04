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

package net.dreamlu.secrity.auth;

import lombok.Getter;
import lombok.Setter;
import net.dreamlu.common.exception.LocalizedException;
import net.dreamlu.config.DreamSecurityProperties;
import net.dreamlu.mica.captcha.servlet.MicaCaptchaServlet;
import net.dreamlu.mica.core.utils.StringUtil;
import net.dreamlu.secrity.service.DreamUserDetailsService;
import net.dreamlu.secrity.service.UserLockService;
import org.springframework.cache.Cache;
import org.springframework.cache.CacheManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.util.Assert;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletResponse;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * 自定义授权处理，添加验证码
 *
 * @author L.cm
 */
public class DreamAuthenticationProvider extends DaoAuthenticationProvider {
	@Getter @Setter
	private DreamSecurityProperties dreamProperties;
	@Getter @Setter
	private MicaCaptchaServlet dreamCaptcha;
	@Getter @Setter
	private CacheManager cacheManager;
	private Cache passwordRetryCache;

	@Override
	public Authentication authenticate(Authentication auth) throws AuthenticationException {
		if (auth.isAuthenticated()) {
			return auth;
		}
		DreamWebAuthenticationDetails details = (DreamWebAuthenticationDetails) auth.getDetails();
		String verificationCode = details.getVerificationCode();
		if (StringUtil.isBlank(verificationCode)) {
			throw new LocalizedException("verification.code.blank", "The verification code is blank.");
		}
		ServletRequestAttributes attributes = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes());
		HttpServletResponse response = attributes.getResponse();
		if (dreamCaptcha.validate(response, verificationCode)) {
			return super.authenticate(auth);
		} else {
			throw new LocalizedException("verification.code.incorrect", "The verification code is incorrect.");
		}
	}

	@Override
	protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
		// 添加用户锁定的功能，用户尝试登录密码错误太多次锁定账号
		String username = userDetails.getUsername();
		//retry count + 1
		AtomicInteger retryCount = passwordRetryCache.get(username, AtomicInteger.class);
		if(retryCount == null) {
			retryCount = new AtomicInteger(0);
			passwordRetryCache.put(username, retryCount);
		}
		int retryLimit = dreamProperties.getLogin().getRetryLimit();
		if(retryCount.incrementAndGet() > retryLimit) {
			//if retry count > retryLimit
			logger.warn("username: " + username + " tried to login more than " + retryLimit + " times in period");
			UserLockService userLockService = this.getUserLockService();
			userLockService.updateLockUser((AuthUser) userDetails);
			throw new LocalizedException("login.retry.limit", new Object[]{username, retryLimit},
				"User " + username + " password has been incorrectly typed more than " + retryLimit + " times, the account has been locked.");
		} else {
			passwordRetryCache.put(username, retryCount);
		}
		super.additionalAuthenticationChecks(userDetails, authentication);
		//clear retry data
		passwordRetryCache.evict(username);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

	@Override
	protected void doAfterPropertiesSet() throws Exception {
		super.doAfterPropertiesSet();
		Assert.notNull(dreamProperties, "dreamProperties is null");
		Assert.notNull(dreamCaptcha, "dreamCaptcha is null");
		Assert.notNull(cacheManager, "cacheManager is null");
		String retryLimitCacheName = dreamProperties.getLogin().getRetryLimitCacheName();
		this.passwordRetryCache = cacheManager.getCache(retryLimitCacheName);
		Assert.notNull(this.passwordRetryCache, "retryLimitCache retryLimitCacheName: " + retryLimitCacheName + " is not config.");
	}

	private DreamUserDetailsService getUserLockService() {
		UserDetailsService userDetailsService = super.getUserDetailsService();
		return (DreamUserDetailsService) userDetailsService;
	}
}
