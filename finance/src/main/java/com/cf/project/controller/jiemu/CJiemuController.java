package com.cf.project.controller.jiemu;

import com.cf.project.mybatis.model.CJiemu;
import com.cf.project.service.jiemu.CJiemuService;
import com.cf.project.Constants;
import com.cf.project.controller.GridController;
import com.cf.util.EntyPage;
import com.cf.util.GridJsonResult;
import com.cf.util.JsonResult;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/jiemu")
public class CJiemuController extends GridController {
    @Autowired
    private CJiemuService cJiemuService;
    
    
    
    @SuppressWarnings("unchecked")
    @ResponseBody
    @RequestMapping("/list")
    public GridJsonResult listJson(@RequestParam Map<String, Object> map, EntyPage page) {
        GridJsonResult result = null;
		try {
			map.put("page",page);
			List<Map<String,Object>> list = cJiemuService.findCJiemuList(map).getList();
			result = new GridJsonResult(page);
			result.setData(list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
    }

    
    //跳转预览页面
    @RequestMapping("/jmpage")
    public Object jmpage(HttpServletRequest request, HttpSession session){

        ModelAndView mv = new ModelAndView();
//        String classVideo = request.getParameter("classVideo");
//        System.out.println(classVideo);
//        mv.addObject("kitG", classVideo);
        mv.setViewName("main/jiemu/show");
        return mv;
    }
    //跳转预览页面
    @RequestMapping("/openShow")
    public Object openShow(HttpServletRequest request, HttpSession session){
    	
    	ModelAndView mv = new ModelAndView();
        String sucaiIds = request.getParameter("sucaiIds");
//        System.out.println(classVideo);
        sucaiIds = sucaiIds.substring(0, sucaiIds.length()-1);
        sucaiIds = "'"+sucaiIds.replaceAll(",", "','")+"'";
    	mv.addObject("sucaiIds", sucaiIds);
        mv.addObject("flg", 1);
    	mv.setViewName("main/jiemu/show2");
    	return mv;
    }
    //跳转预览页面
    @RequestMapping("/testJM")
    public Object testJM(HttpServletRequest request, HttpSession session){
    	ModelAndView mv = new ModelAndView();
    	
        String url = request.getParameter("url");
        String type = request.getParameter("type");
//        System.out.println(classVideo);
        mv.addObject("url", url);
        mv.addObject("type", type);
    	mv.setViewName("main/jiemu/previewSC");
    	return mv;
    }
    //跳转预览页面
    @RequestMapping("/scpage")
    public Object scpage(HttpServletRequest request, HttpSession session){
    	
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("main/jiemu/scpage");
    	return mv;
    }
    //跳转预览页面
    @RequestMapping("/setJM")
    public Object setJM(HttpServletRequest request, HttpSession session){
    	
    	ModelAndView mv = new ModelAndView();
    	String dates = request.getParameter("dates");
        String times = request.getParameter("times");
        String jmId = request.getParameter("jmId");
        
        mv.addObject("dates", dates);
        mv.addObject("times", times);
    	mv.setViewName("main/jiemu/setjm");
    	return mv;
    }
    
  //跳转预览页面
    @RequestMapping("/preview")
    public Object preview(HttpServletRequest request, HttpSession session){
    	System.out.println("yl");
        ModelAndView mv = new ModelAndView();
        String path = request.getParameter("path");
        String jg = request.getParameter("jg");
        String vvv = request.getParameter("vvv");
        String pdfpath = request.getParameter("pdfpath");
        String pptpath = request.getParameter("pptpath");
        String sctypes = request.getParameter("sctypes");
        String lbType = request.getParameter("lbType");
        
        System.out.println(path+"----------"+jg);
        mv.addObject("path", path);
        mv.addObject("jg", jg);
        mv.addObject("vvv", vvv);
        mv.addObject("pdfpath", pdfpath);
        mv.addObject("pptpath", pptpath);
        mv.addObject("sctypes", sctypes);
        mv.addObject("lbType", lbType);
        mv.setViewName("main/jiemu/preview");
        return mv;
    }
    
    @ResponseBody
    @RequestMapping("/saveJM")
    public JsonResult saveJM(@RequestParam Map<String, Object> map) {
    	System.out.println(map.get("vids"));
    	System.out.println(map.get("jg"));
    	JsonResult result = null;
    	try {
    		result = cJiemuService.saveJM(map);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return result;
    }
    @ResponseBody
    @RequestMapping("/saveJMJH")
    public JsonResult saveJMJH(@RequestParam Map<String, Object> map) {
    	System.out.println(map.get("vids"));
    	System.out.println(map.get("jg"));
    	System.out.println(map.get("dates"));
    	System.out.println(map.get("times"));
    	System.out.println(map.get("jmId"));
    	JsonResult result = null;
    	try {
    		result = cJiemuService.saveJMJH(map);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return result;
    }
    @ResponseBody
    @RequestMapping("/saveJH")
    public JsonResult saveJH(@RequestParam Map<String, Object> map) {
    	System.out.println(map.get("dates"));
    	System.out.println(map.get("times"));
    	JsonResult result = null;
    	try {
    		result = cJiemuService.saveJH(map);
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
    	return result;
    }
    
    @ResponseBody
    @RequestMapping("/deleteJM")
    public JsonResult deleteJM(String id) {
    	System.out.println("id:"+id);
		JsonResult jResult = new JsonResult();
		try {
			jResult = cJiemuService.deleteJM(id);
		} catch (Exception e) {
			jResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jResult;
	}
	/*
	 * @SuppressWarnings("unchecked")
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping("/list") public GridJsonResult listJson(@RequestParam
	 * Map<String, Object> map, EntyPage page) { GridJsonResult result = null; try {
	 * map.put("page",page); List<Map<String,Object>> list =
	 * cJiemuService.findCJiemuList(map).getList(); result = new
	 * GridJsonResult(page); result.setData(list); } catch (Exception e) {
	 * e.printStackTrace(); } return result; }
	 * 
	 * @RequestMapping(value= "/add",method = RequestMethod.GET) public String
	 * add(ModelMap model) { return "main/meetingVerify/add"; }
	 * 
	 * @RequestMapping(value= "/edit",method = RequestMethod.GET) public String
	 * edit(String id, ModelMap model) { try { CJiemu pojo =
	 * cJiemuService.findCJiemuListById(id); model.addAttribute("pojo",pojo); }
	 * catch (Exception e) { e.printStackTrace(); } return
	 * "main/meetingVerify/edit"; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value= "/save",method = RequestMethod.POST, consumes =
	 * "application/json") public JsonResult create(@RequestBody CJiemu pojo) {
	 * JsonResult result = new JsonResult(); try { result =
	 * cJiemuService.saveOrUpdate(pojo); } catch (Exception e) {
	 * result.setResult(Constants.OPERATION_FAIL); e.printStackTrace(); } return
	 * result; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value= "/del",method = RequestMethod.POST) public JsonResult
	 * del(String id) { JsonResult result = new JsonResult(); try { result =
	 * cJiemuService.del(id); } catch (Exception e) {
	 * result.setResult(Constants.OPERATION_FAIL); e.printStackTrace(); } return
	 * result; }
	 */
}