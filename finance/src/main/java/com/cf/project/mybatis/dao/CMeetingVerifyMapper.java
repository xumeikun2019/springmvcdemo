package com.cf.project.mybatis.dao;

import com.cf.project.mybatis.model.CMeetingVerify;
import com.cf.project.mybatis.model.CMeetingVerifyExample;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CMeetingVerifyMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    long countByExample(CMeetingVerifyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    int deleteByExample(CMeetingVerifyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    int insert(CMeetingVerify record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    int insertSelective(CMeetingVerify record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    List<CMeetingVerify> selectByExample(CMeetingVerifyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    CMeetingVerify selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CMeetingVerify record, @Param("example") CMeetingVerifyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CMeetingVerify record, @Param("example") CMeetingVerifyExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CMeetingVerify record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CMeetingVerify record);

	List<Map<String, Object>> findByHDPage(Map<String, Object> map);
}