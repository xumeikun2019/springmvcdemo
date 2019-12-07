package com.cf.project.mybatis.dao;

import com.cf.project.mybatis.model.CMessage;
import com.cf.project.mybatis.model.CMessageExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CMessageMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    long countByExample(CMessageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    int deleteByExample(CMessageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    int insert(CMessage record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    int insertSelective(CMessage record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    List<CMessage> selectByExample(CMessageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    CMessage selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CMessage record, @Param("example") CMessageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CMessage record, @Param("example") CMessageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CMessage record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_message
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CMessage record);

	List<Map<String, Object>> findByHDPage(Map<String, Object> map);
}