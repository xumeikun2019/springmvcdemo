package com.cf.project.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cf.project.Constants;
import com.cf.project.annotation.Cache;
import com.cf.project.annotation.CacheClear;
import com.cf.project.mybatis.dao.CAttendanceRecordMapper;
import com.cf.project.mybatis.dao.CMeetingOrderMapper;
import com.cf.project.mybatis.dao.CMeetingUserMapper;
import com.cf.project.mybatis.dao.CMeetingVerifyMapper;
import com.cf.project.mybatis.dao.CMessageMapper;
import com.cf.project.mybatis.model.CMeetingOrder;
import com.cf.project.mybatis.model.CMeetingUser;
import com.cf.project.mybatis.model.CMeetingVerify;
import com.cf.project.mybatis.model.CMessage;
import com.cf.project.service.CMeetingOrderService;
import com.cf.util.DateTimeUtil;
import com.cf.util.EntyPage;
import com.cf.util.JsonListResult;
import com.cf.util.JsonResult;
import com.cf.util.SendUtil;
import com.cf.util.SessionUtil;


@Service
public class CMeetingOrderServiceImpl implements CMeetingOrderService {
	@Autowired
	private CMeetingOrderMapper cMeetingOrderMapper;
	@Autowired
	private CMeetingUserMapper cMeetingUserMapper;
	@Autowired
	private CMeetingVerifyMapper cMeetingVerifyMapper;
    @Autowired
    private CAttendanceRecordMapper cAttendanceRecordMapper;
    @Autowired
    private CMessageMapper cMessageMapper;

