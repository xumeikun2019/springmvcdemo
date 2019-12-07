package com.cf.project.mybatis.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;


public class CUser implements Serializable{
   
	private static final long serialVersionUID = 1L;

	/**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_user.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_user.username
     *
     * @mbg.generated
     */
    private String username;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_user.password
     *
     * @mbg.generated
     */
    private String password;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_user.state
     *
     * @mbg.generated
     */
    private String state;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_user.realname
     *
     * @mbg.generated
     */
    private String realname;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_user.dept
     *
     * @mbg.generated
     */
    private String dept;
    private String szlc;
    private String kh;
    private int point;
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_user.remark
     *
     * @mbg.generated
     */
    private String remark;
    
    private String modified;
    
    private String stringRoleIds;
    
    private List<Map<String, Object>> roleids;
    
    
    private String departmentId;
    
    
    private String idcard;
    
    private String phone;
    
    private String workType;
    
    private String feature;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonFormat(pattern="yyyy-MM-dd", timezone = "GMT+8")
    private Date workDate;
    
    private String strWorkDate;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_user.updateTime
     *
     * @mbg.generated
     */

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_user.id
     *
     * @return the value of c_user.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_user.id
     *
     * @param id the value for c_user.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_user.username
     *
     * @return the value of c_user.username
     *
     * @mbg.generated
     */
    public String getUsername() {
        return username;
    }

    private Date addTime;
    
    private Date lastTime;
    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_user.username
     *
     * @param username the value for c_user.username
     *
     * @mbg.generated
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_user.password
     *
     * @return the value of c_user.password
     *
     * @mbg.generated
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_user.password
     *
     * @param password the value for c_user.password
     *
     * @mbg.generated
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_user.state
     *
     * @return the value of c_user.state
     *
     * @mbg.generated
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_user.state
     *
     * @param state the value for c_user.state
     *
     * @mbg.generated
     */
    public void setState(String state) {
        this.state = state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_user.realname
     *
     * @return the value of c_user.realname
     *
     * @mbg.generated
     */
    public String getRealname() {
        return realname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_user.realname
     *
     * @param realname the value for c_user.realname
     *
     * @mbg.generated
     */
    public void setRealname(String realname) {
        this.realname = realname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_user.dept
     *
     * @return the value of c_user.dept
     *
     * @mbg.generated
     */
    public String getDept() {
        return dept;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_user.dept
     *
     * @param dept the value for c_user.dept
     *
     * @mbg.generated
     */
    public void setDept(String dept) {
        this.dept = dept;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_user.remark
     *
     * @return the value of c_user.remark
     *
     * @mbg.generated
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_user.remark
     *
     * @param remark the value for c_user.remark
     *
     * @mbg.generated
     */
    public void setRemark(String remark) {
        this.remark = remark;
    }

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	public String getModified() {
		return modified;
	}

	public void setModified(String modified) {
		this.modified = modified;
	}

	
    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_user.updateTime
     *
     * @return the value of c_user.updateTime
     *
     * @mbg.generated
     */
    public List<Map<String, Object>> getRoleids() {
        return roleids;
    }
    public void setRoleids(List<Map<String, Object>> roleids) {
        this.roleids = roleids;
    }
    
	public String getStringRoleIds() {
		return stringRoleIds;
	}

	public void setStringRoleIds(String stringRoleIds) {
		this.stringRoleIds = stringRoleIds;
	}

	public String getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getIdcard() {
		return idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

	public Date getWorkDate() {
		return workDate;
	}

	public void setWorkDate(Date workDate) {
		this.workDate = workDate;
	}

	public String getStrWorkDate() {
		return strWorkDate;
	}

	public void setStrWorkDate(String strWorkDate) {
		this.strWorkDate = strWorkDate;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getSzlc() {
		return szlc;
	}

	public void setSzlc(String szlc) {
		this.szlc = szlc;
	}

	public String getKh() {
		return kh;
	}

	public void setKh(String kh) {
		this.kh = kh;
	}

}