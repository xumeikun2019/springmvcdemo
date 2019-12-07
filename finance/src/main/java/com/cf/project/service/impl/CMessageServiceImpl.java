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
        List<Map<String,Object>> list = cMessageMapper.findByHDPage(map);
    }

    @Cache
    public CMessage findCMessageListById(String id) throws Exception {
        return this.cMessageMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(CMessage pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult update(CMessage pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }
}