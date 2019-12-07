<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>菜单管理</title>
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
    <link rel="stylesheet" href="${ctx}/statics/css/layui.css">
    <%-- <link rel="stylesheet"  href="${ctx}/statics/css/eleTree.css" /> --%>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.table.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.excheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.exedit.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.form.min.js"></script>
    <style>
    .layui-table {
    	width: 1300px;
    }
    table {
    		max-width: 1300px;
		}
    </style>
</head>
<body style="background: #eee;">
	

   <div class="admin-main">
    
   <!--表格区域  -->
   <form id="gridform">
    <table id="usertab" class="layui-table site-table table-hover"   lay-skin="line" >
        <thead>
        <tr>
						<th width="5%">
							<!-- <input type="checkbox" name="all" id="all" lay-skin="primary" onchange="change(this)" > -->
						</th>
						<th width="10%">设备名称</th>
						<th width="10%">ip地址</th>
						<th width="5%">楼层</th>
						<th width="10%">周一</th>
						<th width="10%">周二</th>
						<th width="10%">周三</th>
						<th width="10%">周四</th>
						<th width="10%">周五</th>
						<th width="10%">周六</th>
						<th width="10%">周日</th>
					</tr>
        </thead>
        <tbody id="tbody">
        </tbody>
    </table>
    <input type="hidden" id="userName" name="userName" value="${user.username}"> <!-- 当前用户 -->
    <input type="hidden" id="deviceIds"  value="${deviceIds}"> <!-- 当前用户 -->
    <input type="hidden" id="dates"  value="${dates}"> <!-- 当前用户 -->
    <input type="hidden" id="times"  value="${times}"> <!-- 当前用户 -->
   </form>
