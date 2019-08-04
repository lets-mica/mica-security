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

package net.dreamlu.system.syslog;

import net.dreamlu.common.DreamConstants;
import net.dreamlu.mica.core.utils.CharPool;
import net.dreamlu.mica.core.utils.ObjectUtil;
import net.dreamlu.mica.core.utils.StringUtil;
import net.dreamlu.mica.core.utils.WebUtil;
import net.dreamlu.secrity.SecurityUtils;
import net.dreamlu.secrity.auth.AuthUser;
import org.springframework.security.core.GrantedAuthority;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * 系统日志工具类
 *
 * @author L.cm
 */
public class SysLogUtils {

	public static SysLogEvent getSysLogDTO() {
		SysLogEvent sysLogDTO = new SysLogEvent();
		HttpServletRequest request = WebUtil.getRequest();
		// url
		String requestUrl = request.getRequestURI();
		// paraMap
		Map<String, String[]> paraMap = request.getParameterMap();
		if (ObjectUtil.isEmpty(paraMap)) {
			sysLogDTO.setContent(requestUrl);
		} else {
			// 注意使用 全角 的字符，避免sql问题 【？＝＆】
			StringBuilder builder = new StringBuilder(requestUrl).append(CharPool.QUESTION_MARK);
			paraMap.forEach((key, values) -> {
				builder.append(key).append("＝");
				if ("password".equalsIgnoreCase(key)) {
					builder.append("******");
				} else {
					builder.append(StringUtil.join(values));
				}
				builder.append("＆");
			});
			builder.deleteCharAt(builder.length() - 1);
			sysLogDTO.setContent(builder.toString());
		}
		sysLogDTO.setClientIp(WebUtil.getIP());
		AuthUser authUser = SecurityUtils.getUser();
		if (authUser != null) {
			sysLogDTO.setUsername(authUser.getUsername());
			String roles = authUser.getAuthorities()
				.stream()
				.map(GrantedAuthority::getAuthority)
				.filter(x -> x.startsWith(DreamConstants.SECURITY_ROLE_PREFIX))
				.map(x -> x.replace(DreamConstants.SECURITY_ROLE_PREFIX, ""))
				.reduce((a, b) -> a + "," + b)
				.orElse("");
			sysLogDTO.setRoleName(roles);
		}
		return sysLogDTO;
	}

}
