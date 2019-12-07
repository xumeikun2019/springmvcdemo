package com.cf.project.service.jiemu;

import com.cf.project.mybatis.model.CJiemu;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import java.util.Map;

public interface CJiemuService {

	JsonListResult findCJiemuList(Map<String, Object> map);
	/*
	 * JsonListResult findCJiemuList(Map<String, Object> map) throws Exception;
	 * 
	 * CJiemu findCJiemuListById(String id) throws Exception;
	 * 
	 * JsonResult saveOrUpdate(CJiemu pojo) throws Exception;
	 * 
	 * JsonResult update(CJiemu pojo) throws Exception;
	 * 
	 * JsonResult del(String id) throws Exception;
	 */

	JsonResult saveJM(Map<String, Object> map);

	JsonResult saveJMJH(Map<String, Object> map);

	JsonResult saveJH(Map<String, Object> map);

	JsonResult deleteJM(String id);
}