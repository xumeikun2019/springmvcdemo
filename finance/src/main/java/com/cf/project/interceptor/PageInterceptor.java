package com.cf.project.interceptor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.DefaultReflectorFactory;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.reflection.SystemMetaObject;

import com.cf.util.EntyPage;

/**
 * 分页拦截器
 */
@Intercepts({ @Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class,Integer.class }) })
public class PageInterceptor implements Interceptor {

	protected static final Log logger = LogFactory.getLog(PageInterceptor.class);

	public Object intercept(Invocation invocation) throws Throwable {
		StatementHandler statementHandler = (StatementHandler) invocation.getTarget();
		MetaObject metaObject = MetaObject.forObject(statementHandler, SystemMetaObject.DEFAULT_OBJECT_FACTORY,
				SystemMetaObject.DEFAULT_OBJECT_WRAPPER_FACTORY,new DefaultReflectorFactory());
		MappedStatement mappedStatement = (MappedStatement) metaObject.getValue("delegate.mappedStatement");
		String id = mappedStatement.getId();
		if (id.matches(".+HDPage$")) {
			BoundSql boundSql = statementHandler.getBoundSql();
			String sql = boundSql.getSql();
			String countSql = "select count(*) from (" + sql + ") t";
			Connection connection = (Connection) invocation.getArgs()[0];
			PreparedStatement countStatement = connection.prepareStatement(countSql);
			ParameterHandler parameterHandler = (ParameterHandler) metaObject.getValue("delegate.parameterHandler");
			parameterHandler.setParameters(countStatement);
			ResultSet rs = countStatement.executeQuery();

			Map<?, ?> parameter = (Map<?, ?>) boundSql.getParameterObject();
			EntyPage page = (EntyPage) parameter.get("page");
			if (rs.next()) {
				page.setTotalNumber(rs.getInt(1));
			}
			String pageSql = sql + " limit " + page.getDbOffset() + "," + page.getDbSize();
			metaObject.setValue("delegate.boundSql.sql", pageSql);
			
			//logger.info("execute sql："+sql);
		}
		return invocation.proceed();
	}

	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	public void setProperties(Properties properties) {
	}

}
