package com.cf.project.service;

import java.util.List;
import java.util.Map;

import com.cf.project.mybatis.model.CPlace;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

public interface CPlaceService {
    JsonListResult findCPlaceList(Map<String, Object> map) throws Exception;
    
    JsonResult findCPlaceCDeviceListByParentId(Map<String, Object> map) throws Exception;
    
    /**
            * 通过部门查找有使用权限的会议室
     * @param map
     * @return
     * @throws Exception
     */
    JsonResult findCPlaceCroomDeptCMeetingOrderListByDeptId(Map<String, Object> map) throws Exception;
    
    /**
            * 查询人脸识别机器在线状态
     * @param map
     * @return
     * @throws Exception
     */
    JsonResult findCPlaceCDeviceListByTypeParentId(Map<String, Object> map) throws Exception;

    CPlace findCPlaceListById(String id) throws Exception;

    JsonResult saveOrUpdate(CPlace pojo) throws Exception;

    JsonResult update(CPlace pojo) throws Exception;

    JsonResult del(String id) throws Exception;

	JsonResult findTreeList(Map<String, Object> map) throws Exception;

	CPlace findSysDepartmentListById(String id) throws Exception;

	JsonListResult findCplanceByParentIdORlevel(Map<String, Object> map);
	
	JsonResult findCplaceByParentIdORlevel(Map<String, Object> map);

	List<Map<String, Object>> findAllCPlace();
	
	List<Map<String, Object>> findlc(String id);

	JsonResult findFloorMeet()throws Exception;
	//查询监控的参数
	List<Map<String, Object>> findjk();

}