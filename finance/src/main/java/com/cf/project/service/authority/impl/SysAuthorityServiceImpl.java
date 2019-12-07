package com.cf.project.service.authority.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cf.project.Constants;
import com.cf.project.annotation.Cache;
import com.cf.project.annotation.CacheClear;
import com.cf.project.mybatis.dao.SysAuthorityMapper;
import com.cf.project.mybatis.model.SysAuthority;
import com.cf.project.service.authority.SysAuthorityService;
import com.cf.util.EntyPage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

@Service
public class SysAuthorityServiceImpl implements SysAuthorityService {
    @Autowired
    private SysAuthorityMapper sysAuthorityMapper;

    private static final Logger logger = LoggerFactory.getLogger(SysAuthorityServiceImpl.class);

    @Cache
    public JsonListResult findSysAuthorityList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = sysAuthorityMapper.findByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }

    @Cache
    public SysAuthority findSysAuthorityListById(String id) throws Exception {
        return this.sysAuthorityMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(SysAuthority pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
		if (pojo != null) {
			String id = pojo.getId();
			int result = 0;
			if (StringUtils.isNotBlank(id)) {
				result = sysAuthorityMapper.updateByPrimaryKeySelective(pojo);
			} else {
				result = sysAuthorityMapper.insertSelective(pojo);
			}
			if (result == 0) {
				jsonResult.setResult(Constants.OPERATION_FAIL);
			}
		}
		return jsonResult;
    }

    @CacheClear
    public JsonResult update(SysAuthority pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
		int result = sysAuthorityMapper.updateByPrimaryKeySelective(pojo);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();
		int result = 0;
		if (StringUtils.contains(id,",")) {
			String[] idsArr = id.split(",");
			if (idsArr.length > 0) {
				for (String idArr : idsArr) {
					result = sysAuthorityMapper.deleteByPrimaryKey(idArr);
					if (result == 0) {
						break;
					}
				}
			}
		}else {
			result = sysAuthorityMapper.deleteByPrimaryKey(id);
		}
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
    }

    @Cache
	public JsonResult findMenuTreeList(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> list = sysAuthorityMapper.findMenuTreeList(map);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setData(list);
		return jsonResult;
	}

    @Cache
	public JsonResult findMenuByid(String id) throws Exception {
		SysAuthority sysAuthorityKey = sysAuthorityMapper.selectByPrimaryKey(id);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setData(sysAuthorityKey);
		return jsonResult;
	}
	
    @Cache
	public JsonResult findMenuTreeByRoleList(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> menuList = sysAuthorityMapper.findMenuTreeByRoleList(map);
		List<Map<String,Object>> menuLists = new ArrayList<Map<String,Object>>();
		if(!menuList.isEmpty()) {
			for(Map<String,Object> menu : menuList) {
				Map<String,Object> menus = new HashMap<String, Object>();
				int menuLevel = (Integer)menu.get("mlevel");
				if (menuLevel == 2) { // 一级菜单
					String id = (String)menu.get("id");
					List<Map<String,Object>> smenuList = getChild(id, menuList);
					String title = (String)menu.get("title");
					String icon = (String)menu.get("icon");
					String href = (String)menu.get("href");
					menus.put("title", title);
					menus.put("icon", icon);
					menus.put("href", href);
					menus.put("spread", false);
					if (smenuList != null && !smenuList.isEmpty()) {
						menus.put("children", smenuList);
						
					}
					menuLists.add(menus);
				}
				
			}
		}
		JsonResult jsonResult = new JsonResult();
		jsonResult.setData(menuLists);
		return jsonResult;
	}
	
    @Cache
	public JsonResult findMenuTreeRoleList(Map<String, Object> map) throws Exception {
		Map<String,Object> menuMap = new HashMap<String,Object>();
		List<Map<String,Object>> menuList = sysAuthorityMapper.findMenuTreeRoleList(map);
		List<Map<String,Object>> menuLists = new ArrayList<Map<String,Object>>();
		if(!menuList.isEmpty()) {
			for(Map<String,Object> menu : menuList) {
				Map<String,Object> menus = new HashMap<String, Object>();
				int menuLevel = (Integer)menu.get("mlevel");
				if (menuLevel == 2) { // 一级菜单
					String id = (String)menu.get("id");
					List<Map<String,Object>> smenuList = getChild(id, menuList);
					String label = (String)menu.get("label");
					menus.put("id", id);
					menus.put("label", label);
					if (smenuList != null && !smenuList.isEmpty()) {
						menus.put("children", smenuList);
					}
					menuLists.add(menus);
				}

				
			}
		}
		menuMap.put("code", 0);
		menuMap.put("data", menuLists);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setData(menuMap);
		return jsonResult;
	}
	
	public JsonResult findMenuByRole(Map<String, Object> map) throws Exception {
		Map<String,Object> menuMap = new HashMap<String,Object>();
		List<String> menuList = sysAuthorityMapper.findMenuByRole(map);
		for (int i = 0; i < menuList.size(); i++) {
			String id = menuList.get(i);
			int findByParentId = sysAuthorityMapper.findByParentId(id);
			if(findByParentId>0) {
				menuList.remove(i);
			}
			
		}
		menuMap.put("data", menuList);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setData(menuMap);
		return jsonResult;
	}

    /**
     * 获取子菜单
     * @param id
     * @param rootMenu
     * @return
     */
	private List<Map<String,Object>> getChild(String id, List<Map<String,Object>> rootMenu) {
		// 子菜单
		List<Map<String,Object>> childList = new ArrayList<Map<String,Object>>();
		for (Map<String,Object> menu : rootMenu) {
			// 遍历所有节点，将父菜单id与传过来的id比较
			String pid = (String)menu.get("pid");
			if (StringUtils.isNotBlank(pid)) {
				if (StringUtils.equals(id, pid)) {
					childList.add(menu);
				}
			}
		}
		// 把子菜单的子菜单再循环一遍
		for (Map<String,Object> menu : childList) {// 没有url子菜单还有子菜单
				// 递归
			String tid = (String)menu.get("id");
			if (childList != null && !childList.isEmpty()) {
				menu.put("children",getChild(tid, rootMenu));
			}
		} 
		
		// 递归退出条件
		if (childList.size() == 0) {
			return childList;
		}
		return childList;
	}
}