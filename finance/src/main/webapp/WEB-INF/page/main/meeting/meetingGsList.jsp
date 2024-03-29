<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>公司会议统计</title>
	<%@ include file="/common/taglibs.jsp"%>
    <%@ include file="/common/table.jsp"%>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- <meta name="apple-mobile-web-app-status-bar-style" content="black"> -->
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="${ctx}/statics/js/jquery.table.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.form.min.js"></script>
     <link rel="stylesheet"  href="${ctx}/statics/plugins/layui/css/layui.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
</head>
<body>
	<div class="layui-tab">
		<ul class="layui-tab-title">
		    <li class="layui-this">本周</li>
		    <li>下周</li>
		</ul>
		<div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
				<div class="admin-main">
					        <!-- 按钮操作 -->
				   <div class="table_control">
				   			<div class="table_opera">
				   				<button htype="button" title="导出" class="layui-btn layui-btn-primary " onclick="excelExport()">
				                    <i class="icon iconfont icon-export-o"></i>
				                </button>
				   			</div>
				             <!-- 搜索区域操作 -->
				            <div class="table_search">             
					           <div class="layui-form">				
					             <div class="layui-inline">
					                    <label class="layui-form-label">部门名称</label>
					                    <!-- 
					                    <div class="layui-input-block">
											<select id="select1"  lay-filter="lc"  name = "szlc" lay-verify="required" >
												<option value="" >请选择</option>
											</select>
									   </div> -->					                    
					                    <div class="layui-input-inline">
					                       	<input type="text" id="ld" required="" lay-verify="required" placeholder="--请选择--" readonly="" autocomplete="off" class="layui-input"> 
                      						<input name="orderLduserId" id="ldID"  type="hidden"   class="layui-input">     
					                    </div>
				                </div>
				                <button type="button" class="layui-btn layui-btn-primary" id="searchBtn"><i class="layui-icon layui-icon-search"></i></button>
					            </div>
				            </div>           
				    </div>

				   <!--表格区域  -->
				    <div style="float: right;width: 100%;height: 100%">
				    	<table style="width: 100%;height: 93%;font-size: 15px;" align="center" border="1px;"  cellspacing="0" cellpadding="0" id="wdhy" bordercolor="#ccc">
							<tr align="center" style="font-size: 16px;height: 45px;background-color: #f2f3f7;font-weight:bold;">
								<td colspan="2">日期</td>
								<td>会议时间</td>
								<td>会议名称</td>
								<td>会议地点</td>
								<td>主持人</td>
								<td>参会人员</td>
								<td>联系人</td>
							</tr>
							<tr align="center">
								<td rowspan="2">星期一</td>	
								<td>上午</td> <td id="Mondaysw_hysj"></td>	<td id="Mondaysw_hymc"></td>	<td id="Mondaysw_hydd"></td>	<td id="Mondaysw_zcr"></td>	<td id="Mondaysw_chld"></td>	<td id="Mondaysw_lxr"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Mondayxw_hysj"></td>	<td id="Mondayxw_hymc"></td>	<td id="Mondayxw_hydd"></td>	<td id="Mondayxw_zcr"></td>	<td id="Mondayxw_chld"></td>	<td id="Mondayxw_lxr"></td>								
							</tr>
							<tr align="center">
								<td rowspan="2">星期二</td>	
								<td>上午</td> <td id="Tuesdaysw_hysj"></td>	<td id="Tuesdaysw_hymc"></td>	<td id="Tuesdaysw_hydd"></td>	<td id="Tuesdaysw_zcr"></td>	<td id="Tuesdaysw_chld"></td>	<td id="Tuesdaysw_lxr"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Tuesdayxw_hysj"></td>	<td id="Tuesdayxw_hymc"></td>	<td id="Tuesdayxw_hydd"></td>	<td id="Tuesdayxw_zcr"></td>	<td id="Tuesdayxw_chld"></td>	<td id="Tuesdayxw_lxr"></td>												
							</tr>
							<tr align="center">
								<td rowspan="2">星期三</td>	
								<td>上午</td> <td id="Wednesdaysw_hysj"></td>	<td id="Wednesdaysw_hymc"></td>	<td id="Wednesdaysw_hydd"></td>	<td id="Wednesdaysw_zcr"></td>	<td id="Wednesdaysw_chld"></td>	<td id="Wednesdaysw_lxr"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Wednesdayxw_hysj"></td>	<td id="Wednesdayxw_hymc"></td>	<td id="Wednesdayxw_hydd"></td>	<td id="Wednesdayxw_zcr"></td>	<td id="Wednesdayxw_chld"></td>	<td id="Wednesdayxw_lxr"></td>															
							</tr>
							<tr align="center">
								<td rowspan="2">星期四</td>	
								<td>上午</td> <td id="Thursdaysw_hysj"></td>	<td id="Thursdaysw_hymc"></td>	<td id="Thursdaysw_hydd"></td>	<td id="Thursdaysw_zcr"></td>	<td id="Thursdaysw_chld"></td>	<td id="Thursdaysw_lxr"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Thursdayxw_hysj"></td>	<td id="Thursdayxw_hymc"></td>	<td id="Thursdayxw_hydd"></td>	<td id="Thursdayxw_zcr"></td>	<td id="Thursdayxw_chld"></td>	<td id="Thursdayxw_lxr"></td>																
							</tr>
							<tr align="center">
								<td rowspan="2">星期五</td>	
								<td>上午</td> <td id="Fridaysw_hysj"></td>	<td id="Fridaysw_hymc"></td>	<td id="Fridaysw_hydd"></td>	<td id="Fridaysw_zcr"></td>	<td id="Fridaysw_chld"></td>	<td id="Fridaysw_lxr"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Fridayxw_hysj"></td>	<td id="Fridayxw_hymc"></td>	<td id="Fridayxw_hydd"></td>	<td id="Fridayxw_zcr"></td>	<td id="Fridayxw_chld"></td>	<td id="Fridayxw_lxr"></td>						
							</tr>
							<tr align="center">
								<td rowspan="2">星期六</td>	
								<td>上午</td> <td id="Saturdaysw_hysj"></td>	<td id="Saturdaysw_hymc"></td>	<td id="Saturdaysw_hydd"></td>	<td id="Saturdaysw_zcr"></td>	<td id="Saturdaysw_chld"></td>	<td id="Saturdaysw_lxr"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Saturdayxw_hysj"></td>	<td id="Saturdayxw_hymc"></td>	<td id="Saturdayxw_hydd"></td>	<td id="Saturdayxw_zcr"></td>	<td id="Saturdayxw_chld"></td>	<td id="Saturdayxw_lxr"></td>													
							</tr>
							<tr align="center">
								<td rowspan="2">星期天</td>	
								<td>上午</td> <td id="Sundaysw_hysj"></td>	<td id="Sundaysw_hymc"></td>	<td id="Sundaysw_hydd"></td>	<td id="Sundaysw_zcr"></td>	<td id="Sundaysw_chld"></td>	<td id="Sundaysw_lxr"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Sundayxw_hysj"></td>	<td id="Sundayxw_hymc"></td>	<td id="Sundayxw_hydd"></td>	<td id="Sundayxw_zcr"></td>	<td id="Sundayxw_chld"></td>	<td id="Sundayxw_lxr"></td>														
							</tr>
						</table>  
				    </div>
				   
				</div>
				
			</div>
		    <div class="layui-tab-item">
				<div class="admin-main">
					        <!-- 按钮操作 -->
				   <div class="table_control">
				   			<div class="table_opera">
				   				<button htype="button" title="导出" class="layui-btn layui-btn-primary " onclick="excelExport1()">
				                    <i class="icon iconfont icon-export-o"></i>
				                </button>
				   			</div>
				             <!-- 搜索区域操作 -->
				            <div class="table_search">             
					           <div class="layui-form">				
					             <div class="layui-inline">
					                    <label class="layui-form-label">部门名称</label>
					                    <!-- 
					                    <div class="layui-input-block">
											<select id="select2"  lay-filter="lc"  name = "szlc" lay-verify="required" >
												<option value="" >请选择</option>
											</select>
									   	</div>-->					                    
					                    <div class="layui-input-inline">
					                       	<input type="text" id="ld1" required="" lay-verify="required" placeholder="--请选择--" readonly="" autocomplete="off" class="layui-input"> 
                      						<input name="orderLduserId" id="ldID1"  type="hidden"   class="layui-input">     
					                    </div> 
				                </div>
				                <button type="button" class="layui-btn layui-btn-primary" id="searchBtn1"><i class="layui-icon layui-icon-search"></i></button>
					            </div>
				            </div>           
				    </div>

				   <!--表格区域  -->
				    <div style="float: right;width: 100%;height: 100%">
				    	<table style="width: 100%;height: 93%;font-size: 15px;" align="center" border="1px;"  cellspacing="0" cellpadding="0" id="wdhy1" bordercolor="#ccc">
							<tr align="center" style="font-size: 16px;height: 45px;background-color: #f2f3f7;font-weight:bold;">
								<td colspan="2">日期</td>
								<td>会议时间</td>
								<td>会议名称</td>
								<td>会议地点</td>
								<td>主持人</td>
								<td>参会人员</td>
								<td>联系人</td>
							</tr>
							<tr align="center">
								<td rowspan="2">星期一</td>	
								<td>上午</td> <td id="Mondaysw_hysj1"></td>	<td id="Mondaysw_hymc1"></td>	<td id="Mondaysw_hydd1"></td>	<td id="Mondaysw_zcr1"></td>	<td id="Mondaysw_chld1"></td>	<td id="Mondaysw_lxr1"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Mondayxw_hysj1"></td>	<td id="Mondayxw_hymc1"></td>	<td id="Mondayxw_hydd1"></td>	<td id="Mondayxw_zcr1"></td>	<td id="Mondayxw_chld1"></td>	<td id="Mondayxw_lxr1"></td>								
							</tr>
							<tr align="center">
								<td rowspan="2">星期二</td>	
								<td>上午</td> <td id="Tuesdaysw_hysj1"></td>	<td id="Tuesdaysw_hymc1"></td>	<td id="Tuesdaysw_hydd1"></td>	<td id="Tuesdaysw_zcr1"></td>	<td id="Tuesdaysw_chld1"></td>	<td id="Tuesdaysw_lxr1"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Tuesdayxw_hysj1"></td>	<td id="Tuesdayxw_hymc1"></td>	<td id="Tuesdayxw_hydd1"></td>	<td id="Tuesdayxw_zcr1"></td>	<td id="Tuesdayxw_chld1"></td>	<td id="Tuesdayxw_lxr1"></td>												
							</tr>
							<tr align="center">
								<td rowspan="2">星期三</td>	
								<td>上午</td> <td id="Wednesdaysw_hysj1"></td>	<td id="Wednesdaysw_hymc1"></td>	<td id="Wednesdaysw_hydd1"></td>	<td id="Wednesdaysw_zcr1"></td>	<td id="Wednesdaysw_chld1"></td>	<td id="Wednesdaysw_lxr1"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Wednesdayxw_hysj1"></td>	<td id="Wednesdayxw_hymc1"></td>	<td id="Wednesdayxw_hydd1"></td>	<td id="Wednesdayxw_zcr1"></td>	<td id="Wednesdayxw_chld1"></td>	<td id="Wednesdayxw_lxr1"></td>															
							</tr>
							<tr align="center">
								<td rowspan="2">星期四</td>	
								<td>上午</td> <td id="Thursdaysw_hysj1"></td>	<td id="Thursdaysw_hymc1"></td>	<td id="Thursdaysw_hydd1"></td>	<td id="Thursdaysw_zcr1"></td>	<td id="Thursdaysw_chld1"></td>	<td id="Thursdaysw_lxr1"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Thursdayxw_hysj1"></td>	<td id="Thursdayxw_hymc1"></td>	<td id="Thursdayxw_hydd1"></td>	<td id="Thursdayxw_zcr1"></td>	<td id="Thursdayxw_chld1"></td>	<td id="Thursdayxw_lxr1"></td>																
							</tr>
							<tr align="center">
								<td rowspan="2">星期五</td>	
								<td>上午</td> <td id="Fridaysw_hysj1"></td>	<td id="Fridaysw_hymc1"></td>	<td id="Fridaysw_hydd1"></td>	<td id="Fridaysw_zcr1"></td>	<td id="Fridaysw_chld1"></td>	<td id="Fridaysw_lxr1"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Fridayxw_hysj1"></td>	<td id="Fridayxw_hymc1"></td>	<td id="Fridayxw_hydd1"></td>	<td id="Fridayxw_zcr1"></td>	<td id="Fridayxw_chld1"></td>	<td id="Fridayxw_lxr1"></td>						
							</tr>
							<tr align="center">
								<td rowspan="2">星期六</td>	
								<td>上午</td> <td id="Saturdaysw_hysj1"></td>	<td id="Saturdaysw_hymc1"></td>	<td id="Saturdaysw_hydd1"></td>	<td id="Saturdaysw_zcr1"></td>	<td id="Saturdaysw_chld1"></td>	<td id="Saturdaysw_lxr1"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Saturdayxw_hysj1"></td>	<td id="Saturdayxw_hymc1"></td>	<td id="Saturdayxw_hydd1"></td>	<td id="Saturdayxw_zcr1"></td>	<td id="Saturdayxw_chld1"></td>	<td id="Saturdayxw_lxr1"></td>													
							</tr>
							<tr align="center">
								<td rowspan="2">星期天</td>	
								<td>上午</td> <td id="Sundaysw_hysj1"></td>	<td id="Sundaysw_hymc1"></td>	<td id="Sundaysw_hydd1"></td>	<td id="Sundaysw_zcr1"></td>	<td id="Sundaysw_chld1"></td>	<td id="Sundaysw_lxr1"></td>								
							</tr>
							<tr align="center">
								<td>下午</td> <td id="Sundayxw_hysj1"></td>	<td id="Sundayxw_hymc1"></td>	<td id="Sundayxw_hydd1"></td>	<td id="Sundayxw_zcr1"></td>	<td id="Sundayxw_chld1"></td>	<td id="Sundayxw_lxr1"></td>														
							</tr>
						</table>  
				    </div>
				   
				</div>
		</div>		
	</div>
