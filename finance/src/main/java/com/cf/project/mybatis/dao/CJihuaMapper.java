package com.cf.project.mybatis.dao;

import com.cf.project.mybatis.model.CJihua;
import com.cf.project.mybatis.model.CJihuaExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CJihuaMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    long countByExample(CJihuaExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    int deleteByExample(CJihuaExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    int insert(CJihua record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    int insertSelective(CJihua record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    List<CJihua> selectByExample(CJihuaExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    CJihua selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CJihua record, @Param("example") CJihuaExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CJihua record, @Param("example") CJihuaExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CJihua record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_jihua
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CJihua record);

	List<Map<String, Object>> findByHDPage(Map<String, Object> map);
}