package com.cf.project.service.jihua.impl;

import com.cf.project.mybatis.dao.CJihuaMapper;
import com.cf.project.mybatis.dao.CShjlMapper;
import com.cf.project.mybatis.model.CJihua;
import com.cf.project.mybatis.model.CShjl;
import com.cf.project.service.jihua.CJihuaService;
import com.cf.project.Constants;
import com.cf.project.annotation.Cache;
import com.cf.project.annotation.CacheClear;
import com.cf.util.DateTimeUtil;
import com.cf.util.EntyPage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CJihuaServiceImpl implements CJihuaService {
    @Autowired
    private CJihuaMapper cJihuaMapper;
    @Autowired
    private CShjlMapper cShjhMapper; 

	@Override
	public JsonListResult findCJihuaList(Map<String, Object> map) {
		List<Map<String,Object>>	list = cJihuaMapper.findByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
	}

	@Override
	public JsonListResult findSHJHList(Map<String, Object> map) { 
		List<Map<String,Object>>	list = cShjhMapper.findByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
	}
	@CacheClear
	@Override
	public JsonResult editJH(Map<String, Object> map) {
		JsonResult jsonResult = new JsonResult();
		int result = 0;	
		CJihua cjh = cJihuaMapper.selectByPrimaryKey(map.get("id").toString());
		cjh.setDates(map.get("dates").toString());
		cjh.setTimes(map.get("times").toString());
		result = cJihuaMapper.updateByPrimaryKeySelective(cjh);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}
	@CacheClear
	@Override
	public JsonResult connect(Map<String, Object> map) {
		JsonResult jsonResult = new JsonResult();
		int result = 0;	
		CJihua cjh = cJihuaMapper.selectByPrimaryKey(map.get("id").toString());
		cjh.setDeviceIds(map.get("deviceIds").toString());
		result = cJihuaMapper.updateByPrimaryKeySelective(cjh);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}
	@CacheClear
	@Override
	public JsonResult shenheJH(Map<String, Object> map) {
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		JsonResult jsonResult = new JsonResult();
		int result = 0;	
		CJihua cjh = cJihuaMapper.selectByPrimaryKey(map.get("id").toString());
		cjh.setCheckdate(dateTime);
		cjh.setChecker(map.get("userName").toString());
		cjh.setIspass(map.get("flg").toString());
		result = cJihuaMapper.updateByPrimaryKeySelective(cjh);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}
	@CacheClear
	@Override
	public JsonResult fabuJH(Map<String, Object> map) {
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		JsonResult jsonResult = new JsonResult();
		int result = 0;	
		CJihua cjh = cJihuaMapper.selectByPrimaryKey(map.get("id").toString());
		cjh.setPubdate(dateTime);
		cjh.setPublisher(map.get("userName").toString());
		cjh.setIspass("3");
		result = cJihuaMapper.updateByPrimaryKeySelective(cjh);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}
	@CacheClear
	@Override
	public JsonResult subJH(Map<String, Object> map) {
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		JsonResult jsonResult = new JsonResult();
		int result = 0;	
		CJihua cjh = cJihuaMapper.selectByPrimaryKey(map.get("id").toString());
		cjh.setIspass("2");//计划提交
		cjh.setSubTime(dateTime);//计划提交
		result = cJihuaMapper.updateByPrimaryKeySelective(cjh);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}
	
	@CacheClear
	@Override
	public JsonResult deleteJH(String id) {
		JsonResult jsonResult = new JsonResult();
		int result = 0;	
		result = cJihuaMapper.deleteByPrimaryKey(id);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	
	@Override
	public int addSHJH(String id,String flg) {
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		CJihua t = cJihuaMapper.selectByPrimaryKey(id);
		Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
		CShjl tt = new CShjl();
		tt.setCheckdate(dateTime);
		tt.setChecker(usermap.get("username").toString());
		
		tt.setCreater(t.getCreater());
		tt.setCreatetime(t.getCreatetime());
		
		tt.setDates(t.getDates());
		tt.setTimes(t.getTimes());
		
		tt.setJiemuid(t.getJiemuid());
		tt.setDeviceids(t.getDeviceIds());
		tt.setIspass(flg);
		return cShjhMapper.insertSelective(tt);
	}

	
	
}