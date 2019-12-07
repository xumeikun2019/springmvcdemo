package com.cf.project.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

import com.cf.project.redis.RedisUtil;

@Component
public class InitDataListener implements ServletContextListener,ApplicationContextAware {

	private static ApplicationContext applicationContext;
	
	private RedisUtil redisUtil;
	
	private Logger log = Logger.getLogger(InitDataListener.class);

	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		InitDataListener.applicationContext = arg0;
	}

	public void contextInitialized(ServletContextEvent sce) {
		redisUtil = (RedisUtil)applicationContext.getBean("redisPool");
	}

	public void contextDestroyed(ServletContextEvent sce) {
		redisUtil.deleteKeyByContain("*");
		log.info("cache clean success");
	}
}
