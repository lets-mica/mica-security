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

package net.dreamlu.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.ArrayList;
import java.util.List;

/**
 * mica 安全框架配置
 *
 * @author L.cm
 */
@ConfigurationProperties("mica.security")
public class DreamSecurityProperties {

	/**
	 * 忽略的地址
	 */
	@Getter
	private List<String> permitAll = new ArrayList<>();

	@Getter
	private final Login login = new Login();

	/**
	 * 登录配置
	 */
	@Getter
	@Setter
	public static class Login {
		/**
		 * 登录重试锁定次数，默认：5
		 */
		private int retryLimit = 5;
		/**
		 * 登录重试锁定cache名，默认：retryLimitCache
		 */
		private String retryLimitCacheName = "retryLimitCache";
	}
}
