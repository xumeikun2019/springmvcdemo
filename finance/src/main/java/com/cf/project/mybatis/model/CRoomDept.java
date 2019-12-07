package com.cf.project.mybatis.model;

import java.io.Serializable;

public class CRoomDept implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_room_dept.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_room_dept.place_id
     *
     * @mbg.generated
     */
    private String placeId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_room_dept.dept_id
     *
     * @mbg.generated
     */
    private String deptId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table c_room_dept
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_room_dept.id
     *
     * @return the value of c_room_dept.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_room_dept.id
     *
     * @param id the value for c_room_dept.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_room_dept.place_id
     *
     * @return the value of c_room_dept.place_id
     *
     * @mbg.generated
     */
    public String getPlaceId() {
        return placeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_room_dept.place_id
     *
     * @param placeId the value for c_room_dept.place_id
     *
     * @mbg.generated
     */
    public void setPlaceId(String placeId) {
        this.placeId = placeId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_room_dept.dept_id
     *
     * @return the value of c_room_dept.dept_id
     *
     * @mbg.generated
     */
    public String getDeptId() {
        return deptId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_room_dept.dept_id
     *
     * @param deptId the value for c_room_dept.dept_id
     *
     * @mbg.generated
     */
    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }
}