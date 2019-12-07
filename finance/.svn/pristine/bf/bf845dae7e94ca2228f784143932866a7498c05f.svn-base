package com.cf.project.controller.app;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cf.project.Constants;
import com.cf.project.service.CDeviceService;
import com.cf.project.service.CMeetingOrderService;
import com.cf.project.service.CMeetingSignService;
import com.cf.project.service.CUserService;
import com.cf.util.EntyPage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

/**
 * 会议信息
 * 
 * @author Administrator
 *
 */
@RestController
@RequestMapping("/app/meeting")
public class MeetingController {

	@Autowired
	private CMeetingOrderService cMeetingOrderService;
	@Autowired
	private CUserService cUserService;
	@Autowired
	private CDeviceService cDeviceService;
	@Autowired
	private CMeetingSignService cMeetingSignService;

	/**
	 * 
	 * @param dataTime 用户输入的时间
	 * @param deviceId 设备id
	 * @return
	 */
	@RequestMapping(value = "/init", method = RequestMethod.POST)
	public JsonResult findCdeviceCmeetingOrder(@RequestParam(name = "dataTime") String dataTime,HttpServletRequest request) {
		JsonResult result = new JsonResult();
		try {
			String remoteAddr = request.getRemoteAddr();
			result = cMeetingOrderService.findCdeviceCmeetingOrder(dataTime, remoteAddr);

		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 根据设备 id 查询其对应的会议室 并查询会议室下有哪些会议
	 * 
	 * @param deviceId 设备id
	 * @return
	 */
	@RequestMapping(value = "/findByDeviceId", method = RequestMethod.POST)
	public JsonListResult CdeviceCplaceCmeetingOrder(@RequestParam Map<String, Object> map, EntyPage page,HttpServletRequest request) {
		JsonListResult jsonListResult = new JsonListResult();
		try {
			String remoteAddr = request.getRemoteAddr();
			map.put("deviceId",remoteAddr);
			map.put("page", page);
			jsonListResult = cMeetingOrderService.findcdeviceCplaceCmeetingOrder(map);
		} catch (Exception e) {
			jsonListResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jsonListResult;
	}

	/**
	 * 修改会议室状态
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/updateByState", method = RequestMethod.POST)
	public JsonResult CmeetingOrder(@RequestParam(name = "id") String id) {
		JsonResult result = new JsonResult();
		try {
			result = cMeetingOrderService.updateByState(id);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * app用户登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public JsonResult Cuser(@RequestParam(name = "username") String username,
			@RequestParam(name = "password") String password) {
		JsonResult jsonResult = new JsonResult();
		try {
			jsonResult = cUserService.selectByUser(username, password);
		} catch (Exception e) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jsonResult;
	}

	/**
	 * 设备绑定
	 * 
	 * @param cDevice
	 * @return
	 */
	@RequestMapping(value = "/binding", method = RequestMethod.POST)
	public JsonResult Cdevice(@RequestParam Map<String, Object> map) {
		JsonResult jsonResult = new JsonResult();
		try {
			jsonResult = cDeviceService.addCDevice(map);
		} catch (Exception e) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jsonResult;
	}

	/**
	 * 根据设备名称 查询设备
	 * 
	 * @param mac
	 * @return
	 */
	@RequestMapping(value = "/findByMac", method = RequestMethod.POST)
	public JsonResult findByMac(@RequestParam(name = "mac") String mac) {
		JsonResult jsonResult = new JsonResult();
		try {
			jsonResult = cDeviceService.findByMac(mac);
		} catch (Exception e) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jsonResult;

	}

	/**
	 * 签到
	 * 
	 * @param wechatId
	 * @return
	 */
	@RequestMapping(value = "/sign", method = RequestMethod.GET)
	public JsonResult sign(@RequestParam(name = "wechatId") String wechatId,
							@RequestParam(name = "orderId") String meetingId,
							@RequestParam(name = "yzm") String yzm) {
		JsonResult jsonResult = new JsonResult();
		try {
			jsonResult = cMeetingSignService.addCmeetingSign(wechatId, meetingId,yzm);
		} catch (Exception e) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jsonResult;
	}

	@ResponseBody
	@RequestMapping(value = "/SignList", method = RequestMethod.POST)
	public JsonListResult findCmeetingSignList() {
		JsonListResult jsonListResult = new JsonListResult();
		try {
			jsonListResult = cMeetingSignService.findCmeetingSignList();
		} catch (Exception e) {
			jsonListResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jsonListResult;
	}
}