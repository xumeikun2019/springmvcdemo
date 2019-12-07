package com.cf.project.controller;

import com.cf.project.Constants;
import com.cf.project.mybatis.model.CUser;
import com.cf.project.service.CUserService;
import com.cf.project.service.SysDepartmentService;
import com.cf.util.JsonResult;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.security.Principal;
import java.util.Map;

/**
 * 用户管理
 * @author towery
 *
 */
@Controller
@Scope("prototype")
@RequestMapping("/user/admin")
public class UserAdminController extends BaseController {

    @Autowired
	private SysDepartmentService sysDepartmentService;
	    
	
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public JsonResult login(String username, String password, ModelMap model, HttpSession session){
		JsonResult result = new JsonResult();
		try {
			//主体,当前状态为没有认证的状态“未认证”
			Subject subject = SecurityUtils.getSubject();
			// 登录后存放进shiro token
			UsernamePasswordToken token=new UsernamePasswordToken(username,password);

			//登录方法（认证是否通过）
			//使用subject调用securityManager,安全管理器调用Realm
			subject.login(token);
			Map<String,Object> userMap = (Map<String,Object>)subject.getPrincipal();
			String userId = userMap.get("id").toString();
			String deptname = sysDepartmentService.findSysDepartmentByUserId(userId).get("name").toString();
			userMap.put("deptname", deptname);
			String dept = userMap.get("dept").toString();
			session.setAttribute("user",userMap);
			result.setMessage("登录成功");
			result.setData(dept);
		} catch (UnknownAccountException e) {
			result.setResult(Constants.LOGIN_UNKNOWN_ACCOUNT);
		} catch (IncorrectCredentialsException e){
			result.setResult(Constants.LOGIN_PASSWORD_FAIL);
		} catch (Exception e) {
			result.setResult(Constants.OPERATION_FAIL);
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list() {
		return "main/user/list";
	}
}
