<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>中铝金融</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="stylesheet" type="text/css" href="${ctx}/statics/plugins/layui/css/layui.css" media="all">
	<link rel="stylesheet"  href="${ctx}/statics/css/xadmin.css" />
<script type="text/javascript" src="${ctx}/statics/plugins/jparticle.jquery.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/md5.min.js"></script>
</head>
<body class="login-bg" style="background: url(${ctx}/statics/image/dbj.jpg) no-repeat left top;background-size:100% 100%">
	<form method="post" class="layui-form" autocomplete="off">
		<div>
			<img alt="" src="${ctx}/statics/image/xbj.png"
				style="width: 30%; height: 60%; position: absolute; left: 55%; top: 22%;"
				align="center">
			<img alt="" src="${ctx}/statics/image/dl.png"
				style="width: 30%; height: 8%; position: absolute; left: 55%; top: 65.5%;"
				align="center" class="submit_btn">
				<div style="width: 30%; height: 25%; position: absolute; left: 58%; top: 40%;">

				<table id="tb" style="margin-top: 5%; width: 60%; height: 50%;">
					<tr>
						<td style="font-weight: bold"><img src="${ctx}/statics/image/name.png"
							style="width: 70%; height: 40%"></td>
						<td style="font-weight: bold"><input type="text"
							id="username" name="username" maxlength="500" autocomplete="off"
							placeholder="请输入用户名"
							style="border-left-width: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-color: #FFFFFF;">
						</td>
					</tr>
					<tr>
						<td style="font-weight: bold"><img src="${ctx}/statics/image/mima.png"
							style="width: 70%; height: 40%"></td>
						<td style="font-weight: bold"><input type="password"
							id="password" name="password" maxlength="500" autocomplete="off"
							placeholder="请输入密�?" class="input01"
							style="border-left-width: 0px; border-top-width: 0px; border-right-width: 0px; border-bottom-color: #FFFFFF;">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
    <!-- 
    <div class="login layui-anim layui-anim-up">
        <div class="message">智慧校园管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
             <input id="username" type="text" placeholder="账号" class="login_txtbx "/>
            <hr class="hr15">
             <input id="password" type="password" placeholder="密码" class="login_txtbx"/>
            <hr class="hr15">
           <input type="button" id="btnSub" value="登录" class="submit_btn"/>
            <hr class="hr20" >
        </form>
    </div>
 -->
 
<script type="text/javascript">
$(function(){
//	document.getElementById("tb").frame="below";
	$(".layui-canvs").jParticle({
		background: "#141414",
		color: "#E6E6E6"
	});
	document.onkeydown = function(e) {
		var ev = document.all ? window.event : e;
		if (ev.keyCode == 13) {
			$('.submit_btn').click();
		}
	}

	$(".submit_btn").click(function(){

	  var url = '${ctx}/user/admin/login.do';
	  var username = $('#username').val();
	  var password = $('#password').val();
      var md5pwd = hex_md5(password + username);
      var param = {
		  'username':username,
		  'password':md5pwd
	  };
	  $.post(url,param,function (data) {
		   var result = data.result;
		   var u = '';
		   if (result == 'ok') {
		       u = '${ctx}/main/index.shtml';
		   } else {
               u = '${ctx}/user/login.shtml';
		   }
          location.href= u;
      },'json');
	});
});
</script>
</body>
</html>