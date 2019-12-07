<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibsnoload.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>中铝金融智能综合管理平台</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta http-equiv="Access-Control-Allow-Origin" content="*">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="icon" href="${ctx}/statics/images/favicon.ico">
	<link rel="stylesheet" href="${ctx}/statics/plugins/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="${ctx}/statics/font/main/iconfont.css" media="all" />
	<link rel="stylesheet" href="${ctx}/statics/css/main.css" media="all" />
</head>
<body class="main_body">
	<div class="layui-layout layui-layout-admin">
		<!-- 顶部 -->
		<div class="layui-header header">
			<div class="layui-main">
				<div class="logo">
                	<img src="${ctx}/statics/images/logo.jpg">
                </div>
				
				<!-- 搜索/菜单 -->
				<div class="top-right">
				   <div class="left">
				      <!-- 显示/隐藏菜单 -->
				      <a href="javascript:;" class="iconfont hideMenu icon-caidan_o"></a>
				   </div>
				   <div class="middle">
				       <img src="${ctx}/statics/images/logotitle.png"> 
				   </div>
				   <div class="right">
				     <img src="${ctx}/statics/images/top.jpg"> 
				   </div>
				  
				</div>
			    <!-- 天气信息 -->
			    <!--  <div class="weather" pc>
			    	<div id="tp-weather-widget"></div>
					<iframe allowtransparency="true" frameborder="0" width="180" height="36" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=3&z=2&t=0&v=0&d=3&bd=0&k=&f=ffffff&ltf=ffffff&htf=ffffff&q=1&e=1&a=1&c=54511&w=180&h=36&align=center"></iframe>
			    </div> -->
			    <!-- 顶部右侧菜单 -->
			    <ul class="layui-nav top_menu">
			    	<!-- <li class="layui-nav-item showNotice" id="showNotice" pc>
						<a href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
					</li>
			    	<li class="layui-nav-item" mobile>
			    		<a href="javascript:;" class="mobileAddTab" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>设置</cite></a>
			    	</li>
			    	<li class="layui-nav-item" mobile>
			    		<a href="page/login/login.html" class="signOut"><i class="iconfont icon-loginout"></i> �?�?</a>
			    	</li>
					<li class="layui-nav-item lockcms" pc>
						<a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
					</li> -->
					<li class="layui-nav-item info">
						<a href="javascript:;" style="color:white!important;">
							<!-- <img src="images/face.jpg" class="layui-circle" width="35" height="35"> -->
							<cite>${user.deptname}</cite>
							<cite>${user.realname}</cite>
						</a>
						<dl class="layui-nav-child right-dropdown">
							<!-- <dd><a href="javascript:;" data-url="page/user/userInfo.html"><i class="iconfont icon-zhanghu" data-icon="icon-zhanghu"></i><cite>个人资料</cite></a></dd>
							<dd><a href="javascript:;" class="changeSkin"><i class="iconfont icon-huanfu"></i><cite>更换皮肤</cite></a></dd> -->
							<dd><a href="javascript:repwd('${user.username }')" style="color:black!important;"><i class="iconfont icon-quanjushezhi_o" data-icon="icon-quanjushezhi_o"></i><cite>修改密码</cite></a></dd>
							<dd><a href="${ctx}/user/logout.shtml" class="signOut"><i class="iconfont icon-dengchu_o"></i><cite>�?�?</cite></a></dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
		<!-- 左侧导航 -->
		<div class="layui-side layui-bg-black">
		    <div class="nav-top">
		       <img src="${ctx}/statics/images/navtop.jpg">
		    </div>
			<div class="navBar layui-side-scroll"></div>
		</div>
		<!-- 右侧内容 -->
		<div class="layui-body layui-form">
			<div class="layui-tab marg0" lay-filter="bodyTab" id="top_tabs_box">
				<ul class="layui-tab-title top_tab" id="top_tabs">
					<li class="layui-this" lay-id=""><i class="iconfont icon-bijibendiannao"></i> <cite>后台首页</cite></li>
				</ul>
				<ul class="layui-nav closeBox">
				  <li class="layui-nav-item">
				    <a href="javascript:;"><i class="iconfont icon-yingyongAPP_o"></i> 页面操作</a>
				    <dl class="layui-nav-child oper">
					  <dd><a href="javascript:;" class="refresh refreshThis"><i class="layui-icon iconfont icon-jiazai_shuaxin_o"></i> 刷新当前</a></dd>
				      <dd><a href="javascript:;" class="closePageOther"><i class="iconfont icon-shuliangjianshao_o"></i> 关闭其他</a></dd>
				      <dd><a href="javascript:;" class="closePageAll"><i class="iconfont icon-anniu_guanbi_o"></i> 关闭全部</a></dd>
				    </dl>
				  </li>
				</ul>
				<div class="layui-tab-content clildFrame">
					<div class="layui-tab-item layui-show">
               		     <iframe src="${ctx}/main/main.shtml"></iframe>
					</div>
				</div>
			</div>
		</div>
		<!-- 底部 -->
		<div class="layui-footer footer">
			<p>copyright @2019</p>
		</div>
	</div>
	<!-- 修改密码�? -->
	<div class="popup-content">
           <div id="form-container">
               <form class="layui-form layui-form-pane" style="margin: 10px">

                   <div class="layui-form-item" style="padding-top: 20px;padding-left: 20px">
                       <label class="layui-form-label">初始密码�?</label>
                       <div class="layui-input-block" style="padding-right: 20px">
                           <!-- <input type="password" name="modified" lay-verify="required" maxlength="50" autocomplete="off" placeholder="请输入初始密�?" class="oldPwd "> -->
                           <input type="password"  lay-verify="required" maxlength="50" autocomplete="off" placeholder="请输入初始密�?" class="layui-input pMenu" name="modified">
                       </div>
                   </div>
                   
                   <div class="layui-form-item" style="padding-left: 20px">
                       <label class="layui-form-label" style="padding-left: 20px">修改密码�?</label>
                       <div class="layui-input-block" style="padding-right: 20px">
                       		<!-- <input type="password" name="password" lay-verify="required" maxlength="50" autocomplete="off" placeholder="请输入密�?" class="newPwd"> -->
                           <input type="password" name="password" lay-verify="required" maxlength="50" autocomplete="off" placeholder="请输入密�?" class="layui-input pMenu">
                       </div>
                   </div>
                   
                   <div class="layui-form-item" style="padding-left: 20px">
                       <label class="layui-form-label" style="padding-left: 20px">确认密码�?</label>
                       <div class="layui-input-block" style="padding-right: 20px">
                       		<!-- <input type="password"  lay-verify="pass" maxlength="50" autocomplete="off" placeholder="请确认密�?" class="conPwd"> -->
                           <input type="password" lay-verify="pass" maxlength="50" autocomplete="off" placeholder="请确认密�?" class="layui-input pMenu">
                       </div>
                   </div>


                   <div class="layui-form-item" style="margin-top: 40px">
                       <div class="layui-input-block" style="text-align: center;padding-right: 130px">
                           <input type="hidden" id="uId" name="id" value="${user.id }">
                           <input type="hidden" value="${user.username }" name="username">
                           <input type="hidden" id="init">
                           <button class="layui-btn" lay-submit="" lay-filter="menu-add">确认</button>
                       </div>
                   </div>
               </form>
           </div>
       </div>
	
	<!-- 移动导航 -->
	<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
	<div class="site-mobile-shade"></div>

	<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/statics/js/leftNav.js"></script>
	<script id="index" type="text/javascript" src="${ctx}/statics/js/index.js" data="${ctx}"></script>
	<script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
	<link rel="stylesheet"  href="${ctx}/statics/css/common.css" />

