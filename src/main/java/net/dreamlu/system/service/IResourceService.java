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
import net.dreamlu.secrity.auth.AuthUser;
import net.dreamlu.system.model.Resource;

import java.util.List;

/**
 * <p>
 * 资源 服务类
 * </p>
 *
 * @author L.cm
 * @since 2018-01-29
 */
public interface IResourceService extends IService<Resource> {

	List<Resource> findByType(Integer type);

	List<Tree> findAllMenu();

	List<String> findPermissionsByRoleIds(List<Integer> roleIds);

	List<Tree> findAllTree();

	List<Tree> findUserTree(AuthUser authUser);

	List<Resource> findAllByAdminId(Integer adminId);
}
