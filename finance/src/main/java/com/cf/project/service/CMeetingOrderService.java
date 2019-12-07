package com.cf.project.service;


import java.util.List;
import java.util.Map;

import com.cf.project.mybatis.model.CMeetingOrder;
import com.cf.project.mybatis.model.CMeetingVerify;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;

public interface CMeetingOrderService {
    JsonListResult findCMeetingOrderList(Map<String, Object> map) throws Exception;

    CMeetingOrder findCMeetingOrderListById(String id) throws Exception;

    JsonResult saveOrUpdate(CMeetingOrder pojo) throws Exception;

    JsonResult update(CMeetingOrder pojo) throws Exception;

    JsonResult del(String id) throws Exception;	

	JsonResult sptg(CMeetingOrder pojo, String string) throws Exception;

	CMeetingOrder view(String id) throws Exception;

	JsonResult qx(String id) throws Exception;

	JsonResult spbtg(CMeetingVerify pojo, String string) throws Exception;

	JsonResult findCdeviceCmeetingOrder(String dataTime, String deviceId) throws Exception;

	JsonListResult findcdeviceCplaceCmeetingOrder(Map<String, Object> map) throws Exception;

	JsonResult updateByState(String id) throws Exception;

	List<Map<String, Object>> findhytx(String userid, String sj);

	List<Map<String, Object>> findCjihuadbsx(String userid);

	JsonListResult findmoreCMeetingOrderList(Map<String, Object> map) throws Exception;

	JsonListResult finddbsxmorelist(Map<String, Object> map) throws Exception;
	/**
	 * 会议签到情况查询
	 * @param map
	 * @return
	 */
	JsonListResult checkInList(Map<String, Object> map) throws Exception;
	/**
	 * 会议签到情况详细
	 * @param map
	 * @return
	 */
	JsonListResult checkInListDetailed(Map<String, Object> map) throws Exception;
	//查询登录人员的角色是部门管理员、分公司领导、总公司领导还是中心领导
	List<Map<String, Object>> findje(String string) throws Exception;
	/**
     * 本周会议室资源统计
     * @param map
     * @param page
     * @return
     */
	JsonListResult findmeetingList(Map<String, Object> map) throws Exception;
	/**
     *下周会议室资源统计
     * @param map
     * @param page
     * @return
     */
	JsonListResult findmeetingListxz(Map<String, Object> map) throws Exception;
	//查询领导
	List<Map<String, Object>> findld() throws Exception;
	/**
     * 本周领导会议统计
     * @param map
     * @param page
     * @return
     */
	JsonListResult findmeetingListld(Map<String, Object> map) throws Exception;
	/**
     * 下周领导会议统计
     * @param map
     * @param page
     * @return
     */
	JsonListResult findmeetingListldxz(Map<String, Object> map) throws Exception;
	/**
     * 本周公司会议统计
     * @param map
     * @param page
     * @return
     */
	JsonListResult findmeetingGsList(Map<String, Object> map) throws Exception;
	/**
     * 下周公司会议统计
     * @param map
     * @param page
     * @return
     */
	JsonListResult findmeetingGsListxz(Map<String, Object> map) throws Exception;
	/**
	 * 我的会议
	 * @param userid
	 * @return
	 */
	List<Map<String, Object>> findwdhy(String userid) throws Exception;

	JsonResult jmshbtg(String id) throws Exception;

	JsonResult jmshtg(String id) throws Exception;
	
	/**
	 * 手机端操作会议结束
	 * @param id
	 * @return
	 */
	int upMeetingend(String id) throws Exception;
	//查询会议结束时间
	List<Map<String, Object>> findMeetingOrderEnddate(String id) throws Exception;
	//判断延时之后的结束时间是否有下一个会议
	List<Map<String, Object>> findMeetingOrderhy(String id) throws Exception;

	
}