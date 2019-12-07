<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>会议预约</title>
<%@ include file="/common/taglibs.jsp"%>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
<link rel="stylesheet" href="${ctx}/statics/plugins/layui/css/layui.css" />
<link rel="stylesheet" href="${ctx}/statics/css/meeting.table.css" />
<script type="text/javascript">
     var openIndex = 0;
     var loadTimes = 0;
     var clickTime = 0;
	   layui.use(['layer','laydate'], function(){
		  var layer = layui.layer,laydate = layui.laydate;
		  laydate.render({
			  elem : '#date',
				format : 'yyyy-MM-dd',
				type: 'date',
				min: 0,
				done: function(value, date, endDate){
					load(value);
				  }
		  });
		  
		  load('');
		  
		  var index;
		  $('#tablebody').on('mouseover','tr td.background-gray-order, tr td.background-green',function(){
			  var mname = $(this).attr('mname');
			  var stime = $(this).attr('stime');
			  var etime = $(this).attr('etime');
			  var text = '会议名称�?' + mname + '<br>' + '会议时间�?' + stime + '-' + etime;
			  index = layer.tips(text, $(this),{tips: [2, '#6bbbfa'],time:0});
			  $(this).attr('title','');
		  });
		  
		  $('#tablebody').on('mouseleave','tr td.background-gray-order, tr td.background-green',function(){
			  var timeShow = $(this).attr('data-value');
			  $(this).attr('title',timeShow);
			  layer.close(index);
		  }); 
		});             

	   function load(day) {
		   var url = '${ctx}/main/place/room/list.do?meetingTime=' + day + '&deptId=${user.dept_id}';
			  var html = '';
			  $.get(url,function(data){
				  var date = data.message;
				  if (day == '') {
					  $('#date').val(date);
				  }
				  var list = data.data;
				  $.each(list,function(i,d){
					  var mname = d.name;
					  var id = d.id;
					  var verify = d.verify;
					  var mtime = d.list;
					  html += '<tr id="' + id + '" data-key="' + mname + '" data-value="' + id + '" data-verify="' + verify + '"> <td>' + mname + '</td>  <td time-index="1" data-time="08:00" data-value="08:00-08:15" title="08:00-08:15"></td> <td time-index="2" data-time="08:15" data-value="08:15-08:30" title="08:15-08:30"></td> <td time-index="3" data-time="08:30" data-value="08:30-08:45" title="08:30-08:45"></td> <td time-index="4" data-time="08:45" data-value="08:45-09:00" title="08:45-09:00"></td>  <td time-index="5" data-time="09:00" data-value="09:00-09:15" title="09:00-09:15"></td> <td time-index="6" data-time="09:15" data-value="09:15-09:30" title="09:15-09:30"></td> <td time-index="7" data-time="09:30" data-value="09:30-09:45" title="09:30-09:45"></td> <td time-index="8" data-time="09:45" data-value="09:45-10:00" title="09:45-10:00"></td>  <td time-index="9" data-time="10:00" data-value="10:00-10:15" title="10:00-10:15"></td> <td time-index="10" data-time="10:15" data-value="10:15-10:30"></td> <td time-index="11" data-time="10:30" data-value="10:30-10:45"></td> <td time-index="12" data-time="10:45" data-value="10:45-11:00" title="10:45-11:00"></td>  <td time-index="13" data-time="11:00" data-value="11:00-11:15" title="11:00-11:15"></td> <td time-index="14" data-time="11:15" data-value="11:15-11:30" title="11:15-11:30"></td> <td time-index="15" data-time="11:30" data-value="11:30-11:45" title="11:30-11:45"></td> <td time-index="16" data-time="11:45" data-value="11:45-12:00" title="11:45-12:00"></td>  <td time-index="17" data-time="12:00" data-value="12:00-12:15" title="12:00-12:15"></td> <td time-index="18" data-time="12:15" data-value="12:15-12:30" title="12:15-12:30"></td> <td time-index="19" data-time="12:30" data-value="12:30-12:45" title="12:30-12:45"></td> <td time-index="20" data-time="12:45" data-value="12:45-13:00" title="12:45-13:00"></td> <td time-index="21" data-time="13:00" data-value="13:00-13:15" title="13:00-13:15"></td> <td time-index="22" data-time="13:15" data-value="13:15-13:30" title="13:15-13:30"></td> <td time-index="23" data-time="13:30" data-value="13:30-13:45" title="13:30-13:45"></td> <td time-index="24" data-time="13:45" data-value="13:45-14:00" title="13:45-14:00"></td> <td time-index="25" data-time="14:00" data-value="14:00-14:15" title="14:00-14:15"></td> <td time-index="26" data-time="14:15" data-value="14:15-14:30" title="14:15-14:30"></td> <td time-index="27" data-time="14:30" data-value="14:30-14:45" title="14:30-14:45"></td> <td time-index="28" data-time="14:45" data-value="14:45-15:00" title="14:45-15:00"></td> <td time-index="29" data-time="15:00" data-value="15:00-15:15" title="15:00-15:15"></td> <td time-index="30" data-time="15:15" data-value="15:15-15:30" title="15:15-15:30"></td> <td time-index="31" data-time="15:30" data-value="15:30-15:45" title="15:30-15:45"></td> <td time-index="32" data-time="15:45" data-value="15:45-16:00" title="15:45-16:00"></td> <td time-index="33" data-time="16:00" data-value="16:00-16:15" title="16:00-16:15"></td> <td time-index="34" data-time="16:15" data-value="16:15-16:30" title="16:15-16:30"></td> <td time-index="35" data-time="16:30" data-value="16:30-16:45" title="16:30-16:45"></td> <td time-index="36" data-time="16:45" data-value="16:45-17:00" title="16:45-17:00"></td> <td time-index="37" data-time="17:00" data-value="17:00-17:15" title="17:00-17:15"></td> <td time-index="38" data-time="17:15" data-value="17:15-17:30" title="17:15-17:30"></td> <td time-index="39" data-time="17:30" data-value="17:30-17:45" title="17:30-17:45"></td> <td time-index="40" data-time="17:45" data-value="17:45-18:00" title="17:45-18:00"></td> <td time-index="41" data-time="18:00" data-value="18:00-18:15" title="18:00-18:15"></td> <td time-index="42" data-time="18:15" data-value="18:15-18:30" title="18:15-18:30"></td> <td time-index="43" data-time="18:30" data-value="18:30-18:45" title="18:30-18:45"></td> <td time-index="44" data-time="18:45" data-value="18:30-18:45" title="18:30-18:45"></td> <td time-index="45" data-time="19:00" data-value="19:00-19:15" data-value="19:00-19:15" title="19:00-19:15"></td> <td time-index="46" data-time="19:15" data-value="19:15-19:30" title="19:15-19:30"></td> <td time-index="47" data-time="19:30" data-value="19:30-19:45" title="19:30-19:45"></td> <td time-index="48" data-time="19:45" data-value="19:45-20:00" title="19:45-20:00"></td> <td time-index="49" data-time="20:00" data-value="20:00-20:15" title="20:00-20:15"></td> <td time-index="50" data-time="20:15" data-value="20:15-20:30" title="20:15-20:30"></td> <td time-index="51" data-time="20:30" data-value="20:30-20:45" title="20:30-20:45"></td> <td time-index="52" data-time="20:45" data-value="20:45-21:00" title="20:45-21:00"></td> <td time-index="53" data-time="21:00" data-value="21:00-21:15" title="21:00-21:15"></td> <td time-index="54" data-time="21:15" data-value="21:15-21:30" title="21:15-21:30"></td> <td time-index="55" data-time="21:30" data-value="21:30-21:45" title="21:30-21:45"></td> <td time-index="56" data-time="21:45" data-value="21:45-22:00" title="21:45-22:00"></td> <td time-index="57" data-time="22:00" data-value="22:00-22:15" title="22:00-22:15"></td> <td time-index="58" data-time="22:15" data-value="22:15-22:30" title="22:15-22:30"></td> <td time-index="59" data-time="22:30" data-value="22:30-22:45" title="22:30-22:45"></td> <td time-index="60" data-time="22:45" data-value="22:45-23:00" title="22:45-23:00"></td> <td time-index="61" data-time="23:00" data-value="23:00-23:15" title="23:00-23:15"></td> <td time-index="62" data-time="23:15" data-value="23:15-23:30" title="23:15-23:30"></td> <td time-index="63" data-time="23:30" data-value="23:30-23:45" title="23:30-23:45"></td> <td time-index="64" data-time="23:45" data-value="23:45-24:00" title="23:45-24:00"></td><td style="display:none;" time-index="65" data-time="24:00" data-value="24:00-24:15"></td> </tr>';
				  });
				  $('#tablebody').children().remove();
				  $('#tablebody').append(html);
				  if (list.length > 0) {
					  $.each(list,function(i,d){
						  var id = '#' + d.id;
						  var mtime = d.list;
						  $.each(mtime,function(index,data){
							  var state = data.state;
							  var className = '';
							  if (state == 'T') {
								  className = 'background-green';
							  } else {
								  className = 'background-gray-order';
							  }
							  var mname = data.meeting_name;
							  var startIndex = $(id + ' td[data-time="' + data.timeStart + '"]').attr('time-index');
							  var endIndex = $(id + ' td[data-time="' + data.timeEnd + '"]').attr('time-index');
							  console.log('startIndex--' + startIndex);
							  console.log('endIndex--' + endIndex);
							  for (var i = parseInt(startIndex); i < parseInt(endIndex); i++) {
					        		if (i == parseInt(startIndex)) {
					        			var $choose = $(id + ' td[time-index=' + i + ']').addClass(className).attr('order','order').attr('mname',mname).attr('stime',data.timeStart).attr('etime',data.timeEnd).css('border-left','2px solid red');
					        			var minus = parseInt(endIndex) - parseInt(startIndex);
					        			if (minus == 1) {
					        				$choose.css('border-right','2px solid red');
					        			}
					        		} else if (i == parseInt(endIndex) - 1) {
					        			$(id + ' td[time-index=' + i + ']').addClass(className).attr('order','order').attr('mname',mname).attr('stime',data.timeStart).attr('etime',data.timeEnd).css('border-right','2px solid red');
					        		} else {
					        			$(id + ' td[time-index=' + i + ']').addClass(className).attr('order','order').attr('mname',mname).attr('stime',data.timeStart).attr('etime',data.timeEnd);
					        		}
					          }
						  });
					  });
				  }
					  
				 
				  
			  },'json');
			  
			 
			  var startTime = '';
	      	  var endTime = '';
	      	  var sameId = '';
	      	  var isOrder = false;
	      	  if (loadTimes == 0) {
	      		$('#tablebody').on('click','tr td:not(.background-gray-order,.background-green)',function(){
	      			var timeFirst = $(this).attr('data-value');
		        	if (typeof(timeFirst) == 'undefined') {
		        		return false;
		        	}
		        	
		      		if (sameId == '') {
		      			sameId = $(this).parent().attr('id');
		      		}
		      		var secondId = $(this).parent().attr('id');
		      		
		      		var sameIndex = parseInt($('.time-choose').attr('time-index'));
		      		var secondIndex = parseInt($(this).attr('time-index'));
		      		
		      		if (sameId != secondId) {
		      			return false;
		      		}
		      		
		      		if (sameIndex > secondIndex) {
		      			return false;
		      		}
		      		
			        	$(this).addClass('time-choose');
			        	var tindex = $('#meeting-time td.time-choose:first').attr('time-index')
			        	var chooseStart = parseInt($(this).parent().find('td.time-choose:first').attr('time-index'));
			        	var tindexEnd = parseInt($(this).attr('time-index')); 
			        	for (var i = chooseStart; i <= tindexEnd; i++) {
			        		var order = $(this).parent().find('td[time-index=' + i + ']').attr('order');
			        		if (order == 'order') {
			        			isOrder = true;
			        		}
			        		$(this).parent().find('td[time-index=' + i + ']').addClass('background-blue');
			        	}
			        	clickTime++;
			        	var thiz = $(this);
			        	var time = thiz.attr('data-value');
			        	if (clickTime == 1) {
			        		startTime = time.split('-')[0];
			        	} else if (clickTime == 2) {
			        		sameId = '';
			        		if (isOrder == true) {
			        			layer.msg('该时段不能预约！', {
			                        icon: 0
			                    });
			        			var day = $('#date').val();
				       	    	load(day);
				       	    	clickTime = 0;
				       	    	isOrder = false;
			        			return false;
			        		}
			        		endTime = time.split('-')[1];
			        		var day = $('#date').val();
			        		var meetingRoomId = $(this).parent().attr('id');
			        		var meetingRoomName = $(this).parent().attr('data-key');
			        		var verify = $(this).parent().attr('data-verify') == 'T' ? 'manual' : 'auto';
			        		var tip = '您当前�?�择的是' + meetingRoomName + '<br>日期为：' + day + ' ' + startTime + '-' + endTime + '<br>点击确认按钮后进入添加预约信息界�?';
			        		var index = layer.confirm(tip,{title:'确认',closeBtn: 0}, function(){
			        			openIndex = layer.open({
			                        type: 2,
			                        title: '会议预约',
			                        shade: [0.1],
			                        closeBtn: 0,
			                        maxmin: true, //�?启最大化�?小化按钮
			                        area: ['80%', '80%'],
			                        content: '${ctx}/main/meeting/reservation.shtml?meetingRoomId=' + meetingRoomId + '&name=' + meetingRoomName + '&day=' + day + '&startTime=' + startTime + '&endTime=' + endTime + '&verify=' + verify,
			                    }); 
			        			layer.close(index);
				       	    },function(){
				       	    	var day = $('#date').val();
				       	    	load(day);
				       	    	clickTime = 0;
				       	    });
			        		
			        		
			        	}
			        }); 
	      	  }
	      	 
	      	loadTimes++;
	   }
	   
	   function close(){
		   layer.close(openIndex);
		   var day = $('#date').val();
  	       load(day);
  	       clickTime = 0;
	   }
