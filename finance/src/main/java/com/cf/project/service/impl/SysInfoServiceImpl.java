package com.cf.project.service.impl;

import com.cf.project.mybatis.dao.SysInfoMapper;
import com.cf.project.mybatis.model.SysInfo;
import com.cf.project.service.SysInfoService;
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
public class SysInfoServiceImpl implements SysInfoService {
    @Autowired
    private SysInfoMapper sysInfoMapper;

    @Cache
    public JsonListResult findSysInfoList(Map<String, Object> map) throws Exception {
        List<Map<String,Object>> list = sysInfoMapper.findByHDPage(map);
    }

    @Cache
    public SysInfo findSysInfoListById(String id) throws Exception {
        return this.sysInfoMapper.selectByPrimaryKey(id);
    }

    @CacheClear
    public JsonResult saveOrUpdate(SysInfo pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult update(SysInfo pojo) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }

    @CacheClear
    public JsonResult del(String id) throws Exception {
        JsonResult jsonResult = new JsonResult();
    }
    /**
     * 查询考勤设备的IP
     * @param map
     * @return
     * @throws Exception
     */
    @Cache
    public List<Map<String,Object>> findip() {
    	List<Map<String,Object>> list = sysInfoMapper.findIp();
		return list;
    }

}