package com.cf.project.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.cf.project.Constants;
import com.cf.project.mybatis.dao.CUserMapper;
import com.cf.project.mybatis.dao.SysUserRoleMapper;
import com.cf.project.mybatis.dao.WxRequestMapper;
import com.cf.project.security.UserRealm;
import com.cf.project.service.WxRequestService;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import com.cf.util.MD5;

@Service
public class WxRequestServiceImpl implements WxRequestService {

	@Autowired
	UserRealm userRealm;

	@Autowired
	CUserMapper cUserMapper;
	
	@Autowired
	SysUserRoleMapper sysUserRoleMapper ;

	@Autowired
	WxRequestMapper wxRequestMapper;

	@Override
	public String sign(String user, String pwd, String openid) throws Exception {

		Map<String, Object> userMap = cUserMapper.findUserByName(user);
		Boolean sgin = false;
		String role = "";
		String password = MD5.MD5(pwd + user);
		password = userRealm.md5(password, user);
		int result = 0;

		if (userMap == null) {
			// 用户名不存在抛出异常
			throw new UnknownAccountException();
		}
		String userPassWord = (String) userMap.get("password");
		if (!password.equals(userPassWord)) {
			throw new IncorrectCredentialsException();
		} else {

			result = cUserMapper.saveOpenid(openid, user);
			
		}
		if (result > 0) {
			sgin = true;
			role = sysUserRoleMapper.findByUserId(userMap.get("id").toString());
		}
		return role;
	}

	@Override
	public JsonResult findVisitByName(String user) {
		JsonResult jsonResult = new JsonResult();
		List<Map<String, Object>> list = wxRequestMapper.findVisitByName(user);
		//遍历主表 插入明细
		list.forEach(item -> {
			//访客表id
			String vid = (String) item.get("id");
			List<Map<String, Object>> listVisitor = wxRequestMapper.findVisitUserByName(vid);
			item.put("visitors", listVisitor);
		});

		jsonResult.setData(list);
		return jsonResult;
	}

