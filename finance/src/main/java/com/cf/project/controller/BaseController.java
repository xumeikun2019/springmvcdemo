package com.cf.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 基础Controller添加基本方法
 * @author towery
 *
 */
public class BaseController {

	/**
     * 将返回值写入页面
     * @param str
     */
    public void writeResult(String str,HttpServletResponse response){
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(str);
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            if(out != null){
                out.close(); 
            }
        }
    }
    
	/**
	 * 加入值到cookies里
	 * 
	 * @param key
	 *            键
	 * 
	 * @param value
	 *            值
	 */
	public void addCookie(String key, String value,HttpServletResponse response) {
		Cookie cookie = new Cookie(key, value);
		cookie.setPath("/");// 这个要设置
		// 不设置的话，则cookies不写入硬盘,而是写在内存,只在当前页面有用,以秒为单位
		cookie.setMaxAge(7 * 24 * 60 * 60);
		response.addCookie(cookie);
	}
	/**
	 * 根据键获取对应的cookie对象
	 * 
	 * @param key
	 *            对应的key
	 * 
	 * @return key对应的cookie值
	 */
	public Cookie getCookie(String key,HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies == null || cookies.length < 1)
			return null;
		for (Cookie temp : cookies) {
			if (temp.getName().equals(key)) {
				return temp;
			}
		}
		return null;
	}
	
	
	/**
	 * 获得cookie对应的值
	 * 
	 * @param key
	 *            对应的键
	 * 
	 * @return 返回值
	 */
	public String getCookieValue(String key,HttpServletRequest request) {
		Cookie cookie = this.getCookie(key,request);
		if (cookie != null) {
			try {
				return URLDecoder.decode(cookie.getValue(), "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
