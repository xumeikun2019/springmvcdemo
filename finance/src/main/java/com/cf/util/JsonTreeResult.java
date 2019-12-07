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
public class JsonTreeResult implements Serializable{
	
	/**
	 * 请求结果
	 */
//	private int code = 0;
//	
	
	
	
	/**
	 * 请求的返回数据对象，也将被转为json格式
	 */
	private Object data = new HashMap<String,Object>();


	

	
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
//	public int getCode() {
//		return code;
//	}
//	public void setCode(int code) {
//		this.code = code;
//	}

}
