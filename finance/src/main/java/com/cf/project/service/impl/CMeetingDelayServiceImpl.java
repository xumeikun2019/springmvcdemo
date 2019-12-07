package com.cf.project.service.impl;

import com.cf.project.mybatis.dao.CMeetingDelayMapper;
import com.cf.project.mybatis.model.CMeetingDelay;
import com.cf.project.service.CMeetingDelayService;
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
public class CMeetingDelayServiceImpl implements CMeetingDelayService {
    @Autowired
    private CMeetingDelayMapper cMeetingDelayMapper;

    @Cache
    public JsonListResult findCMeetingDelayList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cMeetingDelayMapper.findByHDPage(map);
    }

    @Cache
    public CMeetingDelay findCMeetingDelayListById(String id) throws Exception {
        return this.cMeetingDelayMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(CMeetingDelay pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult update(CMeetingDelay pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }
}