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

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.dreamlu.mica.core.result.R;
import net.dreamlu.mica.core.utils.WebUtil;
import net.dreamlu.system.syslog.SysLogEvent;
import net.dreamlu.system.syslog.SysLogUtils;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Locale;

/**
 * 成功和失败的处理器
 *
 * @author L.cm
 */
@Slf4j
@Component
@RequiredArgsConstructor
public class DreamAuthHandler implements AuthenticationSuccessHandler, AuthenticationFailureHandler {
	private final ApplicationEventPublisher publisher;
	private final MessageSource messageSource;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// 打印日志
		log.error(exception.getMessage(), exception);
		// 返回异常
		String messageKey = exception.getClass().getName();
		Locale locale = LocaleContextHolder.getLocale();
		String message = messageSource.getMessage(messageKey, new Object[0], locale);
		WebUtil.renderJson(response, R.fail(message));
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		WebUtil.renderJson(response, R.success());
		// 记录登录日志
		SysLogEvent sysLogEvent = SysLogUtils.getSysLogDTO();
		sysLogEvent.setOperation("登录成功");
		sysLogEvent.setClassMethod("net.dreamlu.secrity.auth.DreamAuthHandler.onAuthenticationSuccess();");
		// 发送 spring event 事件
		publisher.publishEvent(sysLogEvent);
	}
}
