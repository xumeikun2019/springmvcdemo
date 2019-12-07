package com.cf.project.mybatis.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.cf.project.mybatis.model.CUser;
import com.cf.project.mybatis.model.CUserExample;
import com.cf.util.JsonResult;

public interface CUserMapper {
	/**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    long countByExample(CUserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    int deleteByExample(CUserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    int insert(CUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    int insertSelective(CUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    List<CUser> selectByExample(CUserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    CUser selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") CUser record, @Param("example") CUserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") CUser record, @Param("example") CUserExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(CUser record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table c_course
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(CUser record);
    
    /**
     * 分页列表
     * @param map
     * @return
     */
    List<Map<String,Object>> findByHDPage(Map<String, Object> map);
    
    /**
     * 通过用户名查找用户信息
     * @param username
     * @return
     */
    Map<String,Object> findUserByName(String username);
	
    /**
     * 查询用户名不能重复
     */
	int findUsername(@Param("name") String name, @Param("id") String id);
	
	/**
	 * 重置密码
	 */
	int updateById(@Param("id") String id,@Param("lastTime") Date lastTime,@Param("password") String password);
	
	/**
	 * 比较密码
	 */
	int findBypwd(@Param("password") String password,@Param("id") String id);
	
	/**
	 * 查询同一个学校名下管理人员是否有多个
	 */
	int findRepeatBySid(@Param("sid") String sid,@Param("id") String id);
	
    /**
     * 查看状态
     */
    List<Map<String, Object>> findByPid(String id);
    
    /**
     * 修改状态 为 “T”
     */
    int updateByPidT(String id);
    
    /**
     * 修改状态为“F”
     */
    int updateByPidF(String id);

	List<Map<String, Object>> findByHDPagesh(Map<String, Object> map);
	
	@Update("update c_user set wechat_id  = #{openid}  where username = #{user} ")
	int saveOpenid(@Param("openid")String openid, @Param("user")String user);

	CUser selectByUser(@Param("username")String username);

	/**
	 * 根据用户id查询对应的角色id
	 * @param userId
	 * @return
	 */
	List<String> findByRoleId(String userId);

	/**
	 * 根据用户名查询用户id
	 * @param user
	 * @return
	 */
	@Select("select id from c_user where username = #{user}")
	String findCUserIdByName(String user);
	
	/**
	 * 根据openID 查询用户
	 * @param openId
	 * @return
	 */
	@Select("select * from c_user where wechat_id = #{openId}")
	List<Map<String, Object>> findCUserListByOpenId(String openId);

	
	/**
	 * 解除绑定 删除openID
	 * @param openId
	 * @return
	 */
	@Update("update c_user set wechat_id = -1 where wechat_id = #{openId}")
	int delWechatId(String openId);

	CUser findcUserServiceByWechatId(String wechatId);
	
	@Update("update c_user set open_id  = #{openid}  where username = #{user} ")
	int saveOpenid2(@Param("openid")String openid, @Param("user")String user);


	/**
	 * 获取所有用户的id和name
	 * @return
	 */
	@Select("select id , realname from c_user")
	List<Map<String, Object>> findAllNameId();
	
	/**
	 * 获取领导用户的id和name
	 * @return
	 */
	@Select("select a.id , a.realname from c_user a LEFT JOIN sys_user_role b on a.id=b.user_id where b.role_id='bad9386500fa11ea875400e081bbbd32'")
	List<Map<String, Object>> findLdNameId();
	
	/**
	 * 获取普通员工的id和name
	 * @return
	 */
	@Select("select a.id , a.realname,b.role_id from c_user a, sys_user_role b,(select aa.id , aa.realname,bb.role_id from c_user aa LEFT JOIN sys_user_role bb on aa.id=bb.user_id where bb.role_id='bad9386500fa11ea875400e081bbbd32' ) c where  a.id=b.user_id  and a.id!=c.id")
	List<Map<String, Object>> findptygNameId();

	/**
	 * 判断员工卡号是否重复
	 * @param kh
	 * @return
	 */
	@Select("select * from c_user where kh=#{kh}")
	int findUserkh(@Param("kh") String kh);

}