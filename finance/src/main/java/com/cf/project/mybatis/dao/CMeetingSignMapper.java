package com.cf.project.mybatis.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cf.project.mybatis.model.CMeetingSign;
import com.cf.project.mybatis.model.CMeetingSignExample;

public interface CMeetingSignMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    long countByExample(CMeetingSignExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    int deleteByExample(CMeetingSignExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    int insert(CMeetingSign record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    int insertSelective(CMeetingSign record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    List<CMeetingSign> selectByExample(CMeetingSignExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    CMeetingSign selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CMeetingSign record, @Param("example") CMeetingSignExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CMeetingSign record, @Param("example") CMeetingSignExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CMeetingSign record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_meeting_sign
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CMeetingSign record);

	List<Map<String, Object>> findByHDPage(Map<String, Object> map);

	List<Map<String, Object>> findCmeetingSignList();

	int findCmeetingSignByUserId(@Param("userId")String userId,@Param("meetingId")String meetingId);
}