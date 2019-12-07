package com.cf.project.service;

import com.cf.project.mybatis.model.CAttendanceTime;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

import java.util.List;
import java.util.Map;

public interface CAttendanceTimeService {
    JsonListResult findCAttendanceTimeList(Map<String, Object> map) throws Exception;

    CAttendanceTime findCAttendanceTimeListById(String id) throws Exception;

    JsonResult saveOrUpdate(CAttendanceTime pojo) throws Exception;

    JsonResult update(CAttendanceTime pojo) throws Exception;

    JsonResult del(String id) throws Exception;

    List<Map<String,Object>> findGsList(String string) throws Exception;

	List<Map<String, Object>> findsxbsjList(String fgsid);
}