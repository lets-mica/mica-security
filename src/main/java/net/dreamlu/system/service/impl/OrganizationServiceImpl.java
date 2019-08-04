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

package net.dreamlu.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import net.dreamlu.common.result.Tree;
import net.dreamlu.system.mapper.OrganizationMapper;
import net.dreamlu.system.model.Organization;
import net.dreamlu.system.service.IOrganizationService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 组织机构 服务实现类
 * </p>
 *
 * @author L.cm
 * @since 2018-02-05
 */
@Service
public class OrganizationServiceImpl extends ServiceImpl<OrganizationMapper, Organization> implements IOrganizationService {

	@Override
	public List<Organization> selectTreeGrid() {
		LambdaQueryWrapper<Organization> wrapper = new LambdaQueryWrapper<>();
		wrapper.orderByAsc(Organization::getSeq);
		return super.list(wrapper);
	}

	@Override
	public List<Tree> selectTree() {
		List<Organization> organizationList = selectTreeGrid();
		List<Tree> trees = new ArrayList<>();
		if (organizationList != null) {
			for (Organization organization : organizationList) {
				Tree tree = new Tree();
				tree.setId(organization.getId());
				tree.setText(organization.getName());
				tree.setIconCls(organization.getIconCls());
				tree.setPid(organization.getPid());
				trees.add(tree);
			}
		}
		return trees;
	}
}
