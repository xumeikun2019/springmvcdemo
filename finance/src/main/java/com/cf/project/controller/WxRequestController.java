package com.cf.project.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;

import com.sun.jndi.toolkit.url.UrlUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cf.project.Constants;
import com.cf.project.mybatis.model.CMeetingDelay;
import com.cf.project.mybatis.model.CMeetingOrder;
import com.cf.project.mybatis.model.CUser;
import com.cf.project.service.CMeetingDelayService;
import com.cf.project.service.CMeetingOrderService;
import com.cf.project.service.CUserService;
import com.cf.project.service.SysDepartmentService;
import com.cf.project.service.WxRequestService;
import com.cf.util.JsonResult;
import com.cf.util.MD5;
import com.cf.util.SendUtil;

@RestController
@RequestMapping("/wxRequest")
public class WxRequestController {

	@Autowired
	SysDepartmentService sysDepartmentService;

	@Autowired
	WxRequestService wxRequestService;

	@Autowired
	CUserService cUserService;
	
	@Autowired
    private CMeetingOrderService cMeetingOrderService;
	
    @Autowired
    private CMeetingDelayService cMeetingDelayService;

	/**
	 * 获取一级部门
	 */
	@GetMapping("/getDepartment")
	public JsonResult getDepartment(ModelMap map) {

		JsonResult jsonResult = new JsonResult();
		try {
			jsonResult = sysDepartmentService.findSysDepartmentOne();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("调用成功");

		return jsonResult;

	}

	/**
	 * 获取二级部门
	 */
	@GetMapping("/getDepartmentTwo")
	public JsonResult getDepartmentTwo(String id) {

		JsonResult jsonResult = new JsonResult();
		try {
			jsonResult = sysDepartmentService.findSysDepartmentTwo(id);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("调用成功");

		return jsonResult;

	}

	/**
	 * 获取部门人员
	 */
	@GetMapping("/getDepartmentUser")
	public JsonResult getDepartmentUser(String id) {

		JsonResult jsonResult = new JsonResult();
		try {
			jsonResult = sysDepartmentService.findSysDepartmentUser(id);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("调用成功");

		return jsonResult;

	}

	/**
	 * 预约访客
	 */
	@PostMapping("/saveVisitors")
	public JsonResult saveVisitors(@RequestParam Map<String, Object> map) {

		JsonResult jsonResult = new JsonResult();
		try {
			jsonResult = sysDepartmentService.saveVisitors(map);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("调用成功");

		return jsonResult;

	}

	/**
	 * 查询访客
	 */
	@GetMapping("/findVisits")
	public JsonResult findVisits(String weid) {

		JsonResult jsonResult = new JsonResult();
		try {
			jsonResult = sysDepartmentService.findVisits(weid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("调用成功");

		return jsonResult;

	}
	/**
	 * 查询消息
	 */
	@GetMapping("/messages/{openid}")
	public JsonResult findMessages(@PathVariable String openid) {

		JsonResult jsonResult = new JsonResult();
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = wxRequestService.findMessages(openid).getList();
		jsonResult.setData(list);
		return jsonResult;

	}
	

	public static String sendPost(String url, Map<String, String> paramMap) {
		PrintWriter out = null;
		BufferedReader in = null;
		String result = "";
		String param = "";
		Iterator<String> it = paramMap.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			param += key + "=" + paramMap.get(key) + "&";
		}
		param = param.substring(0, param.length() - 1);
		try {
			URL realUrl = new URL(url);
			// 打开和URL之间的连接
			URLConnection conn = realUrl.openConnection();
			// 设置通用的请求属性
			conn.setRequestProperty("accept", "*/*");
			conn.setRequestProperty("connection", "Keep-Alive");
			conn.setRequestProperty("Accept-Charset", "utf-8");
			conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
			// 发送POST请求必须设置如下两行
			conn.setDoOutput(true);
			conn.setDoInput(true);
			// 获取URLConnection对象对应的输出流
			out = new PrintWriter(conn.getOutputStream());
			// 发送请求参数
			out.print(param);
			// flush输出流的缓冲
			out.flush();
			// 定义BufferedReader输入流来读取URL的响应
			in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
		} catch (Exception e) {

		}
		// 使用finally块来关闭输出流、输入流
		finally {
			try {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			} catch (IOException ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * 根据小程序传来的code 返回openID
	 * 
	 * @param code
	 * @return
	 */
	@GetMapping(value = "/login")
	public static JSONObject getSessionKeyOropenid(String code) {
		Map<String, String> requestUrlParam = new HashMap<String, String>();
		requestUrlParam.put("appid", "wxf6895363b78538f5"); // 开发者设置中的appId  
		requestUrlParam.put("secret", "309e638b48c60d5a886d5ee2a33e7398"); // 开发者设置中的appSecret  
		requestUrlParam.put("js_code", code); // 小程序调用wx.login返回的code  
		requestUrlParam.put("grant_type", "authorization_code");// 默认参数 
		JSONObject jsonObject = JSON
				.parseObject(sendPost("https://api.weixin.qq.com/sns/jscode2session", requestUrlParam));
		return jsonObject;
	}

	/**
	 * 发送模板消息
	 * 
	 * @param openId
	 *
	 * @param title 会议名称
	 * @param keyword1 会议时间
	 * @param keyword2 会议地点
	 * @param keyword3 会议主持人
	 * @param keyword4 会议内容
	 * @return
	 */
	@GetMapping(value = "/send")
	public static boolean send(String openId, String title, String keyword1, String keyword2, String keyword3, String keyword4) {
		System.out.println(openId);
		SendUtil sendUtil = new SendUtil();
		boolean result = sendUtil.pushNoticeUtil(openId, title, keyword1, keyword2, keyword3, keyword4);

		return result;
	}


	/**
	 * 小程序绑定员工登录
	 * 
	 * @param user   用户名
	 * @param pwd    密码
	 * @param openId 微信openID
	 * @return
	 */
	@GetMapping(value = "/sign")
	public String sign(String user, String pwd, String openId) {

		Boolean sign = false;
		String role = ""; 
		try {
			role = wxRequestService.sign(user, pwd, openId);
			return role;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println(openId);
		return role;

	}

	/**
	 * REST api 查询访客 待审批
	 * 
	 * @param user 用户名
	 * @return
	 */

	@GetMapping(value = "/approve/{user}")
	public JsonResult getApprove(@PathVariable String user) {

		JsonResult jsonResult = wxRequestService.findVisitByName(user);
		System.out.println(user);

		return jsonResult;

	}

	
	/**
	 * REST api 查询会议 待审批
	 * 
	 * @param user 用户名
	 * @return
	 */

	@GetMapping(value = "/approveMeet")
	public JsonResult getApproveMeet() {
		JsonResult jsonResult = new JsonResult();
		List<Map<String, Object>> list = wxRequestService.findApproveMeet().getList();
		jsonResult.setData(list);
		return jsonResult;

	}
	
	
	
	
	/**
	 * 解除绑定
	 * @param openId
	 * @return
	 */
	@PutMapping(value = "/users/{openId}")
	public JsonResult users(@PathVariable String openId) {

		try {
			JsonResult jsonResult = cUserService.delWechatId(openId);
			return jsonResult;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 根据传来的openID 判断是否登陆过
	 * 
	 * @param openId
	 * @return
	 */
	@GetMapping(value = "/sign/{openId}")
	public JsonResult getUser(@PathVariable String openId) {
		JsonResult jsonResult = new JsonResult();
		try {
			List<Map<String, Object>> list = cUserService.findCUserListByOpenId(openId).getList();
			jsonResult.setData(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonResult;
	}

//	@PutMapping(value = "/approve/{id}/{state}")
//	public JsonResult putApprove (@PathVariable String id, @PathVariable String state) {
//		
//		JsonResult  jsonResult = wxRequestService.updateVisitorStateById(id, state);
//		//System.out.println(user);
//		
//		return jsonResult;
//		
//	}
	/**
	 * 审批访客
	 * @param map
	 * @return
	 */
	@PutMapping(value = "/approve")
	public JsonResult putApprove(@RequestBody Map<String, Object> map) {

		System.out.println(map);
		JsonResult jsonResult = wxRequestService.updateVisitorStateById(map.get("id").toString(),
				map.get("state").toString());

		return jsonResult;

	}
	
	/**
	 * 审批会议
	 * @param map
	 * @return
	 */
	@PutMapping(value = "/approve/{state}/{id}")
	public JsonResult putApproveMeet(@PathVariable("state") String state, @PathVariable("id") String id) {

		
		JsonResult jsonResult = wxRequestService.updateMeetStateById(state, id);

		return jsonResult;

	}
	/**
	 * 查询打卡记录
	 * @param user 用户名
	 * @param date 时间精确到月份   格式 '2019-10'
	 * @return
	 */
	@GetMapping(value = "record")
	public JsonResult getCheckRecord(String user, String date){
		String uid;
		JsonResult jsonResult = new JsonResult();
		try {
			uid = cUserService.findCUserIdByName(user);
			List<Map<String, Object>> list = wxRequestService.findCheckRecordByUidAndDate(uid,date).getList();
			jsonResult.setData(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonResult;
	}
	
	/**
	 * 根据openID 查询人脸照片
	 * @param openid
	 * @return
	 */
	@GetMapping(value = "face")
	public JsonResult getFace(String openid) {
		JsonResult jsonResult = new JsonResult();
		
		try {
			List<Map<String, Object>> list = wxRequestService.findFaceImg(openid).getList();
			jsonResult.setData(list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return jsonResult;
	}
	/**
	 * 上传照片
	 * @param request
	 * @param response
	 * @param user
	 * @return
	 * @throws IOException
	 */
	@RequestMapping(value = "/uploadImage", method = { RequestMethod.POST, RequestMethod.GET })
	public String uploadImage(HttpServletRequest request, HttpServletResponse response, String user)
			throws IOException {
		System.out.println("进入get方法！");
		System.out.println(user);
		MultipartHttpServletRequest req = (MultipartHttpServletRequest) request;
		MultipartFile multipartFile = req.getFile("file");
		String fileName = multipartFile.getOriginalFilename();
		// String realPath = "F:/image";
		String savePath = request.getSession().getServletContext().getRealPath("") + "/" + "face";
		// 检查目录
		File uploadDir = new File(savePath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
			// return getError("上传目录不存在。");
		}

		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		String saveUrl = request.getContextPath() + "/" + "face";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		savePath += "/" + ymd + "/";
		saveUrl += "/" + ymd + "/";
		File dirFile = new File(savePath);
		if (!dirFile.exists()) {
			dirFile.mkdirs();
		}
		try {

			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
			String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
			String imgUrl = saveUrl + newFileName;
			File file = new File(savePath, newFileName);
			multipartFile.transferTo(file);
			String id = cUserService.findCUserIdByName(user);
			CUser cUser = new CUser();
			cUser.setFeature(imgUrl);
			cUser.setId(id);
			cUserService.update(cUser);
			return imgUrl;
		} catch (IOException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 根据日期用户查询会议
	 * @param date
	 * @param user
	 * @return
	 */
	@GetMapping(value = "/meets")
	public JsonResult findMeets(String date, String user) {
		JsonResult jsonResult = new JsonResult();
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = wxRequestService.findMeets(date+"%", user).getList();
		jsonResult.setData(list);
		return jsonResult;
	}
	
	

	/**
	 * 根据会议id查询会议
	 * @param date
	 * @param user
	 * @return
	 */
	@GetMapping(value = "/meets/{id}")
	public JsonResult findMeetsById(@PathVariable("id") String id) {
		JsonResult jsonResult = new JsonResult();
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = wxRequestService.findMeetsById(id).getList();
		jsonResult.setData(list);
		return jsonResult;
	}
	
	/**
	 * 查询本周领导会议
	 * @return
	 */
	
	@GetMapping(value = "/leaderMeets")
	public JsonResult findLeaderMeets(String leaderid) {
		JsonResult jsonResult = new JsonResult();
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = wxRequestService.findLeaderMeets(leaderid).getList();
		
		jsonResult.setData(list);
		return jsonResult;
	}
	/**
	 * 查询下周领导会议
	 * @return
	 */
	@GetMapping(value = "/nextLeaderMeets")
	public JsonResult findLeaderMeetsNext(String leaderid) {
		JsonResult jsonResult = new JsonResult();
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = wxRequestService.findLeaderMeetsNext(leaderid).getList();
		jsonResult.setData(list);
		return jsonResult;
	}
	
	
	/**
	 * 查询本週公司会议
	 * @return
	 */
	@GetMapping(value = "/CompanyMeets")
	public JsonResult findCompanyMeets(String companyid) {
		JsonResult jsonResult = new JsonResult();
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = wxRequestService.findCompanyMeets(companyid).getList();
		jsonResult.setData(list);
		return jsonResult;
	}
	
	
	/**
	 * 查询下週公司会议
	 * @return
	 */
	@GetMapping(value = "/nextCompanyMeets")
	public JsonResult findCompanyMeetsNext(String companyid) {
		JsonResult jsonResult = new JsonResult();
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = wxRequestService.findCompanyMeetsNext(companyid).getList();
		jsonResult.setData(list);
		return jsonResult;
	}
	
	/**
	 * 查询领导
	 * @return
	 */
	@GetMapping(value = "/leaders")
	public JsonResult findLeader() {
		JsonResult jsonResult = new JsonResult();
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = wxRequestService.findLeader().getList();
		jsonResult.setData(list);
		return jsonResult;
	}
	
	
	/**
	 * 判断是否为领导
	 * @param user 用户名
	 * @return
	 */
	@GetMapping(value = "/leader")
	public boolean leader (String user) {
		
		
		boolean isLeader = wxRequestService.findRoleIsleader(user);
		return isLeader;
		
	}
	
	/**
	 * 手机端会议结束
	 * @param id 会议id
	 */
	@GetMapping(value ="/end")
	public String end(String id) {
		String aa="";
		try {
			int pojo = cMeetingOrderService.upMeetingend(id);
			if(pojo==1) {
				aa="OK";
			}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return aa;
	}
	
	/**
	 * 手机端会议延时
	 * @param id 会议id
	 * @param data 延时原因
	 * @param date 延长时间
	 * @return
	 */
	@GetMapping(value ="/delay")
	public JsonResult delay(String id,String data,int date) {
		 JsonResult result = new JsonResult();
			try {
				CMeetingDelay pojo=new CMeetingDelay();
				pojo.setMeetingId(id);
				pojo.setData(data);
				//查询会议结束时间
				List<Map<String,Object>> list = cMeetingOrderService.findMeetingOrderEnddate(id);
				String end_time=list.get(0).get("date").toString();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
				Date dt = sdf.parse(end_time);  
				Calendar rightNow = Calendar.getInstance();  
				rightNow.add(Calendar.MINUTE, date);// 日期加
				pojo.setDate(sdf.format(rightNow.getTime()));  
				result = cMeetingDelayService.saveOrUpdate(pojo);
				//判断延时之后的结束时间是否有下一个会议
				List<Map<String,Object>> lists = cMeetingOrderService.findMeetingOrderhy(id);
				if(lists.size()>0) {//有会议，给下一个会议的会议申请人发送消息
//					send();
				}else {
					
				}
			} catch (Exception e) {
				result.setResult(Constants.OPERATION_FAIL);
				e.printStackTrace();
			}
			return result;
	}
	
	
	@GetMapping(value ="/saveOpenid")
	public JSONObject saveOpenid(String code, String uname, String pwd) {
		
		Map<String, String> requestUrlParam = new HashMap<String, String>();
		requestUrlParam.put("appid", "wxa37dffb91d9418b6"); // 开发者设置中的appId  
		requestUrlParam.put("secret", "b47138c91da394cdbfc3d69fb3c0e05c"); // 开发者设置中的appSecret  
		requestUrlParam.put("code", code); // 小程序调用wx.login返回的code  
		requestUrlParam.put("grant_type", "authorization_code");// 默认参数 
		JSONObject jsonObject = JSON
				.parseObject(sendPost(" https://api.weixin.qq.com/sns/oauth2/access_token", requestUrlParam));
		System.out.println("返回值**********************************");
		System.out.println(jsonObject);
		try {
			@SuppressWarnings("unused")
			Boolean isSuccess = wxRequestService.saveOpenid(jsonObject, uname, pwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonObject;
	}

}
