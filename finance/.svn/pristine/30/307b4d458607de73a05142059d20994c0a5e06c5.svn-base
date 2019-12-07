package com.cf.project.mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cf.project.mybatis.model.SysDictionary;

public interface SysDictionaryMapper {

	SysDictionary selectByPrimaryKey(String id);

	List<Map<String, Object>> findDictiomaryByParent(@Param(value="id") String id);
	
	/**
	 * 获取字典表树形结构 ztree 数据结构
	 * @param id
	 * @return
	 */
	List<Map<String, Object>> findDicForZtree(String id);
}