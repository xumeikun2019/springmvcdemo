package com.cf.project.controller.app;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cf.project.Constants;
import com.cf.project.service.CDeviceService;
import com.cf.util.JsonResult;

/**
 * 设备状态Controller
 * 
 * @author Administrator
 *
 */
@RestController
@RequestMapping("/attendance/device")
public class DeviceController {

	@Autowired
	private CDeviceService cDeviceService;

	/**
	 * 设备状态
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/state", method = RequestMethod.POST)
	public JsonResult state(@RequestBody Map<String, Object> map) {
		JsonResult result = new JsonResult();
		try {
			result = cDeviceService.updateOnlineStateByIp(map);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/EditLastTime", method = RequestMethod.POST)
	public JsonResult EditLastTime(@RequestParam Map<String, Object> map, HttpServletRequest request) {
		JsonResult jsonResult = new JsonResult();
		try {
			String reqAddr = request.getRemoteAddr();
			map.put("reqAddr", reqAddr);
			jsonResult = cDeviceService.updateDeciveByIp(map);
		} catch (Exception e) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jsonResult;
	}
}
