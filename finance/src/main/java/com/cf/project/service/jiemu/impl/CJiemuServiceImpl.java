package com.cf.project.service.jiemu.impl;

import com.cf.project.mybatis.dao.CJiemuMapper;
import com.cf.project.mybatis.dao.CJihuaMapper;
import com.cf.project.mybatis.model.CJiemu;
import com.cf.project.mybatis.model.CJihua;
import com.cf.project.mybatis.model.SysDepartment;
import com.cf.project.service.jiemu.CJiemuService;
import com.cf.project.Constants;
import com.cf.project.annotation.Cache;
import com.cf.project.annotation.CacheClear;
import com.cf.util.DateTimeUtil;
import com.cf.util.EntyPage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CJiemuServiceImpl implements CJiemuService {
    @Autowired
    private CJiemuMapper cJiemuMapper;
    @Autowired
    private CJihuaMapper cJihuaMapper;

	@Override
	public JsonListResult findCJiemuList(Map<String, Object> map) {
		
		List<Map<String,Object>>	list = cJiemuMapper.findByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
	}

	@Override
	public JsonResult saveJM(Map<String, Object> map) {
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		JsonResult jsonResult = new JsonResult();
			CJiemu jm = new CJiemu();
			jm.setSucaiIds(map.get("vIds").toString());
			jm.setPaths(map.get("paths").toString());
			jm.setCreatetime(dateTime);
			jm.setCreater(map.get("userName").toString());
			jm.setJg(Integer.parseInt(map.get("jg").toString()));
			jm.setName(map.get("jmName").toString());
			int result = 0;
			//result = cJiemuMapper.insertSelective(jm);
			result = cJiemuMapper.insertSelective(jm);
			System.out.println("uuid:"+jm.getId());
			if (result == 0) {
				jsonResult.setResult(Constants.OPERATION_FAIL);
			}
			jsonResult.setData(jm);
			return jsonResult;
	}

	@Override
	public JsonResult saveJMJH(Map<String, Object> map) {
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		JsonResult jsonResult = new JsonResult();
				CJihua cjihua = new CJihua(); 
				cjihua.setCreatetime(dateTime);
				cjihua.setCreater(map.get("userName").toString());
				cjihua.setDates(map.get("dates").toString());
				cjihua.setJiemuid(map.get("jmId").toString());
				cjihua.setTimes(map.get("times").toString());
				int result = 0;
				result = cJihuaMapper.insertSelective(cjihua);
				jsonResult.setData(cjihua.getId());
				if(result == 0) {
					jsonResult.setResult(Constants.OPERATION_FAIL);
				}
			return jsonResult;
	}

	@Override
	public JsonResult saveJH(Map<String, Object> map) {
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		JsonResult jsonResult = new JsonResult();
		int result = 0;			
		CJihua cjihua = new CJihua(); 
		cjihua.setCreatetime(dateTime);
		cjihua.setDates(map.get("dates").toString());
		cjihua.setCreater(map.get("userName").toString());
		cjihua.setJiemuid(map.get("id").toString());
		cjihua.setTimes(map.get("times").toString());
		result = cJihuaMapper.insertSelective(cjihua);
			 
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	@Override
	public JsonResult deleteJM(String id) {
		JsonResult jsonResult = new JsonResult();
		int result = 0;	
		result = cJiemuMapper.deleteByPrimaryKey(id);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	/*
	 * @Cache public JsonListResult findCJiemuList(Map<String, Object> map) throws
	 * Exception { List<Map<String,Object>> list = cJiemuMapper.findByHDPage(map);
	 * EntyPage page = (EntyPage) map.get("page"); JsonListResult jsonResult = new
	 * JsonListResult(page,list); return jsonResult; }
	 * 
	 * @Cache public CJiemu findCJiemuListById(String id) throws Exception { return
	 * this.cJiemuMapper.selectByPrimaryKey(id); }
	 * 
	 * @CacheClear public JsonResult saveOrUpdate(CJiemu pojo) throws Exception {
	 * JsonResult jsonResult = new JsonResult(); if (pojo != null) { String id =
	 * pojo.getId(); int result = 0; Date dateTime =
	 * DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(),
	 * "yyyy-MM-dd HH:mm:ss"); if (StringUtils.isNotBlank(id)) {
	 * pojo.setLastTime(dateTime); result =
	 * cJiemuMapper.updateByPrimaryKeySelective(pojo); } else {
	 * pojo.setAddTime(dateTime); pojo.setLastTime(dateTime); result =
	 * cJiemuMapper.insertSelective(pojo); } if (result == 0) {
	 * jsonResult.setResult(Constants.OPERATION_FAIL); } } return jsonResult; }
	 * 
	 * @CacheClear public JsonResult update(CJiemu pojo) throws Exception {
	 * JsonResult jsonResult = new JsonResult(); Date dateTime =
	 * DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(),
	 * "yyyy-MM-dd HH:mm:ss"); pojo.setLastTime(dateTime); int result =
	 * cJiemuMapper.updateByPrimaryKeySelective(pojo); if (result == 0) {
	 * jsonResult.setResult(Constants.OPERATION_FAIL); } return jsonResult; }
	 * 
	 * @CacheClear public JsonResult del(String id) throws Exception { JsonResult
	 * jsonResult = new JsonResult(); int result = 0; if
	 * (StringUtils.contains(id,",")) { String[] idsArr = id.split(","); if
	 * (idsArr.length > 0) { for (String idArr : idsArr) { result =
	 * cJiemuMapper.deleteByPrimaryKey(idArr); if (result == 0) { break; } } } }
	 * else { result = cJiemuMapper.deleteByPrimaryKey(id); } if (result == 0) {
	 * jsonResult.setResult(Constants.OPERATION_FAIL); } return jsonResult; }
	 */
}