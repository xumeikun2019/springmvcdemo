package com.cf.project.security;

import com.cf.project.mybatis.dao.CUserMapper;
import com.cf.project.mybatis.dao.SysRoleMapper;
import com.cf.project.mybatis.model.CUser;
import com.cf.util.MD5;

import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.CollectionUtils;

import java.net.PasswordAuthentication;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by towery on 2018/8/10.
 */
public class UserRealm extends AuthorizingRealm {

    @Autowired
    private CUserMapper cUserMapper;

    @Autowired
    private SysRoleMapper roleMapper;

    /**
     * 添加权限等操作
     * @param principals
     * @return
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        Map<String,Object> user = (Map<String,Object>) principals.getPrimaryPrincipal();
      //  System.err.println("-------------" + user.get("id") + "-----------");

        // 权限信息对象，用来存放查出的用户的所有的角色（role）及权限（permission）等
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
        if (user != null) {
            String userId = (String)user.get("id");
            // shiro添加角色
            authorizationInfo.setRoles(this.getUserRoles(userId));
            // shiro添加权限
            authorizationInfo.setStringPermissions(this.getUserPermissions(userId));
        }
        return authorizationInfo;
    }

    /**
     * 验证密码等操作
     * @param token
     * @return
     * @throws AuthenticationException
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        String password = new String((char[]) token.getCredentials());
        password = this.md5(password,username);
        Map<String,Object> userMap = cUserMapper.findUserByName(username);
        if (userMap == null) {
            // 用户名不存在抛出异常
            throw new UnknownAccountException();
        }
        String pwd = (String)userMap.get("password");
        if (!password.equals(pwd)) {
            throw new IncorrectCredentialsException();
        }
        ByteSource salt = ByteSource.Util.bytes(username);
        // userMap添加用户信息
        String userId = (String)userMap.get("id");
        Set<String> roleSet =  this.getUserRoles(userId);
        userMap.put("roles", roleSet);
        return new SimpleAuthenticationInfo(userMap, password,salt, getName());
    }

    /**
     * 清除所有用户授权信息缓存.
     */
    public void clearAllCachedAuthorizationInfo() {
//        Cache<Object, AuthorizationInfo> cache = getAuthorizationCache();
//        if (cache != null) {
//            for (Object key : cache.keys()) {
//                cache.remove(key);
//            }
//        }
    }
    /**
     *
     * @Title: clearAuthz
     * @Description: TODO 清楚缓存的授权信息
     * @return void    返回类型
     */
    public void clearAuthz(){
//        this.clearCachedAuthorizationInfo(SecurityUtils.getSubject().getPrincipals());
    }

    public String md5(String password, String salt){
        //加密方式
        String hashAlgorithmName = "MD5";
        //盐：为了即使相同的密码不同的盐加密后的结果也不同
        ByteSource byteSalt = ByteSource.Util.bytes(salt);
        //密码
        Object source = password;
        //加密次数
        int hashIterations = 1024;
        SimpleHash result = new SimpleHash(hashAlgorithmName, source, byteSalt, hashIterations);
        return result.toString();
    }

    /**
     * 获取用户角色
     *
     * @param userId
     * @return
     */
    private Set<String> getUserRoles(String userId) {
        List<Map<String,Object>> roleList = roleMapper.findRoleByUserId(userId);

        Set<String> roles = new HashSet<String>();
        if (CollectionUtils.isEmpty(roleList)) {
            return roles;
        }

        for (Map<String,Object> roleMap : roleList) {
            roles.add((String)roleMap.get("id"));
        }
        return roles;
    }

    /**
     * 获取用户角色
     *
     * @param userId
     * @return
     */
    private Set<String> getUserPermissions(String userId) {
        List<Map<String,Object>> roleList = roleMapper.findPermissionsByUserId(userId);

        Set<String> stringPermissions = new HashSet<String>();
        if (CollectionUtils.isEmpty(roleList)) {
            return stringPermissions;
        }

        for (Map<String,Object> permissionsMap : roleList) {
            stringPermissions.add((String)permissionsMap.get("permissions"));
        }
        return stringPermissions;
    }

    public static void main(String[] args) {
        UserRealm r = new UserRealm();
        String md5 = MD5.MD5("123456admin");
        System.err.println(r.md5(md5,"admin"));
    }

}
