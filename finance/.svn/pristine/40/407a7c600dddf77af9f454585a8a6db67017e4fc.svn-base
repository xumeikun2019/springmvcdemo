package com.cf.project.service.impl;

import com.cf.project.mybatis.dao.CMessageMapper;
import com.cf.project.mybatis.model.CMessage;
import com.cf.project.service.CMessageService;
import com.cf.project.Constants;
import com.cf.project.annotation.Cache;
import com.cf.project.annotation.CacheClear;
import com.cf.util.DateTimeUtil;
import com.cf.util.EntyPage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CMessageServiceImpl implements CMessageService {
    @Autowired
    private CMessageMapper cMessageMapper;

    @Cache
    public JsonListResult findCMessageList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cMessageMapper.findByHDPage(map);		EntyPage page = (EntyPage) map.get("page");		JsonListResult jsonResult = new JsonListResult(page,list);		return jsonResult;
    }

    @Cache
    public CMessage findCMessageListById(String id) throws Exception {
        return this.cMessageMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(CMessage pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		if (pojo != null) {			String id = pojo.getId();			int result = 0;			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");			if (StringUtils.isNotBlank(id)) {				pojo.setLastTime(dateTime);				result = cMessageMapper.updateByPrimaryKeySelective(pojo);			} else {				pojo.setAddTime(dateTime);				pojo.setLastTime(dateTime);				result = cMessageMapper.insertSelective(pojo);			}			if (result == 0) {				jsonResult.setResult(Constants.OPERATION_FAIL);			}		}		return jsonResult;
    }

    @CacheClear
    public JsonResult update(CMessage pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");		pojo.setLastTime(dateTime);		int result = cMessageMapper.updateByPrimaryKeySelective(pojo);		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();		int result = 0;		if (StringUtils.contains(id,",")) {			String[] idsArr = id.split(",");			if (idsArr.length > 0) {				for (String idArr : idsArr) {					result = cMessageMapper.deleteByPrimaryKey(idArr);					if (result == 0) {						break;					}				}			}		} else {			result = cMessageMapper.deleteByPrimaryKey(id);		}		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }
}