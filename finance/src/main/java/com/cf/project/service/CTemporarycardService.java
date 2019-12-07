package com.cf.project.service;

import com.cf.project.mybatis.model.CTemporarycard;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import java.util.Map;

public interface CTemporarycardService {
    JsonListResult findCTemporarycardList(Map<String, Object> map) throws Exception;

    CTemporarycard findCTemporarycardListById(String id) throws Exception;

    JsonResult saveOrUpdate(CTemporarycard pojo) throws Exception;

    JsonResult update(CTemporarycard pojo) throws Exception;

    JsonResult del(String id) throws Exception;
}