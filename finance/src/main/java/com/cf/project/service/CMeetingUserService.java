package com.cf.project.service;

import com.cf.project.mybatis.model.CMeetingUser;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import java.util.Map;

public interface CMeetingUserService {
    JsonListResult findCMeetingUserList(Map<String, Object> map) throws Exception;

    CMeetingUser findCMeetingUserListById(String id) throws Exception;

    JsonResult saveOrUpdate(CMeetingUser pojo) throws Exception;

    JsonResult update(CMeetingUser pojo) throws Exception;

    JsonResult del(String id) throws Exception;
}