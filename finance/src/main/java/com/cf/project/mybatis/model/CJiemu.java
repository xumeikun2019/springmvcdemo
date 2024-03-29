package com.cf.project.mybatis.model;

import java.io.Serializable;
import java.util.Date;

public class CJiemu implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_jiemu.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_jiemu.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_jiemu.createTime
     *
     * @mbg.generated
     */
    private Date createtime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_jiemu.creater
     *
     * @mbg.generated
     */
    private String creater;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_jiemu.content
     *
     * @mbg.generated
     */
    private String content;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_jiemu.status
     *
     * @mbg.generated
     */
    private Integer status;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_jiemu.pn
     *
     * @mbg.generated
     */
    private String pn;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_jiemu.checker
     *
     * @mbg.generated
     */
    private String checker;
    private String sucaiIds;
    
    private int jg;
    private int vd;
    private int vw;
    private String paths;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table c_jiemu
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_jiemu.id
     *
     * @return the value of c_jiemu.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_jiemu.id
     *
     * @param id the value for c_jiemu.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_jiemu.name
     *
     * @return the value of c_jiemu.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_jiemu.name
     *
     * @param name the value for c_jiemu.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_jiemu.createTime
     *
     * @return the value of c_jiemu.createTime
     *
     * @mbg.generated
     */
    public Date getCreatetime() {
        return createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_jiemu.createTime
     *
     * @param createtime the value for c_jiemu.createTime
     *
     * @mbg.generated
     */
    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_jiemu.creater
     *
     * @return the value of c_jiemu.creater
     *
     * @mbg.generated
     */
    public String getCreater() {
        return creater;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_jiemu.creater
     *
     * @param creater the value for c_jiemu.creater
     *
     * @mbg.generated
     */
    public void setCreater(String creater) {
        this.creater = creater;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_jiemu.content
     *
     * @return the value of c_jiemu.content
     *
     * @mbg.generated
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_jiemu.content
     *
     * @param content the value for c_jiemu.content
     *
     * @mbg.generated
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_jiemu.status
     *
     * @return the value of c_jiemu.status
     *
     * @mbg.generated
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_jiemu.status
     *
     * @param status the value for c_jiemu.status
     *
     * @mbg.generated
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_jiemu.pn
     *
     * @return the value of c_jiemu.pn
     *
     * @mbg.generated
     */
    public String getPn() {
        return pn;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_jiemu.pn
     *
     * @param pn the value for c_jiemu.pn
     *
     * @mbg.generated
     */
    public void setPn(String pn) {
        this.pn = pn;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_jiemu.checker
     *
     * @return the value of c_jiemu.checker
     *
     * @mbg.generated
     */
    public String getChecker() {
        return checker;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_jiemu.checker
     *
     * @param checker the value for c_jiemu.checker
     *
     * @mbg.generated
     */
    public void setChecker(String checker) {
        this.checker = checker;
    }

	public String getSucaiIds() {
		return sucaiIds;
	}

	public void setSucaiIds(String sucaiIds) {
		this.sucaiIds = sucaiIds;
	}

	public int getJg() {
		return jg;
	}

	public void setJg(int jg) {
		this.jg = jg;
	}

	public int getVd() {
		return vd;
	}

	public void setVd(int vd) {
		this.vd = vd;
	}

	public int getVw() {
		return vw;
	}

	public void setVw(int vw) {
		this.vw = vw;
	}

	public String getPaths() {
		return paths;
	}

	public void setPaths(String paths) {
		this.paths = paths;
	}
    
    
}