	@Cache
	public JsonListResult findCMeetingOrderList(Map<String, Object> map) throws Exception {

		List<Map<String, Object>> qxlist = cMeetingOrderMapper.findqx(map.get("nameId").toString());

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		if (qxlist.size() > 0) {
			map.put("roleId", qxlist.get(0).get("role_id"));
			if (qxlist.get(0).get("role_id").equals("6178ed4bee1e11e9833900e081bbbd32")) {// 登陆人员为部门管理员--只能查询自己的审批记录
//				list = cMeetingOrderMapper.findBybmHDPage(map);
				list = cMeetingOrderMapper.findByHDPage(map);
			} else if (qxlist.get(0).get("role_id").equals("758e47ccee1e11e9833900e081bbbd32")) {// 登陆人员为会服人员(会议室管理员)--对所有会议室申请进行审批
				list = cMeetingOrderMapper.findByhfHDPage(map);
			}
		} else {// 其他人员只能查询自己的审批记录
			list = cMeetingOrderMapper.findByHDPage(map);
		}
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
	
	/**
     * 本周会议室资源统计
     * @param map
     * @param page
     * @return
     */
	@Cache
	public JsonListResult findmeetingList(Map<String, Object> map) throws Exception {

//		List<Map<String, Object>> qxlist = cMeetingOrderMapper.findqx(map.get("nameId").toString());
		List<Map<String,Object>> list = cMeetingOrderMapper.findmeetingListByHDPage(map);
		
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
	
	/**
     * 下周会议室资源统计
     * @param map
     * @param page
     * @return
     */
	@Cache
	public JsonListResult findmeetingListxz(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> list = cMeetingOrderMapper.findmeetingListxzByHDPage(map);		
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
	
	/**
     *本周领导会议统计
     * @param map
     * @param page
     * @return
     */
	@Cache
	public JsonListResult findmeetingListld(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> list = cMeetingOrderMapper.findmeetingListldByHDPage(map);		
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
	
	/**
     * 下周领导会议统计
     * @param map
     * @param page
     * @return
     */
	@Cache
	public JsonListResult findmeetingListldxz(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> list = cMeetingOrderMapper.findmeetingListldxzByHDPage(map);		
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
    /**
     * 本周公司会议统计
     * @param map
     * @param page
     * @return
     */
	@Cache
	public JsonListResult findmeetingGsList(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> list = cMeetingOrderMapper.findmeetingGsListByHDPage(map);		
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
	/**
     * 下周公司会议统计
     * @param map
     * @param page
     * @return
     */
	@Cache
	public JsonListResult findmeetingGsListxz(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> list = cMeetingOrderMapper.findmeetingGsListxzByHDPage(map);		
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
	/**
	 * 待办事宜更多
	 */
	@Cache
	public JsonListResult finddbsxmorelist(Map<String, Object> map) throws Exception {
//		List<Map<String,Object>> list = cMeetingOrderMapper.finddbsxmoreByHDPage(map);
		
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
    	List<Map<String, Object>> qxlist = cMeetingOrderMapper.findqx(map.get("userid").toString());
    	List<Map<String,Object>> bmlist = cAttendanceRecordMapper.findbm(map.get("userid").toString());//查询员工所在的部门
    	List<Map<String, Object>> shlist = cMeetingOrderMapper.findshqx(map.get("userid").toString());//查询可以节目审核的部门
    	if (qxlist.size() > 0) {
			if (qxlist.get(0).get("role_id").equals("758e47ccee1e11e9833900e081bbbd32")) {// 登陆人员为部门管理员--对自己部门下的会议室申请进行审批
				//综合部管理员有权限对节目进行审核								
				String aa="1";
				for(int i=0;i<shlist.size();i++) {
					if(bmlist.get(0).get("department_id").equals(shlist.get(i).get("depid"))) {
						aa="2";
						break;
					}
				}
				if(aa=="1") {
					list = cMeetingOrderMapper.finddbsxbmHDPage(map);
				}else {
					list = cMeetingOrderMapper.finddbsxbm1HDPage(map);
				}
				
			}else {
				String aa="1";
				for(int i=0;i<shlist.size();i++) {
					if(bmlist.get(0).get("department_id").equals(shlist.get(i).get("depid"))) {
						aa="2";
						break;
					}
				}
				if(aa=="1") {

				}else {
					list = cMeetingOrderMapper.finddbsxbm1HDPage(map);
				}
			}
		} else {// 其他人员只能查询自己的审批记录
			list = cMeetingOrderMapper.finddbsxHDPage(map);
		}

		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
	
	@Cache
	public JsonListResult findmoreCMeetingOrderList(Map<String, Object> map) throws Exception {

//		List<Map<String, Object>> qxlist = cMeetingOrderMapper.findqx(map.get("nameId").toString());
		List<Map<String,Object>> list = cMeetingOrderMapper.findmoreByHDPage(map);
		
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
	/**
	 * 会议签到情况查询
	 */
	@Cache
	public JsonListResult checkInList(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> list = cMeetingOrderMapper.findcheckInListByHDPage(map);		
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
	/**
	 * 会议签到情况详细
	 */
	@Cache
	public JsonListResult checkInListDetailed(Map<String, Object> map) throws Exception {
		List<Map<String,Object>> list = cMeetingOrderMapper.findcheckInDetailedListByHDPage(map);		
		EntyPage page = (EntyPage) map.get("page");
		JsonListResult jsonResult = new JsonListResult(page, list);
		return jsonResult;
	}
	
	@Cache
	public CMeetingOrder view(String id) throws Exception {
		return this.cMeetingOrderMapper.view(id);
	}

	//查询会议结束时间
	@Cache
	public List<Map<String, Object>> findMeetingOrderEnddate(String id) throws Exception {
		List<Map<String,Object>> list = cMeetingOrderMapper.findMeetingOrderEnddate(id);		
		return list;
	}
	
	//判断延时之后的结束时间是否有下一个会议
	@Cache
	public List<Map<String, Object>> findMeetingOrderhy(String id) throws Exception {
		List<Map<String,Object>> list = cMeetingOrderMapper.findMeetingOrderhy(id);		
		return list;
	}

	@Cache
	public CMeetingOrder findCMeetingOrderListById(String id) throws Exception {
		return this.cMeetingOrderMapper.selectByPrimaryKey(id);
	}
	
	//查询登录人员的角色是部门管理员、分公司领导、总公司领导还是中心领导
	@Cache
	public List<Map<String, Object>> findje(String id) throws Exception {
		List<Map<String,Object>> list = cMeetingOrderMapper.findje(id);		
		return list;
	}	
	
	/**
	 * 手机端会议结束
	 */
	@CacheClear
	public int upMeetingend(String id) throws Exception {
		int result =cMeetingOrderMapper.upMeetingend(id);
		return result;		
	}
	/**
	 * 审批通过
	 */
	@CacheClear
	public JsonResult sptg(CMeetingOrder pojo, String userid) throws Exception {
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		int result = 0;
		JsonResult jsonResult = new JsonResult();
		CMeetingVerify pojo1 = new CMeetingVerify();
		pojo1.setMeetingId(pojo.getId());
		pojo1.setUserId(userid);
		pojo1.setState("T");
		pojo1.setAddTime(dateTime);
		pojo1.setLastTime(dateTime);
		result = cMeetingVerifyMapper.insertSelective(pojo1);
		result = cMeetingOrderMapper.updatezt(pojo.getId(), "3");
		/*
		if (pojo.getMeetingStep().equals("1")) {
			result = cMeetingOrderMapper.updatezt(pojo.getId(), "2");
		} else {
			result = cMeetingOrderMapper.updatezt(pojo.getId(), "3");
		}*/
		SendUtil sendUtil = new SendUtil();					
		List<Map<String, Object>> chrylist = cMeetingOrderMapper.findchry(pojo.getId());//查询参会人员的openId(领导和普通人员)
//		List<Map<String, Object>> hyddlist = cMeetingOrderMapper.findhydd(pojo.getOrderPlaceId());//查询会议地址
		//循环遍历参会人员为其推送
		for(int m=0;m<chrylist.size();m++) {
			sendUtil.pushNoticeUtil(chrylist.get(m).get("open_id").toString(), pojo.getMeetingName(), pojo.getTimeStart()+"-"+pojo.getTimeEnd().substring(11, pojo.getTimeEnd().length()-1),pojo.getOrderPlaceId(), pojo.getOrderZcrId(), pojo.getMeetingName());
			//往推送信息表里插入信息
			CMessage messagepojo=new CMessage();
			messagepojo.setOpenid(chrylist.get(m).get("open_id").toString());
			messagepojo.setType("1");
			messagepojo.setContent("会议名称："+pojo.getMeetingName()+";会议时间："+pojo.getTimeStart()+"-"+pojo.getTimeEnd().substring(11, pojo.getTimeEnd().length()-1)+";会议地点："+pojo.getOrderPlaceId()+";会议主持人："+pojo.getOrderZcrId());
			messagepojo.setAddTime(dateTime);
			messagepojo.setLastTime(dateTime);
			result = cMessageMapper.insertSelective(messagepojo);
		}
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	@CacheClear
	public JsonResult spbtg(CMeetingVerify pojo, String userid) throws Exception {
		JsonResult jsonResult = new JsonResult();
		if (pojo != null) {
			String id = pojo.getId();
			int result = 0;
			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
			if (StringUtils.isNotBlank(id)) {
				pojo.setLastTime(dateTime);
				result = cMeetingVerifyMapper.updateByPrimaryKeySelective(pojo);
			} else {
				pojo.setAddTime(dateTime);
				pojo.setLastTime(dateTime);
				result = cMeetingVerifyMapper.insertSelective(pojo);
				result = cMeetingOrderMapper.updatezt(pojo.getMeetingId(), "0");
			}
			if (result == 0) {
				jsonResult.setResult(Constants.OPERATION_FAIL);
			}
		}
		return jsonResult;
	}

	@CacheClear
	public JsonResult saveOrUpdate(CMeetingOrder pojo) throws Exception {
		JsonResult jsonResult = new JsonResult();
		if (pojo != null) {
			String id = pojo.getId();
			int result = 0;
			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
			pojo.setOrderUserId(usermap.get("id").toString());
			// 判断预约时间是否冲突
			List<Map<String, Object>> list = cMeetingOrderMapper.findtime(pojo.getTimeEnd(), pojo.getTimeStart(),
					pojo.getOrderPlaceId());
			if (list.size() > 0) {
				jsonResult.setResult(Constants.OPERATION_FAIL);
				jsonResult.setMessage("预约时间和" + list.get(0).get("meeting_name") + "有冲突!");
				return jsonResult;
			}
			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
			if (StringUtils.isNotBlank(id)) {
				pojo.setLastTime(dateTime);
				result = cMeetingOrderMapper.updateByPrimaryKeySelective(pojo);
			} else {
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				pojo.setAddTime(dateTime);
				pojo.setLastTime(dateTime);
//				pojo.setOrderDeptId(pojo.getOrderDeptId().substring(0, pojo.getOrderDeptId().length() - 1));
				if (pojo.getAuditType().equals("auto")) {
					pojo.setMeetingStep("3");
				} else {
					pojo.setMeetingStep("1");
				}
				pojo.setId(uuid);				
				String[] participant = pojo.getState().split(",");
				pojo.setState("T");
				pojo.setYzm((((int)(Math.random()*9+1)*1000))+"");
//				System.out.println((int)((Math.random()*9+1)*1000));
				List<Map<String, Object>> tslist = cMeetingOrderMapper.findtslist(id);//查询会议资料删除时间(天)
				pojo.setZlscsj(tslist.get(0).get("date").toString());//会议资料删除时间(天)
				result = cMeetingOrderMapper.insertSelective(pojo);
				//往参会人员表里添加普通人员信息
				for (int i = 0; i < participant.length; i++) {
					CMeetingUser pojo1 = new CMeetingUser();
					pojo1.setMeeting(pojo.getId());
					pojo1.setUser(participant[i]);
					pojo1.setType("1");
					cMeetingUserMapper.insertSelective(pojo1);
				}
				//往参会人员表里添加参会领导信息
				if(pojo.getOrderLduserId()!=null) {
					String[] chld = pojo.getOrderLduserId().split(",");
					for (int i = 0; i < chld.length; i++) {
						CMeetingUser pojo1 = new CMeetingUser();
						pojo1.setMeeting(pojo.getId());
						pojo1.setUser(chld[i]);
						pojo1.setType("0");
						cMeetingUserMapper.insertSelective(pojo1);
					}
				}
				
				// 往审核表里插入数据
				/*
				 * CMeetingVerify pojo1=new CMeetingVerify(); pojo1.setMeetingId(uuid);
				 * pojo1.setState("W"); pojo1.setAddTime(dateTime); pojo1.setLastTime(dateTime);
				 * result = cMeetingVerifyMapper.insertSelective(pojo1);
				 */
//				System.out.println("pojo.getAuditType()=="+pojo.getAuditType());
				if ("auto".equals(pojo.getAuditType())) {// 自动审核，开始推送
					SendUtil sendUtil = new SendUtil();					
					List<Map<String, Object>> chrylist = cMeetingOrderMapper.findchry(pojo.getId());//查询参会人员的openId(领导和普通人员)
					List<Map<String, Object>> hyddlist = cMeetingOrderMapper.findhydd(pojo.getOrderPlaceId());//查询会议地点
					//循环遍历参会人员为其推送会议通知
					for(int m=0;m<chrylist.size();m++) {
						sendUtil.pushNoticeUtil(chrylist.get(m).get("open_id").toString(), pojo.getMeetingName(), pojo.getTimeStart()+"-"+pojo.getTimeEnd().substring(11, pojo.getTimeEnd().length()-1),hyddlist.get(0).get("name").toString(), pojo.getOrderZcrId(), pojo.getMeetingName());
						//往推送信息表里插入信息
						CMessage messagepojo=new CMessage();
						messagepojo.setOpenid(chrylist.get(m).get("open_id").toString());
						messagepojo.setType("1");
						messagepojo.setContent("会议名称："+pojo.getMeetingName()+";会议时间："+pojo.getTimeStart()+"-"+pojo.getTimeEnd().substring(11, pojo.getTimeEnd().length()-1)+";会议地点："+hyddlist.get(0).get("name").toString()+";会议主持人："+pojo.getOrderZcrId());
						messagepojo.setAddTime(dateTime);
						messagepojo.setLastTime(dateTime);
						result = cMessageMapper.insertSelective(messagepojo);
					}
				}
			}
			if (result == 0) {
				jsonResult.setResult(Constants.OPERATION_FAIL);
			}
		}
		return jsonResult;
	}

	@CacheClear
	public JsonResult update(CMeetingOrder pojo) throws Exception {
		JsonResult jsonResult = new JsonResult();
		Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
		pojo.setLastTime(dateTime);
		int result = cMeetingOrderMapper.updateByPrimaryKeySelective(pojo);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	@CacheClear
	public JsonResult qx(String id) throws Exception {
		JsonResult jsonResult = new JsonResult();
		int result = 0;
		result = cMeetingOrderMapper.qx(id);
		//给参会人员发送会议取消通知
		List<Map<String, Object>> list = cMeetingOrderMapper.findlist(id);//根据id查询会议信息
		SendUtil sendUtil = new SendUtil();					
//		List<Map<String, Object>> chrylist = cMeetingOrderMapper.findchry(pojo.getId());//查询参会人员的openId(领导和普通人员)
//		List<Map<String, Object>> hyddlist = cMeetingOrderMapper.findhydd(pojo.getOrderPlaceId());//查询会议地点
		//循环遍历参会人员为其推送会议取消通知
		for(int m=0;m<list.size();m++) {
			sendUtil.pushNoticeUtil(list.get(m).get("open_id").toString(), list.get(m).get("meeting_name").toString(), list.get(m).get("time").toString(),list.get(0).get("name").toString(), list.get(m).get("order_zcr_id").toString(), list.get(m).get("meeting_name").toString());
			//往推送信息表里插入信息
			CMessage messagepojo=new CMessage();
			messagepojo.setOpenid(list.get(m).get("open_id").toString());
			messagepojo.setType("4");
			messagepojo.setContent("会议名称："+list.get(m).get("meeting_name").toString()+";会议时间："+list.get(m).get("time").toString()+";会议地点："+list.get(0).get("name").toString()+";会议主持人："+list.get(m).get("order_zcr_id").toString());
			Date dateTime = DateTimeUtil.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss");
			messagepojo.setAddTime(dateTime);
			messagepojo.setLastTime(dateTime);
			result = cMessageMapper.insertSelective(messagepojo);
		}
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	@CacheClear
	public JsonResult del(String id) throws Exception {
		JsonResult jsonResult = new JsonResult();
		int result = 0;
		if (StringUtils.contains(id, ",")) {
			String[] idsArr = id.split(",");
			if (idsArr.length > 0) {
				for (String idArr : idsArr) {
					result = cMeetingOrderMapper.deleteByPrimaryKey(idArr);
					if (result == 0) {
						break;
					}
				}
			}
		} else {
			result = cMeetingOrderMapper.deleteByPrimaryKey(id);
		}
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
	}

	@Cache
	public JsonResult findCdeviceCmeetingOrder(String dataTime, String deviceId) throws Exception {
		JsonResult jsonResult = new JsonResult();
		Map<String, Object> map = cMeetingOrderMapper.findCdeviceCmeetingOrder(dataTime, deviceId);
		if (map != null) {
			// 获取会议的开始结束时间
			String timeStart = (String) map.get("timeStart");
			String timeEnd = (String) map.get("timeEnd");
			if (!StringUtils.isEmpty(timeStart) && !StringUtils.isEmpty(timeEnd)) {
				// 获取当前系统时间
				long CurrDateTime = DateTimeUtil
						.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss").getTime();
				// 时间格式解析
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				long starTtime = dateFormat.parse(timeStart).getTime();
				long endTtime = dateFormat.parse(timeEnd).getTime();
				// 当前时间和会议时间比较
				if (CurrDateTime < starTtime) {
					map.put("meetingState", "会议未开始");
				} else if (CurrDateTime > endTtime) {
					map.put("meetingState", "会议已结束");
				} else {
					map.put("meetingState", "会议进行中");
				}
			}
			jsonResult.setData(map);
		}else {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			jsonResult.setMessage("无相关信息!");
		}
		return jsonResult;
	}

	@CacheClear
	public JsonListResult findcdeviceCplaceCmeetingOrder(Map<String, Object> map) throws Exception {

		// 根据设备id 获取会议内容
		List<Map<String, Object>> list = cMeetingOrderMapper.findcdeviceCplaceCmeetingOrderHDPage(map);
		JsonListResult jsonListResult = null;
		EntyPage page = null;
		if (!list.isEmpty()) {
			//获得迭代器
			ListIterator<Map<String,Object>> listIterator = list.listIterator();
			while(listIterator.hasNext()) {
				Map<String, Object> meet = listIterator.next();
				// 获取会议的开始结束时间
				String timeStart = (String) meet.get("dataTime");
				String timeEnd = (String) meet.get("dataTimeEnd");
				// 获取当前系统时间
				long CurrDateTime = DateTimeUtil
						.getFormatDateTime(DateTimeUtil.getCurrDateTimeStr(), "yyyy-MM-dd HH:mm:ss").getTime();
				// 时间格式解析
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				long starTtime = dateFormat.parse(timeStart).getTime();
				long endTtime = dateFormat.parse(timeEnd).getTime();
				// 当前时间和会议时间比较
				if (CurrDateTime < starTtime) {
					meet.put("meetingState", "会议未开始");
				} else if (CurrDateTime > starTtime && CurrDateTime < endTtime) {
					meet.put("meetingState", "会议进行中");
				}else {
					listIterator.remove();
					continue;
				}
				String dataTime = (String) meet.get("dataTime");
				String subDataTime = StringUtils.substring(dataTime, 0, 10);
				meet.put("dataTime", subDataTime);
			}
			
			page = (EntyPage) map.get("page");
			jsonListResult = new JsonListResult(page, list);

		}else {
			page = (EntyPage) map.get("page");
			jsonListResult = new JsonListResult(page, list);
			jsonListResult.setResult(Constants.OPERATION_FAIL);
		}
		
		return jsonListResult;
	}

	@CacheClear
	public JsonResult updateByState(String id) throws Exception {
		JsonResult jsonResult = new JsonResult();
		CMeetingOrder cMeetingOrder = new CMeetingOrder();
		cMeetingOrder.setId(id);
		cMeetingOrder.setState("E");
		int flag = cMeetingOrderMapper.updateByPrimaryKeySelective(cMeetingOrder);
		if (flag == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
			jsonResult.setMessage("操作失败!");
			return jsonResult;
		}
		jsonResult.setMessage("操作成功!");
		return jsonResult;

	}
	 /**
     * 我的会议
     */
    @Cache
    public List<Map<String,Object>> findwdhy(String userid){
    	List<Map<String,Object>> list = cMeetingOrderMapper.findwdhy(userid);
		return list;
    }
    /**
     * 当前人员的会议提醒
     */
    @Cache
    public List<Map<String,Object>> findhytx(String userid,String sj){
    	List<Map<String,Object>> list = cMeetingOrderMapper.findhytx(userid,sj);
		return list;
    }
    /**
     * 当前人员的待办事项
     */
    @Cache
    public List<Map<String,Object>> findCjihuadbsx(String userid){
    	List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
    	List<Map<String, Object>> qxlist = cMeetingOrderMapper.findqx(userid);
    	List<Map<String,Object>> bmlist = cAttendanceRecordMapper.findbm(userid);//查询员工所在的部门
    	List<Map<String, Object>> shlist = cMeetingOrderMapper.findshqx(userid);//查询可以节目审核的部门
//    	System.out.println("======"+qxlist.get(0).get("role_id"));
    	if (qxlist.size() > 0) {
			if (qxlist.get(0).get("role_id").equals("758e47ccee1e11e9833900e081bbbd32")) {// 登陆人员为部门管理员--对自己部门下的会议室申请进行审批
				//综合部管理员有权限对节目进行审核								
				String aa="1";
				for(int i=0;i<shlist.size();i++) {
					if(bmlist.get(0).get("department_id").equals(shlist.get(i).get("depid"))) {
						aa="2";
						break;
					}
				}
				if(aa=="1") {
//					System.out.println("11111111");
					list = cMeetingOrderMapper.finddbsxbm(userid);
				}else {
//					System.out.println("2222222222");
					list = cMeetingOrderMapper.finddbsxbm1(userid);
				}
				
			}else {
				String aa="1";
				for(int i=0;i<shlist.size();i++) {
//			    	System.out.println(bmlist.get(0).get("department_id")+"====="+shlist.get(i).get("depid"));
					if(bmlist.get(0).get("department_id").equals(shlist.get(i).get("depid"))) {
						aa="2";
						break;
					}
				}
				if(aa=="1") {
//					System.out.println("11111111");
//					list = cMeetingOrderMapper.finddbsxbm(userid);
				}else {
//					System.out.println("2222222222");
					list = cMeetingOrderMapper.finddbsxbm1(userid);
				}
			}
		} else {// 其他人员只能查询自己的审批记录
//			System.out.println("333333333333");
			list = cMeetingOrderMapper.finddbsx(userid);
		}    	
		return list;
    }
    
    /**
     *查询领导
     */
    @Cache
    public List<Map<String,Object>> findld(){
    	List<Map<String,Object>> list = cMeetingOrderMapper.findld();
		return list;
    }
    /**
     * 节目审核通过
     * @param id
     * @return
     */
    @CacheClear
	public JsonResult jmshtg(String id) throws Exception {
    	JsonResult jsonResult = new JsonResult();
		int result = cMeetingOrderMapper.jmshtg(id);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
    }
    
    /**
     * 节目审核不通过
     * @param id
     * @return
     */
    @CacheClear
	public JsonResult jmshbtg(String id) throws Exception {
    	JsonResult jsonResult = new JsonResult();
		int result = cMeetingOrderMapper.jmshbtg(id);
		if (result == 0) {
			jsonResult.setResult(Constants.OPERATION_FAIL);
		}
		return jsonResult;
    }
}