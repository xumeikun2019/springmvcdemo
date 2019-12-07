<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/table.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>中铝金融智能综合管理平台</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${ctx}/statics/plugins/layui/css/layui.css" media="all" />
	<%-- <link rel="stylesheet" href="${ctx}/statics/css/main.css" media="all" /> --%>
	<link rel="stylesheet"  href="${ctx}/statics/css/style.sign.calendar.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/style.sign.css" />
  	 <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.form.min.js"></script>
    <style type="text/css">
        body{
        	background: #f2f2f2;
        	margin:0;
        	padding:0;
        }
        .layui-card{
          	border-radius: 15px;
        }
        .layui-card-header{
        	height: 35px;
        	line-height: 35px;
        	padding-left:0;
        }
        
        .layui-card-header label{
            width: 150px;
            color:white;
            background: #4396ca;
            text-align: center;
            border-top-left-radius: 15px;
        }
        
        .container {
           height: 100%;
           width:99%;
           margin:0 auto;
        }
        
        .top{
           padding:5px 0 0 0;
        }
        
        .top .card {
            height: 288px; 
        }
        
        .bottom {
          width: 99%;
          position: absolute;
          top: 299px;
          bottom: 0px;
          margin:0 auto;
        }
        
        .bottom .card {
            height: 100%;  
        }
        
        .no-data{
        	/* height: 35px; */
        }
        
        .meeting-table{
        	position: absolute;
        	top:0px; 
        	right:2px; 
        	left:2px; 
        	bottom:0;
        	height: 97%;
        }
        
        .meeting-table tr{
        	/* height: 35px; */
        }
        
        .layui-table tbody{
        	 overflow: auto;
        	 height: 50px;
        }
        
        .layui-table td{
        	 padding:6px 2px;
        }
        
        .layui-table th{
        	padding:6px 2px;
        	text-align: center;
        } 
        
        .layui-card-body{
           padding:3px;
        }
        
        .a-tips{
            float: right;
            color: #01AAED;
        }
        a:hover{
        color: #01AAED;
        }
        
    </style>
</head>
<body class="childrenBody">
	<div class="container">
		<div class="top">
     		<div style="width: 50%;float: left;">
        <%--  <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="background-color: #0099FF">
           <h2 class="am-titlebar-title ">
			  会议提醒
    	   </h2>
           <nav class="am-titlebar-nav">
        		<!-- <a href="${ctx}/main/meetingOrder/more.do" class="" target="_blank">更多 &raquo;</a> -->
        		<!-- <a onclick="gethytxmore()" target="_blank">更多 &raquo;</a> -->
        		<a onclick="newTab('会议提醒更多',' ','${ctx}/main/meetingOrder/hytxmore.shtml');" target="_blank">更多 &raquo;</a>
    		</nav>
