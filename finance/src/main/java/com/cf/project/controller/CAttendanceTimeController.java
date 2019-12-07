package com.cf.project.controller;

import com.cf.project.mybatis.model.CAttendanceTime;
import com.cf.project.service.CAttendanceTimeService;
import com.cf.project.Constants;
import com.cf.project.controller.GridController;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/main/attendanceTime")
public class CAttendanceTimeController extends GridController {
    @Autowired
    private CAttendanceTimeService cAttendanceTimeService;

    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
    }

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(ModelMap model) {
    	//查询人员所在分公司
		Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
		try {
			List<Map<String,Object>> list = cAttendanceTimeService.findGsList(usermap.get("id").toString());
			model.addAttribute("parentId",list.get(0).get("parent_id"));
			model.addAttribute("parentName",list.get(0).get("name"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "main/commute/add";
    }

    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
    	Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
        try {
        	List<Map<String,Object>> list = cAttendanceTimeService.findGsList(usermap.get("id").toString());
//			model.addAttribute("parentId",list.get(0).get("parent_id"));
//			model.addAttribute("parentName",list.get(0).get("name"));
    }

    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody CAttendanceTime pojo) {
        JsonResult result = new JsonResult();
    }

    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
    public JsonResult del(String id) {
        JsonResult result = new JsonResult();
    }
}