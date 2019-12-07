package com.cf.project.service;

import com.cf.project.mybatis.model.CMessage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import java.util.Map;

public interface CMessageService {
    JsonListResult findCMessageList(Map<String, Object> map) throws Exception;

    CMessage findCMessageListById(String id) throws Exception;

    JsonResult saveOrUpdate(CMessage pojo) throws Exception;

    JsonResult update(CMessage pojo) throws Exception;

    JsonResult del(String id) throws Exception;
}