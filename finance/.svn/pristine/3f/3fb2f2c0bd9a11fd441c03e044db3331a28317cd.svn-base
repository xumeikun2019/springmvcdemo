package com.cf.project.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

public interface WxRequestService {
	

	String sign(String user, String pwd, String openid) throws Exception;

	JsonResult findVisitByName(String user);

	JsonResult updateVisitorStateById(String id, String state);

	JsonListResult findCheckRecordByUidAndDate(String uid, String date) throws Exception;

	JsonListResult findFaceImg(String openid) throws Exception;

	JsonListResult findMeets(String date, String user);

	Boolean saveOpenid(JSONObject jsonObject, String uname, String pwd) throws Exception;

	boolean findRoleIsleader(String user);

	JsonListResult findLeaderMeets(String leaderid);

	JsonListResult findLeaderMeetsNext(String leaderid);

	JsonListResult findLeader();

	JsonListResult findCompanyMeets(String companyid);

	JsonListResult findCompanyMeetsNext(String companyid);

	JsonListResult findApproveMeet();

	JsonResult updateMeetStateById(String state, String string);

	JsonListResult findMeetsById(String id);

	JsonListResult findMessages(String openid);

//	JsonResult updateVisitorStateFalseById(String id); 

}
