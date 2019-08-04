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

package net.dreamlu.common.result;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import net.dreamlu.mica.core.utils.StringUtil;

/**
 * 页码vo
 * @author L.cm
 */
@Data
public class PageVO {
	private Integer page = 1;
	private Integer rows = 10;
	private String sort;
	private String order = "asc";

	/**
	 * 转化成mybatis plus中的page
	 */
	public <T> Page<T> toPage() {
		Page<T> newPage = new Page<>(page, rows);
		if (StringUtil.isNotBlank(sort)) {
			// 清理特殊字符，避免注入
			String sortBy = StringUtils.camelToUnderline(StringUtil.cleanIdentifier(sort));
			if ("asc".equalsIgnoreCase(order)) {
				newPage.setAsc(sortBy);
			} else {
				newPage.setDesc(sortBy);
			}
		}
		return newPage;
	}
}
