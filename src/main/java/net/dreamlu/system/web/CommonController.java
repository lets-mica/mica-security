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

import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import net.dreamlu.common.DreamConstants;
import net.dreamlu.common.base.BaseController;
import net.dreamlu.mica.captcha.service.ICaptchaService;
import net.dreamlu.mica.core.utils.StringUtil;
import net.dreamlu.mica.core.utils.WebUtil;
import net.dreamlu.secrity.auth.AuthUser;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import springfox.documentation.annotations.ApiIgnore;

import javax.servlet.http.HttpServletResponse;

/**
 * 公共控制器
 *
 * @author L.cm
 */
@Controller
@RequiredArgsConstructor
@Api(tags = "公共::管理")
public class CommonController extends BaseController {
	private final ICaptchaService captchaService;

	@ApiIgnore
	@GetMapping({"/", "main"})
	public String index() {
		return "system/main";
	}

	@ApiIgnore
	@GetMapping("login")
	public String loginView(AuthUser user) {
		if (user == null) {
			return "system/login/index";
		}
		return redirect("/main");
	}

	@ApiIgnore
	@GetMapping("accessDenied")
	public String accessDenied() {
		return "system/error/accessDenied";
	}

	@GetMapping(value = "captcha.jpg", produces = MediaType.IMAGE_JPEG_VALUE)
	public ResponseEntity<Resource> captcha(HttpServletResponse response) {
		String uuid = StringUtil.getUUID();
		WebUtil.setCookie(response, DreamConstants.CAPTCHA_COOKIE_NAME, uuid, -1);
		return captchaService.generateResponseEntity(uuid);
	}

	@ApiIgnore
	@GetMapping("icons.html")
	public String icons() {
		return "system/common/icons";
	}

}
