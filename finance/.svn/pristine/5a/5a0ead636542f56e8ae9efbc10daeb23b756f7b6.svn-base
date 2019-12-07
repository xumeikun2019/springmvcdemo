package com.cf.util;

import java.util.HashMap;

import org.apache.log4j.Logger;

/**
 * 日期操作类
 * @author 郑伟彬
 *
 */

public class LogHelper {

	private Logger log4j;

	private static LogHelper logger = new LogHelper();

	private HashMap<String, String> lmap = new HashMap<String, String>();

	private boolean isLogStack = true;

	public LogHelper() {
		if (null == log4j)
			log4j = Logger.getLogger("cnea");
		lmap.put("FATAL", "1");
		lmap.put("ERROR", "2");
		lmap.put("WARN", "3");
		lmap.put("INFO", "4");
		lmap.put("DEBUG", "5");
	}

	public static void info(String msg) {
		logger.log4j.info(msg);
	}

	public static void warn(String msg) {
		logger.log4j.warn(msg);
	}

	public static void error(String msg) {
		logger.log4j.error(msg);
	}

	public static void debug(String msg) {
		logger.log4j.debug(msg);
	}

	public static void error(String msg, Throwable e) {
		if (logger.isLogStack) {
			logger.log4j.error(msg, e);
		} else {
			logger.log4j.error(msg);
		}
	}

	public static void fatal(String msg) {
		logger.log4j.fatal(msg);
	}

	public static void fatal(String msg, Throwable e) {
		if (logger.isLogStack) {
			logger.log4j.fatal(msg, e);
		} else {
			logger.log4j.fatal(msg);
		}
	}
}
