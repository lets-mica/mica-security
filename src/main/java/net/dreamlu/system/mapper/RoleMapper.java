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
import net.dreamlu.system.model.Role;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * <p>
  * 角色 Mapper 接口
 * </p>
 *
 * @author L.cm
 * @since 2018-01-29
 */
@Mapper
public interface RoleMapper extends BaseMapper<Role> {

	/**
	 * 根据用户id查找用户的角色
	 * @param adminId 用户id
	 * @return 角色集合
	 */
	@Select("SELECT tr.* FROM t_admin_role tar JOIN t_role tr ON tar.role_id = tr.id " +
		"WHERE tr.status = 1 AND tar.admin_id = #{adminId}")
	List<Role> findListByAdminId(@Param("adminId") Integer adminId);

	List<Resource> selectResourceListByRoleIdList(@Param("list") List<Integer> list);

	@Select("SELECT e.resource_id AS id FROM t_role r LEFT JOIN t_role_resource e ON r.id = e.role_id " +
		"WHERE r.id = #{id} AND r.status = 1")
	List<Integer> selectResourceIdListByRoleId(@Param("id") Integer id);
}
