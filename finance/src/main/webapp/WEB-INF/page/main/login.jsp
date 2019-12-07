<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>后台登录</title>
	<meta name="renderer" content="webkit">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">	
	<meta name="apple-mobile-web-app-capable" content="yes">	
	<meta name="format-detection" content="telephone=no">	
	<!-- load css -->
	<link rel="stylesheet" type="text/css" href="${ctx}/statics/plugins/layui/css/layui.css" media="all">
	<link rel="stylesheet" type="text/css" href="${ctx}/statics/css/login.css" media="all">
	<link rel="stylesheet"  href="${ctx}/statics/font/iconfont.css" />
	<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>  
</head>
<body>
<div class="layui-canvs"></div>
<div class="layui-layout layui-layout-login">
	<h1>
		 <strong>管理系统后台</strong>
		 <em>Management System</em>
	</h1>
	<div class="larry-login icon iconfont icon-user-o">
		 <input id="username" type="text" placeholder="账号" class="login_txtbx "/>
		 
	</div>
	<div class="larry-login icon iconfont icon-unlock-o">
		 <input id="password" type="password" placeholder="密码" class="login_txtbx"/>
	</div>
    <div class="larry-login icon iconfont icon-security-o">
    	<div class="layui-code-box">
    		<input type="text" id="code" name="code" placeholder="验证码" maxlength="4" class="login_txtbx">
            <img src="images/verifyimg.png" alt="" class="verifyImg" id="verifyImg" onClick="javascript:this.src='xxx'+Math.random();">
    	</div>
    </div>
    <div class="layui-submit larry-login">
    	<input type="button" value="立即登陆" class="submit_btn"/>
    </div>
    <div class="layui-login-text">
    	<p>© 2017-2018 版权所有</p>
        <p>xxxxxx</p>
    </div>
</div>
<script type="text/javascript" src="${ctx}/statics/js/login.js"></script>
<script type="text/javascript" src="${ctx}/statics/plugins/jparticle.jquery.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/iconfont.js"></script>
<script type="text/javascript">
$(function(){
	$(".layui-canvs").jParticle({
		background: "#141414",
		color: "#E6E6E6"
	});
	//登录链接测试，使用时可删除
	$(".submit_btn").click(function(){
	//  location.href="index.html";
	  var url = '${ctx}/user/admin/login.do';
	  var username = $('#username').val();
	  var password = $('#password').val();
	  var param = {
		  'username':username,
		  'password':password
	  };
	  $.post(url,param,function (data) {
		   var result = data.result;
		   var u = '';
		   if (result == 'ok') {
		       u = '${ctx}/main/index.do';
		   } else {
               u = '${ctx}/main/login.html';
		   }
          location.href= u;
      },'json');
	});
});
</script>
</body>
</html>