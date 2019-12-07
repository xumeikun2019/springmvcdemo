package com.cf.util;


import com.cf.project.Constants;

import java.io.Serializable;
import java.util.HashMap;

/**
 * 用于生成Json格式 结果对象<br>
 * 一般用于一次http的ajax请求的json返回<br>
 * json格式：<br>
 * {"result":1,"message":""}或<br>
 * {"result":1,"data":""}或<br>
 * @author towery
 * @version v1.0
 */
public class JsonResult implements Serializable{
	
	/**
	 * 请求结果
	 */
	private String result = Constants.OPERATION_SUCCESS;
	
	
	/**
	 * 请求结果信息
	 */
	private String message = "";
	
	
	/**
	 * 请求的返回数据对象，也将被转为json格式
	 */
	private Object data = new HashMap<String,Object>();


	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}

}
