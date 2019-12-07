package com.cf.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cf.project.Constants;
import com.cf.project.mybatis.dao.CRoomDeptMapper;
import com.cf.project.mybatis.model.CMeetingOrder;
import com.cf.project.mybatis.model.CPlace;
import com.cf.project.service.CPlaceService;
import com.cf.util.DateTimeUtil;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;
import com.hikvision.artemis.sdk.ArtemisHttpUtil;
import com.hikvision.artemis.sdk.config.ArtemisConfig;

@Controller
@RequestMapping("/main/place")
public class CPlaceController extends GridController {
	@Autowired
	private CPlaceService cPlaceService;
	@Autowired
	private CRoomDeptMapper cRoomDeptMapper;

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/list")
	public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
		GridJsonResult result = null;
		try {
			map.put("page", page);
			List<Map<String, Object>> list = cPlaceService.findCPlaceList(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@ResponseBody
	@RequestMapping("/tree")
	public JsonResult listTree(@RequestParam Map<String, Object> map) {
		JsonResult result = null;
		try {
			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
			String userId = (String) usermap.get("id");
			map.put("userId", userId);
			result = cPlaceService.findTreeList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/eshow", method = RequestMethod.POST)
	public JsonResult editShow(String id) {
		JsonResult result = new JsonResult();
		try {
			CPlace pojo = cPlaceService.findSysDepartmentListById(id);
			List<String> nameList = cRoomDeptMapper.findSysDepartmentNameListByid(id);
			String nameString = nameList.toString();
			String subNameString = nameString.substring(1, nameString.length() - 1);
			pojo.setOrderDeptId(subNameString);
			result.setData(pojo);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/state/list", method = RequestMethod.GET)
	public JsonResult list(@RequestParam Map<String, Object> map) {
		JsonResult result = new JsonResult();
		try {
			map.put("parentId", "1");
			map.put("type", "pad");
			result = cPlaceService.findCPlaceCDeviceListByParentId(map);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/attendance/list", method = RequestMethod.GET)
	public JsonResult attendance(@RequestParam Map<String, Object> map) {
		JsonResult result = new JsonResult();
		try {
			map.put("type", "attendance");
			result = cPlaceService.findCPlaceCDeviceListByTypeParentId(map);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/adv/list", method = RequestMethod.GET)
	public JsonResult adv(@RequestParam Map<String, Object> map) {
		JsonResult result = new JsonResult();
		try {
			map.put("type", "adv");
			result = cPlaceService.findCPlaceCDeviceListByTypeParentId(map);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}
	
	//查询摄像头
	@ResponseBody
	@RequestMapping(value = "/camera/list", method = RequestMethod.GET)
	public JsonResult camera(@RequestParam Map<String, Object> map) {
		JsonResult result = new JsonResult();
		try {
			map.put("type", "monitor");
			result = cPlaceService.findCPlaceCDeviceListByTypeParentId(map);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}
	
	 @RequestMapping(value= "/view",method = RequestMethod.GET)
	    public String view(String id, ModelMap model) {
	        try {
	        	System.out.println("id==="+id);
	        	 model.addAttribute("id",id);
			} catch (Exception e) {
				e.printStackTrace();
			}
	        return "main/camera/view";
	    }

	@ResponseBody
	@RequestMapping(value = "/room/list", method = RequestMethod.GET)
	public JsonResult roomState(@RequestParam Map<String, Object> map) {
		JsonResult result = new JsonResult();
		try {
			String meetingTime = (String)map.get("meetingTime");
			if (StringUtils.isBlank(meetingTime)) {
				String date = DateTimeUtil.getCurrDateStr();
				map.put("meetingTime", date);
			}
			
			result = cPlaceService.findCPlaceCroomDeptCMeetingOrderListByDeptId(map);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public String add(ModelMap model) {
		return "main/place/add";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(String id, ModelMap model) {
		try {
			CPlace pojo = cPlaceService.findCPlaceListById(id);
			model.addAttribute("pojo", pojo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/place/edit";
	}

	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST, consumes = "application/json")
	public JsonResult create(@RequestBody CPlace pojo) {
		JsonResult result = new JsonResult();
		try {
			result = cPlaceService.saveOrUpdate(pojo);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/del", method = RequestMethod.POST)
	public JsonResult del(String id) {
		JsonResult result = new JsonResult();
		try {
			result = cPlaceService.del(id);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
	}
		
	/**
	 *  查询楼层
	 * @param map
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/floor", method = RequestMethod.POST)
	public JsonResult findCplanceByParentIdORlevel(@RequestParam Map<String,Object> map) {
		JsonResult jsonResult = new JsonResult();
		try {
			jsonResult = cPlaceService.findCplaceByParentIdORlevel(map);
		} catch (Exception e) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	/**
     * 查询人员所在楼层(id)
     */
    @ResponseBody
    @RequestMapping(value= "/findlc",method = RequestMethod.GET)
    public JsonResult findlc(String id) {
    	System.out.println("id==="+id);
    	JsonResult result = new JsonResult();
		try {
			List<Map<String,Object>> list = cPlaceService.findlc(id);
			result.setData(list);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
    
    @ResponseBody
    @RequestMapping(value= "/findmt",method = RequestMethod.GET)
    public JsonResult findFloorMeet(@RequestParam Map<String, Object> map) {
    	JsonResult result = new JsonResult();
    	try {
    		result = cPlaceService.findFloorMeet();
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
    	return result;
    }
    
    /**
     * 通过摄像头序号返回一个视频地址
     * @param cameraIndexCode
     * onlyZb="true" 仅直播，去掉回放选项
     * @return
     */
    @RequestMapping(value = "/jk/sxtURL",method=RequestMethod.GET)
    public String sxtURL(String cameraIndexCode,String onlyZb,ModelMap model) {
    	try {
			if("true".equals(onlyZb))model.addAttribute("onlyZb", "true");
//        	Map<String, String>info=(Map<String, String>)getApplication().getAttribute("_info");
			List<Map<String,Object>> info = cPlaceService.findjk();
			String jkServer="";
			String jkAPPKEY="";
			String jkSECRET="";
			String jkSxtURL="";
			String jkXy="";
			for(int i=0;i<info.size();i++) {
				if("jkServer".equals(info.get(i).get("name"))) {
					jkServer=info.get(i).get("val").toString();
					jkServer="218.56.106.12:88";
				}else if("jkAPPKEY".equals(info.get(i).get("name"))){
					jkAPPKEY=info.get(i).get("val").toString();
					jkAPPKEY="26981946";
				}else if("jkSECRET".equals(info.get(i).get("name"))){
					jkSECRET=info.get(i).get("val").toString();
					jkSECRET="dohSNcyqTF7nWM9fnNmi";
				}else if("jkSxtURL".equals(info.get(i).get("name"))){
					jkSxtURL=info.get(i).get("val").toString();
					jkSxtURL="/artemis/api/video/v1/cameras/previewURLs";
				}else if("jkXy".equals(info.get(i).get("name"))){
					jkXy=info.get(i).get("val").toString();
					jkXy="http://";
				}
			}
            ArtemisConfig.host = jkServer; // artemis网关服务器ip端口
            ArtemisConfig.appKey = jkAPPKEY;  // 秘钥appkey
            ArtemisConfig.appSecret = jkSECRET;// 秘钥appSecret        /**
            final String previewURLsApi = jkSxtURL;
            final String jkXys = jkXy;
            Map<String, String> path = new HashMap<String, String>(2) {
                {
                    put(jkXys, previewURLsApi);//根据现场环境部署确认是http还是https
                }
            };
            JSONObject jsonBody = new JSONObject();
            jsonBody.put("cameraIndexCode", cameraIndexCode);
            jsonBody.put("streamType", 0);
            jsonBody.put("protocol", "hls");//hls
            jsonBody.put("transmode", 1);
            jsonBody.put("expand", "transcode=1&videotype=h264");
            String body = jsonBody.toJSONString();
            /*{"code":"0","msg":"success","data":{"url":"http://10.28.126.15:83/openUrl/4hcp8cw/live.m3u8"}}*/
            System.out.println("path=="+path);
            System.out.println("body=="+body);
            String result = ArtemisHttpUtil.doPostStringArtemis(path, body, null, null, "application/json" , null);// post请求application/json类型参数
            System.out.println("result=="+result);
//            String result="{\"code\":\"0\",\"msg\":\"success\",\"data\":{\"url\":\"http://218.56.106.12:88/openUrl/xO4RfvG/live.m3u8\"}}";
    	    Map<String, Object>rs=(Map<String, Object>)JSON.parse(result);
    	    model.addAttribute("code",rs.get("code") );
    	    model.addAttribute("msg",rs.get("msg") );
    	    if("0".equals(rs.get("code").toString())) {
    	    	 Map<String, Object>sxtdata=(Map<String, Object>)rs.get("data");
    	    	 model.addAttribute("url",sxtdata.get("url"));
    	    	 model.addAttribute("cameraIndexCode",cameraIndexCode);
    	    	 model.addAttribute("jiankong_cameraIndexCode", cameraIndexCode);
    	    }
		} catch (Exception e) {
			e.printStackTrace();
			if("true".equals(onlyZb))model.addAttribute("onlyZb", "true");
		}
    	//System.out.println(("true".equals(onlyZb))+"------------"+onlyZb);
	    return "main/camera/hkws";
    }
	    
}