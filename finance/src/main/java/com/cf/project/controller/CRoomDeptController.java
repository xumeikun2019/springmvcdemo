package com.cf.project.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cf.project.Constants;
import com.cf.project.mybatis.model.CRoomDept;
import com.cf.project.service.CRoomDeptService;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;

@Controller
@RequestMapping("/main/roomDept")
public class CRoomDeptController extends GridController {
    @Autowired
    private CRoomDeptService cRoomDeptService;

    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;		try {			map.put("page",page);			List<Map<String,Object>> list = cRoomDeptService.findCRoomDeptList(map).getList();			result = new GridJsonResult(page);			result.setData(list);		} catch (Exception e) {			e.printStackTrace();		}		return result;
    }

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(ModelMap model) {
        return "main/roomDept/add";
    }

    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
        try {			CRoomDept pojo = cRoomDeptService.findCRoomDeptListById(id);			model.addAttribute("pojo",pojo);		} catch (Exception e) {			e.printStackTrace();		}		return "main/roomDept/edit";
    }

    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody CRoomDept pojo) {
        JsonResult result = new JsonResult();		try {			 result = cRoomDeptService.saveOrUpdate(pojo);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }

    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
    public JsonResult del(String id) {
        JsonResult result = new JsonResult();		try {			 result = cRoomDeptService.del(id);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }
}