	@Override
	public JsonResult updateVisitorStateById(String id, String state) {
		JsonResult jsonResult = new JsonResult();
		int result = wxRequestMapper.updateVisitorStateById(id, state); 
		if (result < 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	@Override
	public JsonListResult findCheckRecordByUidAndDate(String uid, String date) throws Exception {
		// TODO Auto-generated method stub
		JsonListResult jsonListResult = new JsonListResult();
		 date = date + "%";
		List<Map<String, Object>> list = wxRequestMapper.findCheckRecordByUidAndDate(uid , date);
		jsonListResult.setList(list);
		return jsonListResult;
	}

	@Override
	public JsonListResult findFaceImg(String openid) throws Exception {
		JsonListResult jsonListResult = new JsonListResult();
		List<Map<String, Object>> list = wxRequestMapper.findFaceImg(openid);
		jsonListResult.setList(list);
		return jsonListResult;
	}
	
	@Override
	public JsonListResult findMeets(String date, String user) {
		
		JsonListResult jsonListResult = new JsonListResult();
		List<Map<String, Object>> list = wxRequestMapper.findMeets(date, user);
		jsonListResult.setList(list);
		return jsonListResult;
	}
	
	
	@Override
	public Boolean saveOpenid(JSONObject jsonObject, String user ,String pwd) throws Exception {
		// TODO Auto-generated method stub
	
		String  openid = jsonObject.getString("openid");
		Map<String, Object> userMap = cUserMapper.findUserByName(user);
		Boolean sgin = false;
		String password = MD5.MD5(pwd + user);
		password = userRealm.md5(password, user);
		int result = 0;

		if (userMap == null) {
			// 用户名不存在抛出异常
			throw new UnknownAccountException();
		}
		String userPassWord = (String) userMap.get("password");
		if (!password.equals(userPassWord)) {
			throw new IncorrectCredentialsException();
		} else {

			result = cUserMapper.saveOpenid2(openid, user);

		}
		if (result > 0) {
			sgin = true;

		}
		return sgin;
		
	}
	
	
	@Override
	public boolean findRoleIsleader(String user) {
		boolean isleader = false;
		List<Map<String, Object>> list = wxRequestMapper.findRoleIsleader(user);
		if (list.get(0).get("role_name") == "领导") {
			
			isleader = true;
		}
		return isleader;
	}
	@Override
	public JsonListResult findLeaderMeets(String leaderid) {
		JsonListResult jsonListResult = new JsonListResult();
		if(("").equals(leaderid)) {
			List<Map<String, Object>> list = wxRequestMapper.findLeaderMeets();
			jsonListResult.setList(list);
		} else {
			List<Map<String, Object>> list = wxRequestMapper.findLeaderMeetsByleaderid(leaderid);
			jsonListResult.setList(list);
		}
		
		return jsonListResult;
	}
	
	@Override
	public JsonListResult findLeaderMeetsNext(String leaderid) {
		JsonListResult jsonListResult = new JsonListResult();
		
		
		if(("").equals(leaderid)) {
			List<Map<String, Object>> list = wxRequestMapper.findLeaderMeetsNext();
			jsonListResult.setList(list);
		} else {
			List<Map<String, Object>> list = wxRequestMapper.findLeaderMeetsNextByleaderid(leaderid);
			jsonListResult.setList(list);
		}
		
		
		return jsonListResult;
	}
	
	@Override
	public JsonListResult findLeader() {
		JsonListResult jsonListResult = new JsonListResult();
		List<Map<String, Object>> list = wxRequestMapper.findLeader();
		jsonListResult.setList(list);
		return jsonListResult;
	}
	
	
	@Override
	public JsonListResult findCompanyMeets(String companyid) {
		JsonListResult jsonListResult = new JsonListResult();
		if(("").equals(companyid)) {
			List<Map<String, Object>> list = wxRequestMapper.findCompanyMeets();
			jsonListResult.setList(list);
		} else {
			List<Map<String, Object>> list = wxRequestMapper.findCompanyMeetsByCompanyid(companyid);
			jsonListResult.setList(list);
		}
		
		return jsonListResult;
		
	}
	
	
	
	@Override
	public JsonListResult findCompanyMeetsNext(String companyid) {
		JsonListResult jsonListResult = new JsonListResult();
		if(("").equals(companyid)) {
			List<Map<String, Object>> list = wxRequestMapper.findCompanyMeetsNext();
			jsonListResult.setList(list);
		} else {
			List<Map<String, Object>> list = wxRequestMapper.findCompanyMeetsNextByCompanyid(companyid);
			jsonListResult.setList(list);
		}
		
		return jsonListResult;
	}
	
	@Override
	public JsonListResult findApproveMeet() {
		JsonListResult jsonListResult = new JsonListResult();
		List<Map<String, Object>> list = wxRequestMapper.findApproveMeet();
		
		jsonListResult.setList(list);
		return jsonListResult;
	}
	
	
	@Override
	public JsonResult updateMeetStateById(String state, String id) {
		JsonResult jsonResult = new JsonResult();
		int result = wxRequestMapper.updateMeetStateById(id, state); 
		if (result < 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}
	
	
	@Override
	public JsonListResult findMeetsById(String id) {
		JsonListResult jsonListResult = new JsonListResult();
		List<Map<String, Object>> list = wxRequestMapper.findMeetsById(id);
		jsonListResult.setList(list);
		return jsonListResult;
	}
	
	@Override
	public JsonListResult findMessages(String openid) {
		JsonListResult jsonListResult = new JsonListResult();
		List<Map<String, Object>> list = wxRequestMapper.findMessages(openid);
		jsonListResult.setList(list);
		return jsonListResult;
	}
//	
//	@Override
//	public JsonResult updateVisitorStateFalseById(String id) {
//		JsonResult jsonResult = new JsonResult();
//		int result = wxRequestMapper.updateVisitorStateFalseById(id);
//		if (result < 0) {
//			jsonResult.setResult(Constants.OPERATION_FAIL);
//		}
//		return jsonResult;
//	}
	

}
