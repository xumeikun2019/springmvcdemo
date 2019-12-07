package com.cf.project.mybatis.model;

import java.io.Serializable;
import java.util.Date;

public class CSucai implements Serializable {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_sucai.id
     *
     * @mbg.generated
     */
    private String id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_sucai.name
     *
     * @mbg.generated
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_sucai.fId
     *
     * @mbg.generated
     */
    private String fid;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_sucai.uploadTime
     *
     * @mbg.generated
     */
    private Date uploadtime;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_sucai.size
     *
     * @mbg.generated
     */
    private Long size;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_sucai.upload_user
     *
     * @mbg.generated
     */
    private String uploadUser;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_sucai.is_share
     *
     * @mbg.generated
     */
    private Integer isShare;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_sucai.share_user
     *
     * @mbg.generated
     */
    private String shareUser;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column c_sucai.shareTime
     *
     * @mbg.generated
     */
    private Date sharetime;
    private int isFolder;
    private String path;
    private int level;
    private String switchpath;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table c_sucai
     *
     * @mbg.generated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_sucai.id
     *
     * @return the value of c_sucai.id
     *
     * @mbg.generated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_sucai.id
     *
     * @param id the value for c_sucai.id
     *
     * @mbg.generated
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_sucai.name
     *
     * @return the value of c_sucai.name
     *
     * @mbg.generated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_sucai.name
     *
     * @param name the value for c_sucai.name
     *
     * @mbg.generated
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_sucai.fId
     *
     * @return the value of c_sucai.fId
     *
     * @mbg.generated
     */
    public String getFid() {
        return fid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_sucai.fId
     *
     * @param fid the value for c_sucai.fId
     *
     * @mbg.generated
     */
    public void setFid(String fid) {
        this.fid = fid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_sucai.uploadTime
     *
     * @return the value of c_sucai.uploadTime
     *
     * @mbg.generated
     */
    public Date getUploadtime() {
        return uploadtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_sucai.uploadTime
     *
     * @param uploadtime the value for c_sucai.uploadTime
     *
     * @mbg.generated
     */
    public void setUploadtime(Date uploadtime) {
        this.uploadtime = uploadtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_sucai.size
     *
     * @return the value of c_sucai.size
     *
     * @mbg.generated
     */
    public Long getSize() {
        return size;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_sucai.size
     *
     * @param size the value for c_sucai.size
     *
     * @mbg.generated
     */
    public void setSize(Long size) {
        this.size = size;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_sucai.upload_user
     *
     * @return the value of c_sucai.upload_user
     *
     * @mbg.generated
     */
    public String getUploadUser() {
        return uploadUser;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_sucai.upload_user
     *
     * @param uploadUser the value for c_sucai.upload_user
     *
     * @mbg.generated
     */
    public void setUploadUser(String uploadUser) {
        this.uploadUser = uploadUser;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_sucai.is_share
     *
     * @return the value of c_sucai.is_share
     *
     * @mbg.generated
     */
    public Integer getIsShare() {
        return isShare;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_sucai.is_share
     *
     * @param isShare the value for c_sucai.is_share
     *
     * @mbg.generated
     */
    public void setIsShare(Integer isShare) {
        this.isShare = isShare;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_sucai.share_user
     *
     * @return the value of c_sucai.share_user
     *
     * @mbg.generated
     */
    public String getShareUser() {
        return shareUser;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_sucai.share_user
     *
     * @param shareUser the value for c_sucai.share_user
     *
     * @mbg.generated
     */
    public void setShareUser(String shareUser) {
        this.shareUser = shareUser;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column c_sucai.shareTime
     *
     * @return the value of c_sucai.shareTime
     *
     * @mbg.generated
     */
    public Date getSharetime() {
        return sharetime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column c_sucai.shareTime
     *
     * @param sharetime the value for c_sucai.shareTime
     *
     * @mbg.generated
     */
    public void setSharetime(Date sharetime) {
        this.sharetime = sharetime;
    }

	public int getIsFolder() {
		return isFolder;
	}

	public void setIsFolder(int isFolder) {
		this.isFolder = isFolder;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public String getSwitchpath() {
		return switchpath;
	}

	public void setSwitchpath(String switchpath) {
		this.switchpath = switchpath;
	}
	
	

	
	
    
}