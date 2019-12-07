package com.cf.project.controller;

import com.cf.project.mybatis.model.CDataDate;
import com.cf.project.service.CDataDateService;
import com.cf.project.Constants;
import com.cf.project.controller.GridController;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/main/DataDate")
public class CDataDateController extends GridController {
    @Autowired
    private CDataDateService cDataDateService;

    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;		try {			map.put("page",page);			List<Map<String,Object>> list = cDataDateService.findCDataDateList(map).getList();			result = new GridJsonResult(page);			result.setData(list);		} catch (Exception e) {			e.printStackTrace();		}		return result;
    }

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(ModelMap model) {
        return "main/dataDate/add";
    }

    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
        try {			CDataDate pojo = cDataDateService.findCDataDateListById(id);			model.addAttribute("pojo",pojo);		} catch (Exception e) {			e.printStackTrace();		}		return "main/DataDate/edit";
    }

    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody CDataDate pojo) {
        JsonResult result = new JsonResult();		try {			 result = cDataDateService.saveOrUpdate(pojo);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }

    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
    public JsonResult del(String id) {
        JsonResult result = new JsonResult();		try {			 result = cDataDateService.del(id);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }
}