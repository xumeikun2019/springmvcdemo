package com.cf.project.mybatis.model;

import java.io.Serializable;
import java.util.Date;

public class CMeetingDelay implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_delay.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_delay.meeting_id
     *
     * @mbg.generated
     */
    private String meetingId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_delay.data
     *
     * @mbg.generated
     */
    private String data;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_meeting_delay.date
     *
     * @mbg.generated
     */
    private String date;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table c_meeting_delay
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_delay.id
     *
     * @return the value of c_meeting_delay.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_delay.id
     *
     * @param id the value for c_meeting_delay.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_delay.meeting_id
     *
     * @return the value of c_meeting_delay.meeting_id
     *
     * @mbg.generated
     */
    public String getMeetingId() {
        return meetingId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_delay.meeting_id
     *
     * @param meetingId the value for c_meeting_delay.meeting_id
     *
     * @mbg.generated
     */
    public void setMeetingId(String meetingId) {
        this.meetingId = meetingId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_delay.data
     *
     * @return the value of c_meeting_delay.data
     *
     * @mbg.generated
     */
    public String getData() {
        return data;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_delay.data
     *
     * @param data the value for c_meeting_delay.data
     *
     * @mbg.generated
     */
    public void setData(String data) {
        this.data = data;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_meeting_delay.date
     *
     * @return the value of c_meeting_delay.date
     *
     * @mbg.generated
     */
    public String getDate() {
        return date;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_meeting_delay.date
     *
     * @param date the value for c_meeting_delay.date
     *
     * @mbg.generated
     */
    public void setDate(String date) {
        this.date = date;
    }

	public void setLastTime(Date dateTime) {
		// TODO Auto-generated method stub
		
	}

	public void setAddTime(Date dateTime) {
		// TODO Auto-generated method stub
		
	}
}