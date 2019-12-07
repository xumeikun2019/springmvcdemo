package com.cf.project.controller;

import com.cf.project.mybatis.model.CAttendanceRecord;
import com.cf.project.service.CAttendanceRecordService;
import com.cf.project.service.CPlaceService;
import com.cf.project.Constants;
import com.cf.project.controller.GridController;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import com.cf.util.SessionUtil;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/main/attendanceRecord")
public class CAttendanceRecordController extends GridController {
    @Autowired
    private CAttendanceRecordService cAttendanceRecordService;
	@Autowired
	private CPlaceService cPlaceService;
    /**
     * 部门考勤表
     * @param map
     * @param page
     * @return
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page,String depid,String sj) {
        GridJsonResult result = null;
        System.out.println("sj====="+sj);
		try {
			map.put("page",page);
			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
			map.put("nameId", usermap.get("id").toString());
			if(depid==null) {
				List<Map<String,Object>> pmlist = cAttendanceRecordService.findbm(usermap.get("id").toString());
				String bmid=pmlist.get(0).get("department_id").toString();
				map.put("depId", bmid);
			}else {
				map.put("depId", depid);
			}
			if(sj==null) {
				
			}else {
				map.put("time", sj);
			}
			if(map.get("time")==null) {
				Date date = new Date();
				SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM");
				map.put("time", dateFormat.format(date));
			}
			List<Map<String,Object>> list = cAttendanceRecordService.findCAttendanceRecordList(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }
    /**
     * 分公司考勤表
     * @param map
     * @param page
     * @return
     */
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/companylist")
    public GridJsonResult companylistJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			Map<String, Object> usermap = (Map<String, Object>) SessionUtil.getSessionAttr("user");
			map.put("nameId", usermap.get("id").toString());
			if(map.get("time")==null) {
				Date date = new Date();
				SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM");
				map.put("time", dateFormat.format(date));
			}
			List<Map<String,Object>> list = cAttendanceRecordService.findCompanyAttList(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }

    @RequestMapping(value= "/add",method = RequestMethod.GET)
    public String add(ModelMap model) {
        return "main/attendanceRecord/add";
    }

    @RequestMapping(value= "/edit",method = RequestMethod.GET)
    public String edit(String id, ModelMap model) {
        try {
			CAttendanceRecord pojo = cAttendanceRecordService.findCAttendanceRecordListById(id);
			model.addAttribute("pojo",pojo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "main/attendanceRecord/edit";
    }

    @ResponseBody
    @RequestMapping(value= "/save",method = RequestMethod.POST, consumes = "application/json")
    public JsonResult create(@RequestBody CAttendanceRecord pojo) {
        JsonResult result = new JsonResult();
		try {
			 result = cAttendanceRecordService.saveOrUpdate(pojo);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }

    @ResponseBody
    @RequestMapping(value= "/del",method = RequestMethod.POST)
    public JsonResult del(String id) {
        JsonResult result = new JsonResult();
		try {
			 result = cAttendanceRecordService.del(id);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
    /**
     * 查询人员所在部门(id和名称)
     */
    @ResponseBody
    @RequestMapping(value= "/findbm1",method = RequestMethod.POST)
    public JsonResult findbm1(String id) {
    	JsonResult result = new JsonResult();
		try {
			List<Map<String,Object>> list = cAttendanceRecordService.findbm1(id);
			result.setData(list);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
    
    /**
     * 查询人员所在部门
     */
    @ResponseBody
    @RequestMapping(value= "/findbm",method = RequestMethod.POST)
    public JsonResult findbm(String id) {
    	JsonResult result = new JsonResult();
		try {
			List<Map<String,Object>> list = cAttendanceRecordService.findbm(id);
			result.setData(list);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
    /**
     * 查询是上班还是下班
     */
    @ResponseBody
    @RequestMapping(value= "/findsxb",method = RequestMethod.POST)
    public JsonResult findsxb(String id,String sj) {
    	JsonResult result = new JsonResult();
		try {
			List<Map<String,Object>> list = cAttendanceRecordService.findsxb(id,sj);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
    /**
     * 查询考勤信息
     */
    @ResponseBody
    @RequestMapping(value= "/findkqxx",method = RequestMethod.POST)
    public JsonResult findkqxx(String id,String sj) {
    	JsonResult result = new JsonResult();
		try {
			List<Map<String,Object>> list = cAttendanceRecordService.findkqxx(id,sj);
			result.setData(list);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
	/**
     * 查询人员所在楼层(id)
     */
    @ResponseBody
    @RequestMapping(value= "/findlc",method = RequestMethod.POST)
    public JsonResult findlc(String id) {
    	id=id.substring(0, id.length()-1);
    	JsonResult result = new JsonResult();
		try {
			List<Map<String,Object>> list = cAttendanceRecordService.findlc(id);
			result.setData(list);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return result;
    }
}