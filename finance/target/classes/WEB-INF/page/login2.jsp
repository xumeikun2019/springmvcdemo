<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1">
  <title>中铝驻桂企业安全培训中心登录</title>

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/png" href="assets/i/favicon.png">

  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">

  <link rel="stylesheet" href="${ctx}/statics/plugins/amazeui/css/amazeui.min.css">
  <link rel="stylesheet" href="${ctx}/statics/plugins/amazeui/css/app.css">
  <link rel="stylesheet" href="${ctx}/statics/css/index.css">
</head>
<body>
  <div class="am-g header">
     <div class="am-u-sm-12">
        <div class="header-info am-g-fixed">
           <div class="am-u-sm-12 am-u-md-6 am-u-lg-6 header-info-left am-vertical-align">
            <img alt="" src="${ctx}/image/logio.png" style="width: 13%; height: 200%;">
              <div class="am-vertical-align-bottom">              	 
	              <label>中铝驻桂企业安全培训中心</label>
              </div>
           </div>
           <div class="am-u-sm-12 am-u-md-6 am-u-lg-6 header-info-right am-vertical-align">
              <div class="am-vertical-align-bottom">
	              <label>建立科学化常态化安全教育</label>
              </div>
           </div>
        </div>
     </div>
  </div>
  
  <div class="am-g am-g-fixed login-container ">
     <div class="am-u-sm-12 am-u-md-9 am-u-lg-9 news">
         <div class="am-slider am-slider-default" data-am-flexslider id="demo-slider-0">
  			<ul class="am-slides">
  				<c:forEach items="${gdl}" var="gdlList" varStatus="status" end="3">		     		
					    <li><a href="${ctx}/user/detail.shtml?id=${gdlList.id}" target="_blank"><img src="${ctx}/upload/common/${gdlList.cname}"/></a></li>			       									
				</c:forEach>
  			</ul>
		</div>
     </div>
     <div class="am-u-sm-12 am-u-md-3 am-u-lg-3 login">
         <div class="login-form">
			<label>进入平台请登�?</label>
				<div class="am-form-group am-form-icon">
    				<i class="am-icon-user"></i>
    			     <input type="text" id="username" class="am-form-field" placeholder=" 账号">
  				</div>

                <div class="am-form-group am-form-icon">
    				<i class="am-icon-unlock-alt"></i>
    				<input type="password" id="password" class="am-form-field" placeholder=" 密码">
  				</div>
  				<div>
  				<div style="width:50%;padding:0;margin:0;float:left;box-sizing:border-box;">
  				<button type="submit" class="am-btn am-btn-primary am-btn-block submit_btn" style="width: 90%">登录</button>
  				</div>
  				<div style="width:50%;padding:0;margin:0;float:left;box-sizing:border-box;">
  				<button type="submit" class="am-btn am-btn-primary am-btn-block submit_btn1" style="width: 90%">注册</button>
  				</div>
  				</div>
         </div>
     </div>
  </div>
  
    <div class="am-g am-g-fixed">
     <div class="am-u-sm-12 am-u-md-6 am-u-lg-6 am-padding-2 am-margin-0 notice">
         <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
           <h2 class="am-titlebar-title ">
			  通知公告
    	   </h2>

           <nav class="am-titlebar-nav">
        		<a href="${ctx}/user/more.shtml?id=dz&currPage=1" class="" target="_blank">更多 &raquo;</a>
    		</nav>
		</div>
		<div class="am-container  am-padding-0 am-list-news-bd">
		     <ul class="am-list">
		     	<c:forEach items="${dz}" var="dzList" varStatus="status" end="3">
		     		
		     		<li>
					    <a href="${ctx}/user/detail.shtml?id=${dzList.id}" class="am-list-item-hd" target="_blank">${dzList.cname}</a>
			       		<span class="am-list-date">${dzList.last_time}</span>
			       		
					</li>
		     		
					
				</c:forEach>
                 
                 
             </ul>
             
		</div>
     </div>
     <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
         <div class="am-container am-padding-2 am-margin-0 platform-notice">
             <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
           <h2 class="am-titlebar-title ">
			  平台公告
    	   </h2>

           <nav class="am-titlebar-nav">
        		<a href="${ctx}/user/more.shtml?id=pt&currPage=1" class="" target="_blank">更多 &raquo;</a>
    		</nav>
		</div>
		<div class="am-container  am-padding-0 am-list-news-bd">
		     <ul class="am-list">
                 <c:forEach items="${pt}" var="ptList" varStatus="status" end="3">
					<li>
					    <a href="${ctx}/user/detail.shtml?id=${ptList.id}" class="am-list-item-hd" target="_blank">${ptList.cname}</a>
			       		<span class="am-list-date">${ptList.last_time}</span>
					</li>
				</c:forEach>
                 
             </ul>
             
		</div>
         </div>
     </div>
  </div>
  
  
  <div class="am-g am-g-fixed">
     <div class="am-u-sm-12 am-padding-2 am-margin-0 knowleage">
         <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
           <h2 class="am-titlebar-title ">
			  知识�?
    	   </h2>

           <nav class="am-titlebar-nav">
        		<a href="${ctx}/user/more.shtml?id=rep&currPage=1" class="" target="_blank">更多 &raquo;</a>
    		</nav>
		</div>
		<div class="am-padding-0 am-list-news-bd">
		     <ul class="am-list">
		     	<c:forEach items="${rep}" var="rep" varStatus="status" end="3">
		     		
		     		<li>
					    <a href="${ctx}/user/detail.shtml?id=${rep.id}" class="am-list-item-hd" target="_blank">${rep.cname}</a>
			       		<span class="am-list-date">${rep.last_time}</span>
					</li>
				</c:forEach>
             </ul>
             
		</div>
     </div>
  </div>
  
  
  <div class="am-g am-g-fixed">
     <div class="am-u-sm-12 res">
         <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" >
           <h2 class="am-titlebar-title ">
			  共享资源
    	   </h2>

           <nav class="am-titlebar-nav">
        		<a href="${ctx}/user/more.shtml?id=gx&currPage=1" class="" target="_blank">更多 &raquo;</a>
    		</nav>
		</div>
		<div class="am-g am-padding-0 am-g-fixed am-text-center">
		    <ul class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-thumbnails">
		    	<c:forEach items="${gxzy}" var="gxzyList" varStatus="status" end="3">
					<li>
						<a href="${ctx}/user/detail.shtml?id=${gxzyList.id}" target="_blank"><img class="am-thumbnail" src="${ctx}/upload/common/${gxzyList.img}" /></a>
					    <label> ${gxzyList.cname} </label>
					</li>
				</c:forEach>
  				
  				
           </ul>
            
		</div>
     </div>
  </div>
  
  <div class="am-g footer">
     <div class="am-u-sm-12">
          <div class="footer-info">
             <h5>�?术支持：中铝山东工程 · 信息�?术中�?</h5>
          </div>
     </div>
  </div>
  
<script src="${ctx}/statics/plugins/amazeui/js/amazeui.min.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/md5.min.js"></script>
</body>
<script type="text/javascript">
$(function(){
	document.onkeydown = function(e) {
		var ev = document.all ? window.event : e;
		if (ev.keyCode == 13) {
			$('#btnSub').click();
		}
	}
	
	$(".submit_btn1").click(function(){
		location.href='${ctx}/user/newUserAdd.shtml';
	})

	$(".submit_btn").click(function(){
	//  location.href="index.html";
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
			   if(data.data == '0'){
				   u = '${ctx}/main/student/index.shtml';
			   }else{
				   u = '${ctx}/main/index.shtml';
			   }
		       
		   } else {
               u = '${ctx}/user/login.shtml';
		   }
          location.href= u;  
      },'json');
	});
});
</script>
</html>