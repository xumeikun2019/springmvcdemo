package com.cf.project.mybatis.model;

import java.io.Serializable;

public class SysDepartmentUser implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_department_user.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_department_user.department_id
     *
     * @mbg.generated
     */
    private String departmentId;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_department_user.user_id
     *
     * @mbg.generated
     */
    private String userId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table sys_department_user
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_department_user.id
     *
     * @return the value of sys_department_user.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_department_user.id
     *
     * @param id the value for sys_department_user.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_department_user.department_id
     *
     * @return the value of sys_department_user.department_id
     *
     * @mbg.generated
     */
    public String getDepartmentId() {
        return departmentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_department_user.department_id
     *
     * @param departmentId the value for sys_department_user.department_id
     *
     * @mbg.generated
     */
    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_department_user.user_id
     *
     * @return the value of sys_department_user.user_id
     *
     * @mbg.generated
     */
    public String getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_department_user.user_id
     *
     * @param userId the value for sys_department_user.user_id
     *
     * @mbg.generated
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }
}