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

package net.dreamlu.common.exception;

import lombok.Getter;

/**
 * 本地化的异常信息
 *
 * @author L.cm
 */
public class LocalizedException extends RuntimeException {
	@Getter
	private final Object[] localeArgs;
	@Getter
	private final String localeMessage;

	public LocalizedException(String localeMessage, String message) {
		super(message);
		this.localeArgs = new Object[0];
		this.localeMessage = localeMessage;
	}

	public LocalizedException(String localeMessage, Object[] localeArgs, String message) {
		super(message);
		this.localeArgs = localeArgs;
		this.localeMessage = localeMessage;
	}

	@Override
	public Throwable fillInStackTrace() {
		return null;
	}

	public Throwable doFillInStackTrace() {
		return super.fillInStackTrace();
	}

}
