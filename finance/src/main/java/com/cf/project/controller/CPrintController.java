package com.cf.project.controller;

import com.cf.project.mybatis.model.CPrint;
import com.cf.project.service.CPrintService;
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
@RequestMapping("/main/print")
public class CPrintController extends GridController {
    @Autowired
    private CPrintService cPrintService;

    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;		try {			map.put("page",page);			List<Map<String,Object>> list = cPrintService.findCPrintList(map).getList();			result = new GridJsonResult(page);			result.setData(list);		} catch (Exception e) {			e.printStackTrace();		}		return result;
    }
    //日打印统计(部门)
    @ResponseBody
    @RequestMapping("/list_day")
    public GridJsonResult listJson_day(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cPrintService.findCPrintList_day(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
  //日打印统计(人员)
    @ResponseBody
    @RequestMapping("/list_days")
    public GridJsonResult listJson_days(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cPrintService.findCPrintList_days(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
  //日打印统计(打印机)
    @ResponseBody
    @RequestMapping("/list_day_dyj")
    public GridJsonResult listJson_day_dyj(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cPrintService.findCPrintList_day_dyj(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
  //月打印统计(部门)
    @ResponseBody
    @RequestMapping("/list_month")
    public GridJsonResult listJson_month(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cPrintService.findCPrintList_month(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
    //月打印统计(打印机)
    @ResponseBody
    @RequestMapping("/list_month_dyj")
    public GridJsonResult listJson_month_dyj(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cPrintService.findCPrintList_month_dyj(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
  //月打印统计(人员)
    @ResponseBody
    @RequestMapping("/list_months")
    public GridJsonResult listJson_months(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cPrintService.findCPrintList_months(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
  //年打印统计(部门)
    @ResponseBody
    @RequestMapping("/list_yer")
    public GridJsonResult listJson_yer(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cPrintService.findCPrintList_yer(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
  //年打印统计(打印机)
    @ResponseBody
    @RequestMapping("/list_yer_dyj")
    public GridJsonResult listJson_yer_dyj(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cPrintService.findCPrintList_yer_dyj(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
  //年打印统计(人员)
    @ResponseBody
    @RequestMapping("/list_yers")
    public GridJsonResult listJson_yers(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cPrintService.findCPrintList_yers(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(ModelMap model) {
        return "main/print/add";
    }

    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
        try {			CPrint pojo = cPrintService.findCPrintListById(id);			model.addAttribute("pojo",pojo);		} catch (Exception e) {			e.printStackTrace();		}		return "main/print/edit";
    }

    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody CPrint pojo) {
        JsonResult result = new JsonResult();		try {			 result = cPrintService.saveOrUpdate(pojo);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }

    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
    public JsonResult del(String id) {
        JsonResult result = new JsonResult();		try {			 result = cPrintService.del(id);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }
}