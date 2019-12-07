package com.cf.project.service.authority;

import com.cf.project.mybatis.model.SysAuthority;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import java.util.Map;

public interface SysAuthorityService {
    JsonListResult findSysAuthorityList(Map<String, Object> map) throws Exception;

    SysAuthority findSysAuthorityListById(String id) throws Exception;

    JsonResult saveOrUpdate(SysAuthority pojo) throws Exception;

    JsonResult update(SysAuthority pojo) throws Exception;

    JsonResult del(String id) throws Exception;

    /**
     * 获取系统目录树
     * @param map
     * @return
     * @throws Exception
     */
    JsonResult findMenuTreeList(Map<String, Object> map) throws Exception;
    
    JsonResult findMenuByid(String id) throws Exception;
    
    /**
     * 获取系统左侧菜单
     * @param map
     * @return
     * @throws Exception
     */
    JsonResult findMenuTreeByRoleList(Map<String, Object> map) throws Exception;
    
    /**
     * 角色授权菜单
     * @param map
     * @return
     * @throws Exception
     */
    JsonResult findMenuTreeRoleList(Map<String, Object> map) throws Exception;
    
    JsonResult findMenuByRole(Map<String, Object> map) throws Exception;
    
    
}