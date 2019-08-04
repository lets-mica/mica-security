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

package net.dreamlu.common.thymeleaf;

import lombok.AllArgsConstructor;
import net.dreamlu.system.model.SysDict;
import net.dreamlu.system.service.ISysDictService;
import org.springframework.stereotype.Component;
import org.springframework.util.Assert;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * <p>
 *     字典函数，用于thymeleaf和tpl中读取
 * </p>
 *
 * @author L.cm
 */
@Component
@AllArgsConstructor
public class SysDictFunc {
	private final ISysDictService sysDictService;

	public Stream<SysDict> getAllSysDict() {
		return sysDictService.selectAll().stream();
	}

	/**
	 * 根据字典类型查找所有的字典
	 * @param dictType 字典类型
	 * @return 字典集合
	 */
	public List<SysDict> getByType(final String dictType) {
		Assert.hasText(dictType, "dictType is black.");
		return getAllSysDict()
			.filter(x -> dictType.equalsIgnoreCase(x.getDictType()))
			.collect(Collectors.toList());
	}

	/**
	 * 根据字典类型查找所有的字典类型
	 * @return 字典集合
	 */
	public List<String> getAllType() {
		return getAllSysDict()
			.map(SysDict::getDictType)
			.distinct()
			.collect(Collectors.toList());
	}

	/**
	 * 根据字典类型查找所有的字典
	 * @param dictType 字典类型
	 * @return 字典集合
	 */
	public List<String> getValuesByType(final String dictType) {
		return getByType(dictType).stream()
			.map(SysDict::getDictValue)
			.collect(Collectors.toList());
	}

	/**
	 * 根据 dictKey 获取字典值
	 */
	public SysDict getByKey(final String dictKey) {
		Assert.hasText(dictKey, "dictKey is black.");
		return getAllSysDict()
			.filter(x -> dictKey.equalsIgnoreCase(x.getDictKey()))
			.findFirst().orElse(null);
	}

	/**
	 * 根据 dictKey 获取字典值
	 */
	public String getValueByKey(final String dictKey) {
		return Optional.ofNullable(getByKey(dictKey))
			.map(SysDict::getDictValue).orElse("");
	}

	/**
	 * 根据 dictType 和 dictKey 获取字典
	 */
	public SysDict getByTypeKey(final String dictType, final String dictKey) {
		Assert.hasText(dictType, "dictType is black.");
		Assert.hasText(dictKey, "dictKey is black.");
		return getAllSysDict()
			.filter(x ->
				dictType.equalsIgnoreCase(x.getDictType())
					&& dictKey.equalsIgnoreCase(x.getDictKey()))
			.findFirst().orElse(null);
	}

	/**
	 * 根据 dictType 和 dictKey 获取字典值
	 */
	public String getValueByTypeKey(final String dictType, final String dictKey) {
		return Optional.ofNullable(getByTypeKey(dictType, dictKey))
			.map(SysDict::getDictValue).orElse("");
	}
}
