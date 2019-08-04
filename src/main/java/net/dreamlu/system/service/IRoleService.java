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

package net.dreamlu.system.service;

import com.baomidou.mybatisplus.extension.service.IService;
import net.dreamlu.common.result.Tree;
import net.dreamlu.system.model.Role;

import java.util.List;

/**
 * <p>
 * 角色 服务类
 * </p>
 *
 * @author L.cm
 * @since 2018-01-29
 */
public interface IRoleService extends IService<Role> {

	List<Tree> selectTree();
	/**
	 * 根据用户id查找角色
	 * @param adminId 用户id
	 * @return 角色集合
	 */
	List<Role> findListByAdminId(Integer adminId);

	List<Integer> selectResourceIdListByRoleId(Integer id);

	void updateRoleResource(Integer id, String resourceIds);
}
