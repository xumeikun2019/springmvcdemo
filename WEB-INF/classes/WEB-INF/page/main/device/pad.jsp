<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会议室平板在线状�?</title>
	<%@ include file="/common/taglibs.jsp"%>
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
    	   var url = '${ctx}/main/place/state/list.do';
    	   $.get(url,function(data){
    		   var html = '';
    		   $.each(data.data,function(i,d){
				   var floorName = d.name;
				   var list = d.list;
				   html += '<div class="floor"><div class="floor-label"><label>' + floorName + '</label></div><div class="rooms">';
				   $.each(list,function(index,room){
					   var roomName = room.name;
					   var roomId = room.id;
					   var mac = room.mac;
					   var online = room.online;
					   var list = d.list;
					   html += '<div class="meeting-room ' + online + '"><label>' + roomName + '</label></div>';
					   
	    		   });
				   html += '</div><div style="clear: left;"></div></div>';
    		   });
    		   $('.container').append(html);
    	   },'json');
       });
    </script>
</head>
<body>
   <div class="container">
   <fieldset class="layui-elem-field layui-field-title" >
  <legend>会议室平板在线情�?</legend>
</fieldset>
<blockquote class="layui-elem-quote" style="margin-bottom: 30px;">在线状�?�说�?  绿色：在线状�? &nbsp;&nbsp;&nbsp;&nbsp;红色：离线状�?</blockquote>
 
        <!-- <div class="floor">
          <div class="floor-label">
            <label>�?�?</label>
          </div>
          <div class="rooms">
          	 <div class="meeting-room online">
            	<label>会议�?</label>
          	 </div>
          	  <div class="meeting-room offline">
            	<label>会议�?</label>
          	 </div>
          	  <div class="meeting-room">
            	<label>会议�?</label>
          	 </div>
          	  <div class="meeting-room">
            	<label>会议�?</label>
          	 </div>
          	  <div class="meeting-room">
            	<label>会议�?</label>
          	 </div>
          </div> 
       <div style="clear: left;"></div>
       </div> -->
       
       <!-- <div class="floor">
          <div class="floor-label">
            <label>�?�?</label>
          </div>
          <div class="rooms">
          	 <div class="meeting-room online">
            	<label>会议�?</label>
          	 </div>
          	  <div class="meeting-room offline">
            	<label>会议�?</label>
          	 </div>
          	  <div class="meeting-room">
            	<label>会议�?</label>
          	 </div>
          	  <div class="meeting-room">
            	<label>会议�?</label>
          	 </div>
          	  <div class="meeting-room">
            	<label>会议�?</label>
          	 </div>
          </div>
       </div>  -->
       
   </div>
</body>
</html>