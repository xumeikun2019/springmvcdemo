package com.cf.project.mybatis.dao;

import com.cf.project.mybatis.model.SysDepartment;
import com.cf.project.mybatis.model.SysDepartmentUser;

public interface SysDepartmentUserMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_department_user
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_department_user
     *
     * @mbg.generated
     */
    int insert(SysDepartmentUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_department_user
     *
     * @mbg.generated
     */
    int insertSelective(SysDepartmentUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_department_user
     *
     * @mbg.generated
     */
    SysDepartmentUser selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_department_user
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(SysDepartmentUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table sys_department_user
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(SysDepartmentUser record);

	void deleteByUserId(String id);

	SysDepartmentUser selectByUserId(String userid);
	
	int selectCountByPrimaryKey(String id);

	SysDepartmentUser selectByParentId(String depid);
	
}