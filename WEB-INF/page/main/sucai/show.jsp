<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();


%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>图片上传</title>
	<%@ include file="/common/taglibs.jsp"%>
    <%@ include file="/common/table.jsp"%>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/metroStyle/metroStyle.css" />
    <link rel="stylesheet" href="/static/layui/css/layui.css" media="all">
    <script src="/static/layui/layui.js"></script>
    <script src="/static/js/jquery.min.js"></script>
</head>

<body>
<div class="kit-doc">
    <!--这里写页面的代码-->
    <div id="box" align="center">
    </div>
</div>
<input  type="hidden" id="type" value="${type}">
<input  type="hidden" id="path" value="${kitG}">
<input  type="hidden" id="base" value="<%=basePath %>">
<script>
	$(function(){
		var html='';
		var base = $('#base').val();
		var path = $('#path').val();
		var type = $('#type').val();
		if(type=="视频"){
			html+='<video id="video" controls preload="auto" width="950px" height="650px">';
			html+='    <source src="'+base+path+'" type="video/mp4">';
			html+='</video>';
			$('#box').html(html);
			
		}else if(type=="图片"){
			html+='<img class="layui-upload-img" src="'+base+path+'" style="width:950px;height:650px;"/>';
			$('#box').html(html);
			
		}else if(type=="excel"){
			html+='<iframe class="img item-preview" id="excel" src="'+base+path+'" style="width:950px;height:650px;">';
			html+='</iframe>';
			$('#box').html(html);
			
		}else if(type=="word"){
			 html+='<iframe class="img item-preview" id="iframe" src="'+base+path+'"  style="width:950px;height:650px;"> ';
			html+='</iframe>';
			$('#box').html(html); 
			
			//----------------
			/*  document.getElementById('iframe').onload=function(){ 
				var img = document.getElementById('iframe').contentWindow.document.getElementsByTagName('img');
				for(i=0;i<img.length;i++){
					var src = $(img[i]).attr('src');
					src = src.split('finance')[1];
					src = "\\finance"+src;
					$(img[i]).attr('src',src);
				}
			} */

			
		}else if(type=="pdf"){
			var pathArr = path.split(",");
			html+='<div class="layui-carousel" id="test1" lay-filter="test1">';
			html+='	  <div carousel-item="">';
			for(i=0;i<pathArr.length;i++){
				html+='    <div class="tp"><img  src="'+base+pathArr[i]+'" style="width: auto; height: auto; max-width: 100%; max-height: 100%;"></img></div>';
			}
			
			html+='	  </div>';
			html+='	</div> ';
			$('#box').html(html);
		}else if(type="ppt"){
			var pathArr = path.split(",");
			html+='<div class="layui-carousel" id="test1" lay-filter="test1">';
			html+='	  <div carousel-item="">';
			for(i=0;i<pathArr.length;i++){
				html+='    <div class="tp"><img  src="'+base+pathArr[i]+'" style="width:950px;height:650px;"></img></div>';
			}
			
			html+='	  </div>';
			html+='	</div> ';
			$('#box').html(html);
		}
	});

	
	
	
	
	
	layui.use(['carousel', 'form'], function(){
		  var carousel = layui.carousel
		  ,form = layui.form;
		  //设定各种参数
		  var ins3 = carousel.render({
		    elem: '#test1',
		    width:'1000px',
		    height:'563px',
		  });
	});
    /* layer.open({
        type: 1,
        title: false,
        shadeClose: true,
        area: ['400px', '350px'],
        content: $('#box'),
        success: function(layero){
            //layer样式layer-anim导致全屏样式错乱，移除该样式即可
            setTimeout(function() {
                $(layero).removeClass('layer-anim');
            }, 0);
        }
    }); */
</script>

</body>

</html>