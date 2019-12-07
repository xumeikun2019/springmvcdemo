package com.cf.project.controller;

import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 移动前端管理controller
 * @author towery
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/web")
public class IndexWebController extends BaseController {

	/**
	 * 页面跳转方法
	 * @param page
	 * @param model
	 * @param paramMap
	 * @return
	 */
	@RequestMapping(value = {"/{page}","/{page}/{spage}"}, method = RequestMethod.GET)
	public String skip(@PathVariable("page") String page,@PathVariable(value = "spage",required = false) String spage, ModelMap model,@RequestParam Map<String,Object> paramMap){
		if (paramMap != null) {
			model.addAttribute("param",paramMap);
		}
		String url = "web/" + page;
		if (StringUtils.isNotBlank(spage)) {
			url = url + "/" + spage;
		}
		return url;
	}
}
