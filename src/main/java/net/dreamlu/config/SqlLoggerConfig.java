package net.dreamlu.config;

import com.alibaba.druid.filter.logging.Log4j2Filter;
import com.alibaba.druid.sql.SQLUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * druid sql 日志配置
 *
 * @author L.cm
 */
@Configuration
public class SqlLoggerConfig {

	@Bean
	public Log4j2Filter logFilter() {
		Log4j2Filter logFilter = new Log4j2Filter();
		logFilter.setConnectionLogEnabled(false);
		logFilter.setConnectionCloseAfterLogEnabled(false);
		logFilter.setStatementCreateAfterLogEnabled(false);
		logFilter.setStatementPrepareAfterLogEnabled(false);
		logFilter.setStatementParameterSetLogEnabled(false);
		logFilter.setStatementExecuteAfterLogEnabled(false);
		logFilter.setStatementExecuteQueryAfterLogEnabled(false);
		logFilter.setStatementExecuteUpdateAfterLogEnabled(false);
		logFilter.setStatementExecuteBatchAfterLogEnabled(false);
		logFilter.setStatementCloseAfterLogEnabled(false);
		logFilter.setStatementExecutableSqlLogEnable(true);
		logFilter.setStatementLogErrorEnabled(true);
		logFilter.setStatementLogEnabled(true);
		logFilter.setStatementSqlFormatOption(new SQLUtils.FormatOption(false, false));
		return logFilter;
	}

}
