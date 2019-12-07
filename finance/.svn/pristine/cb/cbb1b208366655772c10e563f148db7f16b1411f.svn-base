package com.cf.project.service.impl;

import com.cf.project.mybatis.dao.CAttendanceTimeMapper;
import com.cf.project.mybatis.model.CAttendanceTime;
import com.cf.project.service.CAttendanceTimeService;
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
public class CAttendanceTimeServiceImpl implements CAttendanceTimeService {
    @Autowired
    private CAttendanceTimeMapper cAttendanceTimeMapper;

    @Cache
    public JsonListResult findCAttendanceTimeList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cAttendanceTimeMapper.findByHDPage(map);		EntyPage page = (EntyPage) map.get("page");		JsonListResult jsonResult = new JsonListResult(page,list);		return jsonResult;
    }
    /**
     * 查询人员所在分公司
     * @param map
     * @return
     * @throws Exception
     */
    @Cache
    public List<Map<String,Object>> findGsList(String id) throws Exception {
    	List<Map<String,Object>> list = cAttendanceTimeMapper.findGsList(id);
		return list;
    }
    /**
     * 查询分公司规定上下班时间
     * @param map
     * @return
     * @throws Exception
     */
    @Cache
    public List<Map<String,Object>> findsxbsjList(String id) {
    	List<Map<String,Object>> list = cAttendanceTimeMapper.findsxbsjList(id);
		return list;
    }

    @Cache
    public CAttendanceTime findCAttendanceTimeListById(String id) throws Exception {
        return this.cAttendanceTimeMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(CAttendanceTime pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		if (pojo != null) {			String id = pojo.getId();			int result = 0;			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");			if (StringUtils.isNotBlank(id)) {				pojo.setLastTime(dateTime);				result = cAttendanceTimeMapper.updateByPrimaryKeySelective(pojo);			} else {				pojo.setAddTime(dateTime);				pojo.setLastTime(dateTime);				result = cAttendanceTimeMapper.insertSelective(pojo);			}			if (result == 0) {				jsonResult.setResult(Constants.OPERATION_FAIL);			}		}		return jsonResult;
    }

    @CacheClear
    public JsonResult update(CAttendanceTime pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");		pojo.setLastTime(dateTime);		int result = cAttendanceTimeMapper.updateByPrimaryKeySelective(pojo);		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();		int result = 0;		if (StringUtils.contains(id,",")) {			String[] idsArr = id.split(",");			if (idsArr.length > 0) {				for (String idArr : idsArr) {					result = cAttendanceTimeMapper.deleteByPrimaryKey(idArr);					if (result == 0) {						break;					}				}			}		} else {			result = cAttendanceTimeMapper.deleteByPrimaryKey(id);		}		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }
}