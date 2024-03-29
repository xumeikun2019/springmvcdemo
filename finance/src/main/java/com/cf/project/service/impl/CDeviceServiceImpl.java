package com.cf.project.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.cf.project.Constants;
import com.cf.project.annotation.Cache;
import com.cf.project.annotation.CacheClear;
import com.cf.project.mybatis.dao.CDeviceMapper;
import com.cf.project.mybatis.dao.CSucaiMapper;
import com.cf.project.mybatis.model.CDevice;
import com.cf.project.mybatis.model.CDeviceExample;
import com.cf.project.service.CDeviceService;
import com.cf.util.DateTimeUtil;
import com.cf.util.EntyPage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;

@Service
public class CDeviceServiceImpl implements CDeviceService {

	@Value("${app.project.url}")
	private String url;

	@Autowired
	private CDeviceMapper cDeviceMapper;
	@Autowired
	private CSucaiMapper cSucaiMapper;

	@Cache
	public JsonListResult findCDeviceList(Map<String, Object> map) throws Exception {
		List<Map<String, Object>> list = cDeviceMapper.findByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}

	@Override
	public List<Map<String, Object>> allList(Map<String, Object> map) {
		System.out.println(123);
		Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
		Set<String> roleSet = (Set<String>) usermap.get("roles");
		Iterator<String> it = roleSet.iterator(); 
		String rolesStr = "";
		while (it.hasNext()) {  
		  String str = it.next();  
		  rolesStr+=str+",";
		} 
		if(!rolesStr.isEmpty()) {
			rolesStr = rolesStr.substring(0, rolesStr.length()-1);
		}
		map.put("rolesStr",rolesStr);
		List<Map<String, Object>> list = cDeviceMapper.allList(map);
		return list;
	}

	@Cache
	public CDevice findCDeviceListById(String id) throws Exception {
		return this.cDeviceMapper.selectByPrimaryKey(id);
	}

	@CacheClear
	public JsonResult saveOrUpdate(CDevice pojo) throws Exception {
		JsonResult jsonResult = new JsonResult();
		if (pojo != null) {
			String id = pojo.getId();
			int result = 0;
			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
			if (StringUtils.isNotBlank(id)) {
				pojo.setLastTime(dateTime);
				result = cDeviceMapper.updateByPrimaryKeySelective(pojo);
			} else {
				pojo.setAddTime(dateTime);
				pojo.setLastTime(dateTime);
				result = cDeviceMapper.insertSelective(pojo);
			}
			if (result == 0) {
				jsonResult.setResult(Constants.OPERATION_FAIL);
			}
		}
		return jsonResult;
	}

