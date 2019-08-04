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

import lombok.Getter;
import lombok.Setter;

/**
 * SysLog数据承载
 *
 * @author L.cm
 */
@Getter
@Setter
public class SysLogEvent {
	/**
	 * 登陆名
	 */
	private String username;
	/**
	 * 角色名
	 */
	private String roleName;
	/**
	 * 操作
	 */
	private String operation;
	/**
	 * 类-方法
	 */
	private String classMethod;
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 客户端ip
	 */
	private String clientIp;
}
