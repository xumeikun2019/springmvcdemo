package com.cf.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cf.project.service.SysDictionaryService;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;

@Controller
@RequestMapping("/main/dictiomary")
public class SysDictionaryController {
	
	@Autowired
	private SysDictionaryService dictionaryService;
	
	@ResponseBody
	@RequestMapping("/findDictiomaryByParent")
	public JsonResult findDictiomaryByParent(String id){
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		JsonResult result = new JsonResult();
		try {
			list = dictionaryService.findDictiomaryByParent(id);
			result.setData(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/ztree/dic")
	public JsonResult listzTree(@RequestParam Map<String, Object> map) {
		JsonResult result = null;
		try {
//			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
//			map.put("userid", usermap.get("id").toString());
			result = dictionaryService.findSysDictionaryForZtree(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
