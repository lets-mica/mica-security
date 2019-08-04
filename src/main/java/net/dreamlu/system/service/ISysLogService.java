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

package net.dreamlu.system.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import net.dreamlu.system.model.SysLog;
import net.dreamlu.system.syslog.SysLogEvent;

/**
 * <p>
 * 系统日志 服务类
 * </p>
 *
 * @author L.cm
 * @since 2018-03-31
 */
public interface ISysLogService extends IService<SysLog> {
	void saveSysLog(SysLogEvent sysLogEvent);

	void findPage(Page<SysLog> pages, SysLog sysLog);
}
