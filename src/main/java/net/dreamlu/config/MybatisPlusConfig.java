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

package net.dreamlu.config;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.InnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.OptimisticLockerInnerInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import lombok.extern.slf4j.Slf4j;
import net.dreamlu.common.logger.SqlLogFilter;
import net.dreamlu.secrity.SecurityUtils;
import org.apache.ibatis.reflection.MetaObject;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.time.LocalDateTime;
import java.util.List;

/**
 * MybatisPlus配置
 *
 * @author L.cm
 */
@Configuration(proxyBeanMethods = false)
@MapperScan("net.dreamlu.**.mapper.**")
public class MybatisPlusConfig {

	@Bean
	public SqlLogFilter SqlLogFilter() {
		return new SqlLogFilter();
	}

	/**
	 * mybatis-plus 乐观锁拦截器
	 */
	@Bean
	public OptimisticLockerInnerInterceptor optimisticLockerInterceptor() {
		return new OptimisticLockerInnerInterceptor();
	}

	/**
	 * mybatis-plus分页插件
	 */
	@Bean
	public PaginationInnerInterceptor paginationInterceptor() {
		return new PaginationInnerInterceptor();
	}

	/**
	 * mybatis plus 插件
	 */
	@Bean
	public MybatisPlusInterceptor mybatisPlusInterceptor(ObjectProvider<List<InnerInterceptor>> listObjectProvider) {
		final MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
		listObjectProvider.ifAvailable(interceptorList -> interceptorList.forEach(interceptor::addInnerInterceptor));
		return interceptor;
	}

	/**
	 * 全局参数填充
	 */
	@Slf4j
	@Configuration(proxyBeanMethods = false)
	public static class MybatisPlusMetaObjectHandler implements MetaObjectHandler {
		@Override
		public void insertFill(MetaObject metaObject) {
			log.debug("mybatis plus start insert fill ....");
			LocalDateTime now = LocalDateTime.now();
			String userName = SecurityUtils.getUserName();
			this.fillValIfNullByName("createTime", now, metaObject);
			this.fillValIfNullByName("updateTime", now, metaObject);
			this.fillValIfNullByName("createdBy", userName, metaObject);
			this.fillValIfNullByName("updatedBy", userName, metaObject);
			// 逻辑删除的填充，避免数据库没有设置默认值，存储为 1 正常
			this.fillValIfNullByName("status", 1, metaObject);
		}

		@Override
		public void updateFill(MetaObject metaObject) {
			log.debug("mybatis plus start update fill ....");
			this.fillValIfNullByName("updateTime", LocalDateTime.now(), metaObject);
			this.fillValIfNullByName("updatedBy", SecurityUtils.getUserName(), metaObject);
		}

		/**
		 * 填充值，先判断是否有手动设置，优先手动设置的值，例如：job必须手动设置
		 *
		 * @param fieldName  属性名
		 * @param fieldVal   属性值
		 * @param metaObject MetaObject
		 */
		private void fillValIfNullByName(String fieldName, Object fieldVal, MetaObject metaObject) {
			// 用户手动设置的值
			Object userSetValue = this.getFieldValByName(fieldName, metaObject);
			if (userSetValue != null) {
				return;
			}
			this.setFieldValByName(fieldName, fieldVal, metaObject);
		}
	}
}
