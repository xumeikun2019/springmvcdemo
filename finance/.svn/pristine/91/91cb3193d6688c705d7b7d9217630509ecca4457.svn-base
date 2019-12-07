<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>摄像头直播/回放</title>
<style type="text/css">
	html,body{border:0;margin:0;padding:0;width:100%;height:100%}
	td,tr{border:0;margin:0;padding:0;}
</style>
<script type="text/javascript" src="${ctx}/finance/statics/js/jiankong/hls.min.js"></script>
<script type="text/javascript">
	Date.prototype.format = function(fmt) { 
	     var o = { 
	        "M+" : this.getMonth()+1,                 //月份 
	        "d+" : this.getDate(),                    //日 
	        "h+" : this.getHours(),                   //小时 
	        "m+" : this.getMinutes(),                 //分 
	        "s+" : this.getSeconds(),                 //秒 
	        "q+" : Math.floor((this.getMonth()+3)/3),   //季度 
	        "S"  : this.getMilliseconds()             //毫秒 
	    }; 
	    if(/(y+)/.test(fmt)) {
	            fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
	    }
	     for(var k in o) {
	        if(new RegExp("("+ k +")").test(fmt)){
	             fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
	         }
	     }
	    return fmt; 
	}    
	
	window.onload=function(){
		if("true"=="${onlyZb}")
			document.getElementById("firstTr").style.display="none";
		else{
	        //回放开始和截止                                                                                                                                                                                                                                                        
	        var date=new Date();
	        document.getElementById("endTime").value=date.format("yyyy-MM-ddThh:mm");//"2019-10-10T12:00";
	        date.setDate(date.getDate()-3);
	        document.getElementById("beginTime").value=date.format("yyyy-MM-ddThh:mm");//"2019-10-10T12:00";
		}
		if("0"!="${code}"){
			alert("获取视频失败：${msg}");
			return;
		}
	  if(Hls.isSupported()) {
			console.log("${url}");
	    var video = document.getElementById('video');
	    var hls = new Hls();
	    hls.loadSource('${url}');
	    hls.attachMedia(video);
	    hls.on(Hls.Events.MANIFEST_PARSED,function() {
	      video.play();
	  });
	 }
	}
	
	function huifang(){
		var beginTime=document.getElementById("beginTime").value;//2019-09-03T03:42
		var endTime=document.getElementById("endTime").value;
		if(""==beginTime || ""==endTime){
			err();
			return;
		}
		if(_dateTimeToLong(endTime)-_dateTimeToLong(beginTime)>86400000*3){
			err();
			return;
		}
		window.open("${scheme}${address }${path }c/jk/huifang?beginTime="+beginTime+":00&endTime="+endTime+":00");
	}
	
	function err(){
		document.getElementById("err").style.display="";
		setTimeout(function() {
			document.getElementById("err").style.display="none";
		}, 3000);
	}
	
	function _dateTimeToLong(val){
		var dt=new Date();
		dt.setFullYear(val.substring(0,4),Number(val.substring(5,7))-1,val.substring(8,10));
		dt.setHours(val.substring(11,13),val.substring(14,16),0,0);
		return dt.getTime();
	}
</script>
</head>
<body>
	<video id="video" style="width:100%;height:95%"></video>
	<table style="position:absolute;top:0;left:0;z-index:999">
		<tr id="firstTr">
			<td><input type="datetime-local" id="beginTime"/>至<input type="datetime-local" id="endTime"/><button onclick="huifang()">回放</button></td>
			<td><button style="color:red;font-weight:bold;display:none" id="err">请填全年月日时分，前后相差3日之内！</button></td>
			<td align="right"><button onclick="window.parent.closeVideo()">关闭</button></td>
		</tr>
	</table>
</body>
</html>