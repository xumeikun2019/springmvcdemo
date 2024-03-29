<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <link rel="stylesheet"  href="${ctx}/statics/css/style.sign.calendar.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/style.sign.css" />
    <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
	<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
	<link rel="stylesheet" href="${ctx}/statics/plugins/layui/css/layui.css" />
	<link rel="stylesheet" href="${ctx}/statics/css/meeting.table.css" />
	<style type="text/css">
	   .sign_main {
    position: absolute;
    left: 15px;
    right: 15;
    bottom: 0;
    top: 67px;
}

.sign{
	top:41px;
}
.layui-elem-quote{
	border-left: 5px solid #4396ca;
}
	</style>
</head>
<body class="childrenBody">
	<!-- <div class="container" style="height: 1%;">
		<blockquote class="layui-elem-quote" style="margin-bottom: 30px;">姓名：<font id="name"></font> &nbsp;&nbsp;&nbsp;&nbsp;部门：<font id="deptname"></font></blockquote>
	</div> -->
   <div class="container" style="height: 90%; ">
   <blockquote class="layui-elem-quote" style="margin-bottom: 30px;">姓名：<font id="name"></font> &nbsp;&nbsp;&nbsp;&nbsp;部门：<font id="deptname"></font></blockquote>
	   <div class="row">
			<div class="col-xs-12 clearPadding" >
				<div style="padding:15px 15px 0">
					<div style="height: 90%">
						<div id="calendar1">
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
    <script src="${ctx}/statics/js/calendar1.js"></script>
    <script>
$(function(){
	window.onload=function(){  
	    var message = getUrlVars()["id"];  
	    if(message!=null && typeof(message)!="undefined"){ 
	    	$.post('${ctx}/main/attendanceRecord/findbm1.do',{"id":decodeURI(message)},function (json) {
	    		if(json.data!=""){
	    			var name=json.data[0].realname;//员工姓名
	    			var deptname=json.data[0].name;//员工部门
	    			$("#name").html(name);
	    			$("#deptname").html(deptname);
	    		}	    
	    		calUtil1.init(decodeURI(message));
	    	}) 
	    }else{
	    	$("#name").html("${user.realname}");
			$("#deptname").html("${user.deptname}");
	    	calUtil1.init("${user.id}");
	    }  
	}  
   

});

  
function getUrlVars(){  
   var vars = [], hash;  
   var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');  
   for(var i = 0; i < hashes.length; i++){  
       hash = hashes[i].split('=');  
       vars.push(hash[0]);  
       vars[hash[0]] = hash[1];  
   }  
   return vars;  
}  

</script>
</body>
