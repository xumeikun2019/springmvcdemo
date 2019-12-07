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
        List<Map<String,Object>> list = cRoomDeptMapper.findByHDPage(map);
    }

    @Cache
    public CRoomDept findCRoomDeptListById(String id) throws Exception {
        return this.cRoomDeptMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(CRoomDept pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult update(CRoomDept pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }
}