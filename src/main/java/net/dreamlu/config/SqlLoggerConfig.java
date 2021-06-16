package net.dreamlu.config;

import net.dreamlu.common.logger.SqlLogFilter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * druid sql 日志配置
 *
 * @author L.cm
 */
@Configuration(proxyBeanMethods = false)
public class SqlLoggerConfig {

	@Bean
	public SqlLogFilter SqlLogFilter() {
		return new SqlLogFilter();
	}

}
