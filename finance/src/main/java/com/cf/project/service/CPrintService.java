package com.cf.project.service;

import com.cf.project.mybatis.model.CPrint;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import java.util.Map;

public interface CPrintService {
    JsonListResult findCPrintList(Map<String, Object> map) throws Exception;

    CPrint findCPrintListById(String id) throws Exception;

    JsonResult saveOrUpdate(CPrint pojo) throws Exception;

    JsonResult update(CPrint pojo) throws Exception;

    JsonResult del(String id) throws Exception;

	JsonListResult findCPrintList_day(Map<String, Object> map) throws Exception;

	JsonListResult findCPrintList_month(Map<String, Object> map) throws Exception;

	JsonListResult findCPrintList_yer(Map<String, Object> map) throws Exception;

	JsonListResult findCPrintList_days(Map<String, Object> map) throws Exception;

	JsonListResult findCPrintList_months(Map<String, Object> map) throws Exception;

	JsonListResult findCPrintList_yers(Map<String, Object> map) throws Exception;

	JsonListResult findCPrintList_day_dyj(Map<String, Object> map) throws Exception;

	JsonListResult findCPrintList_month_dyj(Map<String, Object> map) throws Exception;

	JsonListResult findCPrintList_yer_dyj(Map<String, Object> map) throws Exception;
}