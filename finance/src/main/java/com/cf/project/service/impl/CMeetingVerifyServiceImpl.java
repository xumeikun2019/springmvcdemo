package com.cf.project.service.impl;

import com.cf.project.mybatis.dao.CMeetingOrderMapper;
import com.cf.project.mybatis.dao.CMeetingVerifyMapper;
import com.cf.project.mybatis.model.CMeetingVerify;
import com.cf.project.service.CMeetingVerifyService;
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
public class CMeetingVerifyServiceImpl implements CMeetingVerifyService {
    @Autowired
    private CMeetingVerifyMapper cMeetingVerifyMapper;
    @Autowired
    private CMeetingOrderMapper cMeetingOrderMapper;

    @Cache
    public JsonListResult findCMeetingVerifyList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cMeetingVerifyMapper.findByHDPage(map);
    }

    @Cache
    public CMeetingVerify findCMeetingVerifyListById(String id) throws Exception {
        return this.cMeetingVerifyMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(CMeetingVerify pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
				result = cMeetingOrderMapper.updatezt(pojo.getMeetingId(),"0");
    }

    @CacheClear
    public JsonResult update(CMeetingVerify pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }
}