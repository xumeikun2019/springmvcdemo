package com.cf.project.service;

import com.cf.project.mybatis.model.CAttendanceRecord;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

import java.util.List;
import java.util.Map;

public interface CAttendanceRecordService {
    JsonListResult findCAttendanceRecordList(Map<String, Object> map) throws Exception;

    CAttendanceRecord findCAttendanceRecordListById(String id) throws Exception;

    JsonResult saveOrUpdate(CAttendanceRecord pojo) throws Exception;

    JsonResult update(CAttendanceRecord pojo) throws Exception;

    JsonResult del(String id) throws Exception;

	JsonListResult findCompanyAttList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> findbm(String id);

	List<Map<String, Object>> findsxb(String id, String sj);

	List<Map<String, Object>> findkqxx(String id, String sj);

	List<Map<String, Object>> findbm1(String id);

	List<Map<String, Object>> findlc(String id);

}