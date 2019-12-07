package com.cf.project;


import com.cf.util.ThreadContextHolder;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by towery on 2018/7/19.
 */
public class DispatcherFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {

    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;
        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;
        String uri = httpRequest.getServletPath();

		/* 应对微信新的网页获取用户数据的方式而增加 */
        if (uri.endsWith(".txt")) {
            filterChain.doFilter(httpRequest, httpResponse);
            return;
        }


        // 不允许jsp被执行，防止被挂马
        if (uri.endsWith(".jsp")) {
            return;
        }

        // 不允许properties被执行，防止泄漏隐私
        if (uri.endsWith(".properties")) {
            return;
        }

        // 允许静态资源执行
        if (isExinclude(uri)) {
            filterChain.doFilter(httpRequest, httpResponse);
        }


        HttpSession session = httpRequest.getSession();
        ThreadContextHolder.setSession(session);
        ThreadContextHolder.setHttpRequest(httpRequest);
        ThreadContextHolder.setHttpResponse(httpResponse);

        // 允许controller执行
        if (uri.endsWith(".html") || uri.endsWith(".shtml") || uri.contains("/druid") || uri.endsWith(".jso") || uri.endsWith(".json") || uri.contains("/api") || uri.endsWith(".do")) {
            filterChain.doFilter(httpRequest, httpResponse);
        }

        ThreadContextHolder.remove();
    }

    /**
     * 是否访问静态文件
     *
     * @param uri
     *            uri链接
     * @return 返回状态
     */
    private boolean isExinclude(String uri) {
        String[] exts = new String[] { "jpg", "jpeg", "mp4", "pdf", "gif", "js", "png", "css", "doc",
                "xls", "swf", "ico", "ttf", "woff", "woff2"};
        for (String ext : exts) {
            if (uri.toUpperCase().endsWith(ext.toUpperCase())) {
                return true;
            }
        }
        return false;
    }


    public void destroy() {

    }
}
