package com.cf.project.service;

import com.cf.project.mybatis.model.CMeetingDelay;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import java.util.Map;

public interface CMeetingDelayService {
    JsonListResult findCMeetingDelayList(Map<String, Object> map) throws Exception;

    CMeetingDelay findCMeetingDelayListById(String id) throws Exception;

    JsonResult saveOrUpdate(CMeetingDelay pojo) throws Exception;

    JsonResult update(CMeetingDelay pojo) throws Exception;

    JsonResult del(String id) throws Exception;
}