package com.cf.project.service.sucai;

import java.util.Map;

import com.cf.project.mybatis.model.CSucai;
import com.cf.util.JsonResult;

public interface CSucaiService {
	
	 /**
     * 获取系统目录树
     * @param map
     * @return
     * @throws Exception
     */
    JsonResult findMenuTreeList(Map<String, Object> map) throws Exception;

	JsonResult save(CSucai sc);

	JsonResult findChildList(Map<String, Object> map);

	JsonResult eidtName(Map<String, Object> map);

	JsonResult delete(Map<String, Object> map);

	JsonResult getSucaiList(Map<String, Object> map);
    
	
	/*
	 * JsonListResult findCSucaiList(Map<String, Object> map) throws Exception;
	 * 
	 * CSucai findCSucaiListById(String id) throws Exception;
	 * 
	 * JsonResult saveOrUpdate(CSucai pojo) throws Exception;
	 * 
	 * JsonResult update(CSucai pojo) throws Exception;
	 * 
	 * JsonResult del(String id) throws Exception;
	 */
}