package com.cf.project.controller.authority;

import java.util.List;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cf.project.Constants;
import com.cf.project.annotation.CacheClear;
import com.cf.project.controller.GridController;
import com.cf.project.mybatis.model.SysRole;
import com.cf.project.service.authority.SysRoleService;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;

@Controller
@RequestMapping("/main/role")
public class SysRoleController extends GridController {
    @Autowired
    private SysRoleService sysRoleService;

    private static final Logger logger = LoggerFactory.getLogger(SysRoleController.class);

    @ResponseBody
    @RequestMapping(value= "/list",method = RequestMethod.POST)
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			Subject subject = SecurityUtils.getSubject();
			boolean ro = subject.hasRole("admin");
			System.err.println(ro);
            
			Map<String,Object> userMap = (Map<String,Object>)SessionUtil.getSessionAttr("user");
			System.err.println(userMap.get("dept"));
			
			map.put("page",page);
			List<Map<String,Object>> list = sysRoleService.findSysRoleList(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(ModelMap model) {
        return "main/authority/add";
    }


    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
        try {
			SysRole pojo = sysRoleService.findSysRoleListById(id);
			model.addAttribute("pojo",pojo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/authority/edit";
    }

	@CacheClear
    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody SysRole pojo) {
        JsonResult result = new JsonResult();
		try {
			 result = sysRoleService.saveOrUpdate(pojo);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }

	@CacheClear
    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
		public JsonResult del(String id) {
        JsonResult result = new JsonResult();
		try {
			 result = sysRoleService.del(id);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }

	@ResponseBody
    @RequestMapping("/cache")
    public JsonResult test(@RequestParam Map<String, Object> map,EntyPage page){
		JsonResult result = new JsonResult();
		try {
			//Map<String,Object> map = new HashMap<String,Object>();
			map.put("page",page);
			List<Map<String,Object>> list = sysRoleService.findSysRoleCacheList(map).getList();
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping(value = "/show",consumes = "application/json")
    public JsonResult listClass(@RequestParam Map<String, Object> map) {
		JsonResult result = new JsonResult();
		try {
			List<Map<String, Object>> list = sysRoleService.findSysRoleName(map).getList();
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}