<<<<<<< .mine
		</div> --%>
		
		<div class="layui-card card">
        	<div class="layui-card-header">
        	         <label>部门会议提醒</label>
        	   <a href="javascript:newTab('会议提醒更多',' ','${ctx}/main/meetingOrder/hytxmore.shtml')" class="a-tips">更多</a>
        	   </div>
	        <div class="layui-card-body">
	          <table class="layui-table" lay-skin="line" id="hytx">
			  </table>
	        </div>
      	</div>
     </div>

     <div style="width: 50%;float: left;">
        <%-- <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="background-color: #0099FF;" >
           <h2 class="am-titlebar-title ">
			  待办事宜
    	   </h2>

           <nav class="am-titlebar-nav">
        		<!-- <a href="${ctx}/main/meetingOrder/dbsxmore.do" class="" target="_blank">更多 &raquo;</a> -->
        		<!-- <a onclick="getdbsxmore()" class="" target="_blank">更多 &raquo;</a> -->
        		<a onclick="newTab('待办事宜更多',' ','${ctx}/main/meetingOrder/dbsxmore.shtml');" target="_blank">更多 &raquo;</a>
    		</nav>
		</div>
		<div style="padding:0 0 0 5px">
			<table style="width: 100%;height: 80%;table-layout:fixed" align="center" border="1px;"  cellspacing="0" cellpadding="0" id="dbsx">
				
			</table>           
		</div> --%>
		
		<div class="layui-card card" style="margin-left:5px;">
        	<div class="layui-card-header">
        	  <label>待办事宜</label>
        	   <a href="javascript:newTab('待办事宜更多',' ','${ctx}/main/meetingOrder/dbsxmore.shtml')" class="a-tips">更多</a>
        	</div>
	        <div class="layui-card-body">
	          <table class="layui-table" lay-skin="line" id="dbsx">
			  </table>
	        </div>
      	</div>
     </div> 
     
     <div style="clear:both;"></div>
  </div>
  
  <div class="bottom">
  <div style="width: 50%;float: left;">
  		<!-- <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="background-color: #0099FF" >
  			<h2 class="am-titlebar-title ">
			  我的会议
    	    </h2>
    	</div>
  		<div>
			<table style="width: 100%;height: 93%" align="center" border="1px;"  cellspacing="0" cellpadding="0" id="wdhy">
				
			</table>           
		</div> -->
       <div class="layui-card card" style="position: relative;">
        	<div class="layui-card-header">
        	    <label>部门会议</label>
        	 </div>
	        <div class="layui-card-body" style="position: absolute;top:35px; right:0; left:0; bottom:0;">
	          <table class="layui-table meeting-table" id="wdhy">
			  </table>
	        </div>
      	</div>
  	</div>
  	<div style="width: 50%;float: left;">
  		 <!-- <div data-am-widget="titlebar" class="am-titlebar am-titlebar-default" style="background-color: #0099FF" >
  		 	<h2 class="am-titlebar-title ">
			  我的考勤
    	    </h2>
    	 </div>
  		 <div class="row">
				<div class="col-xs-12 clearPadding">
					<div style="padding:0 0 0 15px">
						<div style="height: 100%;width: 100%">
							<div id="calendar">
								
							</div>
						</div>
					</div>
				</div>
		   </div> -->
  		 
  		  <div class="layui-card card" style="margin-left: 5px;position: relative;">
        	<div class="layui-card-header">
        	    <label>我的考勤</label>
        	 </div>
	        <div class="layui-card-body" style="position: absolute;top:40px; right:0; left:0; bottom:0;">
	          <div id="calendar">
	            
			  </div>
	        </div>
      	</div>
  		
  	</div> 
  	
  	 <div style="clear:both;"></div>
  	
  </div>
	</div>
	
<!-- <div id="hytxmore" class="admin-main" style="display: none;">
	
	高级搜索区域
        <div class="page_explain">

            <form class="layui-form" action="">

                <div class="layui-inline">
                    <label class="layui-form-label">预约�?</label>
                    <div class="layui-input-inline">
                        <input type="text" autocomplete="off" class="layui-input" id="orderName">
                    </div>
                </div>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-small search-button" id="searchName">搜索</button>
            </form>
        </div>
	

        按钮操作
        <div class="table_control">
            <div class="table_opera">
            </div>

             搜索区域操作
            <div class="table_search">
                <input type="text" id="_search" class="keyword" placeholder="请在这里输入关键�?" style="height:25px;">
                
	           <div class="layui-form">
		            <div class="layui-inline">
	                    <label class="layui-form-label">会议室搜�?</label>
	                    <div class="layui-input-inline">
	                        <input id="place_name" type="text" autocomplete="off" class="layui-input" placeholder="">
	                    </div>
	                </div>
	                 <button type="button" class="layui-btn layui-btn-primary" id="searchBtn"><i class="layui-icon layui-icon-search"></i></button>
	            </div>
            </div>           
    </div>

   
   表格区域 
   <form id="gridform">
    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th>
            <th>会议名称</th>
            <th>会议地点</th>
            <th>会议时间�?</th>
            <th>会议时间�?</th>
        </tr>
        </thead>
    </table>
   </form>
</div>
 -->
	<!-- 
	<div class="panel_box row">
		<h2 style="text-align: left;padding-top: 30px;padding-left: 40px;">欢迎使用中铝金融智能综合管理平台</h2>
		<div style="text-align: center;">
			<img style="width: 400px;" src="${ctx}/statics/images/welcome.png" >
		</div>			
		
	</div>
	<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/statics/js/main.js"></script>
	 -->
