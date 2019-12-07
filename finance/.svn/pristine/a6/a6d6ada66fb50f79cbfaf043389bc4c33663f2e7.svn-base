package com.cf.project.service.impl;

import com.cf.project.mybatis.dao.CTemporarycardMapper;
import com.cf.project.mybatis.dao.SysInfoMapper;
import com.cf.project.mybatis.model.CTemporarycard;
import com.cf.project.service.CTemporarycardService;
import com.cf.project.Constants;
import com.cf.project.annotation.Cache;
import com.cf.project.annotation.CacheClear;
import com.cf.util.DateTimeUtil;
import com.cf.util.EntyPage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

import labor.add;

import java.util.Date;
import java.util.List;
import java.util.Map;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CTemporarycardServiceImpl implements CTemporarycardService {
    @Autowired
    private CTemporarycardMapper cTemporarycardMapper;
    @Autowired
    private SysInfoMapper sysInfoMapper;

    @Cache
    public JsonListResult findCTemporarycardList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = cTemporarycardMapper.findByHDPage(map);		EntyPage page = (EntyPage) map.get("page");		JsonListResult jsonResult = new JsonListResult(page,list);		return jsonResult;
    }

    @Cache
    public CTemporarycard findCTemporarycardListById(String id) throws Exception {
        return this.cTemporarycardMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(CTemporarycard pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		if (pojo != null) {			String id = pojo.getId();			int result = 0;			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");			if (StringUtils.isNotBlank(id)) {				pojo.setLastTime(dateTime);				result = cTemporarycardMapper.updateByPrimaryKeySelective(pojo);			} else {
				pojo.setYxbz("T");
				pojo.setFwr(pojo.getFwr().substring(0, pojo.getFwr().length()-1));				pojo.setAddTime(dateTime);				pojo.setLastTime(dateTime);				result = cTemporarycardMapper.insertSelective(pojo);
				//往门禁设备添加人员及卡片信息
				List<Map<String,Object>> list = sysInfoMapper.findIp();
				add Add=new add();
				for(int i=0;i<list.size();i++) {
					Add.tjlsry(list.get(i).get("ip").toString(),pojo.getId(), pojo.getName(),pojo.getKh());
				}			}			if (result == 0) {				jsonResult.setResult(Constants.OPERATION_FAIL);			}		}		return jsonResult;
    }

    @CacheClear
    public JsonResult update(CTemporarycard pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");		pojo.setLastTime(dateTime);		int result = cTemporarycardMapper.updateByPrimaryKeySelective(pojo);		if (result == 0) {			jsonResult.setResult(Constants.OPERATION_FAIL);		}		return jsonResult;
    }
    /**
     * 收回临时卡
     */
    @CacheClear
    public JsonResult del(String id) throws Exception {
    	 JsonResult jsonResult = new JsonResult();
 		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
 		CTemporarycard pojo=new CTemporarycard();
 		pojo.setId(id);		
 		pojo.setLastTime(dateTime);
 		int result = cTemporarycardMapper.shkp(pojo);
 		//删除考勤门禁设备上的人员信息
 		List<Map<String,Object>> list = sysInfoMapper.findIp();
		add Add=new add();
		for(int i=0;i<list.size();i++) {
			Add.scdgry(list.get(i).get("ip").toString(),pojo.getId());
		}
 		if (result == 0) {
 			jsonResult.setResult(Constants.OPERATION_FAIL);
 		}
 		return jsonResult;
    }
}