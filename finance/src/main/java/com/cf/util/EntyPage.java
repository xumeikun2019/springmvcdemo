package com.cf.util;

/**
 * 分页对应的实体类
 */
public class EntyPage implements java.io.Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1173808L;
	/**
	 * 总条数
	 */
	private int totalNumber;
	/**
	 * 当前第几页
	 */
	private int currentPage;
	/**
	 * 总页数
	 */
	private int totalPage;
	/**
	 * 每页显示条数
	 */
	private int pageSize = 20;
	/**
	 * 数据库中limit的参数，从第几条开始取
	 */
	private int dbOffset;
	/**
	 * 数据库中limit的参数，一共取多少条
	 */
	private int dbSize;
	/**
	 * 有下一页
	 */
	private Boolean hasNextPage;

	/**
	 * 有上一页
	 */
	private Boolean hasLastPage;
	/**
	 * 下一页
	 */
	private Integer nextPage;
	/**
	 * 上一页
	 */
	private Integer lastPage;

	// 该页是否有下一页.
	public Boolean getHasNextPage() {
		hasNextPage = currentPage < totalPage;
		return hasNextPage;
	}

	// 该页是否有上一页.
	public Boolean getHasLastPage() {
		hasLastPage = currentPage > 1;
		return hasLastPage;
	}

	// 获取上一页页数
	public int getLastPage() {
		if (getHasLastPage()) {
			lastPage = currentPage - 1;
		} else {
			lastPage = currentPage;
		}
		return lastPage;
	}

	public int getNextPage() {
		if (getHasNextPage()) {
			nextPage = currentPage + 1;
		} else {
			nextPage = currentPage;
		}
		return nextPage;
	}

	/**
	 * 根据当前对象中属性值计算并设置相关属性值
	 */

	public void count() {
		// 计算总页数
		int totalPageTemp = this.totalNumber / this.pageSize;
		int plus = (this.totalNumber % this.pageSize) == 0 ? 0 : 1;
		totalPageTemp = totalPageTemp + plus;
		if (totalPageTemp <= 0) {
			totalPageTemp = 1;
		}
		this.totalPage = totalPageTemp;

		// 当前页数小于1设置为1
		if (this.currentPage < 1) {
			this.currentPage = 1;
		}

		// 设置limit的参数
		this.dbOffset = (this.currentPage - 1) * this.pageSize;
		this.dbSize = this.pageSize;
	}

	public int getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;

		// 兼容dataTable分页模式
		if (currentPage == 0) {
			this.dbSize = this.pageSize;
		} else {
			this.count();
		}
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getDbOffset() {
		return dbOffset;
	}

	public void setDbOffset(int dbOffset) {
		this.dbOffset = dbOffset;
	}

	public int getDbSize() {
		return dbSize;
	}

	public void setDbsize(int dbSize) {
		this.dbSize = dbSize;
	}

}