<script src="${ctx}/statics/js/calendar.js" charset="utf-8"></script>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/main.js"></script>
<script type="text/javascript">
	layui.use(['form'], function(){
    var form = layui.form;

});
</script>
<script>
$(function(){
   var signList=new Array();
   var day=getNowFormatDate();
   for(var i=1;i<32;i++){
   	if(i<=day){
    	var a=i<10? "0" + i:i+"";
    	signList[i-1]={"signDay":a};
    }
   }
   //判断本月�?
   calUtil.init("${user.id}"); 
//   calUtil1.init("${user.id}");
   $('.sign_cal td').click(function(){	   
//    var val = $(this).text();
//    val=val<10? "0" + val:val;
  //  alert(val);
//    signIn(getNowFormatDate1()+"-"+val);
   });
   //会议提醒添加
   $.post('${ctx}/main/meetingOrder/findhytx.do',{},function (json) {
	   var hytx=" <thead><tr style='text-align:center;'>"+
					"<th>序号</th>"+
					"<th>会议名称</th>"+
					"<th>会议�?始时�?</th>"+
					"<th>会议地点</th>"+
				"</tr> </thead><tbody>";

				if (json.data.length > 0) {
					for(var i=0;i<6;i++){
						   if(json.data.length>i){
							   hytx+="<tr align='center'>"+
										"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+(i+1)+"'>"+(i+1)+"</td>"+
										"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].meeting_name+"'>"+json.data[i].meeting_name+"</td>"+
										"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].time_start+"'>"+json.data[i].time_start+"</td>"+
										"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].name+"'>"+json.data[i].name+"</td>"+
									 "</tr>";
						   }  
					   }
				} else {
					hytx += '<tr style="text-align:center;"><td colspan=4>暂无显示内容</td></tr>';
				}
	   
	  
	   $("#hytx").html('</tbody>' + hytx);
   });
   //待办事宜添加
   $.post('${ctx}/main/meetingOrder/finddbsx.do',{},function (json) {
//	   console.log(json.data);
	   var dbsx = '<colgroup><col width="50"><col width="90"><col><col><col><col width="40"></colgroup>'; 
	   dbsx += "<thead><tr style='text-align:center;'>"+
					"<th>序号</th>"+
					"<th>事项名称</th>"+
					"<th>事项内容</th>"+
				/* 	"<th>提交�?</th>"+ */
				"<th>提交时间</th>"+
					"<th>操作</th>"+
				"</tr></thead><tbody>";
				if (json.data.length  > 0) {
					for(var i=0;i<6;i++){
						   console.log();
						   if(json.data.length>i){
							   if(json.data[i].name=="会议室申�?"){
								   dbsx+="<tr align='center'>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+(i+1)+"'>"+(i+1)+"</td>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='会议室申�?'>"+"会议室申�?"+"</td>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].meetingName+"'>"+json.data[i].meetingName+"</td>"+
									/* "<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].sysName+"'>"+json.data[i].sysName+"</td>"+ */
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].add_time+"'>"+json.data[i].add_time+"</td>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='审核'>"+"<a href='#' style='color: #0000FF' onclick='newTab(\"审核\",\"\",\"${ctx}/main/meetingOrder/edit.shtml?id="+json.data[i].id+"\");'>审核</a></td>"+
//									"<td>"+"<a  style='color: #0000FF' href='${ctx}/main/meetingOrder/edit.shtml?id="+json.data[i].id+"'>审核</a>"+"</td>"+
								 "</tr>";
							   }else if(json.data[i].name=="节目审核"){
								   dbsx+="<tr style='height: 14%' align='center'>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+(i+1)+"'>"+(i+1)+"</td>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='节目审核'>"+"节目审核"+"</td>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].sysName+"'>"+"<a href='#' style='color: #0000FF' onclick='jmck(\""+json.data[i].sucaiIds+"\")' >"+json.data[i].sysName+"</a>"+"</td>"+
									/* "<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].meetingName+"'>"+json.data[i].meetingName+"</td>"+ */					
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].add_time+"'>"+json.data[i].add_time+"</td>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='审核'>"+"<a href='#'  style='color: #0000FF'  onclick='jmsh(\""+json.data[i].id+"\")'>审核</a>"+"</td>"+
								 "</tr>";
							   }else{
								   dbsx+="<tr style='height: 14%' align='center'>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+(i+1)+"'>"+(i+1)+"</td>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='访客申请'>"+"访客申请"+"</td>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].meetingName+"'>"+json.data[i].meetingName+"</td>"+
									/* "<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].sysName+"'>"+json.data[i].sysName+"</td>"+ */
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='"+json.data[i].add_time+"'>"+json.data[i].add_time+"</td>"+
									"<td style='word-break:keep-all;white-space:nowrap;overflow:hidden;text-overflow:ellipsis ' title='审核'>"+"<a href='#'  style='color: #0000FF' onclick='newTab(\"审核\",\"\",\"${ctx}/main/visitor/visitor.shtml?id="+json.data[i].id+"\");'>审核</a>"+"</td>"+
//									"<td>"+"<a  style='color: #0000FF' href='${ctx}/main/visitor/visitor.shtml?id="+json.data[i].id+"'>审核</a>"+"</td>"+
								 "</tr>";
							   }			   
						   }	  
					   }
				} else {
					dbsx += '<tr style="text-align:center;"><td colspan=5>暂无显示内容</td></tr>';
				}
	   
	   $("#dbsx").html('</tbody>'+ dbsx);
   })
   
   //我的会议添加
   $.post('${ctx}/main/meetingOrder/findwdhy.do',{},function (json) {
//	   console.log(json);
	   var wdhy="<thead><tr style='text-align:center;'>"+
		"<td>星期�?</td>"+
		"<td>星期�?</td>"+
		"<td>星期�?</td>"+
		"<td>星期�?</td>"+
		"<td>星期�?</td>"+
		"<td>星期�?</td>"+
		"<td>星期�?</td>"+
		"</tr></thead><tbody>";

		var xq1=new Array();var xq2=new Array();var xq3=new Array();var xq4=new Array();var xq5=new Array();var xq6=new Array();var xq7=new Array();
		for(var i=0;i<json.data.length;i++){			
			if(json.data[i].xq1!=""){
				xq1.push(json.data[i].xq1);
			}
			if(json.data[i].xq2!=""){
				xq2.push(json.data[i].xq2);
			}
			if(json.data[i].xq3!=""){
				xq3.push(json.data[i].xq3);
			}
			if(json.data[i].xq4!=""){
				xq4.push(json.data[i].xq4);
			}
			if(json.data[i].xq5!=""){
				xq5.push(json.data[i].xq5);
			}
			if(json.data[i].xq6!=""){
				xq6.push(json.data[i].xq6);
			}
			if(json.data[i].xq7!=""){
				xq7.push(json.data[i].xq7);
			}
		}
//		console.log(xq2[0]);
		for(var i=0;i<6;i++){
			var Monday="";var Tuesday="";var Wednesday="";var Thursday="";var Friday="";var Saturday="";var Sunday="";
			if(xq1[i]!=undefined){
				Monday=xq1[i];
			}
			if(xq2[i]!=undefined){
				Tuesday=xq2[i];
			}
			if(xq3[i]!=undefined){
				Wednesday=xq3[i];
			}
			if(xq4[i]!=undefined){
				Thursday=xq4[i];
			}
			if(xq5[i]!=undefined){
				Friday=xq5[i];
			}
			if(xq6[i]!=undefined){
				Saturday=xq6[i];
			}
			if(xq7[i]!=undefined){
				Sunday=xq7[i];
			}
			wdhy+="<tr align='center'>"+
				"<td>"+Monday+"</td>"+
				"<td>"+Tuesday+"</td>"+
				"<td>"+Wednesday+"</td>"+
				"<td>"+Thursday+"</td>"+
				"<td>"+Friday+"</td>"+
				"<td>"+Saturday+"</td>"+
				"<td>"+Sunday+"</td>"+
				"</tr>";
		}
//		console.log(wdhy);
		$("#wdhy").html('</tbody>'+ wdhy);
		var oTable = document.getElementById("wdhy");
		var iNum=new Array();
		if(xq1.length==0){	
			iNum.unshift(0);
//			deleteColumn(oTable,0); 
		}
		if(xq2.length==0){
			iNum.unshift(1);
		}
		if(xq3.length==0){
			iNum.unshift(2);
		}
		if(xq4.length==0){
			iNum.unshift(3);
		}
		if(xq5.length==0){
			iNum.unshift(4);
		}
		if(xq6.length==0){
			iNum.unshift(5);
		}
		if(xq7.length==0){
			iNum.unshift(6);
		}
//		console.log(iNum);
		if(iNum.length!=7){
			deleteColumn(oTable,iNum); 
		}		
		/*
		for(var i=0;i<6;i++){
			  if(json.data.length>i){
				  wdhy+="<tr style='height: 14%' align='center'>"+
					"<td style='font-size:8px' >"+json.data[i].xq1+"</td>"+
					"<td style='font-size:8px' >"+json.data[i].xq2+"</td>"+
					"<td style='font-size:8px' >"+json.data[i].xq3+"</td>"+
					"<td style='font-size:8px' >"+json.data[i].xq4+"</td>"+
					"<td style='font-size:8px' >"+json.data[i].xq5+"</td>"+
					"<td style='font-size:8px' >"+json.data[i].xq6+"</td>"+
					"<td style='font-size:8px' >"+json.data[i].xq7+"</td>"+
				 "</tr>";
			  }else{
				  wdhy+="<tr style='height: 14%' align='center'>"+
					"<td></td>"+
					"<td></td>"+
					"<td></td>"+
					"<td></td>"+
					"<td></td>"+
					"<td></td>"+
					"<td></td>"+
				 "</tr>";
	  	   }	
		}	*/
	   
   })
})
function deleteColumn(oTable,iNum){
  //自定义删除列函数，即每行删除相应单元�?
  for (var index = 0; index < oTable.rows.length; index++){
	  for(var i=0;i<iNum.length;i++){
		  oTable.rows[index].deleteCell(iNum[i]);
	  }
	  
  }
    
}

