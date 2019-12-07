package com.cf.project.service.authority;

import com.cf.project.mybatis.model.SysRole;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import java.util.Map;

public interface SysRoleService {
    JsonListResult findSysRoleList(Map<String, Object> map) throws Exception;

    SysRole findSysRoleListById(String id) throws Exception;

    JsonResult saveOrUpdate(SysRole pojo) throws Exception;

    JsonResult update(SysRole pojo) throws Exception;

    JsonResult del(String id) throws Exception;

    JsonListResult findSysRoleCacheList(Map<String, Object> map) throws Exception;
    
    //查询角色
    JsonListResult findSysRoleName(Map<String, Object> map) throws Exception;
}