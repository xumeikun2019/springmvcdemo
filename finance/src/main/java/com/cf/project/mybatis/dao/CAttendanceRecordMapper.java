package com.cf.project.mybatis.dao;

import com.cf.project.mybatis.model.CAttendanceRecord;
import com.cf.project.mybatis.model.CAttendanceRecordExample;
import com.cf.util.JsonResult;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface CAttendanceRecordMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    long countByExample(CAttendanceRecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    int deleteByExample(CAttendanceRecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    int insert(CAttendanceRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    int insertSelective(CAttendanceRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    List<CAttendanceRecord> selectByExample(CAttendanceRecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    CAttendanceRecord selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CAttendanceRecord record, @Param("example") CAttendanceRecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CAttendanceRecord record, @Param("example") CAttendanceRecordExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CAttendanceRecord record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_attendance_record
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CAttendanceRecord record);

	List<Map<String, Object>> findByHDPage(Map<String, Object> map);

	List<Map<String, Object>> findbm(@Param("userid") String userid);

	List<Map<String, Object>> findCompanyAttByHDPage(Map<String, Object> map);

	List<Map<String, Object>> findGsList(String string);

	List<Map<String, Object>> findsxb(@Param("userid") String userid,@Param("sj") String sj);

	List<Map<String, Object>> findkqxx(@Param("userid") String userid,@Param("sj") String sj);

	List<Map<String, Object>> findbm1(@Param("userid") String userid);

	List<Map<String, Object>> findCompanyByHDPage(Map<String, Object> map);

	List<Map<String, Object>> findlc(@Param("userid") String userid);
}