package com.cf.project.controller.authority;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import com.cf.project.controller.GridController;
import com.cf.project.mybatis.model.SysAuthority;
import com.cf.project.service.authority.SysAuthorityService;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;

@Controller
@RequestMapping("/main/menu")
public class SysAuthorityController extends GridController {
    @Autowired
    private SysAuthorityService sysAuthorityService;

    private static final Logger logger = LoggerFactory.getLogger(SysAuthorityController.class);

    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = sysAuthorityService.findSysAuthorityList(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }

	@ResponseBody
	@RequestMapping("/menu")
	public JsonResult listMenuTree(@RequestParam Map<String, Object> map) {
		JsonResult result = null;
		try {
			result = sysAuthorityService.findMenuTreeList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(ModelMap model) {
        return "main/authority/menu_add";
    }

    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
        try {
			SysAuthority pojo = sysAuthorityService.findSysAuthorityListById(id);
			model.addAttribute("pojo",pojo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/authority/menu_edit";
    }

    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody SysAuthority pojo) {
        JsonResult result = new JsonResult();
		try {
			 result = sysAuthorityService.saveOrUpdate(pojo);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }

    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
    public JsonResult del(String id) {
        JsonResult result = new JsonResult();
		try {
			 result = sysAuthorityService.del(id);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
    
    @ResponseBody
    @RequestMapping(value= "/eshow",method = RequestMethod.POST)
    public JsonResult editShow(String id) {
        JsonResult result = new JsonResult();
		try {
			 result = sysAuthorityService.findMenuByid(id);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
    
    @SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/mtree")
	public List<Map<String,Object>> menuTree(@RequestParam Map<String, Object> map) {
		List<Map<String,Object>> result = null;
		try {
			Map<String,Object> userMap = (Map<String,Object>)SessionUtil.getSessionAttr("user");
			Set<String> roles = (Set<String>)userMap.get("roles");
			List<String> list = new ArrayList<String>(roles);
			map.put("roleKeys", list);
			result = (List<Map<String,Object>>)sysAuthorityService.findMenuTreeByRoleList(map).getData();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/rtree")
	public Map<String,Object> roleMenuTree(@RequestParam Map<String, Object> map) {
		Map<String,Object> result = null;
		try {
			result = (Map<String,Object>)sysAuthorityService.findMenuTreeRoleList(map).getData();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping("/stree")
	public Map<String,Object> roleMenuCheckTree(@RequestParam Map<String, Object> map) {
		Map<String,Object> result = null;
		try {
			 result = (Map<String, Object>) sysAuthorityService.findMenuByRole(map).getData();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}