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

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import net.dreamlu.common.result.EasyPage;
import net.dreamlu.common.result.PageVO;
import net.dreamlu.system.model.SysLog;
import net.dreamlu.system.service.ISysLogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * <p>
 * 系统日志 前端控制器
 * </p>
 *
 * @author L.cm
 * @since 2018-03-31
 */
@Controller
@RequestMapping("/sysLog")
@AllArgsConstructor
public class SysLogController {
    private final ISysLogService sysLogService;

    @GetMapping("/manager")
    public String manager() {
        return "system/sysLog/sysLogList";
    }

    @PostMapping("/dataGrid")
    @ResponseBody
    public EasyPage<SysLog> dataGrid(SysLog sysLog, PageVO pageVO) {
		Page<SysLog> pages = pageVO.toPage();
		sysLogService.findPage(pages, sysLog);
        return EasyPage.of(pages);
    }
}