//节目审核
function jmsh(id) {
//	alert(id);
	layer.confirm('', {
		  btn: ['通过','不�?�过'] //按钮
		}, function(){
			$.post('${ctx}/main/meetingOrder/jmshtg.do?id='+id,{},function (json) {
				layer.msg('审核成功', {icon: 1});
			})
			top.location.reload();
		}, function(){
			$.post('${ctx}/main/meetingOrder/jmshbtg.do?id='+id,{},function (json) {
				layer.msg('审核成功', {icon: 1});
			})
			top.location.reload();
		});

}

//节目查看
function jmck(id) {
	 var index = layer.open({
         type: 2,
         content: '${ctx}/jiemu/openShow.do?sucaiIds='+id,
         area: ['100%', '100%'],
         title:'节目查看',
         offset:'t',
         maxmin: true
     });
}

function gethytxmore() {
//	$("#hytxmore").style.display ="block";

	container = layer.open({
        type: 1,
        title: '会议提醒列表',
        shade: [0.5],
        maxmin: true, //�?启最大化�?小化按钮
        area: ['100%', '100%'],
        content: $('#hytxmore').html()
    });
}

function getdbsxmore() {
//	$("#hytxmore").style.display ="block";

	container = layer.open({
        type: 1,
        title: '待办事宜列表',
        shade: [0.5],
        maxmin: true, //�?启最大化�?小化按钮
        area: ['100%', '100%'],
        content: $('#dbsxmore').html()
    });
}
    	
function getNowFormatDate() {//获取当前时间(�?)	
	var date = new Date();	
	var seperator1 = "-";	
	var seperator2 = ":";	
	var month = date.getMonth() + 1<10? "0"+(date.getMonth() + 1):date.getMonth() + 1;	
	var strDate = date.getDate()<10? "0" + date.getDate():date.getDate();	
	var currentdate = strDate;	
	return currentdate;
}
function getNowFormatDate1() {//获取当前时间(�?-�?)	
	var date = new Date();	
	var seperator1 = "-";	
	var seperator2 = ":";	
	var month = date.getMonth() + 1<10? "0"+(date.getMonth() + 1):date.getMonth() + 1;	
	var year = date.getFullYear(); 
	var currentdate = year+seperator1+month;	
	return currentdate;
}

function newTab(title,icon,url){
	 window.parent.tab.newTab({
         title: title,
         icon: '',
         href: url
     });
}
    </script>
</body>
</html>