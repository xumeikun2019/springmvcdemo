package com.cf.project.controller.app;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cf.project.Constants;
import com.cf.project.service.CDeviceService;
import com.cf.util.JsonResult;

@RestController
@RequestMapping("/app/adv")
public class AdvController {

	@Autowired
	private CDeviceService cDeviceService;
	@RequestMapping(value = "/contrast", method = RequestMethod.POST)
	public JsonResult updateDevice(@RequestParam Map<String, Object> param,HttpServletRequest request) {
		JsonResult jsonResult = new JsonResult();
		try {
			String remoteAddr = request.getRemoteAddr();
			if(!StringUtils.isEmpty(remoteAddr)) {
				param.put("remoteAddr", remoteAddr);
			}
			jsonResult = cDeviceService.updateByAdvice(param);
		} catch (Exception e) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	@RequestMapping(value = "/playContent", method = RequestMethod.POST)
	public JsonResult findSucaiJihuaJiemu(HttpServletRequest request) {
		JsonResult jsonResult = new JsonResult();
			try {
				String remoteAddr = request.getRemoteAddr();
				jsonResult = cDeviceService.findSucaiJihuaJiemu(remoteAddr);
			} catch (Exception e) {
				jsonResult.setResult(Constants.OPERATION_FAIL);
				e.printStackTrace();
			}
		
		return jsonResult;
	}
}