</div>

   <script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
   <script>
   var param;
   function child(date){
 	  param = date;
   }
   
   function change(obj){
	   var b = $(obj).is(":checked");
	  $("input[name='id']").each(function(){
		 this.checked = b;
	  });
   }
   
   //var table;
	   layui.use(['form', 'layer'], function () {
		   var form = layui.form;
		   form.render(); 
		  });
	   var ini = [];
   $(function(){
	   
	   
	   
	  // str2json();
	   var url = '${ctx}/jihua/deviceList.do';
	   
	   $.ajax({
			url : url,
			type : "post",
			dataType : "json",
			success : function(d) {
				var html = "";
				for(var i=0;i<d.length;i++){
					html+='<tr ';
			        	/* if(d[i].lc%2!=0){
			        		html+=' bgcolor="#F0FFFF" ';
			        	} */
		         	html+='>';
		         	
		         	html+='	<td><input type="checkbox"   name="id" value="'+d[i].id+'" ';
		         	//deviceIds
		    		   var deviceIds = ','+$('#deviceIds').val();
		    		   var cb='<input type="checkbox" ';
		    		   if(deviceIds.indexOf(','+(d[i].id)+',')>-1){
		    			   ini.push(1);
		    			  html+=' checked="true" '; 
		    		   }else{
		    			   ini.push(0);
		    		   }
		         	html+='  onclick="tot(\''+d[i].arr+'\',this,'+i+')"></td>';
		         	html+='	<td>'+d[i].cname+'</td>';
		         	html+='	<td>'+d[i].ip+'</td>';
		         	html+='	<td>'+d[i].name+'</td>';
		         	
		         	//
		         	if(d[i].arr!=null){
			         	var all = str2json(d[i].arr);
			         	var wa = all[0];
			         	var da = all[1];
			         	for(var j=0;j<7;j++){
				         	html+='<td>';
				         	if(wa[j]!=null&&wa[j]!=""){
				         		var ddd = da[j].split("|");
				         		for(var n=0;n<ddd.length;n++){
				         			var t = ddd[n].split(",");
						         	html+=' <span class="layui-badge layui-bg-green" >';
						         	html+=' 		<input type="hidden" value="'+t[0]+'">';
						         	html+=' 			<font size="1px;">';
						         	html+=' 				<span class="startTime">'+t[0]+'</span> �?  '+t[1];
						         	html+=' 			</font>';
						         	html+=' 		</span>';
						         	html+='	<br>';
				         		}
				         		
				         	}
				         	html+='</td>';
			         	}
		         	}else{
		         		for(var j=0;j<7;j++){
		         			html+="<td></td>"
		         		}
		         	}
		         	
		         	html+='</tr>';

				}
				$('#tbody').html(html);
				
				
				//change
				 //设备选中时判断时�?
				 
				
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				layer.msg('出现错误!', {
                      icon: 2
                  });
			}
		});
	   
	   
   });
 //判断时间段冲�?
   function tot(arr,obj,num){//判断 已进入关联设备页�? 初始是否选中
	 //初始是否选中 
	 if(ini[num]==1){
		 return;
	 }
	 
	 //console.log(arr);
	 //console.log(arr);
	   var all = str2json(arr);
	 //  console.log(all);
	   var tArr = all[1];//[empty, "22:00,22:05|04:00,05:05", "22:00,22:05|04:00,05:05", "04:00,05:05", "04:00,05:05", empty × 2]
	//	console.log(ta);
	   var myd = $('#dates').val();//�?要判断日�? 1,2,
	   var myt = $('#times').val();//�?要判断时�? 22:00:00,23:00:00
	   
	 
			  var p = $(obj).is(":checked");
			  if(p==true){
				//判断时间冲突
				var da = myd.split(",");
				var ta = myt.split(",");
				//console.log(da);// ["2", ""]
				//console.log(ta);//["04:30", "05:00"]
				for(var i=0;i<da.length-1;i++){
					if(tArr[da[i]-1]!=null&&tArr[da[i]-1]!=""){
						var ada = tArr[da[i]-1].split("|");
						for(var j=0;j<ada.length;j++){
							adaArr = ada[j].split(",");
							var a = adaArr[0]; var b = adaArr[1];   //04:00,05:05                  22:00,22:05
							var c = ta[0]; var d = ta[1];            //04:30,05:00 				   04:30,05:00
							//console.log(b+"<="+c);
							//console.log(d+"<="+a);
							if(b<=c||d<=a){
								//console.log("没有冲突");
							}else{
								//console.log("冲突");
								//da[i]//冲突日期 2（周二）
								//a b 冲突的开始时�?
								var num = (da[i]*1)+3;
								var td = $(obj).parent().parent().children('td').eq(num);
								
								//td下所有的元素
								 td.children('span').each(function(){
									 var start = $(this).children('input').eq(0).val();
									if(start==a){
										$(this).removeClass('layui-bg-green');
										$(this).addClass('layui-bg-badge');
										layer.msg('时间段存在冲�? ，无法�?�择�?', {
						                      icon: 2
						                  });
										obj.checked = false;
									}
								 });
							}
							
						}
						
					}
				}
			  }
   }
   function submitForm(){
	    var startTimeArr = [];
	    var endTimeArr = [];
	    var timeE = '',timeS = '';
	    for(var i = 0,len = $('.startTime').length; i < len ; i++){
	        timeS = $('.startTime').eq(i).val();
	        startTimeArr.push(timeS);
	    }
	    for(var j = 0,len = $('.endTime').length; j < len; j++){
	        timeE = $('.endTime').eq(j).val();
	        endTimeArr.push(timeE);
	    }
	    var begin = startTimeArr.sort();
	    var over = endTimeArr.sort();
	    for(var k=1;k<begin.length;k++){
	        if (begin[k] <= over[k-1]){
	            alert("时间段存在重叠！");
	            return false;
	        }
	    }
	    return true;
	}
 
 
   function str2json(str){
	   var all = [];
		var wa =  new Array(7)
		var da =  new Array(7)
		//var da =  {d1:[],d2:[],d3:[],d4:[],d5:[],d6:[],d7:[]}
	   var a1 = [];
	   var o1 = {};
	   var a2 = [];
	   var o2 = {};
	   var arr = str.split('_');
	   for(var i=0;i<arr.length;i++){
		   var dates = arr[i].split("|")[0];//1,2,
		   var times = arr[i].split("|")[1];//03:00:00,04:00:00
		  
		   var datesArr = dates.split(",");
		   for(var j=0;j<datesArr.length-1;j++){
			   wa[(datesArr[j]*1-1)] = "1";
			   //console.log(da[(datesArr[j]*1-1)]!=null);
			   
			   if(da[(datesArr[j]*1-1)]!=null){
				   var v = da[(datesArr[j]*1-1)];
				   da[(datesArr[j]*1-1)]=v+"|"+times;
			   }else{
				   da[(datesArr[j]*1-1)]=times;
			   }
		   }
		   
	   }
		  all.push(wa);
		  all.push(da);
		  return all;
   }
	function getCheck(){
		 var obj = $("input[name='id']:checked");
		    var check_val = [];
		    for(var i=0;i<obj.length;i++){
	        	var deviceIds = $(obj[i]).val();
	            check_val.push(deviceIds);
		    }
         return check_val;
	}
 
   </script>

</body>
</html>