<script type="text/javascript">
	
	/* function verPwd() {
		alert("pwd:"+$("#pwd").val());
		var oP = $(".oldPwd").eq(1).val();
		var nP = $(".newPwd").eq(1).val();
		var cP = $(".conPwd").eq(1).val();
		alert(oP+"!!!!"+nP+"@@@@@@@"+cP);
	} */
layui.use(['form', 'layedit', 'laydate'], function(){
	
	var form = layui.form;
		
	 //监听提交
    form.on('submit(menu-add)', function(data){
    	//alert("密码");
    	//var formData = data.field;
    	//var val = formData.password;
    	//alert(val+"@@@@@@@@");
    	//$("#nPwd").attr("value",val);
    	//alert($("#nPwd").val()+"!!!!!!");
       	var url = '${ctx}/main/user/save.do';
       	$.submit.post(data,url,function(data){
       		var res = data.result;
       		if(res == 'ok'){
		       	var count = $("#init").val();
		       	layer.close(count);
       		}
       	});
        return false;
    });
	 
	 //验证密码
    form.verify({
 	   pass:function(value,item){
 			//var nP = $(".newPwd").eq(1).val();
 			var val = $(':input[name=password]:eq(1)').val();
 		   if(value != val){
 			   return '两次密码输入不一�?';
 		   }
 	   }
    });
});
	
		//修改密码
	function repwd(username){
		        var index = layer.open({
		            type: 1,
		            title: '修改密码',
		            shade: [0.1],
		            maxmin: true, //�?启最大化�?小化按钮
		            area: ['40%', '51%'],
		            content: $("#form-container").html()
		        });
		        $("#init").attr("value",index);
	}
	


</script>
	
</body>
</html>