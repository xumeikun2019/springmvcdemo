package com.cf.project.service.impl;

import com.cf.project.mybatis.dao.CVisitorMapper;
import com.cf.project.mybatis.model.CMeetingVerify;
import com.cf.project.mybatis.model.CVisitor;
import com.cf.project.service.CVisitorService;
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
public class CVisitorServiceImpl implements CVisitorService {
    @Autowired
    private CVisitorMapper cVisitorMapper;

    @Cache
    public JsonListResult findCVisitorList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cVisitorMapper.findByHDPage(map);		EntyPage page = (EntyPage) map.get("page");		JsonListResult jsonResult = new JsonListResult(page,list);		return jsonResult;
    }
    /**
     * 访客预约统计(年)
     */
    @Cache
    public JsonListResult findCVisitorStatisticsList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cVisitorMapper.findVisitorStatisByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    /**
     * 访客预约统计(月)
     */
    @Cache
    public JsonListResult findCVisitorStatisticsList_yue(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cVisitorMapper.findVisitorStatisYueByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    /**
     * 访客预约统计(日)
     */
    @Cache
    public JsonListResult findCVisitorStatisticsList_ri(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cVisitorMapper.findVisitorStatisRiByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }
    /**
     * 访客预约统计(明细)
     */
    @Cache
    public JsonListResult findCVisitorStatisticsList_mixi(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cVisitorMapper.findVisitorStatisMiXiByHDPage(map);
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page,list);
		return jsonResult;
    }

    @Cache
    public CVisitor findCVisitorListById(String id) throws Exception {
        return this.cVisitorMapper.selectByPrimaryKey(id);
    }
    
    @Cache
    public List<Map<String, Object>> findVisitor(String id) throws Exception {
    	List<Map<String,Object>> list = cVisitorMapper.findVisitor(id);
        return list;
    }
    
    /**
     * 访客预约审批成功
     */
    @CacheClear
    public JsonResult sptg(CVisitor pojo) throws Exception {
    	Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
    	int result = 0;
    	JsonResult jsonResult = new JsonResult();
    	pojo.setState("P");
    	pojo.setLastTime(dateTime);
    	result = cVisitorMapper.updateByPrimaryKeySelective(pojo);
    	if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
    }
    /**
     * 访客预约审批不成功
     */
    @CacheClear
    public JsonResult spbtg(CVisitor pojo) throws Exception {
    	Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
    	int result = 0;
    	JsonResult jsonResult = new JsonResult();
    	pojo.setState("N");
    	pojo.setLastTime(dateTime);
    	result = cVisitorMapper.updateByPrimaryKeySelective(pojo);
    	if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
    }

    @CacheClear
    public JsonResult saveOrUpdate(CVisitor pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		if (pojo != null) {			String id = pojo.getId();			int result = 0;			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");			if (StringUtils.isNotBlank(id)) {				pojo.setLastTime(dateTime);				result = cVisitorMapper.updateByPrimaryKeySelective(pojo);			} else {				pojo.setAddTime(dateTime);				pojo.setLastTime(dateTime);				result = cVisitorMapper.insertSelective(pojo);			}			if (result == 0) {				jsonResult.setResult(Constants.OPERATION_FAIL);			}		}		return jsonResult;
    }

    @CacheClear
    public JsonResult update(CVisitor pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");		pojo.setLastTime(dateTime);		int result = cVisitorMapper.updateByPrimaryKeySelective(pojo);		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();		int result = 0;		if (StringUtils.contains(id,",")) {			String[] idsArr = id.split(",");			if (idsArr.length > 0) {				for (String idArr : idsArr) {					result = cVisitorMapper.deleteByPrimaryKey(idArr);					if (result == 0) {						break;					}				}			}		} else {			result = cVisitorMapper.deleteByPrimaryKey(id);		}		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }
}