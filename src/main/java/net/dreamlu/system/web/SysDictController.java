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

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.AllArgsConstructor;
import net.dreamlu.common.base.BaseController;
import net.dreamlu.common.result.EasyPage;
import net.dreamlu.common.result.PageVO;
import net.dreamlu.mica.core.result.R;
import net.dreamlu.mica.core.utils.BeanUtil;
import net.dreamlu.system.model.SysDict;
import net.dreamlu.system.service.ISysDictService;
import net.dreamlu.system.vo.SysDictVO;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

/**
 * <p>
 * 字典 前端控制器
 * </p>
 *
 * @author L.cm
 * @since 2018-04-15
 */
@Controller
@RequestMapping("/sysDict")
@AllArgsConstructor
public class SysDictController extends BaseController {
	private final ISysDictService sysDictService;

	@GetMapping("/manager")
	@PreAuthorize("@sec.hasPermission('sysDict:manager')")
	public String manager() {
		return "system/sysDict/sysDictList";
	}

	@PostMapping("/dataGrid")
	@PreAuthorize("@sec.hasPermission('sysDict:dataGrid')")
	@ResponseBody
	public EasyPage<SysDict> dataGrid(SysDictVO sysDictVO, PageVO pageVO) {
		SysDict sysDict = BeanUtil.copy(sysDictVO, SysDict.class);
		LambdaQueryWrapper<SysDict> ew = new LambdaQueryWrapper<>(sysDict);
		LocalDateTime startTime = sysDictVO.getCreatedateStart();
		LocalDateTime endTime = sysDictVO.getCreatedateEnd();
		ew.ge(null != startTime, SysDict::getCreateTime, startTime);
		ew.le(null != endTime, SysDict::getCreateTime, endTime);
		Page<SysDict> pages = pageVO.toPage();
		sysDictService.page(pages, ew);
		return EasyPage.of(pages);
	}

	/**
	 * 获取所有的字典
	 */
	@GetMapping("/list")
	@PreAuthorize("@sec.isAuthenticated()")
	@ResponseBody
	public List<SysDict> list() {
		return sysDictService.selectAll();
	}

	/**
	 * 添加页面-字典
	 */
	@GetMapping("/addPage")
	public String addPage() {
		return "system/sysDict/sysDictAdd";
	}

	/**
	 * 添加页面-字典
	 */
	@PostMapping("/add")
	@PreAuthorize("@sec.hasPermission('sysDict:add')")
	@ResponseBody
	public R<Object> add(@Valid SysDict sysDict) {
		sysDict.setCreateTime(LocalDateTime.now());
		return status(sysDictService.save(sysDict));
	}

	/**
	 * 编辑-字典
	 */
	@GetMapping("/editPage")
	public String editPage(Model model, Integer id) {
		SysDict sysDict = sysDictService.getById(id);
		model.addAttribute("sysDict", sysDict);
		return "system/sysDict/sysDictEdit";
	}

	/**
	 * 编辑-字典
	 */
	@PostMapping("/edit")
	@PreAuthorize("@sec.hasPermission('sysDict:edit')")
	@ResponseBody
	public R<Object> edit(@Valid SysDict sysDict) {
		return status(sysDictService.updateById(sysDict));
	}
}
