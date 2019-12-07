package com.cf.util;

import java.util.Map;

import javax.servlet.http.HttpSession;

/**
 * 添加获取session属性
 * @author towery
 *
 */
public class SessionUtil {

	/**
	 * 获取session中的属性值
	 * @param name
	 * @return
	 */
	public static Object getSessionAttr(String name) {
		HttpSession session = ThreadContextHolder.getSession();
		return session.getAttribute(name);
	}
	
	/**
	 * 设置session中的属性值
	 * @param name
	 * @param value
	 */
	public static void setSessionAttr(String name,Object value) {
		HttpSession session = ThreadContextHolder.getSession();
		session.setAttribute(name,value);
	}
}
