package com.cf.project.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cf.project.Constants;
import com.cf.project.annotation.Cache;
import com.cf.project.annotation.CacheClear;
import com.cf.project.mybatis.dao.CRoomDeptMapper;
import com.cf.project.mybatis.model.CRoomDept;
import com.cf.project.service.CRoomDeptService;
import com.cf.util.DateTimeUtil;
import com.cf.util.EntyPage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

@Service
public class CRoomDeptServiceImpl implements CRoomDeptService {
    @Autowired
    private CRoomDeptMapper cRoomDeptMapper;

    @Cache
    public JsonListResult findCRoomDeptList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cRoomDeptMapper.findByHDPage(map);		EntyPage page = (EntyPage) map.get("page");		JsonListResult jsonResult = new JsonListResult(page,list);		return jsonResult;
    }

    @Cache
    public CRoomDept findCRoomDeptListById(String id) throws Exception {
        return this.cRoomDeptMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(CRoomDept pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		if (pojo != null) {			String id = pojo.getId();			int result = 0;			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");			if (StringUtils.isNotBlank(id)) {				//pojo.setLastTime(dateTime);				result = cRoomDeptMapper.updateByPrimaryKeySelective(pojo);			} else {				//pojo.setAddTime(dateTime);				//pojo.setLastTime(dateTime);				result = cRoomDeptMapper.insertSelective(pojo);			}			if (result == 0) {				jsonResult.setResult(Constants.OPERATION_FAIL);			}		}		return jsonResult;
    }

    @CacheClear
    public JsonResult update(CRoomDept pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");		//pojo.setLastTime(dateTime);		int result = cRoomDeptMapper.updateByPrimaryKeySelective(pojo);		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();		int result = 0;		if (StringUtils.contains(id,",")) {			String[] idsArr = id.split(",");			if (idsArr.length > 0) {				for (String idArr : idsArr) {					result = cRoomDeptMapper.deleteByPrimaryKey(idArr);					if (result == 0) {						break;					}				}			}		} else {			result = cRoomDeptMapper.deleteByPrimaryKey(id);		}		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }
}