</div>  


<script type="text/javascript">
	layui.use(['form'], function(){
    var form = layui.form;
  
});

var table;
$(function(){
	//领导下拉列表
	var url = '${ctx}/main/meetingOrder/findld.do';
		$.post(url, function(data) {
			$.each(data.data, function(i, item) {
				$('#select1').append("<option value="+item.value+" >" + item.title+ "</option>");
				$('#select2').append("<option value="+item.value+" >" + item.title+ "</option>");
			});
		})

	ym1("");
	ym2("");

  //本周搜索
    $("#searchBtn").click(function(){
	   searchGoods(table);
    });
  //下周搜索
    $("#searchBtn1").click(function(){
	   searchGoods1(table);
    });
  
});



 //本周搜索
 function searchGoods(table){
//	 alert($("#ldID").val().length);
//	 ym1($("#select1").val());
	 ym1($("#ldID").val().substring(0, $("#ldID").val().length-1));
}

//下周搜索
function searchGoods1(table){
//	 alert($("#ldID").val().length);
//	 ym2($("#select2").val());
	 ym2($("#ldID1").val().substring(0, $("#ldID1").val().length-1));
}
 
//高级搜索
 function searchTable(table){
	 var place_name = $("#place_name").val();
	 var orderName = $("#orderName").val();
	var searchkey={
			'sysName':orderName,
			'placeName':place_name
					
	};
	
	$("#goodsdata").table('search',searchkey);
}

	$('#ld').click(function(){
  		 openIndex = layer.open({
               type: 2,
               title: '员工姓名',
               shade: [0.1],
               closeBtn: 1,
               maxmin: true, //开启最大化最小化按钮
               area: ['80%', '80%'],
               content: '${ctx}/main/meeting/participants.shtml?id=ptyg',
           }); 
  	});
	
	$('#ld1').click(function(){
 		 openIndex = layer.open({
              type: 2,
              title: '员工姓名',
              shade: [0.1],
              closeBtn: 1,
              maxmin: true, //开启最大化最小化按钮
              area: ['80%', '80%'],
              content: '${ctx}/main/meeting/participants1.shtml?id=ptyg',
          }); 
 	});
	
	
	function participantsChooseptry (ids,names) {
		 $('#ldID').val(ids);
		 $('#ld').val(names);
	}
	function participantsChooseptry1 (ids,names) {
		 $('#ldID1').val(ids);
		 $('#ld1').val(names);
	}
	
	function close(){
		   layer.close(openIndex);
	}
	//本周页面
	function ym1(id){
		 $.post('${ctx}/main/meetingOrder/meetingGsList.do?userid='+id,{},function (json) {
//			 console.log(json);
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
				var Mondaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void'  cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
				
				var Mondaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				
				var Mondaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				
				var Mondaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				
				var Mondaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				
				var Mondaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				for(var i=0;i<xq1.length;i++){
					var xq1s=xq1[i].split(";");	
					if(xq1s[0].split("-")[0]<"12:00"){
						Mondaysw_hysj+="<tr align='center'><td>"+xq1s[0]+"</td></tr>";
						Mondaysw_hymc+="<tr align='center'><td>"+xq1s[1]+"</td></tr>";
						Mondaysw_hydd+="<tr align='center'><td>"+xq1s[2]+"</td></tr>";
						Mondaysw_zcr+="<tr align='center'><td>"+xq1s[4]+"</td></tr>";
						Mondaysw_lxr+="<tr align='center'><td>"+xq1s[3]+"</td></tr>";	
						Mondaysw_chld+="<tr align='center'><td>"+xq1s[5]+"</td></tr>";				
					}else{
						Mondayxw_hysj+="<tr align='center'><td>"+xq1s[0]+"</td></tr>";
						Mondayxw_hymc+="<tr align='center'><td>"+xq1s[1]+"</td></tr>";
						Mondayxw_hydd+="<tr align='center'><td>"+xq1s[2]+"</td></tr>";
						Mondayxw_zcr+="<tr align='center'><td>"+xq1s[4]+"</td></tr>";
						Mondayxw_lxr+="<tr align='center'><td>"+xq1s[3]+"</td></tr>";
						Mondayxw_chld+="<tr align='center'><td>"+xq1s[5]+"</td></tr>";		
					}			
				}
				Mondaysw_hysj+="</table>";
				Mondayxw_hysj+="</table>";
				
				Mondaysw_hymc+="</table>";
				Mondayxw_hymc+="</table>";
				
				Mondaysw_hydd+="</table>";
				Mondayxw_hydd+="</table>";
				
				Mondaysw_zcr+="</table>";
				Mondayxw_zcr+="</table>";
				
				Mondaysw_lxr+="</table>";
				Mondayxw_lxr+="</table>";
				
				Mondaysw_chld+="</table>";
				Mondayxw_chld+="</table>";
				 $("#Mondaysw_hysj").html(Mondaysw_hysj);
				 $("#Mondayxw_hysj").html(Mondayxw_hysj);
				 
				 $("#Mondaysw_hymc").html(Mondaysw_hymc);
				 $("#Mondayxw_hymc").html(Mondayxw_hymc);
				 
				 $("#Mondaysw_hydd").html(Mondaysw_hydd);
				 $("#Mondayxw_hydd").html(Mondayxw_hydd);
				 
				 $("#Mondaysw_zcr").html(Mondaysw_zcr);
				 $("#Mondayxw_zcr").html(Mondayxw_zcr);
				 
				 $("#Mondaysw_lxr").html(Mondaysw_lxr);
				 $("#Mondayxw_lxr").html(Mondayxw_lxr);
				 
				 $("#Mondaysw_chld").html(Mondaysw_chld);
				 $("#Mondayxw_chld").html(Mondayxw_chld);
				 
				 //星期二
				 var Tuesdaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
					
					var Tuesdaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					
					var Tuesdaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					
					var Tuesdaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					
					var Tuesdaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					
					var Tuesdaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					for(var i=0;i<xq2.length;i++){
						var xq2s=xq2[i].split(";");	
						if(xq2s[0].split("-")[0]<"12:00"){
							Tuesdaysw_hysj+="<tr align='center'><td>"+xq2s[0]+"</td></tr>";
							Tuesdaysw_hymc+="<tr align='center'><td>"+xq2s[1]+"</td></tr>";
							Tuesdaysw_hydd+="<tr align='center'><td>"+xq2s[2]+"</td></tr>";
							Tuesdaysw_zcr+="<tr align='center'><td>"+xq2s[4]+"</td></tr>";
							Tuesdaysw_lxr+="<tr align='center'><td>"+xq2s[3]+"</td></tr>";	
							Tuesdaysw_chld+="<tr align='center'><td>"+xq2s[5]+"</td></tr>";				
						}else{
							Tuesdayxw_hysj+="<tr align='center'><td>"+xq2s[0]+"</td></tr>";
							Tuesdayxw_hymc+="<tr align='center'><td>"+xq2s[1]+"</td></tr>";
							Tuesdayxw_hydd+="<tr align='center'><td>"+xq2s[2]+"</td></tr>";
							Tuesdayxw_zcr+="<tr align='center'><td>"+xq2s[4]+"</td></tr>";
							Tuesdayxw_lxr+="<tr align='center'><td>"+xq2s[3]+"</td></tr>";
							Tuesdayxw_chld+="<tr align='center'><td>"+xq2s[5]+"</td></tr>";		
						}			
					}
					Tuesdaysw_hysj+="</table>";
					Tuesdayxw_hysj+="</table>";
					
					Tuesdaysw_hymc+="</table>";
					Tuesdayxw_hymc+="</table>";
					
					Tuesdaysw_hydd+="</table>";
					Tuesdayxw_hydd+="</table>";
					
					Tuesdaysw_zcr+="</table>";
					Tuesdayxw_zcr+="</table>";
					
					Tuesdaysw_lxr+="</table>";
					Tuesdayxw_lxr+="</table>";
					
					Tuesdaysw_chld+="</table>";
					Tuesdaysw_chld+="</table>";
					 $("#Tuesdaysw_hysj").html(Tuesdaysw_hysj);
					 $("#Tuesdayxw_hysj").html(Tuesdayxw_hysj);
					 
					 $("#Tuesdaysw_hymc").html(Tuesdaysw_hymc);
					 $("#Tuesdayxw_hymc").html(Tuesdayxw_hymc);
					 
					 $("#Tuesdaysw_hydd").html(Tuesdaysw_hydd);
					 $("#Tuesdayxw_hydd").html(Tuesdayxw_hydd);
					 
					 $("#Tuesdaysw_zcr").html(Tuesdaysw_zcr);
					 $("#Tuesdayxw_zcr").html(Tuesdayxw_zcr);
					 
					 $("#Tuesdaysw_lxr").html(Tuesdaysw_lxr);
					 $("#Tuesdayxw_lxr").html(Tuesdayxw_lxr);
					 
					 $("#Tuesdaysw_chld").html(Tuesdaysw_chld);
					 $("#Tuesdayxw_chld").html(Tuesdayxw_chld);
					 
					 //星期三
					 var Wednesdaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
						
						var Wednesdaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						
						var Wednesdaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						
						var Wednesdaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						
						var Wednesdaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						
						var Wednesdaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						for(var i=0;i<xq3.length;i++){
							var xq3s=xq3[i].split(";");	
							if(xq3s[0].split("-")[0]<"12:00"){
								Wednesdaysw_hysj+="<tr align='center'><td>"+xq3s[0]+"</td></tr>";
								Wednesdaysw_hymc+="<tr align='center'><td>"+xq3s[1]+"</td></tr>";
								Wednesdaysw_hydd+="<tr align='center'><td>"+xq3s[2]+"</td></tr>";
								Wednesdaysw_zcr+="<tr align='center'><td>"+xq3s[4]+"</td></tr>";
								Wednesdaysw_lxr+="<tr align='center'><td>"+xq3s[3]+"</td></tr>";	
								Wednesdaysw_chld+="<tr align='center'><td>"+xq3s[5]+"</td></tr>";				
							}else{
								Wednesdayxw_hysj+="<tr align='center'><td>"+xq3s[0]+"</td></tr>";
								Wednesdayxw_hymc+="<tr align='center'><td>"+xq3s[1]+"</td></tr>";
								Wednesdayxw_hydd+="<tr align='center'><td>"+xq3s[2]+"</td></tr>";
								Wednesdayxw_zcr+="<tr align='center'><td>"+xq3s[4]+"</td></tr>";
								Wednesdayxw_lxr+="<tr align='center'><td>"+xq3s[3]+"</td></tr>";
								Wednesdayxw_chld+="<tr align='center'><td>"+xq3s[5]+"</td></tr>";		
							}			
						}
						Wednesdaysw_hysj+="</table>";
						Wednesdayxw_hysj+="</table>";
						
						Wednesdaysw_hymc+="</table>";
						Wednesdayxw_hymc+="</table>";
						
						Wednesdaysw_hydd+="</table>";
						Wednesdayxw_hydd+="</table>";
						
						Wednesdaysw_zcr+="</table>";
						Wednesdayxw_zcr+="</table>";
						
						Wednesdaysw_lxr+="</table>";
						Wednesdayxw_lxr+="</table>";
						
						Wednesdaysw_chld+="</table>";
						Wednesdaysw_chld+="</table>";
						 $("#Wednesdaysw_hysj").html(Wednesdaysw_hysj);
						 $("#Wednesdayxw_hysj").html(Wednesdayxw_hysj);
						 
						 $("#Wednesdaysw_hymc").html(Wednesdaysw_hymc);
						 $("#Wednesdayxw_hymc").html(Wednesdayxw_hymc);
						 
						 $("#Wednesdaysw_hydd").html(Wednesdaysw_hydd);
						 $("#Wednesdayxw_hydd").html(Wednesdayxw_hydd);
						 
						 $("#Wednesdaysw_zcr").html(Wednesdaysw_zcr);
						 $("#Wednesdayxw_zcr").html(Wednesdayxw_zcr);
						 
						 $("#Wednesdaysw_lxr").html(Wednesdaysw_lxr);
						 $("#Wednesdayxw_lxr").html(Wednesdayxw_lxr);
						 
						 $("#Wednesdaysw_chld").html(Wednesdaysw_chld);
						 $("#Wednesdayxw_chld").html(Wednesdayxw_chld);
						 
						 //星期四
						 var Thursdaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
							
							var Thursdaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							
							var Thursdaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							
							var Thursdaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							
							var Thursdaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							
							var Thursdaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							for(var i=0;i<xq4.length;i++){
								var xq4s=xq4[i].split(";");	
								if(xq4s[0].split("-")[0]<"12:00"){
									Thursdaysw_hysj+="<tr align='center'><td>"+xq4s[0]+"</td></tr>";
									Thursdaysw_hymc+="<tr align='center'><td>"+xq4s[1]+"</td></tr>";
									Thursdaysw_hydd+="<tr align='center'><td>"+xq4s[2]+"</td></tr>";
									Thursdaysw_zcr+="<tr align='center'><td>"+xq4s[4]+"</td></tr>";
									Thursdaysw_lxr+="<tr align='center'><td>"+xq4s[3]+"</td></tr>";	
									Thursdaysw_chld+="<tr align='center'><td>"+xq4s[5]+"</td></tr>";				
								}else{
									Thursdayxw_hysj+="<tr align='center'><td>"+xq4s[0]+"</td></tr>";
									Thursdayxw_hymc+="<tr align='center'><td>"+xq4s[1]+"</td></tr>";
									Thursdayxw_hydd+="<tr align='center'><td>"+xq4s[2]+"</td></tr>";
									Thursdayxw_zcr+="<tr align='center'><td>"+xq4s[4]+"</td></tr>";
									Thursdayxw_lxr+="<tr align='center'><td>"+xq4s[3]+"</td></tr>";
									Thursdayxw_chld+="<tr align='center'><td>"+xq4s[5]+"</td></tr>";		
								}			
							}
							Thursdaysw_hysj+="</table>";
							Thursdayxw_hysj+="</table>";
							
							Thursdaysw_hymc+="</table>";
							Thursdayxw_hymc+="</table>";
							
							Thursdaysw_hydd+="</table>";
							Thursdayxw_hydd+="</table>";
							
							Thursdaysw_zcr+="</table>";
							Thursdayxw_zcr+="</table>";
							
							Thursdaysw_lxr+="</table>";
							Thursdayxw_lxr+="</table>";
							
							Thursdaysw_chld+="</table>";
							Thursdaysw_chld+="</table>";
							 $("#Thursdaysw_hysj").html(Thursdaysw_hysj);
							 $("#Thursdayxw_hysj").html(Thursdayxw_hysj);
							 
							 $("#Thursdaysw_hymc").html(Thursdaysw_hymc);
							 $("#Thursdayxw_hymc").html(Thursdayxw_hymc);
							 
							 $("#Thursdaysw_hydd").html(Thursdaysw_hydd);
							 $("#Thursdayxw_hydd").html(Thursdayxw_hydd);
							 
							 $("#Thursdaysw_zcr").html(Thursdaysw_zcr);
							 $("#Thursdayxw_zcr").html(Thursdayxw_zcr);
							 
							 $("#Thursdaysw_lxr").html(Thursdaysw_lxr);
							 $("#Thursdayxw_lxr").html(Thursdayxw_lxr);
							 
							 $("#Thursdaysw_chld").html(Thursdaysw_chld);
							 $("#Thursdayxw_chld").html(Thursdayxw_chld);
							 
							 //星期五
							 var Fridaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
								
								var Fridaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								
								var Fridaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								
								var Fridaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								
								var Fridaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								
								var Fridaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								for(var i=0;i<xq5.length;i++){
									var xq5s=xq5[i].split(";");	
									if(xq5s[0].split("-")[0]<"12:00"){
										Fridaysw_hysj+="<tr align='center'><td>"+xq5s[0]+"</td></tr>";
										Fridaysw_hymc+="<tr align='center'><td>"+xq5s[1]+"</td></tr>";
										Fridaysw_hydd+="<tr align='center'><td>"+xq5s[2]+"</td></tr>";
										Fridaysw_zcr+="<tr align='center'><td>"+xq5s[4]+"</td></tr>";
										Fridaysw_lxr+="<tr align='center'><td>"+xq5s[3]+"</td></tr>";	
										Fridaysw_chld+="<tr align='center'><td>"+xq5s[5]+"</td></tr>";				
									}else{
										Fridayxw_hysj+="<tr align='center'><td>"+xq5s[0]+"</td></tr>";
										Fridayxw_hymc+="<tr align='center'><td>"+xq5s[1]+"</td></tr>";
										Fridayxw_hydd+="<tr align='center'><td>"+xq5s[2]+"</td></tr>";
										Fridayxw_zcr+="<tr align='center'><td>"+xq5s[4]+"</td></tr>";
										Fridayxw_lxr+="<tr align='center'><td>"+xq5s[3]+"</td></tr>";
										Fridayxw_chld+="<tr align='center'><td>"+xq5s[5]+"</td></tr>";		
									}			
								}
								Fridaysw_hysj+="</table>";
								Fridayxw_hysj+="</table>";
								
								Fridaysw_hymc+="</table>";
								Fridayxw_hymc+="</table>";
								
								Fridaysw_hydd+="</table>";
								Fridayxw_hydd+="</table>";
								
								Fridaysw_zcr+="</table>";
								Fridayxw_zcr+="</table>";
								
								Fridaysw_lxr+="</table>";
								Fridayxw_lxr+="</table>";
								
								Fridaysw_chld+="</table>";
								Fridaysw_chld+="</table>";
								 $("#Fridaysw_hysj").html(Fridaysw_hysj);
								 $("#Fridayxw_hysj").html(Fridayxw_hysj);
								 
								 $("#Fridaysw_hymc").html(Fridaysw_hymc);
								 $("#Fridayxw_hymc").html(Fridayxw_hymc);
								 
								 $("#Fridaysw_hydd").html(Fridaysw_hydd);
								 $("#Fridayxw_hydd").html(Fridayxw_hydd);
								 
								 $("#Fridaysw_zcr").html(Fridaysw_zcr);
								 $("#Fridayxw_zcr").html(Fridayxw_zcr);
								 
								 $("#Fridaysw_lxr").html(Fridaysw_lxr);
								 $("#Fridayxw_lxr").html(Fridayxw_lxr);
								 
								 $("#Fridaysw_chld").html(Fridaysw_chld);
								 $("#Fridayxw_chld").html(Fridayxw_chld);
								 
								 //星期六
								 var Saturdaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
									
									var Saturdaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									
									var Saturdaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									
									var Saturdaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									
									var Saturdaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									
									var Saturdaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									for(var i=0;i<xq6.length;i++){
										var xq6s=xq6[i].split(";");	
										if(xq6s[0].split("-")[0]<"12:00"){
											Saturdaysw_hysj+="<tr align='center'><td>"+xq6s[0]+"</td></tr>";
											Saturdaysw_hymc+="<tr align='center'><td>"+xq6s[1]+"</td></tr>";
											Saturdaysw_hydd+="<tr align='center'><td>"+xq6s[2]+"</td></tr>";
											Saturdaysw_zcr+="<tr align='center'><td>"+xq6s[4]+"</td></tr>";
											Saturdaysw_lxr+="<tr align='center'><td>"+xq6s[3]+"</td></tr>";	
											Saturdaysw_chld+="<tr align='center'><td>"+xq6s[5]+"</td></tr>";				
										}else{
											Saturdayxw_hysj+="<tr align='center'><td>"+xq6s[0]+"</td></tr>";
											Saturdayxw_hymc+="<tr align='center'><td>"+xq6s[1]+"</td></tr>";
											Saturdayxw_hydd+="<tr align='center'><td>"+xq6s[2]+"</td></tr>";
											Saturdayxw_zcr+="<tr align='center'><td>"+xq6s[4]+"</td></tr>";
											Saturdayxw_lxr+="<tr align='center'><td>"+xq6s[3]+"</td></tr>";
											Saturdayxw_chld+="<tr align='center'><td>"+xq6s[5]+"</td></tr>";		
										}			
									}
									Saturdaysw_hysj+="</table>";
									Saturdayxw_hysj+="</table>";
									
									Saturdaysw_hymc+="</table>";
									Saturdayxw_hymc+="</table>";
									
									Saturdaysw_hydd+="</table>";
									Saturdayxw_hydd+="</table>";
									
									Saturdaysw_zcr+="</table>";
									Saturdayxw_zcr+="</table>";
									
									Saturdaysw_lxr+="</table>";
									Saturdayxw_lxr+="</table>";
									
									Saturdaysw_chld+="</table>";
									Saturdaysw_chld+="</table>";
									 $("#Saturdaysw_hysj").html(Saturdaysw_hysj);
									 $("#Saturdayxw_hysj").html(Saturdayxw_hysj);
									 
									 $("#Saturdaysw_hymc").html(Saturdaysw_hymc);
									 $("#Saturdayxw_hymc").html(Saturdayxw_hymc);
									 
									 $("#Saturdaysw_hydd").html(Saturdaysw_hydd);
									 $("#Saturdayxw_hydd").html(Saturdayxw_hydd);
									 
									 $("#Saturdaysw_zcr").html(Saturdaysw_zcr);
									 $("#Saturdayxw_zcr").html(Saturdayxw_zcr);
									 
									 $("#Saturdaysw_lxr").html(Saturdaysw_lxr);
									 $("#Saturdayxw_lxr").html(Saturdayxw_lxr);
									 
									 $("#Saturdaysw_chld").html(Saturdaysw_chld);
									 $("#Saturdayxw_chld").html(Saturdayxw_chld);
									 
									 //星期天
									 var Sundaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
										
										var Sundaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										
										var Sundaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										
										var Sundaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										
										var Sundaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										
										var Sundaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										for(var i=0;i<xq7.length;i++){
											var xq7s=xq7[i].split(";");	
											if(xq7s[0].split("-")[0]<"12:00"){
												Sundaysw_hysj+="<tr align='center'><td>"+xq7s[0]+"</td></tr>";
												Sundaysw_hymc+="<tr align='center'><td>"+xq7s[1]+"</td></tr>";
												Sundaysw_hydd+="<tr align='center'><td>"+xq7s[2]+"</td></tr>";
												Sundaysw_zcr+="<tr align='center'><td>"+xq7s[4]+"</td></tr>";
												Sundaysw_lxr+="<tr align='center'><td>"+xq7s[3]+"</td></tr>";	
												Sundaysw_chld+="<tr align='center'><td>"+xq7s[5]+"</td></tr>";				
											}else{
												Sundayxw_hysj+="<tr align='center'><td>"+xq7s[0]+"</td></tr>";
												Sundayxw_hymc+="<tr align='center'><td>"+xq7s[1]+"</td></tr>";
												Sundayxw_hydd+="<tr align='center'><td>"+xq7s[2]+"</td></tr>";
												Sundayxw_zcr+="<tr align='center'><td>"+xq7s[4]+"</td></tr>";
												Sundayxw_lxr+="<tr align='center'><td>"+xq7s[3]+"</td></tr>";
												Sundayxw_chld+="<tr align='center'><td>"+xq7s[5]+"</td></tr>";		
											}			
										}
										Sundaysw_hysj+="</table>";
										Sundayxw_hysj+="</table>";
										
										Sundaysw_hymc+="</table>";
										Sundayxw_hymc+="</table>";
										
										Sundaysw_hydd+="</table>";
										Sundayxw_hydd+="</table>";
										
										Sundaysw_zcr+="</table>";
										Sundayxw_zcr+="</table>";
										
										Sundaysw_lxr+="</table>";
										Sundayxw_lxr+="</table>";
										
										Sundaysw_chld+="</table>";
										Sundaysw_chld+="</table>";
										 $("#Sundaysw_hysj").html(Sundaysw_hysj);
										 $("#Sundayxw_hysj").html(Sundayxw_hysj);
										 
										 $("#Sundaysw_hymc").html(Sundaysw_hymc);
										 $("#Sundayxw_hymc").html(Sundayxw_hymc);
										 
										 $("#Sundaysw_hydd").html(Sundaysw_hydd);
										 $("#Sundayxw_hydd").html(Sundayxw_hydd);
										 
										 $("#Sundaysw_zcr").html(Sundaysw_zcr);
										 $("#Sundayxw_zcr").html(Sundayxw_zcr);
										 
										 $("#Sundaysw_lxr").html(Sundaysw_lxr);
										 $("#Sundayxw_lxr").html(Sundayxw_lxr);
										 
										 $("#Sundaysw_chld").html(Sundaysw_chld);
										 $("#Sundayxw_chld").html(Sundayxw_chld);
		 })
	}
	
	//下周页面
	function ym2(id){
		 $.post('${ctx}/main/meetingOrder/meetingGsListxz.do?userid='+id,{},function (json) {
//			 console.log(json);
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
				var Mondaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void'  cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
				
				var Mondaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				
				var Mondaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				
				var Mondaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				
				var Mondaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				
				var Mondaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				var Mondayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
				for(var i=0;i<xq1.length;i++){
					var xq1s=xq1[i].split(";");	
					if(xq1s[0].split("-")[0]<"12:00"){
						Mondaysw_hysj+="<tr align='center'><td>"+xq1s[0]+"</td></tr>";
						Mondaysw_hymc+="<tr align='center'><td>"+xq1s[1]+"</td></tr>";
						Mondaysw_hydd+="<tr align='center'><td>"+xq1s[2]+"</td></tr>";
						Mondaysw_zcr+="<tr align='center'><td>"+xq1s[4]+"</td></tr>";
						Mondaysw_lxr+="<tr align='center'><td>"+xq1s[3]+"</td></tr>";	
						Mondaysw_chld+="<tr align='center'><td>"+xq1s[5]+"</td></tr>";				
					}else{
						Mondayxw_hysj+="<tr align='center'><td>"+xq1s[0]+"</td></tr>";
						Mondayxw_hymc+="<tr align='center'><td>"+xq1s[1]+"</td></tr>";
						Mondayxw_hydd+="<tr align='center'><td>"+xq1s[2]+"</td></tr>";
						Mondayxw_zcr+="<tr align='center'><td>"+xq1s[4]+"</td></tr>";
						Mondayxw_lxr+="<tr align='center'><td>"+xq1s[3]+"</td></tr>";
						Mondayxw_chld+="<tr align='center'><td>"+xq1s[5]+"</td></tr>";		
					}			
				}
				Mondaysw_hysj+="</table>";
				Mondayxw_hysj+="</table>";
				
				Mondaysw_hymc+="</table>";
				Mondayxw_hymc+="</table>";
				
				Mondaysw_hydd+="</table>";
				Mondayxw_hydd+="</table>";
				
				Mondaysw_zcr+="</table>";
				Mondayxw_zcr+="</table>";
				
				Mondaysw_lxr+="</table>";
				Mondayxw_lxr+="</table>";
				
				Mondaysw_chld+="</table>";
				Mondayxw_chld+="</table>";
				 $("#Mondaysw_hysj1").html(Mondaysw_hysj);
				 $("#Mondayxw_hysj1").html(Mondayxw_hysj);
				 
				 $("#Mondaysw_hymc1").html(Mondaysw_hymc);
				 $("#Mondayxw_hymc1").html(Mondayxw_hymc);
				 
				 $("#Mondaysw_hydd1").html(Mondaysw_hydd);
				 $("#Mondayxw_hydd1").html(Mondayxw_hydd);
				 
				 $("#Mondaysw_zcr1").html(Mondaysw_zcr);
				 $("#Mondayxw_zcr1").html(Mondayxw_zcr);
				 
				 $("#Mondaysw_lxr1").html(Mondaysw_lxr);
				 $("#Mondayxw_lxr1").html(Mondayxw_lxr);
				 
				 $("#Mondaysw_chld1").html(Mondaysw_chld);
				 $("#Mondayxw_chld1").html(Mondayxw_chld);
				 
				 //星期二
				 var Tuesdaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
					
					var Tuesdaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					
					var Tuesdaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					
					var Tuesdaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					
					var Tuesdaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					
					var Tuesdaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					var Tuesdayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
					for(var i=0;i<xq2.length;i++){
						var xq2s=xq2[i].split(";");	
						if(xq2s[0].split("-")[0]<"12:00"){
							Tuesdaysw_hysj+="<tr align='center'><td>"+xq2s[0]+"</td></tr>";
							Tuesdaysw_hymc+="<tr align='center'><td>"+xq2s[1]+"</td></tr>";
							Tuesdaysw_hydd+="<tr align='center'><td>"+xq2s[2]+"</td></tr>";
							Tuesdaysw_zcr+="<tr align='center'><td>"+xq2s[4]+"</td></tr>";
							Tuesdaysw_lxr+="<tr align='center'><td>"+xq2s[3]+"</td></tr>";	
							Tuesdaysw_chld+="<tr align='center'><td>"+xq2s[5]+"</td></tr>";				
						}else{
							Tuesdayxw_hysj+="<tr align='center'><td>"+xq2s[0]+"</td></tr>";
							Tuesdayxw_hymc+="<tr align='center'><td>"+xq2s[1]+"</td></tr>";
							Tuesdayxw_hydd+="<tr align='center'><td>"+xq2s[2]+"</td></tr>";
							Tuesdayxw_zcr+="<tr align='center'><td>"+xq2s[4]+"</td></tr>";
							Tuesdayxw_lxr+="<tr align='center'><td>"+xq2s[3]+"</td></tr>";
							Tuesdayxw_chld+="<tr align='center'><td>"+xq2s[5]+"</td></tr>";		
						}			
					}
					Tuesdaysw_hysj+="</table>";
					Tuesdayxw_hysj+="</table>";
					
					Tuesdaysw_hymc+="</table>";
					Tuesdayxw_hymc+="</table>";
					
					Tuesdaysw_hydd+="</table>";
					Tuesdayxw_hydd+="</table>";
					
					Tuesdaysw_zcr+="</table>";
					Tuesdayxw_zcr+="</table>";
					
					Tuesdaysw_lxr+="</table>";
					Tuesdayxw_lxr+="</table>";
					
					Tuesdaysw_chld+="</table>";
					Tuesdaysw_chld+="</table>";
					 $("#Tuesdaysw_hysj1").html(Tuesdaysw_hysj);
					 $("#Tuesdayxw_hysj1").html(Tuesdayxw_hysj);
					 
					 $("#Tuesdaysw_hymc1").html(Tuesdaysw_hymc);
					 $("#Tuesdayxw_hymc1").html(Tuesdayxw_hymc);
					 
					 $("#Tuesdaysw_hydd1").html(Tuesdaysw_hydd);
					 $("#Tuesdayxw_hydd1").html(Tuesdayxw_hydd);
					 
					 $("#Tuesdaysw_zcr1").html(Tuesdaysw_zcr);
					 $("#Tuesdayxw_zcr1").html(Tuesdayxw_zcr);
					 
					 $("#Tuesdaysw_lxr1").html(Tuesdaysw_lxr);
					 $("#Tuesdayxw_lxr1").html(Tuesdayxw_lxr);
					 
					 $("#Tuesdaysw_chld1").html(Tuesdaysw_chld);
					 $("#Tuesdayxw_chld1").html(Tuesdayxw_chld);
					 
					 //星期三
					 var Wednesdaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
						
						var Wednesdaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						
						var Wednesdaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						
						var Wednesdaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						
						var Wednesdaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						
						var Wednesdaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						var Wednesdayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
						for(var i=0;i<xq3.length;i++){
							var xq3s=xq3[i].split(";");	
							if(xq3s[0].split("-")[0]<"12:00"){
								Wednesdaysw_hysj+="<tr align='center'><td>"+xq3s[0]+"</td></tr>";
								Wednesdaysw_hymc+="<tr align='center'><td>"+xq3s[1]+"</td></tr>";
								Wednesdaysw_hydd+="<tr align='center'><td>"+xq3s[2]+"</td></tr>";
								Wednesdaysw_zcr+="<tr align='center'><td>"+xq3s[4]+"</td></tr>";
								Wednesdaysw_lxr+="<tr align='center'><td>"+xq3s[3]+"</td></tr>";	
								Wednesdaysw_chld+="<tr align='center'><td>"+xq3s[5]+"</td></tr>";				
							}else{
								Wednesdayxw_hysj+="<tr align='center'><td>"+xq3s[0]+"</td></tr>";
								Wednesdayxw_hymc+="<tr align='center'><td>"+xq3s[1]+"</td></tr>";
								Wednesdayxw_hydd+="<tr align='center'><td>"+xq3s[2]+"</td></tr>";
								Wednesdayxw_zcr+="<tr align='center'><td>"+xq3s[4]+"</td></tr>";
								Wednesdayxw_lxr+="<tr align='center'><td>"+xq3s[3]+"</td></tr>";
								Wednesdayxw_chld+="<tr align='center'><td>"+xq3s[5]+"</td></tr>";		
							}			
						}
						Wednesdaysw_hysj+="</table>";
						Wednesdayxw_hysj+="</table>";
						
						Wednesdaysw_hymc+="</table>";
						Wednesdayxw_hymc+="</table>";
						
						Wednesdaysw_hydd+="</table>";
						Wednesdayxw_hydd+="</table>";
						
						Wednesdaysw_zcr+="</table>";
						Wednesdayxw_zcr+="</table>";
						
						Wednesdaysw_lxr+="</table>";
						Wednesdayxw_lxr+="</table>";
						
						Wednesdaysw_chld+="</table>";
						Wednesdaysw_chld+="</table>";
						 $("#Wednesdaysw_hysj1").html(Wednesdaysw_hysj);
						 $("#Wednesdayxw_hysj1").html(Wednesdayxw_hysj);
						 
						 $("#Wednesdaysw_hymc1").html(Wednesdaysw_hymc);
						 $("#Wednesdayxw_hymc1").html(Wednesdayxw_hymc);
						 
						 $("#Wednesdaysw_hydd1").html(Wednesdaysw_hydd);
						 $("#Wednesdayxw_hydd1").html(Wednesdayxw_hydd);
						 
						 $("#Wednesdaysw_zcr1").html(Wednesdaysw_zcr);
						 $("#Wednesdayxw_zcr1").html(Wednesdayxw_zcr);
						 
						 $("#Wednesdaysw_lxr1").html(Wednesdaysw_lxr);
						 $("#Wednesdayxw_lxr1").html(Wednesdayxw_lxr);
						 
						 $("#Wednesdaysw_chld1").html(Wednesdaysw_chld);
						 $("#Wednesdayxw_chld1").html(Wednesdayxw_chld);
						 
						 //星期四
						 var Thursdaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
							
							var Thursdaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							
							var Thursdaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							
							var Thursdaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							
							var Thursdaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							
							var Thursdaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							var Thursdayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
							for(var i=0;i<xq4.length;i++){
								var xq4s=xq4[i].split(";");	
								if(xq4s[0].split("-")[0]<"12:00"){
									Thursdaysw_hysj+="<tr align='center'><td>"+xq4s[0]+"</td></tr>";
									Thursdaysw_hymc+="<tr align='center'><td>"+xq4s[1]+"</td></tr>";
									Thursdaysw_hydd+="<tr align='center'><td>"+xq4s[2]+"</td></tr>";
									Thursdaysw_zcr+="<tr align='center'><td>"+xq4s[4]+"</td></tr>";
									Thursdaysw_lxr+="<tr align='center'><td>"+xq4s[3]+"</td></tr>";	
									Thursdaysw_chld+="<tr align='center'><td>"+xq4s[5]+"</td></tr>";				
								}else{
									Thursdayxw_hysj+="<tr align='center'><td>"+xq4s[0]+"</td></tr>";
									Thursdayxw_hymc+="<tr align='center'><td>"+xq4s[1]+"</td></tr>";
									Thursdayxw_hydd+="<tr align='center'><td>"+xq4s[2]+"</td></tr>";
									Thursdayxw_zcr+="<tr align='center'><td>"+xq4s[4]+"</td></tr>";
									Thursdayxw_lxr+="<tr align='center'><td>"+xq4s[3]+"</td></tr>";
									Thursdayxw_chld+="<tr align='center'><td>"+xq4s[5]+"</td></tr>";		
								}			
							}
							Thursdaysw_hysj+="</table>";
							Thursdayxw_hysj+="</table>";
							
							Thursdaysw_hymc+="</table>";
							Thursdayxw_hymc+="</table>";
							
							Thursdaysw_hydd+="</table>";
							Thursdayxw_hydd+="</table>";
							
							Thursdaysw_zcr+="</table>";
							Thursdayxw_zcr+="</table>";
							
							Thursdaysw_lxr+="</table>";
							Thursdayxw_lxr+="</table>";
							
							Thursdaysw_chld+="</table>";
							Thursdaysw_chld+="</table>";
							 $("#Thursdaysw_hysj1").html(Thursdaysw_hysj);
							 $("#Thursdayxw_hysj1").html(Thursdayxw_hysj);
							 
							 $("#Thursdaysw_hymc1").html(Thursdaysw_hymc);
							 $("#Thursdayxw_hymc1").html(Thursdayxw_hymc);
							 
							 $("#Thursdaysw_hydd1").html(Thursdaysw_hydd);
							 $("#Thursdayxw_hydd1").html(Thursdayxw_hydd);
							 
							 $("#Thursdaysw_zcr1").html(Thursdaysw_zcr);
							 $("#Thursdayxw_zcr1").html(Thursdayxw_zcr);
							 
							 $("#Thursdaysw_lxr1").html(Thursdaysw_lxr);
							 $("#Thursdayxw_lxr1").html(Thursdayxw_lxr);
							 
							 $("#Thursdaysw_chld1").html(Thursdaysw_chld);
							 $("#Thursdayxw_chld1").html(Thursdayxw_chld);
							 
							 //星期五
							 var Fridaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
								
								var Fridaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								
								var Fridaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								
								var Fridaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								
								var Fridaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								
								var Fridaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								var Fridayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
								for(var i=0;i<xq5.length;i++){
									var xq5s=xq5[i].split(";");	
									if(xq5s[0].split("-")[0]<"12:00"){
										Fridaysw_hysj+="<tr align='center'><td>"+xq5s[0]+"</td></tr>";
										Fridaysw_hymc+="<tr align='center'><td>"+xq5s[1]+"</td></tr>";
										Fridaysw_hydd+="<tr align='center'><td>"+xq5s[2]+"</td></tr>";
										Fridaysw_zcr+="<tr align='center'><td>"+xq5s[4]+"</td></tr>";
										Fridaysw_lxr+="<tr align='center'><td>"+xq5s[3]+"</td></tr>";	
										Fridaysw_chld+="<tr align='center'><td>"+xq5s[5]+"</td></tr>";				
									}else{
										Fridayxw_hysj+="<tr align='center'><td>"+xq5s[0]+"</td></tr>";
										Fridayxw_hymc+="<tr align='center'><td>"+xq5s[1]+"</td></tr>";
										Fridayxw_hydd+="<tr align='center'><td>"+xq5s[2]+"</td></tr>";
										Fridayxw_zcr+="<tr align='center'><td>"+xq5s[4]+"</td></tr>";
										Fridayxw_lxr+="<tr align='center'><td>"+xq5s[3]+"</td></tr>";
										Fridayxw_chld+="<tr align='center'><td>"+xq5s[5]+"</td></tr>";		
									}			
								}
								Fridaysw_hysj+="</table>";
								Fridayxw_hysj+="</table>";
								
								Fridaysw_hymc+="</table>";
								Fridayxw_hymc+="</table>";
								
								Fridaysw_hydd+="</table>";
								Fridayxw_hydd+="</table>";
								
								Fridaysw_zcr+="</table>";
								Fridayxw_zcr+="</table>";
								
								Fridaysw_lxr+="</table>";
								Fridayxw_lxr+="</table>";
								
								Fridaysw_chld+="</table>";
								Fridaysw_chld+="</table>";
								 $("#Fridaysw_hysj1").html(Fridaysw_hysj);
								 $("#Fridayxw_hysj1").html(Fridayxw_hysj);
								 
								 $("#Fridaysw_hymc1").html(Fridaysw_hymc);
								 $("#Fridayxw_hymc1").html(Fridayxw_hymc);
								 
								 $("#Fridaysw_hydd1").html(Fridaysw_hydd);
								 $("#Fridayxw_hydd1").html(Fridayxw_hydd);
								 
								 $("#Fridaysw_zcr1").html(Fridaysw_zcr);
								 $("#Fridayxw_zcr1").html(Fridayxw_zcr);
								 
								 $("#Fridaysw_lxr1").html(Fridaysw_lxr);
								 $("#Fridayxw_lxr1").html(Fridayxw_lxr);
								 
								 $("#Fridaysw_chld1").html(Fridaysw_chld);
								 $("#Fridayxw_chld1").html(Fridayxw_chld);
								 
								 //星期六
								 var Saturdaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
									
									var Saturdaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									
									var Saturdaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0'>";
									
									var Saturdaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									
									var Saturdaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									
									var Saturdaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									var Saturdayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
									for(var i=0;i<xq6.length;i++){
										var xq6s=xq6[i].split(";");	
										if(xq6s[0].split("-")[0]<"12:00"){
											Saturdaysw_hysj+="<tr align='center'><td>"+xq6s[0]+"</td></tr>";
											Saturdaysw_hymc+="<tr align='center'><td>"+xq6s[1]+"</td></tr>";
											Saturdaysw_hydd+="<tr align='center'><td>"+xq6s[2]+"</td></tr>";
											Saturdaysw_zcr+="<tr align='center'><td>"+xq6s[4]+"</td></tr>";
											Saturdaysw_lxr+="<tr align='center'><td>"+xq6s[3]+"</td></tr>";	
											Saturdaysw_chld+="<tr align='center'><td>"+xq6s[5]+"</td></tr>";				
										}else{
											Saturdayxw_hysj+="<tr align='center'><td>"+xq6s[0]+"</td></tr>";
											Saturdayxw_hymc+="<tr align='center'><td>"+xq6s[1]+"</td></tr>";
											Saturdayxw_hydd+="<tr align='center'><td>"+xq6s[2]+"</td></tr>";
											Saturdayxw_zcr+="<tr align='center'><td>"+xq6s[4]+"</td></tr>";
											Saturdayxw_lxr+="<tr align='center'><td>"+xq6s[3]+"</td></tr>";
											Saturdayxw_chld+="<tr align='center'><td>"+xq6s[5]+"</td></tr>";		
										}			
									}
									Saturdaysw_hysj+="</table>";
									Saturdayxw_hysj+="</table>";
									
									Saturdaysw_hymc+="</table>";
									Saturdayxw_hymc+="</table>";
									
									Saturdaysw_hydd+="</table>";
									Saturdayxw_hydd+="</table>";
									
									Saturdaysw_zcr+="</table>";
									Saturdayxw_zcr+="</table>";
									
									Saturdaysw_lxr+="</table>";
									Saturdayxw_lxr+="</table>";
									
									Saturdaysw_chld+="</table>";
									Saturdaysw_chld+="</table>";
									 $("#Saturdaysw_hysj1").html(Saturdaysw_hysj);
									 $("#Saturdayxw_hysj1").html(Saturdayxw_hysj);
									 
									 $("#Saturdaysw_hymc1").html(Saturdaysw_hymc);
									 $("#Saturdayxw_hymc1").html(Saturdayxw_hymc);
									 
									 $("#Saturdaysw_hydd1").html(Saturdaysw_hydd);
									 $("#Saturdayxw_hydd1").html(Saturdayxw_hydd);
									 
									 $("#Saturdaysw_zcr1").html(Saturdaysw_zcr);
									 $("#Saturdayxw_zcr1").html(Saturdayxw_zcr);
									 
									 $("#Saturdaysw_lxr1").html(Saturdaysw_lxr);
									 $("#Saturdayxw_lxr1").html(Saturdayxw_lxr);
									 
									 $("#Saturdaysw_chld1").html(Saturdaysw_chld);
									 $("#Saturdayxw_chld1").html(Saturdayxw_chld);
									 
									 //星期天
									 var Sundaysw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_hysj="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";	
										
										var Sundaysw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_hymc="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										
										var Sundaysw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_hydd="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										
										var Sundaysw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_zcr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										
										var Sundaysw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_lxr="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										
										var Sundaysw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										var Sundayxw_chld="<table style='width: 100%;height: 100%;font-size: 15px;' align='center' border='1px;' frame='void' cellspacing='0' cellpadding='0' bordercolor='#ccc'>";
										for(var i=0;i<xq7.length;i++){
											var xq7s=xq7[i].split(";");	
											if(xq7s[0].split("-")[0]<"12:00"){
												Sundaysw_hysj+="<tr align='center'><td>"+xq7s[0]+"</td></tr>";
												Sundaysw_hymc+="<tr align='center'><td>"+xq7s[1]+"</td></tr>";
												Sundaysw_hydd+="<tr align='center'><td>"+xq7s[2]+"</td></tr>";
												Sundaysw_zcr+="<tr align='center'><td>"+xq7s[4]+"</td></tr>";
												Sundaysw_lxr+="<tr align='center'><td>"+xq7s[3]+"</td></tr>";	
												Sundaysw_chld+="<tr align='center'><td>"+xq7s[5]+"</td></tr>";				
											}else{
												Sundayxw_hysj+="<tr align='center'><td>"+xq7s[0]+"</td></tr>";
												Sundayxw_hymc+="<tr align='center'><td>"+xq7s[1]+"</td></tr>";
												Sundayxw_hydd+="<tr align='center'><td>"+xq7s[2]+"</td></tr>";
												Sundayxw_zcr+="<tr align='center'><td>"+xq7s[4]+"</td></tr>";
												Sundayxw_lxr+="<tr align='center'><td>"+xq7s[3]+"</td></tr>";
												Sundayxw_chld+="<tr align='center'><td>"+xq7s[5]+"</td></tr>";		
											}			
										}
										Sundaysw_hysj+="</table>";
										Sundayxw_hysj+="</table>";
										
										Sundaysw_hymc+="</table>";
										Sundayxw_hymc+="</table>";
										
										Sundaysw_hydd+="</table>";
										Sundayxw_hydd+="</table>";
										
										Sundaysw_zcr+="</table>";
										Sundayxw_zcr+="</table>";
										
										Sundaysw_lxr+="</table>";
										Sundayxw_lxr+="</table>";
										
										Sundaysw_chld+="</table>";
										Sundaysw_chld+="</table>";
										 $("#Sundaysw_hysj1").html(Sundaysw_hysj);
										 $("#Sundayxw_hysj1").html(Sundayxw_hysj);
										 
										 $("#Sundaysw_hymc1").html(Sundaysw_hymc);
										 $("#Sundayxw_hymc1").html(Sundayxw_hymc);
										 
										 $("#Sundaysw_hydd1").html(Sundaysw_hydd);
										 $("#Sundayxw_hydd1").html(Sundayxw_hydd);
										 
										 $("#Sundaysw_zcr1").html(Sundaysw_zcr);
										 $("#Sundayxw_zcr1").html(Sundayxw_zcr);
										 
										 $("#Sundaysw_lxr1").html(Sundaysw_lxr);
										 $("#Sundayxw_lxr1").html(Sundayxw_lxr);
										 
										 $("#Sundaysw_chld1").html(Sundaysw_chld);
										 $("#Sundayxw_chld1").html(Sundayxw_chld);
		 })
	}
	
	function excelExport(){
		  var table = document.getElementById("wdhy");
	      var excelContent = table.innerHTML;
	      var excelFile = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>";
	      excelFile += "<head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head>";
	      excelFile += "<body><table>";
	      excelFile += excelContent;
	      excelFile += "</table></body>";
	      excelFile += "</html>";
	      var link = "data:application/vnd.ms-excel;base64," + base64(excelFile);
	      var a = document.createElement("a");
	      a.download = "本周公司会议统计"+".xls";
	      a.href = link;
	      a.click();
//		$('#exportForm').submit();
//		alert("11111");
//		location.href="${ctx}/download/fileDownLoad.do?originalName=人员模板.xls&path=rymb.xls";
	}
	
	function excelExport1(){
		  var table = document.getElementById("wdhy1");
	      var excelContent = table.innerHTML;
	      var excelFile = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:x='urn:schemas-microsoft-com:office:excel' xmlns='http://www.w3.org/TR/REC-html40'>";
	      excelFile += "<head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head>";
	      excelFile += "<body><table>";
	      excelFile += excelContent;
	      excelFile += "</table></body>";
	      excelFile += "</html>";
	      var link = "data:application/vnd.ms-excel;base64," + base64(excelFile);
	      var a = document.createElement("a");
	      a.download = "下周公司会议统计"+".xls";
	      a.href = link;
	      a.click();
	}
  function base64 (content) {
      return window.btoa(unescape(encodeURIComponent(content)));         
   }

</script>
</body>
</html>