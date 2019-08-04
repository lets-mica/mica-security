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

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.dreamlu.common.annotation.SysLog;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * 操作日志使用spring event异步入库
 *
 * @author L.cm
 */
@Aspect
@Order
@Slf4j
@Component
@RequiredArgsConstructor
public class SysLogAspect {
	private final ApplicationEventPublisher publisher;

	@Around("@annotation(sysLog)")
	public Object aroundSysLog(ProceedingJoinPoint point, SysLog sysLog) throws Throwable {
		String strClassName = point.getTarget().getClass().getName();
		String strMethodName = point.getSignature().getName();
		log.info("[类名]:{},[方法]:{}", strClassName, strMethodName);

		SysLogEvent sysLogEvent = SysLogUtils.getSysLogDTO();
		sysLogEvent.setOperation(sysLog.value());
		sysLogEvent.setClassMethod(strClassName + "." + strMethodName + "();");
		// 发送异步日志事件
		publisher.publishEvent(sysLogEvent);
		return point.proceed();
	}

}
