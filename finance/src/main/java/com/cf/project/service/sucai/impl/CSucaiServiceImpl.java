package com.cf.project.service.sucai.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cf.project.Constants;
import com.cf.project.annotation.Cache;
import com.cf.project.mybatis.dao.CSucaiMapper;
import com.cf.project.mybatis.model.CSucai;
import com.cf.project.service.sucai.CSucaiService;
import com.cf.util.JsonResult;

@Service
public class CSucaiServiceImpl implements CSucaiService {
    @Autowired
    private CSucaiMapper cSucaiMapper;


    @Cache
	public JsonResult findMenuTreeList(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> list = cSucaiMapper.findMenuTreeList(map);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setData(list);
		return jsonResult;
	}


	@Override
	public JsonResult save(CSucai sc) {
		JsonResult jsonResult = new JsonResult();
		int result = cSucaiMapper.insertSelective(sc);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}


	@Override
	public JsonResult findChildList(Map<String, Object> map) {
		List<Map<String,Object>> list = cSucaiMapper.findChildList(map);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setData(list);
		return jsonResult;
	}


	@Override
	public JsonResult eidtName(Map<String, Object> map) {
		// TODO Auto-generated method stub
		JsonResult jsonResult = new JsonResult();
		CSucai sc = cSucaiMapper.selectByPrimaryKey(map.get("id").toString());
		sc.setName(map.get("name").toString());
		int result = cSucaiMapper.updateByPrimaryKeySelective(sc);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}


	@Override
	public JsonResult delete(Map<String, Object> map) {
		JsonResult jsonResult = new JsonResult();
		int result = cSucaiMapper.deleteByPrimaryKey(map.get("id").toString());
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}


	@Override
	public JsonResult getSucaiList(Map<String, Object> map) {
		List<Map<String,Object>> list = cSucaiMapper.getSucaiList(map);
		JsonResult jsonResult = new JsonResult();
		jsonResult.setData(list);
		return jsonResult;
	}

	/*
	 * @Cache public JsonListResult findCSucaiList(Map<String, Object> map) throws
	 * Exception { List<Map<String,Object>> list = cSucaiMapper.findByHDPage(map);
	 * EntyPage page = (EntyPage) map.get("page"); JsonListResult jsonResult = new
	 * JsonListResult(page,list); return jsonResult; }
	 * 
	 * @Cache public CSucai findCSucaiListById(String id) throws Exception { return
	 * this.cSucaiMapper.selectByPrimaryKey(id); }
	 * 
	 * @CacheClear public JsonResult saveOrUpdate(CSucai pojo) throws Exception {
	 * JsonResult jsonResult = new JsonResult(); if (pojo != null) { String id =
	 * pojo.getId(); int result = 0; Date dateTime =
	 * DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(),
	 * "yyyy-MM-dd HH:mm:ss"); if (StringUtils.isNotBlank(id)) {
	 * pojo.setLastTime(dateTime); result =
	 * cSucaiMapper.updateByPrimaryKeySelective(pojo); } else {
	 * pojo.setAddTime(dateTime); pojo.setLastTime(dateTime); result =
	 * cSucaiMapper.insertSelective(pojo); } if (result == 0) {
	 * jsonResult.setResult(Constants.OPERATION_FAIL); } } return jsonResult; }
	 * 
	 * @CacheClear public JsonResult update(CSucai pojo) throws Exception {
	 * JsonResult jsonResult = new JsonResult(); Date dateTime =
	 * DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(),
	 * "yyyy-MM-dd HH:mm:ss"); pojo.setLastTime(dateTime); int result =
	 * cSucaiMapper.updateByPrimaryKeySelective(pojo); if (result == 0) {
	 * jsonResult.setResult(Constants.OPERATION_FAIL); } return jsonResult; }
	 * 
	 * @CacheClear public JsonResult del(String id) throws Exception { JsonResult
	 * jsonResult = new JsonResult(); int result = 0; if
	 * (StringUtils.contains(id,",")) { String[] idsArr = id.split(","); if
	 * (idsArr.length > 0) { for (String idArr : idsArr) { result =
	 * cSucaiMapper.deleteByPrimaryKey(idArr); if (result == 0) { break; } } } }
	 * else { result = cSucaiMapper.deleteByPrimaryKey(id); } if (result == 0) {
	 * jsonResult.setResult(Constants.OPERATION_FAIL); } return jsonResult; }
	 */
}