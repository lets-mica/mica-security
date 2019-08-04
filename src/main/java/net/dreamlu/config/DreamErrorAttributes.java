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

import lombok.RequiredArgsConstructor;
import net.dreamlu.common.exception.LocalizedException;
import net.dreamlu.mica.core.result.R;
import net.dreamlu.mica.core.utils.BeanUtil;
import net.dreamlu.mica.servlet.error.MicaErrorAttributes;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.context.request.WebRequest;

import java.util.Locale;
import java.util.Map;

/**
 * html请求异常处理
 *
 * @author L.cm
 */
@Configuration
@RequiredArgsConstructor
public class DreamErrorAttributes extends MicaErrorAttributes {
	private final MessageSource messageSource;

	@Override
	public Map<String, Object> getErrorAttributes(WebRequest webRequest, boolean includeStackTrace) {
		Throwable error = getError(webRequest);
		if (error instanceof LocalizedException) {
			Locale locale = LocaleContextHolder.getLocale();
			LocalizedException e = (LocalizedException) error;
			String message = messageSource.getMessage(e.getLocaleMessage(), e.getLocaleArgs(), locale);
			return BeanUtil.toMap(R.fail(message));
		}
		return super.getErrorAttributes(webRequest, includeStackTrace);
	}
}
