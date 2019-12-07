package com.cf.project.controller;

import com.cf.project.mybatis.model.CVisitor;
import com.cf.project.service.CVisitorService;
import com.cf.project.Constants;
import com.cf.project.controller.GridController;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/main/visitor")
public class CVisitorController extends GridController {
    @Autowired
    private CVisitorService cVisitorService;

    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;		try {			map.put("page",page);
			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
			map.put("userid", usermap.get("id").toString());			List<Map<String,Object>> list = cVisitorService.findCVisitorList(map).getList();			result = new GridJsonResult(page);			result.setData(list);		} catch (Exception e) {			e.printStackTrace();		}		return result;
    }

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(ModelMap model) {
        return "main/visitor/add";
    }

    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
        try {			CVisitor pojo = cVisitorService.findCVisitorListById(id);			model.addAttribute("pojo",pojo);		} catch (Exception e) {			e.printStackTrace();		}		return "main/visitor/approval";
    }

    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody CVisitor pojo) {
        JsonResult result = new JsonResult();		try {			 result = cVisitorService.saveOrUpdate(pojo);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }

    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
    public JsonResult del(String id) {
        JsonResult result = new JsonResult();		try {			 result = cVisitorService.del(id);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }
    
    @RequestMapping(value= "/visitor",method = RequestMethod.GET)
    public String visitor(String id, ModelMap model) {
        try {
        	List<Map<String,Object>> list = cVisitorService.findVisitor(id);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/visitor/approval";
    }
    @RequestMapping(value= "/view",method = RequestMethod.GET)
    public String view(String id, ModelMap model) {
        try {
        	List<Map<String,Object>> list = cVisitorService.findVisitor(id);
			model.addAttribute("list",list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/visitor/view";
    }
    /**
     * 访客预约审批通过
     */
    @ResponseBody
    @RequestMapping(value= "/sptg",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult sptg(@RequestBody CVisitor pojo) {
        JsonResult result = new JsonResult();
		try {
			 result = cVisitorService.sptg(pojo);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
    /**
     * 访客预约审批不通过
     */
    @ResponseBody
    @RequestMapping(value= "/spbtg",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult spbtg(@RequestBody CVisitor pojo) {
        JsonResult result = new JsonResult();
		try {
			 result = cVisitorService.spbtg(pojo);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
    /**
     * 访客预约统计(年)
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/statisticsList")
    public GridJsonResult statisticsList(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			Date date = new Date();
	    	SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy");
	    	String sj=dateFormat.format(date);
	    	if(map.get("sj")==null) {
	    		map.put("sj",sj);
	    	}
			map.put("page",page);
			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
			map.put("userid", usermap.get("id").toString());
			List<Map<String,Object>> list = cVisitorService.findCVisitorStatisticsList(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
    /**
     * 访客预约统计(月)
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/statisticsList_yue")
    public GridJsonResult statisticsList_yue(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
			map.put("userid", usermap.get("id").toString());
			List<Map<String,Object>> list = cVisitorService.findCVisitorStatisticsList_yue(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
    /**
     * 访客预约统计(日)
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/statisticsList_ri")
    public GridJsonResult statisticsList_ri(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
			map.put("userid", usermap.get("id").toString());
			List<Map<String,Object>> list = cVisitorService.findCVisitorStatisticsList_ri(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
    /**
     * 访客预约统计(明细)
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/statisticsList_mixi")
    public GridJsonResult statisticsList_mixi(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
			map.put("userid", usermap.get("id").toString());
			List<Map<String,Object>> list = cVisitorService.findCVisitorStatisticsList_mixi(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
}