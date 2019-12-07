<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>摄像头管�?</title>
	<%@ include file="/common/taglibs.jsp"%>
    <%@ include file="/common/table.jsp"%>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
    <link rel="stylesheet"  href="${ctx}/statics/plugins/layui/css/layui.css" />
    <link rel="stylesheet" href="${ctx}/statics/css/floor.css" />
    <script type="text/javascript">
       $(function(){
    	   var url = '${ctx}/main/place/camera/list.do';
    	   $.get(url,function(data){
    		   var html = '';
    		   $.each(data.data,function(i,d){
//				   console.log(d);    			   
//				   console.log(d.list);    
				   var floorName = d.name;
				   var list = d.list;
				   html += '<div class="floor"><div class="floor-label"><label>' + floorName + '</label></div><div class="rooms">';
				   $.each(list,function(index,room){
					   var roomName = room.dname;
					   var roomId = room.id;
					   var online = room.online;
					   var list = d.list;
					   html += "<div><div class='meeting-room " + online + "' style='background: url(${ctx}/statics/image/g15.ico);width: 20px;height: 20px;background-size: 100%' onclick='newTab(\"摄像头视频查看\",\"\",\"${ctx}/main/place/view.shtml?id="+roomId+"\");'></div><div style='margin-left:30px;'>"+roomName+"</div></div>";
					   
	    		   });
				   html += '</div><div style="clear: left;"></div></div>';
    		   });
    		   $('.container').append(html);
    	   },'json');
       });
       function ck() {
			alert(111);
	   }
    </script>
</head>
<body>
   <div class="container" >
   <fieldset >
  <legend>摄像�?</legend>
</fieldset>
<!-- <blockquote class="layui-elem-quote" style="margin-bottom: 30px;">在线状�?�说�?  绿色：在线状�? &nbsp;&nbsp;&nbsp;&nbsp;红色：离线状�?   &nbsp;&nbsp;&nbsp;&nbsp;</blockquote> -->
 
       
   </div>
</body>
</html>