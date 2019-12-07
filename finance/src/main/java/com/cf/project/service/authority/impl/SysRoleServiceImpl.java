package com.cf.project.service.authority.impl;

import java.util.Date;
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
import com.cf.project.mybatis.dao.CRoleFloorMapper;
import com.cf.project.mybatis.dao.SysRoleAuthorityMapper;
import com.cf.project.mybatis.dao.SysRoleMapper;
import com.cf.project.mybatis.model.CRoleFloor;
import com.cf.project.mybatis.model.CRoleFloorExample;
import com.cf.project.mybatis.model.SysRole;
import com.cf.project.mybatis.model.SysRoleAuthority;
import com.cf.project.service.authority.SysRoleService;
import com.cf.util.DateTimeUtil;
import com.cf.util.EntyPage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

@Service
public class SysRoleServiceImpl implements SysRoleService {
    @Autowired
    private SysRoleMapper sysRoleMapper;
    
    @Autowired
    private SysRoleAuthorityMapper sysRoleAuthorityMapper;
    
    @Autowired
    private CRoleFloorMapper cRoleFloorMapper;
    

    private static final Logger logger = LoggerFactory.getLogger(SysRoleServiceImpl.class);

    @Cache
    public JsonListResult findSysRoleList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = sysRoleMapper.findByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }

	@Cache
    public SysRole findSysRoleListById(String id) throws Exception {
		Map<String,Object> paramMap = new HashMap<String,Object>();
		paramMap.put("roleId", id);
		List<Map<String,Object>> floorList = cRoleFloorMapper.findFloorByRoleList(paramMap);
		SysRole sysRole =  this.sysRoleMapper.selectByPrimaryKey(id);
		if (sysRole != null) {
			sysRole.setFloorIds(floorList);
			StringBuilder builder = new StringBuilder();
			for(Map<String,Object> floorMap : floorList) {
				String floorId = (String)floorMap.get("id");
				builder.append(floorId).append(",");
			}
			sysRole.setFloorIdsStr(builder.toString());
			
		}
        return sysRole;
    }

	@CacheClear
    public JsonResult saveOrUpdate(SysRole pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
		if (pojo != null) {
			String id = pojo.getId();
			List<Map<String, Object>> authoritys = pojo.getAuthoritys();
			int result = 0;
			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
			String createTime = DateTimeUtil.getFormatDateTime(dateTime,"yyyy-MM-dd HH:mm:ss");
			pojo.setCreateTime(createTime);
			if (StringUtils.isNotBlank(id)) {
				result = sysRoleMapper.updateByPrimaryKeySelective(pojo);
				sysRoleAuthorityMapper.deleteByRoleKey(id);
				for (Map<String, Object> map : authoritys) {
					if(!"1".equals(map.get("id").toString())) {
						SysRoleAuthority sysRoleAuth = new SysRoleAuthority();
						sysRoleAuth.setMenuCode(map.get("id").toString());
						sysRoleAuth.setRoleKey(id);
						sysRoleAuthorityMapper.insertSelective(sysRoleAuth);
					}
					
				}
				
			} else {
				result = sysRoleMapper.insertSelective(pojo);
				id = pojo.getId();
				for (Map<String, Object> map : authoritys) {
					if(!"1".equals(map.get("id").toString())) {
					SysRoleAuthority sysRoleAuth = new SysRoleAuthority();
					sysRoleAuth.setMenuCode(map.get("id").toString());
					sysRoleAuth.setRoleKey(id);
					sysRoleAuthorityMapper.insertSelective(sysRoleAuth);
					}
				}
			}
			
			CRoleFloorExample example = new CRoleFloorExample();
			example.createCriteria().andRoleIdEqualTo(id);
			cRoleFloorMapper.deleteByExample(example);
			// 获取角色对应管理楼层
			List<Map<String,Object>> floorList = pojo.getFloorIds();
			for (Map<String, Object> floorMap : floorList) {
				CRoleFloor roleFloor = new CRoleFloor();
				roleFloor.setRoleId(id);
				roleFloor.setPlaceId(floorMap.get("id").toString());
				cRoleFloorMapper.insertSelective(roleFloor);
			}
			
			if (result == 0) {
				jsonResult.setResult(Constants.OPERATION_FAIL);
			}
		}
		return jsonResult;
    }
	@CacheClear
    public JsonResult update(SysRole pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
		int result = sysRoleMapper.updateByPrimaryKeySelective(pojo);
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
					result = sysRoleMapper.deleteByPrimaryKey(idArr);
					sysRoleAuthorityMapper.deleteByRoleKey(idArr);
					if (result == 0) {
						break;
					}
				}
			}
		} else {
			result = sysRoleMapper.deleteByPrimaryKey(id);
			sysRoleAuthorityMapper.deleteByRoleKey(id);
		}
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
    }

	public JsonListResult findSysRoleCacheList(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> list = sysRoleMapper.findByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
	}
	
    public JsonListResult findSysRoleName(Map<String, Object> map) throws Exception {
    	List<Map<String, Object>> list = sysRoleMapper.findRoleName(map);
    	JsonListResult jResult = new JsonListResult(list);
    	return jResult;
    }
}