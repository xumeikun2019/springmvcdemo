package com.cf.project.mybatis.model;

import java.io.Serializable;

public class SysRoleAuthority implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_role_authority.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_role_authority.menu_code
     *
     * @mbg.generated
     */
    private String menuCode;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column sys_role_authority.role_key
     *
     * @mbg.generated
     */
    private String roleKey;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table sys_role_authority
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_role_authority.id
     *
     * @return the value of sys_role_authority.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_role_authority.id
     *
     * @param id the value for sys_role_authority.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_role_authority.menu_code
     *
     * @return the value of sys_role_authority.menu_code
     *
     * @mbg.generated
     */
    public String getMenuCode() {
        return menuCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_role_authority.menu_code
     *
     * @param menuCode the value for sys_role_authority.menu_code
     *
     * @mbg.generated
     */
    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column sys_role_authority.role_key
     *
     * @return the value of sys_role_authority.role_key
     *
     * @mbg.generated
     */
    public String getRoleKey() {
        return roleKey;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column sys_role_authority.role_key
     *
     * @param roleKey the value for sys_role_authority.role_key
     *
     * @mbg.generated
     */
    public void setRoleKey(String roleKey) {
        this.roleKey = roleKey;
    }
}