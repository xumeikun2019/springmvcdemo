package com.cf.project.mybatis.model;

import java.io.Serializable;
import java.util.Date;

public class CMeetingVerify implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_verify.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_verify.meeting_id
     *
     * @mbg.generated
     */
    private String meetingId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_verify.user_id
     *
     * @mbg.generated
     */
    private String userId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_verify.state
     *
     * @mbg.generated
     */
    private String state;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_verify.remark
     *
     * @mbg.generated
     */
    private String remark;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_verify.add_time
     *
     * @mbg.generated
     */
    private Date addTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_verify.last_time
     *
     * @mbg.generated
     */
    private Date lastTime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table c_meeting_verify
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_verify.id
     *
     * @return the value of c_meeting_verify.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_verify.id
     *
     * @param id the value for c_meeting_verify.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_verify.meeting_id
     *
     * @return the value of c_meeting_verify.meeting_id
     *
     * @mbg.generated
     */
    public String getMeetingId() {
        return meetingId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_verify.meeting_id
     *
     * @param meetingId the value for c_meeting_verify.meeting_id
     *
     * @mbg.generated
     */
    public void setMeetingId(String meetingId) {
        this.meetingId = meetingId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_verify.user_id
     *
     * @return the value of c_meeting_verify.user_id
     *
     * @mbg.generated
     */
    public String getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_verify.user_id
     *
     * @param userId the value for c_meeting_verify.user_id
     *
     * @mbg.generated
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_verify.state
     *
     * @return the value of c_meeting_verify.state
     *
     * @mbg.generated
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_verify.state
     *
     * @param state the value for c_meeting_verify.state
     *
     * @mbg.generated
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_verify.remark
     *
     * @return the value of c_meeting_verify.remark
     *
     * @mbg.generated
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_verify.remark
     *
     * @param remark the value for c_meeting_verify.remark
     *
     * @mbg.generated
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_verify.add_time
     *
     * @return the value of c_meeting_verify.add_time
     *
     * @mbg.generated
     */
    public Date getAddTime() {
        return addTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_verify.add_time
     *
     * @param addTime the value for c_meeting_verify.add_time
     *
     * @mbg.generated
     */
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_verify.last_time
     *
     * @return the value of c_meeting_verify.last_time
     *
     * @mbg.generated
     */
    public Date getLastTime() {
        return lastTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_verify.last_time
     *
     * @param lastTime the value for c_meeting_verify.last_time
     *
     * @mbg.generated
     */
    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }
}