package com.cf.project.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.cf.project.mybatis.model.SysDepartment;
import com.cf.project.mybatis.model.SysDepartmentUser;
import com.cf.util.JsonResult;

public interface SysDepartmentService {
    SysDepartment findSysDepartmentListById(String id) throws Exception;

    SysDepartmentUser findSysDepartmentListByUserId(String id) throws Exception;

    JsonResult saveOrUpdate(SysDepartment pojo) throws Exception;

    JsonResult del(String id) throws Exception;

    JsonResult findTreeList(Map<String, Object> map) throws Exception;
    
	Map<String,Object> findETreeList(Map<String, Object> map);
	Map<String,Object> findSysDepartmentByUserId(String userid) throws Exception;
	JSONArray findTreeListToJSON(Map<String, Object> map) throws Exception;

	String importContract(List<Object[]> readAllExcel);

	JSONArray finduserTreeListToJSON(Map<String, Object> map) throws Exception ;

	JSONArray findplaceTreeListToJSON(Map<String, Object> map) throws Exception;

	JsonResult findSysDepartmentOne() throws Exception;

	JsonResult findSysDepartmentTwo(String id) throws Exception;

	JsonResult findSysDepartmentUser(String id) throws Exception;

	JsonResult saveVisitors(Map<String, Object> map) throws Exception;

	JsonResult findVisits(String weid) throws Exception;

	JSONArray findldTreeListToJSON(Map<String, Object> map) throws Exception;

	JSONArray findptygTreeListToJSON(Map<String, Object> map) throws Exception;
}