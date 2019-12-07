package com.cf.project.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cf.project.mybatis.model.CAttendanceRecord;
import com.cf.project.service.CAttendanceRecordService;
import com.cf.project.service.CAttendanceTimeService;
import com.cf.util.JsonResult;

@Controller
@RequestMapping("/service")
public class ServiceController extends GridController {
	@Autowired
	private CAttendanceRecordService cAttendanceRecordService;
	@Autowired
    private CAttendanceTimeService cAttendanceTimeService;
    /**
     * 考勤设备识别回调地址
     * @param map
     * @param page
     * @return
     */
	@ResponseBody
	@RequestMapping(value = "/sbhd", method = RequestMethod.POST)
	public JsonResult upload(HttpServletRequest req,HttpServletResponse res) {		
		JsonResult result = new JsonResult();
		try {
			String path=req.getParameter("path");//图片
	    	String ip=req.getParameter("ip");//考勤设备IP
	    	String time=req.getParameter("time");//考勤时间
	    	String personId=req.getParameter("personId");//人员ID
	    	String dept_id="";//员工部门id
	    	String date =new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new java.util.Date(Long.parseLong(time)));//转换考勤时间类型
	    	List<Map<String,Object>> list = cAttendanceRecordService.findbm(personId);//查询员工所在部门
	    	if(list.size()>0) {
	    		dept_id=list.get(0).get("department_id").toString();
	    	}
	    	//判断是上班打卡还是下班打卡
	    	String sj =new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date(Long.parseLong(time)));
	    	List<Map<String,Object>> sxblist = cAttendanceRecordService.findsxb(personId,sj);
	    	CAttendanceRecord pojo=new CAttendanceRecord();
	    	//判断上班是否迟到   

			List<Map<String,Object>> fgslist = cAttendanceTimeService.findGsList(personId);//查询员工所在分公司
			String sbsj="";
			String xbsj="";
			if(fgslist.size()>0) {
				String fgsid=fgslist.get(0).get("parent_id").toString();
//				System.out.println("fgsid===="+fgsid);
				List<Map<String,Object>> sxbsjlist = cAttendanceTimeService.findsxbsjList(fgsid);//查询分公司规定上下班时间
				sbsj=sxbsjlist.get(0).get("time_start").toString();
				xbsj=sxbsjlist.get(0).get("time_end").toString();				
//				System.out.println("sbsj===="+sbsj);
//				System.out.println("xbsj===="+xbsj);
			}
	    	if(sxblist.size()==0) {//上班(第一次打卡)
	    		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
				if(sdf.parse(new java.text.SimpleDateFormat("HH:mm").format(new java.util.Date(Long.parseLong(time)))).getTime()>=sdf.parse(sbsj).getTime()) {
					pojo.setType("迟到");
				}else {
					pojo.setType("正常");
				}
	    		pojo.setUserId(personId);
	        	pojo.setSignTime(date);
	        	pojo.setSbdkdd(ip);
	        	pojo.setDeptId(dept_id);        	
				result = cAttendanceRecordService.saveOrUpdate(pojo);
				
	    	}else {//下班(第一次之后的打卡，随时更新，一天的最后一次为下班打卡)
	    		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");
				if(sdf.parse(new java.text.SimpleDateFormat("HH:mm").format(new java.util.Date(Long.parseLong(time)))).getTime()<=sdf.parse(xbsj).getTime()) {
					pojo.setBz("早退");
				}else {
					pojo.setBz("正常");
				}
	    		pojo.setId(sxblist.get(0).get("id").toString());
        		pojo.setUserId(personId);
        		pojo.setOffTime(date);
        		pojo.setXbdkdd(ip);
        		try {
    				result = cAttendanceRecordService.saveOrUpdate(pojo);
    			} catch (Exception e) {
    				e.printStackTrace();
    			} 		
	    	}
    	} catch (Exception e) {
			e.printStackTrace();
		}
        result.setResult("1");
        result.setMessage("true");
		return result;
	}

}