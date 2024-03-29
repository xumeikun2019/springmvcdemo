package com.cf.project.controller;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cf.project.Constants;
import com.cf.project.mybatis.model.CUser;
import com.cf.project.service.CDeviceService;
import com.cf.project.service.CUserService;
import com.cf.project.service.ExcelManager;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import com.cf.util.JsonUtil;

@Controller
@RequestMapping("/main/user")
public class CUserController extends GridController {
    @Autowired
    private CUserService cUserService;
    
    @Autowired
    private ExcelManager excelManager;
	@Autowired
    private CDeviceService cDeviceService;
    
    
    /**
     * 重置密码
     * @param map
     * @param page
     * @return
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping(value = "/resetpwd",method = RequestMethod.POST)
    public JsonResult repwd(String id,String username) {
    	JsonResult jsonResult = new JsonResult();
    	try {
			jsonResult = cUserService.updatePwd(id,username);
		} catch (Exception e) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
    	return jsonResult;
    }

    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;		try {
			map.put("page",page);			List<Map<String,Object>> list = cUserService.findCUserList(map).getList();			result = new GridJsonResult(page);			result.setData(list);		} catch (Exception e) {			e.printStackTrace();		}		return result;
    }
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/shlist")
    public GridJsonResult shlistJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cUserService.findCUserListsh(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(String departmentId,ModelMap model) {
    	model.addAttribute("departmentId", departmentId);
        return "main/user/add";
    }

    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
        try {			CUser pojo = cUserService.findCUserListById(id);
			//构造楼层数据,查询所有楼层
    		List<Map<String,Object>> floorList = cDeviceService.findCDeviceByFloor();
    		String floor = JsonUtil.writeList2JSON(floorList, false, true);
    		//存入域中
    		model.addAttribute("floor",floor);			model.addAttribute("pojo",pojo);		} catch (Exception e) {			e.printStackTrace();		}		return "main/user/edit";
    }
    
    @RequestMapping(value= "/edits",method = RequestMethod.GET)
    public String edits(String id, ModelMap model) {
        try {
			CUser pojo = cUserService.findCUserListById(id);
			model.addAttribute("pojo",pojo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/review/edit";
    }

    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody CUser pojo) {
    	System.out.println(pojo.getFeature());
        JsonResult result = new JsonResult();		try {			 result = cUserService.saveOrUpdate(pojo);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }
    
    @ResponseBody
    @RequestMapping(value= "/save1",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create1(@RequestBody CUser pojo) {
        JsonResult result = new JsonResult();
		try {
			pojo.setState("T");
			List<Map<String, Object>> roleids = new ArrayList<Map<String, Object>>();
			Map<String, Object> map = new  HashMap<String, Object>();
			map.put("id", "0f3f5d863a4111e997d900163e035f23");
			roleids.add(map);
			pojo.setRoleids(roleids);
			 result = cUserService.saveOrUpdate(pojo);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
    @ResponseBody
    @RequestMapping(value= "/save2",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create2(@RequestBody CUser pojo) {
        JsonResult result = new JsonResult();
		try {
			pojo.setState("100");
			 result = cUserService.saveOrUpdate(pojo);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }

    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
    public JsonResult del(String id) {
        JsonResult result = new JsonResult();		try {			 result = cUserService.del(id);		} catch (Exception e) {			result.setResult(Constants.OPERATION_FAIL);			e.printStackTrace();		}		return result;
    }
    
    @ResponseBody
    @RequestMapping(value = "/state",method = RequestMethod.POST)
    public JsonResult stateJson(String pid) {
		JsonResult jResult = new JsonResult();
		try {
			jResult = cUserService.updateState(pid);
		} catch (Exception e) {
			jResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jResult;
	}
    
    @RequestMapping(value= "/export",method = RequestMethod.POST)
    public void excelExport(HttpServletResponse response,@RequestParam Map<String, Object> map, EntyPage page) {
    	try {
    		map.put("page",page);
    		List<Map<String,Object>> list = cUserService.findCUserList(map).getList();
    		String[] titles = new String[]{"名称","状态"};
        	String[] cols = new String[]{"username","realname"};
    		String[] widths = new String[]{"200","200"};
    		InputStream is = excelManager.exportExcel(titles, cols, widths, list);
    		String fileName = (String)map.get("fileName");
    		excelManager.downloadExcel(response, is, fileName);
    	} catch (Exception e) {
			e.printStackTrace();
		}
    }
}