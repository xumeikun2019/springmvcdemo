package com.cf.project.service.impl;

import com.cf.project.mybatis.dao.CPrintMapper;
import com.cf.project.mybatis.model.CPrint;
import com.cf.project.service.CPrintService;
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
public class CPrintServiceImpl implements CPrintService {
    @Autowired
    private CPrintMapper cPrintMapper;

    @Cache
    public JsonListResult findCPrintList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cPrintMapper.findByHDPage(map);
    }
    
    @Cache
    public JsonListResult findCPrintList_day(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cPrintMapper.findDayByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    @Cache
    public JsonListResult findCPrintList_days(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cPrintMapper.findDaysByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    @Cache
    public JsonListResult findCPrintList_day_dyj(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cPrintMapper.findDayDyjByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    
    @Cache
    public JsonListResult findCPrintList_month(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cPrintMapper.findByMonthHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    @Cache
    public JsonListResult findCPrintList_month_dyj(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cPrintMapper.findByMonthDyjHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    @Cache
    public JsonListResult findCPrintList_months(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cPrintMapper.findByMonthsHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    
    @Cache
    public JsonListResult findCPrintList_yer(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cPrintMapper.findYerByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    @Cache
    public JsonListResult findCPrintList_yer_dyj(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cPrintMapper.findYerDyjByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    @Cache
    public JsonListResult findCPrintList_yers(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cPrintMapper.findYersByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }

    @Cache
    public CPrint findCPrintListById(String id) throws Exception {
        return this.cPrintMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(CPrint pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult update(CPrint pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }
}