	@CacheClear
	public JsonResult update(CDevice pojo) throws Exception {
		JsonResult jsonResult = new JsonResult();
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		pojo.setLastTime(dateTime);
		int result = cDeviceMapper.updateByPrimaryKeySelective(pojo);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	@CacheClear
	@Override
	public JsonResult updateOnlineState(Map<String, Object> paramMap) throws Exception {
		JsonResult jsonResult = new JsonResult();
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		paramMap.put("lastTime", dateTime);
		int result = cDeviceMapper.updateByIp(paramMap);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	@CacheClear
	public JsonResult updateOnlineStateByIp(Map<String, Object> paramMap) throws Exception {
		JsonResult jsonResult = new JsonResult();
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		paramMap.put("lastTime", dateTime);
		int result = cDeviceMapper.updateByIp(paramMap);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	@CacheClear
	public JsonResult del(String id) throws Exception {
		JsonResult jsonResult = new JsonResult();
		int result = 0;
		if (StringUtils.contains(id, ",")) {
			String[] idsArr = id.split(",");
			if (idsArr.length > 0) {
				for (String idArr : idsArr) {
					result = cDeviceMapper.deleteByPrimaryKey(idArr);
					if (result == 0) {
						break;
					}
				}
			}
		} else {
			result = cDeviceMapper.deleteByPrimaryKey(id);
		}
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	/**
	 * 移动端设备绑定
	 * 
	 * @param
	 * @return
	 */
	@CacheClear
	public JsonResult addCDevice(Map<String, Object> map) {
		JsonResult jsonResult = new JsonResult();
		String placeId = (String) map.get("placeId");
		String mac = (String) map.get("mac");
		if (!StringUtils.isEmpty(placeId) && !StringUtils.isEmpty(mac)) {
			CDevice device = cDeviceMapper.findcDeviceBymap(map);
			if (device != null) {
				String deviceId = device.getId();
				cDeviceMapper.deleteByPrimaryKey(deviceId);
			}
			CDevice cDevice = new CDevice();
			cDevice.setPlaceId(placeId);
			cDevice.setMac(mac);
			cDevice.setState("T");
			int flag = cDeviceMapper.insertSelective(cDevice);
			if (flag > 0) {
				jsonResult.setMessage("绑定成功!");
			}
			return jsonResult;
		}
		jsonResult.setResult(Constants.OPERATION_FAIL);
		jsonResult.setMessage("绑定失败!");
		return jsonResult;
	}

	/**
	 * 根据设备id 查询设备
	 */
	@Cache
	public JsonResult findByMac(String mac) {
		JsonResult jsonResult = new JsonResult();
		if (!StringUtils.isEmpty(mac)) {
			Map<String, Object> map = cDeviceMapper.findByMac(mac);
			if (map == null) {
				jsonResult.setMessage("无此设备信息!");
				jsonResult.setResult(Constants.OPERATION_FAIL);
			}
			jsonResult.setData(map);
			return jsonResult;
		}
		jsonResult.setMessage("设备名不能为空!");
		jsonResult.setResult(Constants.OPERATION_FAIL);
		return jsonResult;
	}

	/**
	 * web端pad设备绑定
	 */
	@CacheClear
	public JsonResult addCDevice(CDevice pojo) {
		JsonResult jsonResult = new JsonResult();
		String placeId = pojo.getPlaceId();
		//String mac = pojo.getMac();
		if (!StringUtils.isEmpty(placeId)) {
			Map<String, Object> map = new HashMap<>();
			//map.put("mac", mac);
			map.put("placeId", placeId);
			CDevice device = cDeviceMapper.findcDeviceBymap(map);
			if (device != null) {
				String deviceId = device.getId();
				cDeviceMapper.deleteByPrimaryKey(deviceId);
			}
			pojo.setType("pad");
			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
			pojo.setAddTime(dateTime);
			int flag = cDeviceMapper.insertSelective(pojo);
			if (flag > 0) {
				jsonResult.setMessage("绑定成功!");
			}
			return jsonResult;
		}
		jsonResult.setResult(Constants.OPERATION_FAIL);
		jsonResult.setMessage("绑定失败!");
		return jsonResult;
	}

	/**
	 * pad更新设备
	 */
	@CacheClear
	public JsonResult updateCDevice(CDevice pojo) {
		JsonResult jsonResult = new JsonResult();
		pojo.setType("pad");
		// Date dateTime =
		// DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd
		// HH:mm:ss");
		// pojo.setLastTime(dateTime);
		int flag = cDeviceMapper.updateByPrimaryKeySelective(pojo);
		if (flag == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			jsonResult.setMessage("更新失败!");
			return jsonResult;
		}
		jsonResult.setMessage("更新成功!");
		return jsonResult;
	}

	/**
	 * 添加设备
	 */
	@CacheClear
	public JsonResult addDevice(CDevice pojo) {
		JsonResult jsonResult = new JsonResult();
		String placeId = pojo.getPlaceId();
		String ip = pojo.getIp();
		String deviceToken = pojo.getDeviceToken();
		if (!StringUtils.isEmpty(placeId) && !StringUtils.isEmpty(ip) || !StringUtils.isEmpty(deviceToken)) {
			Map<String, Object> map = new HashMap<>();
			map.put("ip", ip);
			map.put("deviceToken", deviceToken);
			CDevice device = cDeviceMapper.findcDeviceBymap(map);
			if (device != null) {
				String deviceId = device.getId();
				cDeviceMapper.deleteByPrimaryKey(deviceId);
			}
			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
			pojo.setAddTime(dateTime);
			int flag = cDeviceMapper.insertSelective(pojo);
			if (flag > 0) {
				jsonResult.setMessage("绑定成功!");
			}
			return jsonResult;
		}

		return jsonResult;
	}

	/**
	 * 更新其他设备
	 */
	@CacheClear
	public JsonResult updateDevice(CDevice pojo) {
		JsonResult jsonResult = new JsonResult();
		// Date dateTime =
		// DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd
		// HH:mm:ss");
		// pojo.setLastTime(dateTime);
		int flag = cDeviceMapper.updateByPrimaryKeySelective(pojo);
		if (flag == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			jsonResult.setMessage("更新失败!");
			return jsonResult;
		}
		jsonResult.setMessage("更新成功!");

		return jsonResult;
	}

	/**
	 * 查询楼层
	 */
	@Cache
	public List<Map<String, Object>> findCDeviceByFloor() {
		return cDeviceMapper.findCDeviceByFloor();
	}

	@CacheClear
	public JsonResult updateByAdvice(Map<String, Object> param) {
		JsonResult jsonResult = new JsonResult();
		String remoteAddr = param.get("remoteAddr").toString();
		String deviceToken = param.get("deviceToken").toString();
		CDeviceExample example = new CDeviceExample();
		example.createCriteria().andIpEqualTo(remoteAddr);
		CDevice device = new CDevice();
		device.setDeviceToken(deviceToken);
		int falg = cDeviceMapper.updateByExampleSelective(device, example);
		if (falg == 0) {
			jsonResult.setMessage("绑定失败");
			jsonResult.setResult(Constants.OPERATION_FAIL);
			return jsonResult;
		}
		jsonResult.setMessage("绑定成功");
		return jsonResult;
	}

	/**
	 * 查看设备需要播放的内容
	 */
	@Cache
	public JsonResult findSucaiJihuaJiemu(String remoteAddr) {
		JsonResult jsonResult = new JsonResult();
		// 根据ip查询设备
		Map<String, Object> map = new HashMap<>();
		// "192.168.0.156"
		map.put("ip", remoteAddr);
		CDevice cDevice = cDeviceMapper.findcDeviceBymap(map);
		if (cDevice == null) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			jsonResult.setMessage("设备不存在");
			return jsonResult;
		}
		// 获取设备id
		String deviceId = cDevice.getId();
		// 查询计划节目列表
		List<Map<String, Object>> jhjmList = cDeviceMapper.findJihuaJiemu();
		if (jhjmList.isEmpty()) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			jsonResult.setMessage("无相关信息");
			return jsonResult;
		}
		List<Map<String, Object>> arrayList = new ArrayList<>();
		// 获取jhjm设备ids
		for (Map<String, Object> jhjm : jhjmList) {
			String devices = (String) jhjm.get("deviceIds");
			if (StringUtils.isEmpty(devices)) {
				continue;
			}
			String[] splitDevices = devices.split(",");
			// 遍历deviceIds
			for (int i = 0; i < splitDevices.length; i++) {
				// 如果包含当前设备id
				if (deviceId.equals(splitDevices[i])) {
					String times = (String) jhjm.get("times");
					if (!StringUtils.isEmpty(times)) {
						String timesString = ",";
						String[] timesSup = times.split(",");
						if (timesSup.length > 0) {
							if(timesSup.length ==1) {
								timesString = timesSup[0] + ":01" + ",";
							}
							if(timesSup.length == 2) {
								if (StringUtils.isEmpty(timesSup[0]) && !StringUtils.isEmpty(timesSup[1])) {
									timesString = "," + timesSup[1] + ":00";
								}else {
									timesString = timesSup[0] + ":01" + "," + timesSup[1] + ":00";
								}
							}
						}
						jhjm.put("times", timesString);
					}

					// 获取素材id
					String sucaiIds = (String) jhjm.get("sucaiIds");
					if (StringUtils.isEmpty(sucaiIds)) {
						jsonResult.setResult(Constants.OPERATION_FAIL);
						jsonResult.setMessage("无相关素材");
						return jsonResult;
					}
					// 处理sucaiIds
					String[] sucaiIdsStr = sucaiIds.split(",");
					List<Map<String, Object>> list = new ArrayList<>();
					// 根据sucaiIds查询对应的素材path
					List<Map<String, Object>> sucaiList = cSucaiMapper.findAllBySucaiIds(sucaiIdsStr);
					// 遍历sucaiList,获取path
					for (Map<String, Object> sucai : sucaiList) {
						String sucaiPath = (String) sucai.get("path");
						// 获取后缀名
						String sucaiSuffix = sucaiPath.substring(sucaiPath.lastIndexOf(".") + 1);
						String type = "";
						String reqUrl = "";
						Map<String, Object> pathMap = null;
						if (sucaiSuffix.equals("doc") || sucaiSuffix.equals("xls") || sucaiSuffix.equals("pdf")
								|| sucaiSuffix.equals("ppt") || sucaiSuffix.equals("docx") ||sucaiSuffix.equals("xlsx")
								||sucaiSuffix.equals("pptx")) {
							String switchpath = (String) sucai.get("switchpath");
							// 处理switchpath
							String[] switchpathArr = switchpath.split(",");
							for (int j = 0; j < switchpathArr.length; j++) {

								// 获取后缀名
								String switchpathSuffix = switchpathArr[j]
										.substring(switchpathArr[j].lastIndexOf(".") + 1);
								if (switchpathSuffix.equals("html")) {
									String[] subswitchpath = switchpathArr[j].split("/");
									type = subswitchpath[2];
									reqUrl = switchpathArr[j];
								} else {
									reqUrl = url + switchpathArr[j];
								}
								pathMap = new HashMap<>();
								Integer jgInt = (Integer) jhjm.get("jg") * 1000;
								String jg = Integer.toString(jgInt);
								pathMap.put("url", reqUrl);
								pathMap.put("delyed", jg);
								pathMap.put("type", type);
								list.add(pathMap);
							}
						} else {
							reqUrl = url + sucaiPath;
							pathMap = new HashMap<>();
							Integer jgInt = (Integer) jhjm.get("jg") * 1000;
							String jg = Integer.toString(jgInt);
							pathMap.put("url", reqUrl);
							pathMap.put("delyed", jg);
							pathMap.put("type", type);
							list.add(pathMap);

						}
					}

					// 获取后缀
					// 如果后缀包含 word excle pdf ppt 就取switchpath
					jhjm.put("list", list);
					jhjm.remove("jg");
					jhjm.remove("deviceIds");
					jhjm.remove("sucaiIds");
					arrayList.add(jhjm);

				}
			}
			// arrayList.add(jhjm);
		}
		jsonResult.setData(arrayList);
		return jsonResult;
	}

	@Override
	public JsonResult findByDeviceIp(String ip) {
		JsonResult jsonResult = new JsonResult();
		CDeviceExample example = new CDeviceExample();
		example.createCriteria().andIpEqualTo(ip);
		List<CDevice> list = cDeviceMapper.selectByExample(example);
		if (list.size() > 0) {
			jsonResult.setMessage("ip重复绑定");
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	/**
	 * 根据设备ip更改lastTime
	 */
	@CacheClear
	public JsonResult updateDeciveByIp(Map<String, Object> map) {
		JsonResult jsonResult = new JsonResult();
		CDeviceExample example = new CDeviceExample();
		example.createCriteria().andIpEqualTo((String) map.get("reqAddr"));
		CDevice cDevice = new CDevice();
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		cDevice.setLastTime(dateTime);
		int flag = cDeviceMapper.updateByExampleSelective(cDevice, example);
		if (flag == 0) {
			jsonResult.setMessage("此设备未绑定");
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	/**
	 * 根据id修改状态
	 */
	@CacheClear
	public JsonResult updateCDevice(Map<String, Object> map) {
		JsonResult jsonResult = new JsonResult();
		String id = (String) map.get("id");
		String state = (String) map.get("state");
		CDevice cDevice = new CDevice();
		cDevice.setId(id);
		cDevice.setState(state);
		int flag = cDeviceMapper.updateByPrimaryKeySelective(cDevice);
		if (flag == 0) {
			jsonResult.setMessage("修改失败");
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	@Cache
	public JsonResult findDeviceByMap(Map<String, Object> map) {
		JsonResult jsonResult = new JsonResult();
		List<Map<String, Object>> list = cDeviceMapper.findDeviceByMap(map);
		if (!list.isEmpty()) {
			jsonResult.setMessage("设备重复绑定");
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}
}