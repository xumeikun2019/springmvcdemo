package com.cf.project.controller.app;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cf.project.Constants;
import com.cf.project.controller.BaseController;
import com.cf.project.service.CPlaceService;
import com.cf.util.JsonListResult;

@RestController
@RequestMapping("/app/plance")
public class CPlanceController extends BaseController {
	
	@Autowired
	private CPlaceService cPlaceService;
	/**
	 * 根据level或者parentId查询地点
	 * @param map
	 * @return
	 */
	@RequestMapping(value = "/findByParam", method = RequestMethod.POST)
	public JsonListResult findCplanceByParentIdORlevel( @RequestParam Map<String,Object> map) {
		JsonListResult jsonListResult = new JsonListResult();
		try {
			jsonListResult = cPlaceService.findCplanceByParentIdORlevel(map);
		} catch (Exception e) {
			jsonListResult.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}
		return jsonListResult;
	}
}
