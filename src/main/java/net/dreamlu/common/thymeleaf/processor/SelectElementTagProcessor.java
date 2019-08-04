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

package net.dreamlu.common.thymeleaf.processor;

import lombok.extern.slf4j.Slf4j;
import net.dreamlu.common.thymeleaf.SysDictFunc;
import net.dreamlu.mica.core.utils.StringUtil;
import net.dreamlu.system.model.SysDict;
import org.thymeleaf.context.ITemplateContext;
import org.thymeleaf.model.IModel;
import org.thymeleaf.model.IModelFactory;
import org.thymeleaf.model.IProcessableElementTag;
import org.thymeleaf.processor.element.AbstractElementTagProcessor;
import org.thymeleaf.processor.element.IElementTagStructureHandler;
import org.thymeleaf.templatemode.TemplateMode;
import org.unbescape.html.HtmlEscape;

import java.util.ArrayList;
import java.util.List;

/**
 * 下拉框
 *
 * @author L.cm
 */
@Slf4j
public class SelectElementTagProcessor extends AbstractElementTagProcessor {
	private static final String TAG_NAME = "select";
	private final SysDictFunc dictFunc;

	public SelectElementTagProcessor(final String prefix, int precedence, SysDictFunc dictFunc) {
		super(TemplateMode.HTML, prefix, TAG_NAME, true, null, false, precedence);
		this.dictFunc = dictFunc;
	}

	@Override
	protected void doProcess(final ITemplateContext context, final IProcessableElementTag tag, final IElementTagStructureHandler structureHandler) {

		// select html tag
		String id = tag.getAttributeValue("id");
		String name = tag.getAttributeValue("name");
		String classValue = tag.getAttributeValue("class");
		String style = tag.getAttributeValue("style");
		String dataOptions = tag.getAttributeValue("data-options");

		// 字典类型
		String dictType = tag.getAttributeValue("type");
		String defaultValue = tag.getAttributeValue("default");

		List<String> options = new ArrayList<>();
		if (StringUtil.isNotBlank(defaultValue)) {
			options.add("<option value=\"\">" + defaultValue + "</option>");
		}
		if (StringUtil.isNotBlank(dictType)) {
			List<SysDict> dictList = dictFunc.getByType(dictType);
			dictList.forEach(sysDict -> {
				String dictKey = sysDict.getDictKey();
				StringBuilder option = new StringBuilder();
				option.append("<option value=\"");
				option.append(dictKey);
				option.append("\">");
				option.append(sysDict.getDictValue());
				option.append("</option>");
				options.add(option.toString());
			});
		} else {
			List<String> typeList = dictFunc.getAllType();
			typeList.forEach(type -> {
				StringBuilder option = new StringBuilder();
				option.append("<option value=\"");
				option.append(type);
				option.append("\")>");
				option.append(type);
				option.append("</option>");
				options.add(option.toString());
			});
		}

		final IModelFactory modelFactory = context.getModelFactory();

		final IModel model = modelFactory.createModel();
		model.add(modelFactory.createText("\n\t"));

		IProcessableElementTag selectElement = modelFactory.createOpenElementTag("select");
		if (StringUtil.isNotBlank(id)) {
			selectElement = modelFactory.setAttribute(selectElement, "id", id);
		}
		if (StringUtil.isNotBlank(name)) {
			selectElement = modelFactory.setAttribute(selectElement, "name", name);
		}
		if (StringUtil.isNotBlank(style)) {
			selectElement = modelFactory.setAttribute(selectElement, "style", style);
		}
		if (StringUtil.isNotBlank(classValue)) {
			selectElement = modelFactory.setAttribute(selectElement, "class", classValue);
		}
		if (StringUtil.isNotBlank(dataOptions)) {
			selectElement = modelFactory.setAttribute(selectElement, "data-options", dataOptions);
		}
		model.add(selectElement);
		model.add(modelFactory.createText("\n\t\t"));
		model.add(modelFactory.createText(HtmlEscape.unescapeHtml(String.join("\n\t\t", options))));
		model.add(modelFactory.createText("\n\t"));
		model.add(modelFactory.createCloseElementTag("select"));

		structureHandler.replaceWith(model, false);
	}
}
