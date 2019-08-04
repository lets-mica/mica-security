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

package net.dreamlu.system.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import net.dreamlu.system.model.Resource;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
  * 资源 Mapper 接口
 * </p>
 *
 * @author L.cm
 * @since 2018-01-29
 */
@Mapper
public interface ResourceMapper extends BaseMapper<Resource> {

	@Select("SELECT r.permissions FROM t_resource r, t_role_resource rr WHERE " +
		"r.id = rr.resource_id AND r.status = 1 AND rr.role_id IN (${roleIds})")
	List<String> findPermissionsByRoleIds(@Param("roleIds") String roleIds);
}
