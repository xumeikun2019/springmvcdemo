package com.cf.project.controller.jihua;

import com.cf.project.service.CDeviceService;
import com.cf.project.service.jihua.CJihuaService;
import com.cf.project.Constants;
import com.cf.project.controller.GridController;
import com.cf.project.mybatis.model.CDevice;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import com.cf.util.push.PushUtil;
import com.cf.util.push.Test;

import net.sf.json.JSONObject;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/jihua")
public class CJihuaController extends GridController {
    @Autowired
    private CJihuaService cJihuaService; 
    @Autowired
    private CDeviceService cDeviceService;
    
	
	@SuppressWarnings("unchecked")
	@ResponseBody

	@RequestMapping("/list")
	public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
		GridJsonResult result = null;
		try {
			map.put("page", page);
			List<Map<String, Object>> list = cJihuaService.findCJihuaList(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	@ResponseBody
	
	@RequestMapping("/shjlList")
	public GridJsonResult shjlList(@RequestParam Map<String, Object> map, EntyPage page) {
		GridJsonResult result = null;
		try {
			map.put("page", page);
			List<Map<String, Object>> list = cJihuaService.findSHJHList(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@ResponseBody
    @RequestMapping("/editJH")
    public JsonResult editJH(@RequestParam Map<String, Object> map) {
    	JsonResult result = null;
    	try {
    		result = cJihuaService.editJH(map);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return result;
    }
	@ResponseBody
    @RequestMapping("/deleteJH")
    public JsonResult deleteJH(String id) {
    	System.out.println("id:"+id);
		JsonResult jResult = new JsonResult();
		try {
			jResult = cJihuaService.deleteJH(id);
		} catch (Exception e) {
			jResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jResult;
	}
	@ResponseBody
	@RequestMapping("/shenhe")
	public JsonResult shenhe(@RequestParam Map<String, Object> map) {
		JsonResult result = null;
		try {
			result = cJihuaService.shenheJH(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@ResponseBody
	@RequestMapping("/connect")
	public JsonResult connect(@RequestParam Map<String, Object> map) {
		JsonResult result = null;
		try {
			result = cJihuaService.connect(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@ResponseBody
	@RequestMapping("/subJH")
	public JsonResult subJH(@RequestParam Map<String, Object> map) {
		JsonResult result = null;
		try {
			result = cJihuaService.subJH(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@ResponseBody
	@RequestMapping("/fabu")
	public  JsonResult fabu(@RequestParam Map<String, Object> map) {
		JsonResult result = null;
		try {
			String f = "";
			String ret = "SUCCESS";
			String deviceIds = map.get("deviceIds").toString();
			String[] dIds = deviceIds.split(",");
			for (int i = 0; i < dIds.length; i++) {
				CDevice d = cDeviceService.findCDeviceListById(dIds[i]);
				f = PushUtil.sendAndroidUnicasts("5dc3b71b3fc19511fd000609","z7szjlzbomj4jj7rxhue1bxy2lvi3uyw",d.getDeviceToken(),"/finance/word/20191109/20191109111616_866.html","word");
				JSONObject jsonObject = JSONObject.fromObject(f);
				 ret = (String)jsonObject.get("ret");
			}
			if(ret.equals("SUCCESS")) {
				result = cJihuaService.fabuJH(map);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	 //跳转预览页面
    @RequestMapping("/device_list")
    public Object device_list(HttpServletRequest request, HttpSession session){
    	Map<String, Object> map = new HashMap<String, Object>();
        ModelAndView mv = new ModelAndView();
        String deviceIds = request.getParameter("deviceIds");
        String dates = request.getParameter("dates");
        String times = request.getParameter("times");

       // List<Map<String,Object>> list = cDeviceService.allList(map);
        mv.addObject("deviceIds", deviceIds);
        mv.addObject("dates", dates);
        mv.addObject("times", times);
        System.out.println(dates);
        System.out.println(times);
        //mv.addObject("list", list);
        mv.setViewName("main/jihua/connectDevice");
        return mv;
    }
    //跳转预览页面
    @RequestMapping("/editJM")
    public Object editJM(HttpServletRequest request, HttpSession session){
    	Map<String, Object> map = new HashMap<String, Object>();
    	ModelAndView mv = new ModelAndView();
    	String jhId = request.getParameter("jhId");
    	
    	// List<Map<String,Object>> list = cDeviceService.allList(map);
    	mv.addObject("jhId", jhId);
    	mv.setViewName("main/jiemu/index2");
    	return mv;
    }
    @ResponseBody
    @RequestMapping("/deviceList")
    public List<Map<String,Object>> deviceList(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
        List<Map<String,Object>> list = null;
		try {
			list = cDeviceService.allList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
    }
    
    
}