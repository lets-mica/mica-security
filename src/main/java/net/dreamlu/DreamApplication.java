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

package net.dreamlu;

import net.dreamlu.mica.launcher.MicaApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * 启动入口
 *
 * @author L.cm
 */
@SpringBootApplication
public class DreamApplication extends SpringBootServletInitializer {
	private static final String APPLICATION_NAME = "mica-fast";

	public static void main(String[] args) {
		MicaApplication.run(APPLICATION_NAME, DreamApplication.class, args);
	}

	@Override
	protected SpringApplicationBuilder createSpringApplicationBuilder() {
		// war 包启动方式，注意继承 SpringBootServletInitializer，实现 createSpringApplicationBuilder 方法
		return MicaApplication.createSpringApplicationBuilder(APPLICATION_NAME, DreamApplication.class);
	}
}
