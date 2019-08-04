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

import lombok.AllArgsConstructor;
import net.dreamlu.mica.core.result.R;
import net.dreamlu.mica.core.utils.WebUtil;
import org.springframework.http.HttpMethod;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 认证失败处理器
 *
 * @author L.cm
 */
@AllArgsConstructor
public class DreamAccessDeniedHandler extends AccessDeniedHandlerImpl {
	private final String errorPage;

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
		HttpMethod httpMethod = HttpMethod.resolve(request.getMethod());
		if (response.isCommitted()) {
			return;
		}
		if (HttpMethod.GET == httpMethod) {
			if (errorPage != null) {
				// 没有权限 403 给返回 正常 200
				response.setStatus(HttpServletResponse.SC_FORBIDDEN);
				// forward to error page.
				RequestDispatcher dispatcher = request.getRequestDispatcher(errorPage);
				dispatcher.forward(request, response);
			} else {
				response.sendError(HttpServletResponse.SC_FORBIDDEN, accessDeniedException.getMessage());
			}
		} else {
			// 没有权限 403 给返回 正常 200
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
			R<String> result = R.fail("没有权限访问");
			WebUtil.renderJson(response, result);
		}

	}

}