</script>
</head>
<body>
	<div class="container">
		<fieldset class="layui-elem-field layui-field-title">
			<legend>会议预约</legend>
		</fieldset>
		
		
		<form class="layui-form" action="">
                 <div class="layui-inline" style="margin-bottom:5px;">
		               <div class="layui-input-inline">
		                   <input type="text" id="date" name="meetingTime" maxlength="255" autocomplete="off"  class="layui-input" readonly="readonly">
		               </div>
           		</div> 
            </form>
		
		<div class="am_con" id="freezings" style=""
			onscroll="javascript:freezing()">
			<table class="hysRes" id="hysResTable" border="1"
				bordercolor="#a0c6e5">
				<thead>
					<tr id="tablehead">
						<td>会议�?</td>
						<td colspan="4">8:00</td>
						<td colspan="4">9:00</td>
						<td colspan="4">10:00</td>
						<td colspan="4">11:00</td>
						<td colspan="4">12:00</td>
						<td colspan="4">13:00</td>
						<td colspan="4">14:00</td>
						<td colspan="4">15:00</td>
						<td colspan="4">16:00</td>
						<td colspan="4">17:00</td>
						<td colspan="4">18:00</td>
						<td colspan="4">19:00</td>
						<td colspan="4">20:00</td>
						<td colspan="4">21:00</td>
						<td colspan="4">22:00</td>
						<td colspan="4">23:00</td>
					</tr>

					<tr height="1" style="height: 0px;">
						<td width="5.92%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>

						<td width="0.98%" style="height: 0px;"></td>
						
						<td width="0.98%" style="height: 0px;"></td>
						
						<td width="0.98%" style="height: 0px;display: none;"></td>
					</tr>
				</thead>
				<colgroup>
					<col width="5.92%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">

					<col width="0.98%">
					
					<col width="0.98%" style="display: none;">

				</colgroup>

				<tbody style="height: 80%" id="tablebody">
					<!-- <tr id="meeting-time" data-key="测试会议�?" data-value="2019102600659769">
						<td>
						<div> 测试会议�?
							</div>
						</td>
						
						<td time-index="1" data-time="480" data-value="08:00-08:15" id="td0_0_33"></td>
						<td time-index="2" data-time="495" data-value="08:15-08:30" id="td0_0_34"></td>
						<td time-index="3" data-time="510" data-value="08:30-08:45" id="td0_0_35"></td>
						<td time-index="4" data-time="525" data-value="08:45-09:00" id="td0_0_36"></td>
						
						<td time-index="5" data-time="540" data-value="09:00-09:15" id="td0_0_37"></td>
						<td time-index="6" data-time="555" data-value="09:15-09:30" id="td0_0_38"></td>
												<td time-index="7" data-time="570" data-value="09:30-09:45" id="td0_0_39"></td>
						<td time-index="8" data-time="585" data-value="09:45-10:00" id="td0_0_40"></td>
							
						<td time-index="9" data-time="600" data-value="10:00-10:15" id="td0_0_41"></td>
						<td time-index="10" data-time="615" data-value="10:15-10:30" id="td0_0_42"></td>
						<td time-index="11" data-time="630" data-value="10:30-10:45" id="td0_0_43"></td>
						<td time-index="12" data-time="645" data-value="10:45-11:00" id="td0_0_44"></td>
							
						<td time-index="13" data-time="660" data-value="11:00-11:15" id="td0_0_45"></td>
						<td time-index="14" data-time="675" data-value="11:15-11:30" id="td0_0_46"></td>
						<td time-index="15" data-time="690" data-value="11:30-11:45" id="td0_0_47"></td>
						<td time-index="16" data-time="705" data-value="11:45-12:00" id="td0_0_48"></td>
							
						<td time-index="17" data-time="720" data-value="12:00-12:15" id="td0_0_49"></td>
						<td time-index="18" data-time="735" data-value="12:15-12:30" id="td0_0_50"></td>
						<td time-index="19" data-time="750" data-value="12:30-12:45" id="td0_0_51"></td>
						<td time-index="20" data-time="765" data-value="12:45-13:00" id="td0_0_52"></td>
							
						<td time-index="21" data-time="780" data-value="13:00-13:15" id="td0_0_53"></td>
						<td time-index="22" data-time="795" data-value="13:15-13:30" id="td0_0_54"></td>
						<td time-index="23" data-time="810" data-value="13:30-13:45" id="td0_0_55"></td>
						<td time-index="24" data-time="825" data-value="13:45-14:00" id="td0_0_56"></td>
							
						<td time-index="24" data-time="840" data-value="14:00-14:15" id="td0_0_57"></td>
						<td time-index="25" data-time="855" data-value="14:15-14:30" id="td0_0_58"></td>
						<td time-index="26" data-time="870" data-value="14:30-14:45" id="td0_0_59"></td>
						<td time-index="27" data-time="885" data-value="14:45-15:00" id="td0_0_60"></td>
							 
						<td time-index="28" data-time="900" data-value="15:00-15:15" id="td0_0_61"></td>
						<td time-index="29" data-time="915" data-value="15:15-15:30" id="td0_0_62"></td>
						<td time-index="30" data-time="930" data-value="15:30-15:45" id="td0_0_63"></td>
						<td time-index="31" data-time="945" data-value="15:45-16:00" id="td0_0_64"></td>
							 
						<td time-index="32" data-time="960" data-value="16:00-16:15" id="td0_0_65"></td>
						<td time-index="33" data-time="975" data-value="16:15-16:30" id="td0_0_66"></td>
						<td time-index="34" data-time="990" data-value="16:30-16:45" id="td0_0_67"></td>
						<td time-index="35" data-time="1005" data-value="16:45-17:00" id="td0_0_68"></td>
							 
						<td time-index="36" data-time="1020" data-value="17:00-17:15" id="td0_0_69"></td>
						<td time-index="37" data-time="1035" data-value="17:15-17:30" id="td0_0_70"></td>
						<td time-index="38" data-time="1050" data-value="17:30-17:45" id="td0_0_71"></td>
						<td time-index="39" data-time="1065" data-value="17:45-18:00" id="td0_0_72"></td>
							 
						<td time-index="40" data-time="1080" data-value="18:00-18:15" id="td0_0_73"></td>
						<td time-index="5" data-time="1095" data-value="18:15-18:30" id="td0_0_74"></td>
						<td time-index="5" data-time="1110" data-value="18:30-18:45" id="td0_0_75"></td>
						<td time-index="5" data-time="1125" data-value="18:45-19:00" id="td0_0_76"></td>
							 
						<td time-index="5" data-time="1140" data-value="19:00-19:15" id="td0_0_77"></td>
						<td time-index="5" data-time="1155" data-value="19:15-19:30" id="td0_0_78"></td>
						<td time-index="5" data-time="1170" data-value="19:30-19:45" id="td0_0_79"></td>
						<td time-index="5" data-time="1185" data-value="19:45-20:00" id="td0_0_80"></td>
							 
						<td time-index="5" data-time="1200" data-value="20:00-20:15" id="td0_0_81"></td>
						<td time-index="5" data-time="1215" data-value="20:15-20:30" id="td0_0_82"></td>
						<td time-index="5" data-time="1230" data-value="20:30-20:45" id="td0_0_83"></td>
						<td time-index="5" data-time="1245" data-value="20:45-21:00" id="td0_0_84"></td>
							 
						<td time-index="5" data-time="1260" data-value="21:00-21:15" id="td0_0_85"></td>
						<td time-index="5" data-time="1275" data-value="21:15-21:30" id="td0_0_86"></td>
						<td time-index="5" data-time="1290" data-value="21:30-21:45" id="td0_0_87"></td>
						<td time-index="5" data-time="1290" data-value="21:45-22:00" id="td0_0_88"></td>
							 
						<td time-index="5" data-time="1335" data-value="22:00-22:15" id="td0_0_89"></td>
						<td time-index="5" data-time="1335" data-value="22:15-22:30" id="td0_0_90"></td>
						<td time-index="5" data-time="1350" data-value="22:30-22:45" id="td0_0_91"></td>
						<td time-index="5" data-time="1365" data-value="22:45-23:00" id="td0_0_92"></td>
							 
						<td time-index="5" data-time="1380" data-value="23:00-23:15" id="td0_0_93"></td>
						<td time-index="5" data-time="1395" data-value="23:15-23:30" id="td0_0_94"></td>
						<td time-index="5" data-time="1410" data-value="23:30-23:45" id="td0_0_95"></td>
						<td time-index="5" data-time="1425" data-value="23:45-24:00" id="td0_0_96"></td>
					</tr> -->
				</tbody>
			</table>
		</div>
		
		<blockquote class="layui-elem-quote" style="margin-top: 30px;">使用说明：点击空白区域�?�择会议室时�?  每小格为15分钟
			&nbsp;&nbsp;状�??  蓝色：�?�中时段 &nbsp;&nbsp;&nbsp;&nbsp; 绿色：会议审核�?�过 &nbsp;&nbsp;&nbsp;&nbsp;灰色：会议待审核</blockquote>
	</div>
</body>
</html>