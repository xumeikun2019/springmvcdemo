<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会议室会议状态</title>
	<%@ include file="/common/taglibs.jsp"%>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
    <link rel="stylesheet"  href="${ctx}/statics/plugins/layui/css/layui.css" />
    <link rel="stylesheet" href="${ctx}/statics/css/floor.css" />
    <style type="text/css">
      .room-container{
        text-align: center;
      }
      
      .room-name {
      	padding-left:30px;
      }
    
      .floor .rooms .meeting-room{
       		padding:5px;
       		width: auto;
       }
       
       .floor .rooms .meeting-room label {
			white-space:nowrap;
			overflow:hidden;
			min-width:200px;
			text-overflow:ellipsis;
		    cursor: pointer;
		}
    </style>
    <script type="text/javascript">
	layui.use(['layer'], function(){
 	   var url = '${ctx}/main/place/findmt.do';
 	   var index;
 	  
 	  $.get(url,function(data){
 		   var placeList = data.data.placeList;
 		   var meetingList = data.data.meetingList;
 		   var html = '';
 		   $.each(placeList,function(i,d){
				   var placeId = d.id;
				   var placeName = d.name;
				   html += '<div class="floor" ><div class="floor-label" id="' + placeName + '"><label>' + placeName + '</label></div><div class="rooms">';
				   
				   
				   $.each(meetingList,function(index,meeting){
					   var parentId = meeting.parentId;
					   var meetingName = meeting.meetingName;
					   var placeName = meeting.placeName;
					   var flag = meeting.flag;
					   if(placeId == parentId){
						   if(flag !== undefined){
							   if(flag=='1'){
							   		html += '<div class="rooms"> <div class="room-container"> <div class="meeting-room"> <label>'+ meetingName +'</label> </div> <div class="room-name"> <label>'+ placeName +'</label> </div> </div> </div>';
							   }else{
							  	    
								    html += '<div class="rooms"> <div class="room-container"> <div class="meeting-room"> <label>无</label> </div> <div class="room-name"> <label>'+ placeName +'</label> </div> </div> </div>';   
								    }
						   }
//						   html += '<div class="meeting-room ' + online + '"><label>' + roomName + '</label></div>';  
					   }
	    		   });
				   html += '</div><div style="clear: left;"></div></div>';
 		   });
 		   $('.container').append(html);
 		   
 		  $('.floor').on('mouseover','.rooms .meeting-room label',function(){
 	 		   var text = $(this).text();
 	 		   if(text != '无'){
 	 			 index = layer.tips(text, $(this),{tips: [2, '#6bbbfa'],time:0});
 	 		   }
 	 	   });
 	 	   
 	 	   $('.floor').on('mouseout','.rooms .meeting-room label',function(){
 	 		  layer.close(index);
 	  	   }); 
 	 	   
 	   },'json'); 
    });
    </script>
</head>
<body>
   <div class="container">
   <fieldset class="layui-elem-field layui-field-title" >
  <legend>会议室情况</legend>
</fieldset>
<blockquote class="layui-elem-quote" style="margin-bottom: 30px;">会议室状态说明  &nbsp;&nbsp;  当前时间有会议：显示会议名称 &nbsp;&nbsp;&nbsp;&nbsp;当前时间无会议：显示会议室名称</blockquote>
 
        <!--  <div class="floor">
          <div class="floor-label">
            <label>一楼</label>
          </div>
          <div class="rooms">
            <div class="room-container">
               <div class="meeting-room">
            	  <label>会议室会议会议室会议会议室会议</label>
          	   </div>
          	   <div class="room-name">
            	 <label>101</label>
               </div>
            </div>
          </div> 
       <div style="clear: left;"></div>
       </div>   -->
       
       <!-- <div class="floor">
          <div class="floor-label">
            <label>一楼</label>
          </div>
          <div class="rooms">
          	 <div class="meeting-room online">
            	<label>会议室</label>
          	 </div>
          	  <div class="meeting-room offline">
            	<label>会议室</label>
          	 </div>
          	  <div class="meeting-room">
            	<label>会议室</label>
          	 </div>
          	  <div class="meeting-room">
            	<label>会议室</label>
          	 </div>
          	  <div class="meeting-room">
            	<label>会议室</label>
          	 </div>
          </div>
       </div>  -->
       
   </div>
</body>
</html>