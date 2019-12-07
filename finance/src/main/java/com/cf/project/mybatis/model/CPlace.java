package com.cf.project.mybatis.model;

import java.io.Serializable;
import java.util.Date;

public class CPlace implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_place.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_place.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_place.parent_id
     *
     * @mbg.generated
     */
    private String parentId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_place.sort
     *
     * @mbg.generated
     */
    private Integer sort;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_place.state
     *
     * @mbg.generated
     */
    private String state;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_place.level
     *
     * @mbg.generated
     */
    private Integer level;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_place.add_time
     *
     * @mbg.generated
     */
    private Date addTime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_place.last_time
     *
     * @mbg.generated
     */
    private Date lastTime;
    
    private String verify;
    
    private String orderDeptId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table c_place
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;
    
    
    public String getOrderDeptId() {
        return orderDeptId;
    }
    
    public void setOrderDeptId(String orderDeptId) {
        this.orderDeptId = orderDeptId;
    }
    
    
    
    public String getVerify() {
        return verify;
    }
    
    public void setVerify(String verify) {
        this.verify = verify;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_place.id
     *
     * @return the value of c_place.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_place.id
     *
     * @param id the value for c_place.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_place.name
     *
     * @return the value of c_place.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_place.name
     *
     * @param name the value for c_place.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_place.parent_id
     *
     * @return the value of c_place.parent_id
     *
     * @mbg.generated
     */
    public String getParentId() {
        return parentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_place.parent_id
     *
     * @param parentId the value for c_place.parent_id
     *
     * @mbg.generated
     */
    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_place.sort
     *
     * @return the value of c_place.sort
     *
     * @mbg.generated
     */
    public Integer getSort() {
        return sort;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_place.sort
     *
     * @param sort the value for c_place.sort
     *
     * @mbg.generated
     */
    public void setSort(Integer sort) {
        this.sort = sort;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_place.state
     *
     * @return the value of c_place.state
     *
     * @mbg.generated
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_place.state
     *
     * @param state the value for c_place.state
     *
     * @mbg.generated
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_place.level
     *
     * @return the value of c_place.level
     *
     * @mbg.generated
     */
    public Integer getLevel() {
        return level;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_place.level
     *
     * @param level the value for c_place.level
     *
     * @mbg.generated
     */
    public void setLevel(Integer level) {
        this.level = level;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_place.add_time
     *
     * @return the value of c_place.add_time
     *
     * @mbg.generated
     */
    public Date getAddTime() {
        return addTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_place.add_time
     *
     * @param addTime the value for c_place.add_time
     *
     * @mbg.generated
     */
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_place.last_time
     *
     * @return the value of c_place.last_time
     *
     * @mbg.generated
     */
    public Date getLastTime() {
        return lastTime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_place.last_time
     *
     * @param lastTime the value for c_place.last_time
     *
     * @mbg.generated
     */
    public void setLastTime(Date lastTime) {
        this.lastTime = lastTime;
    }
}