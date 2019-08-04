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

package net.dreamlu.system.web;

import lombok.AllArgsConstructor;
import net.dreamlu.common.base.BaseController;
import net.dreamlu.mica.captcha.servlet.MicaCaptchaServlet;
import net.dreamlu.mica.common.support.IController;
import net.dreamlu.secrity.auth.AuthUser;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletResponse;

/**
 * 公共控制器
 *
 * @author L.cm
 */
@Controller
@AllArgsConstructor
public class CommonController extends BaseController {
	private final MicaCaptchaServlet dreamCaptcha;

	@GetMapping({"/", "main"})
	public String index() {
		return "system/main";
	}

	@GetMapping("login")
	public String loginView(AuthUser user) {
		if (user == null) {
			return "system/login/index";
		}
		return redirect("/main");
	}

	@GetMapping("accessDenied")
	public String accessDenied() {
		return "system/error/accessDenied";
	}

	@GetMapping("captcha.jpg")
	public ResponseEntity<Resource> captcha(HttpServletResponse response) {
		return dreamCaptcha.generate(response);
	}

	@GetMapping("icons.html")
	public String icons() {
		return "system/common/icons";
	}

}
