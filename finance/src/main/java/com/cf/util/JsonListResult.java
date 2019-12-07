package com.cf.util;


import com.cf.project.Constants;

import java.io.Serializable;
import java.util.*;

/**
 * 用于生成Json格式 结果对象<br>
 * 一般用于一次http的ajax请求的json返回<br>
 * @author towery
 * @version v1.0
 */
public class JsonListResult implements Serializable{
	
	/**
	 * 请求结果
	 */
	private String result = Constants.OPERATION_SUCCESS;

	/**
	 * 数据总数
	 */
	private int count = 0;

	/**
	 * 是否有下一页
	 */
    private boolean hasNextPage = false;

    private int currentPage = 0;

	/**
	 * 每页显示数量
	 */
	private int pagesize = 10;

	/**
	 * 查询出的数据
	 */
    private List list = Collections.emptyList();
    
    private Object extra = new HashMap<String,Object>();
	
	/**
	 * 请求结果信息
	 */
	private String message = "";

	public JsonListResult() {
	}
	
	public JsonListResult(List<Map<String,Object>> list) {
		this.setList(list);
	}
	
	public JsonListResult(EntyPage page, List<Map<String,Object>> list) {
		if (page != null) {
			int total = page.getTotalNumber();
			int currentPage = page.getCurrentPage();
			boolean hasNextPage = page.getHasNextPage();
			int pagesize = page.getPageSize();
			this.setList(list);
			this.setCount(total);
			this.setPagesize(pagesize);
			this.setCurrentPage(currentPage);
			this.setHasNextPage(hasNextPage);
		}
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public boolean isHasNextPage() {
		return hasNextPage;
	}

	public void setHasNextPage(boolean hasNextPage) {
		this.hasNextPage = hasNextPage;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getExtra() {
		return extra;
	}

	public void setExtra(Object extra) {
		this.extra = extra;
	}
}
