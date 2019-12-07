package com.cf.project.mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cf.project.mybatis.model.CSucai;
import com.cf.project.mybatis.model.CSucaiExample;

public interface CSucaiMapper {
	
	
	 /**
     * 获取系统菜单树
     * @param map
     * @return
     */
    List<Map<String,Object>> findMenuTreeList(Map<String, Object> map);
    
	
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    long countByExample(CSucaiExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    int deleteByExample(CSucaiExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    int insert(CSucai record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    int insertSelective(CSucai record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    List<CSucai> selectByExample(CSucaiExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    CSucai selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CSucai record, @Param("example") CSucaiExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CSucai record, @Param("example") CSucaiExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CSucai record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CSucai record);


	List<Map<String, Object>> findChildList(Map<String, Object> map);


	List<Map<String, Object>> getSucaiList(Map<String, Object> map);


	List<Map<String, Object>> findAllBySucaiIds(String[] sucaiIdsStr);
}