package com.cf.project.service.impl;

import com.cf.project.mybatis.dao.CAttendanceRecordMapper;
import com.cf.project.mybatis.dao.CAttendanceTimeMapper;
import com.cf.project.mybatis.dao.CMeetingOrderMapper;
import com.cf.project.mybatis.model.CAttendanceRecord;
import com.cf.project.service.CAttendanceRecordService;
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
public class CAttendanceRecordServiceImpl implements CAttendanceRecordService {
    @Autowired
    private CAttendanceRecordMapper cAttendanceRecordMapper;
    @Autowired
    private CAttendanceTimeMapper cAttendanceTimeMapper;
    /**
     * 部门考勤表
     */
    @Cache
    public JsonListResult findCAttendanceRecordList(Map<String, Object> map) throws Exception {
//    	List<Map<String,Object>> qxlist = cAttendanceRecordMapper.findbm(map.get("nameId").toString());
//    	map.put("depId", qxlist.get(0).get("department_id"));
        List<Map<String,Object>> list = cAttendanceRecordMapper.findByHDPage(map);		EntyPage page = (EntyPage) map.get("page");		JsonListResult jsonResult = new JsonListResult(page,list);		return jsonResult;
    }
    
    @Cache
    public List<Map<String,Object>> findkqxx(String userid,String sj){
    	List<Map<String,Object>> list = cAttendanceRecordMapper.findkqxx(userid,sj);
		return list;
    }
    
    @Cache
    public List<Map<String,Object>> findbm1(String userid){
    	List<Map<String,Object>> list = cAttendanceRecordMapper.findbm1(userid);
		return list;
    }
    
    @Cache
    public List<Map<String,Object>> findlc(String userid){
    	List<Map<String,Object>> list = cAttendanceRecordMapper.findlc(userid);
		return list;
    }
    
    @Cache
    public List<Map<String,Object>> findbm(String userid){
    	List<Map<String,Object>> list = cAttendanceRecordMapper.findbm(userid);
		return list;
    }
    
    @Cache
    public List<Map<String,Object>> findsxb(String userid,String sj){
    	List<Map<String,Object>> list = cAttendanceRecordMapper.findsxb(userid,sj);
		return list;
    }
    /**
     * 分公司考勤表
     */
    @Cache
    public JsonListResult findCompanyAttList(Map<String, Object> map) throws Exception {
    	List<Map<String,Object>> gslist = cAttendanceRecordMapper.findGsList(map.get("nameId").toString());
    	map.put("comId", gslist.get(0).get("parent_id"));
        List<Map<String,Object>> list = cAttendanceRecordMapper.findCompanyAttByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }

    @Cache
    public CAttendanceRecord findCAttendanceRecordListById(String id) throws Exception {
        return this.cAttendanceRecordMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(CAttendanceRecord pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		if (pojo != null) {			String id = pojo.getId();			int result = 0;			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");			if (StringUtils.isNotBlank(id)) {				pojo.setLastTime(dateTime);				result = cAttendanceRecordMapper.updateByPrimaryKeySelective(pojo);			} else {				pojo.setAddTime(dateTime);				pojo.setLastTime(dateTime);				result = cAttendanceRecordMapper.insertSelective(pojo);			}			if (result == 0) {				jsonResult.setResult(Constants.OPERATION_FAIL);			}		}		return jsonResult;
    }

    @CacheClear
    public JsonResult update(CAttendanceRecord pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");		pojo.setLastTime(dateTime);		int result = cAttendanceRecordMapper.updateByPrimaryKeySelective(pojo);		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();		int result = 0;		if (StringUtils.contains(id,",")) {			String[] idsArr = id.split(",");			if (idsArr.length > 0) {				for (String idArr : idsArr) {					result = cAttendanceRecordMapper.deleteByPrimaryKey(idArr);					if (result == 0) {						break;					}				}			}		} else {			result = cAttendanceRecordMapper.deleteByPrimaryKey(id);		}		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }
}