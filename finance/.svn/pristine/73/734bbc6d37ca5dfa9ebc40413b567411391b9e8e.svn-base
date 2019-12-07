package com.cf.project.service;

import java.util.Map;

import com.cf.project.mybatis.model.CMeetingSign;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

public interface CMeetingSignService {
    JsonListResult findCMeetingSignList(Map<String, Object> map) throws Exception;

    CMeetingSign findCMeetingSignListById(String id) throws Exception;

    JsonResult saveOrUpdate(CMeetingSign pojo) throws Exception;

    JsonResult update(CMeetingSign pojo) throws Exception;

    JsonResult del(String id) throws Exception;

	JsonResult addCmeetingSign(String wechatId,String meetingId,String yzm) throws Exception;

	JsonListResult findCmeetingSignList();
}