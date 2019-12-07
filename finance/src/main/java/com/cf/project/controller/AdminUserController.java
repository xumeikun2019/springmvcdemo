package com.cf.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cf.project.Constants;
import com.cf.project.mybatis.model.CUser;
import com.cf.project.service.CUserService;
import com.cf.project.service.SysDepartmentService;
import com.cf.project.service.SysDictionaryService;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;

/**
 * Created by towery on 2018/9/10.
 */

@Controller
@Scope("prototype")
@RequestMapping("/user")
public class AdminUserController extends BaseController{
	@Autowired
	private SysDictionaryService dictionaryService;
	@Autowired
    private SysDepartmentService sysDepartmentService;
	@Autowired
	private CUserService cUserService;
	
	/**
	 * 登录界面
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "/login";
	}
    
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
	@RequestMapping("/tree")
	public JsonResult listTree(@RequestParam Map<String, Object> map) {
		JsonResult result = null;
		try {
			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
//			String userId = (String)usermap.get("id");
			map.put("userId", "ddbcb068117611e994d400163e035f23");
			result = sysDepartmentService.findTreeList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
    
    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody CUser pojo) {
        JsonResult result = new JsonResult();
       
        if(StringUtils.isNotBlank(pojo.getDepartmentId())) {
        	try {
    			pojo.setState("W");
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
        }else {
        	result.setMessage("no");
        	return result;
        }
		
    }
    
}
