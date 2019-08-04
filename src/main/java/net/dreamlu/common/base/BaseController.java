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

package net.dreamlu.common.base;

import net.dreamlu.mica.common.support.IController;
import net.dreamlu.mica.core.result.R;
import net.dreamlu.mica.core.result.SystemCode;

/**
 * 抽象控制器
 *
 * @author L.cm
 */
public abstract class BaseController implements IController {

	/**
	 * 根据状态返回成功和失败
	 *
	 * @param status 状态
	 * @param <T>    枚举
	 * @return 返回信息
	 */
	protected <T> R<T> status(boolean status) {
		return status ? success() : fail();
	}

	/**
	 * 状态返回失败
	 *
	 * @param <T> 枚举
	 * @return 返回信息
	 */
	protected <T> R<T> fail() {
		return R.fail(SystemCode.FAILURE, "操作失败");
	}
}
