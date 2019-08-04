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

package net.dreamlu.common;

/**
 * 系统常量
 *
 * @author L.cm
 */
public interface DreamConstants {

	/**
	 * 角色前缀
	 */
	String SECURITY_ROLE_PREFIX = "ROLE_";

	/**
	 * 状态[0:失效,1:正常]
	 */
	int DB_STATUS_DEL = 0;
	int DB_STATUS_OK = 1;

	/**
	 * 用户锁定状态
	 */
	int DB_ADMIN_NON_LOCKED = 0;
	int DB_ADMIN_LOCKED = 1;

	/**
	 * 菜单
 	 */
	int RESOURCE_TYPE_MENU = 0;
}
