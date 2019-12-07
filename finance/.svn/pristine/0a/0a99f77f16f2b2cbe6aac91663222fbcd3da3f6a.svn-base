package com.cf.project.controller;

import com.cf.project.mybatis.model.SysInfo;
import com.cf.project.service.SysInfoService;
import com.cf.project.Constants;
import com.cf.project.controller.GridController;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import com.cf.util.JsonListResult;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/main/info")
public class SysInfoController extends GridController {
    @Autowired
    private SysInfoService sysInfoService;

    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;		try {			map.put("page",page);			List<Map<String,Object>> list = sysInfoService.findSysInfoList(map).getList();			result = new GridJsonResult(page);			result.setData(list);		} catch (Exception e) {			e.printStackTrace();		}		return result;
    }

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(ModelMap model) {
        return "main/info/add";
    }

    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
        try {			SysInfo pojo = sysInfoService.findSysInfoListById(id);			model.addAttribute("pojo",pojo);		} catch (Exception e) {			e.printStackTrace();		}		return "main/info/edit";
    }

    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody SysInfo pojo) {
        JsonResult result = new JsonResult();		try {			 result = sysInfoService.saveOrUpdate(pojo);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }

    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
    public JsonResult del(String id) {
        JsonResult result = new JsonResult();		try {			 result = sysInfoService.del(id);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }
    /**
     * 查询考勤设备IP
     */
    public List<Map<String,Object>> findip() {
		List<Map<String,Object>> list=sysInfoService.findip();
		System.out.println(list);
		return list;
	}
}