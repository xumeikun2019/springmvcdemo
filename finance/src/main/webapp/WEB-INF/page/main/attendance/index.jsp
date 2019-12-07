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
</head>
<body>
   <div class="container">
	   <div class="row">
		<div class="col-xs-12 clearPadding">
			<div class="calendar">
				<div class="calenbox">
					<div id="calendar"><div class="sign_main" id="sign_layer"><div class="sign_succ_calendar_title"><div class="calendar_month_next">下月</div><div class="calendar_month_prev">上月</div><div class="calendar_month_span">2020年9月</div></div></div></div>
				</div>
			</div>
		</div>
	</div>
	<div style="height: 5%"></div>
	<div>
		<table style="width: 100%;height: 30%" align="center" border="1px;"  cellspacing="0" cellpadding="0"> 
			<tr align="center">
				<td>姓名</td>
				<td id="name"></td>
				<td>部门</td>
				<td id="deptname"></td>
			</tr>
			<tr align="center">
				<td colspan="4" id="type"></td>
			</tr>
			<tr align="center">
				<td>上下班时间</td>
				<td>类型</td>
				<td>上下班打卡时间</td>
				<td>工作时长</td>
			</tr>
			<tr align="center">
				<td id="sbsj"></td>
				<td>上班</td>
				<td id="sbdksj"></td>
				<td rowspan="2" id="gzsc"></td>
			</tr>
			<tr align="center">
				<td id="xbsj"></td>
				<td>下班</td>
				<td id="xbdksj"></td>
			</tr>
		</table>
	</div>
	<div class="maskbox"></div>
		<div class="qdbox">
	         上班打卡时间
	         下班打卡时间
		</div>
    </div>
    <script src="${ctx}/statics/js/calendar.js"></script>
    <script>
function  signIn(sj){
	$.post('${ctx}/main/attendanceRecord/findkqxx.do',{"id":"${user.id}","sj":sj},function (json) {
		if(json.data!=""){
			var sbdksj=json.data[0].sign_time;//上班打卡时间
			var xbdksj=json.data[0].off_time;//下班打卡时间
			var sbsj=json.data[0].time_start;//上班时间
			var xbsj=json.data[0].time_end;//下班时间
			var name=json.data[0].realname;//员工姓名
			var deptname=json.data[0].name;//员工部门
			var type=json.data[0].type;//状态
			var gzsc=getgzsc(sbdksj,xbdksj);//工作时间
			$("#sbdksj").html(sbdksj);
			$("#xbdksj").html(xbdksj);
			$("#sbsj").html(sbsj);
			$("#xbsj").html(xbsj);
			$("#gzsc").html(gzsc);
			$("#name").html(name);
			$("#deptname").html(deptname);
			$("#type").html(type);
		}else{
			$("#sbsj").html("");
			$("#xbsj").html("");
			$("#sbdksj").html("");
			$("#xbdksj").html("");
			$("#gzsc").html("");
		}
		
	})
//	$(".maskbox").fadeIn();
//	$(".qdbox").fadeIn();
//	$(".maskbox").height($(document).height());
}
$(".maskbox").click(function(){
	$(".maskbox").fadeOut();
	$(".qdbox").fadeOut();
});
$(function(){
	
  //ajax获取日历json数据
//  var signList=[{"signDay":"10"},{"signDay":"11"},{"signDay":"12"}];
  var signList=new Array();
  var day=getNowFormatDate();
  for(var i=1;i<32;i++){
	  if(i<=day){
		  var a=i<10? "0" + i:i+"";
		  signList[i-1]={"signDay":a};
	  }
  }
   calUtil.init(signList);
   
   $('.sign td').click(function(){
	   var val = $(this).text();
	   val=val<10? "0" + val:val;
//	   alert(getNowFormatDate1()+"-"+val);
	   signIn(getNowFormatDate1()+"-"+val);
   });
});
function getgzsc(sjq,sjz) {//计算工作时长	
	var sjq = new Date(sjq);
	var sjz = new Date(sjz);	
	var gzsc=MillisecondToDate(parseInt(sjz - sjq));	
	return gzsc;
}
//将毫秒秒转化为xx小时xx分钟xx秒
function MillisecondToDate(msd) {
     var time = parseFloat(msd) / 1000;   //先将毫秒转化成秒
    if (null != time && "" != time) {
         if (time > 60 && time < 60 * 60) {
             time = parseInt(time / 60.0) + "分钟" + parseInt((parseFloat(time / 60.0) -
                parseInt(time / 60.0)) * 60) + "秒";
         }
         else if (time >= 60 * 60 && time < 60 * 60 * 24) {
             time = parseInt(time / 3600.0) + "小时" + parseInt((parseFloat(time / 3600.0) -
                parseInt(time / 3600.0)) * 60) + "分钟" +
                 parseInt((parseFloat((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60) -
                parseInt((parseFloat(time / 3600.0) - parseInt(time / 3600.0)) * 60)) * 60) + "秒";
         }
         else {
             time = parseInt(time) + "秒";
         }
     }
     return time;
 }

function getNowFormatDate() {//获取当前时间(天)	
	var date = new Date();	
	var seperator1 = "-";	
	var seperator2 = ":";	
	var month = date.getMonth() + 1<10? "0"+(date.getMonth() + 1):date.getMonth() + 1;	
	var strDate = date.getDate()<10? "0" + date.getDate():date.getDate();	
	var currentdate = strDate;	
	return currentdate;
}
function getNowFormatDate1() {//获取当前时间(年-月)	
	var date = new Date();	
	var seperator1 = "-";	
	var seperator2 = ":";	
	var month = date.getMonth() + 1<10? "0"+(date.getMonth() + 1):date.getMonth() + 1;	
	var year = date.getFullYear(); 
	var currentdate = year+seperator1+month;	
	return currentdate;
}
</script>
</body>
