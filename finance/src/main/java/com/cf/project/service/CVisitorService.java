package com.cf.project.service;

import com.cf.project.mybatis.model.CVisitor;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

import java.util.List;
import java.util.Map;

public interface CVisitorService {
    JsonListResult findCVisitorList(Map<String, Object> map) throws Exception;

    CVisitor findCVisitorListById(String id) throws Exception;

    JsonResult saveOrUpdate(CVisitor pojo) throws Exception;

    JsonResult update(CVisitor pojo) throws Exception;

    JsonResult del(String id) throws Exception;

	List<Map<String, Object>> findVisitor(String id) throws Exception;

	JsonResult sptg(CVisitor pojo) throws Exception;

	JsonResult spbtg(CVisitor pojo) throws Exception;

	JsonListResult findCVisitorStatisticsList(Map<String, Object> map) throws Exception;

	JsonListResult findCVisitorStatisticsList_yue(Map<String, Object> map) throws Exception;

	JsonListResult findCVisitorStatisticsList_ri(Map<String, Object> map) throws Exception;

	JsonListResult findCVisitorStatisticsList_mixi(Map<String, Object> map) throws Exception;
}