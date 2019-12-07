package com.cf.project.service.jihua;

import com.cf.project.mybatis.model.CJihua;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import java.util.Map;

public interface CJihuaService {
	/*
	 * JsonListResult findCJihuaList(Map<String, Object> map) throws Exception;
	 * 
	 * CJihua findCJihuaListById(String id) throws Exception;
	 * 
	 * JsonResult saveOrUpdate(CJihua pojo) throws Exception;
	 * 
	 * JsonResult update(CJihua pojo) throws Exception;
	 * 
	 * JsonResult del(String id) throws Exception;
	 */

	JsonListResult findCJihuaList(Map<String, Object> map);

	JsonResult editJH(Map<String, Object> map);

	JsonResult connect(Map<String, Object> map);

	JsonResult shenheJH(Map<String, Object> map);

	JsonResult fabuJH(Map<String, Object> map);

	JsonResult subJH(Map<String, Object> map);

	JsonResult deleteJH(String id);

	int addSHJH(String id,String flg);

	JsonListResult findSHJHList(Map<String, Object> map); 
}