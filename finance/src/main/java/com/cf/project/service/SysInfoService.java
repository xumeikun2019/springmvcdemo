package com.cf.project.service;

import com.cf.project.mybatis.model.SysInfo;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

import java.util.List;
import java.util.Map;

public interface SysInfoService {
    JsonListResult findSysInfoList(Map<String, Object> map) throws Exception;

    SysInfo findSysInfoListById(String id) throws Exception;

    JsonResult saveOrUpdate(SysInfo pojo) throws Exception;

    JsonResult update(SysInfo pojo) throws Exception;

    JsonResult del(String id) throws Exception;

	List<Map<String, Object>> findip();
}