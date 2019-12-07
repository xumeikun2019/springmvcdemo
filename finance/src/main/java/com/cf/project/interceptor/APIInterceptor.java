package com.cf.project.interceptor;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.cf.project.Constants;
import com.cf.project.service.CDeviceService;
import com.cf.util.JsonListResult;

/**
 * 手机接口拦截器
 * @author towery
 * @date 2018年12月19日下午3:42:31
 */
public class APIInterceptor implements HandlerInterceptor {

	@Autowired
	private CDeviceService cDeviceService;
	
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}

	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		
		String token = arg0.getParameter("token");
		if (StringUtils.isBlank(token)) {
			JsonListResult result = new JsonListResult();
			result.setResult(Constants.OPERATION_FAIL);
			result.setMessage("token不存在");
			String jsonString = JSONObject.toJSONString(result);
			sendMessage(arg1,jsonString);
			return false;
		} else {
			String ip = arg0.getRemoteAddr();
			Map<String,Object> paramMap = new HashMap<String, Object>();
			paramMap.put("ip", ip);
			cDeviceService.updateOnlineState(paramMap);
		}
		return true;
	}

	  /**
     * 发送消息 application/json;charset=UTF-8
     * @param response
     * @param str
     * @throws Exception
     */
    private void sendMessage(HttpServletResponse response, String str) throws Exception {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.print(str);
        writer.close();
        response.flushBuffer(); 
    }

}
