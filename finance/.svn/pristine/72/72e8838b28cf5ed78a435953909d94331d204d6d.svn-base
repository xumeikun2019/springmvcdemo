package com.cf.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


/**
 * 符合easy ui grid 格式的json result<br>
 * @author kingapex
 * @version v1.0
 * 2016年2月16日下午4:33:03
 * @since v6.0
 */
public class GridJsonResult implements Serializable{
	
	public GridJsonResult(){}
	
	public GridJsonResult(EntyPage page){
		
		HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		String draws = request.getParameter("draw");
		draws = ( draws==null ?"1":draws);
		
		this.draw = Long.parseLong(draws);
		this.recordsFiltered= page.getTotalNumber();
		this.recordsTotal= page.getTotalNumber();
		//this.data= (List)page.get;
	}
	
	/**
	 * 带有List参数的构造函数<br>
	 * 填充好total 和rows
	 * @param list
	 */
	public GridJsonResult(List list){
		HttpServletRequest request = ThreadContextHolder.getHttpRequest();
		String draws = request.getParameter("draw");
		draws = ( draws==null ?"1":draws);
		
		this.draw = Long.parseLong(draws);
		this.recordsFiltered= list.size();
		this.recordsTotal= list.size();
		this.data= list;
		
	}
	
	private long draw;			//本页面记录服务器端返回多少次
	
	private long recordsFiltered;	//前端过滤后的条数
	
	private long recordsTotal;	//一共多少条
	
	private List data;
	
	private Object extra = new HashMap<String,Object>();

	public long getDraw() {
		return draw;
	}

	public void setDraw(long draw) {
		this.draw = draw;
	}

	public long getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(long recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public long getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(long recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public Object getExtra() {
		return extra;
	}

	public void setExtra(Object extra) {
		this.extra = extra;
	}
}
