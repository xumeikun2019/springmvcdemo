package com.cf.project.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cf.project.annotation.Cache;
import com.cf.project.mybatis.dao.SysDictionaryMapper;
import com.cf.project.mybatis.model.SysDepartmentUser;
import com.cf.project.service.SysDictionaryService;
import com.cf.util.JsonResult;

@Service
public class SysDictionaryServiceImpl implements SysDictionaryService {
	
	@Autowired
	private SysDictionaryMapper  dictionaryMapper;

	@Override
	public List<Map<String, Object>> findDictiomaryByParent(String id) throws Exception {
		return dictionaryMapper.findDictiomaryByParent(id);
	}

	@Cache
	public JsonResult findSysDictionaryForZtree(Map<String, Object> param) throws Exception {
		JsonResult jsonResult = new JsonResult();
		String pid = (String)param.get("pid");
		List<Map<String,Object>> dicList = dictionaryMapper.findDicForZtree(pid);
		jsonResult.setData(dicList);
		return jsonResult;
	}

}
