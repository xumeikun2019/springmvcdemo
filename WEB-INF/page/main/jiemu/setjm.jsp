<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
</head>
<body style="background: #eee;">
   <div class="admin-main" >

           <div style="float: right;width: 100%;height:100%;">

               <div class="layui-card">
                   <div class="layui-card-body">

                       <div class="container">
							<form class="layui-form" style="margin: 10px;">
		
		                   <!-- <div class="layui-form-item">
		                       <label class="layui-form-label">计划名称</label>
		                       <div class="layui-input-block">
						      <input type="text" name="jhmc" id="jhmc"  value="">
						    </div>
		                   </div> -->
		                   <div class="layui-form-item">
		                       <label class="layui-form-label">播放日</label>
		                       <div class="layui-input-block">
						      <input type="checkbox" name="xq" id="c1" title="周一" value="1">
						      <input type="checkbox" name="xq" id="c2" title="周二" value="2">
						      <input type="checkbox" name="xq" id="c3" title="周三" value="3">
						      <input type="checkbox" name="xq" id="c4" title="周四" value="4">
						      <input type="checkbox" name="xq" id="c5" title="周五" value="5">
						      <input type="checkbox" name="xq" id="c6" title="周六" value="6">
						      <input type="checkbox" name="xq" id="c7" title="周日" value="7">
						    </div>
		                   </div>
		
		                   <div class="layui-form-item">
		                       <label class="layui-form-label">时间段</label>
		                       <div class="layui-input-block">
		                           <div class="layui-inline">
							        <input type="text" class="layui-input" id="startTime" placeholder="开始时间">
							      	&nbsp;&nbsp;&nbsp;
							        <input type="text" class="layui-input" id="endTime" placeholder="结束时间">
							    </div>
		                       </div>
		                   </div>
		                   <div class="layui-form-item">
		                       <label class="layui-form-label"></label>
		                       <div class="layui-input-block" style="float:right;">
		                           <div class="layui-inline" id="btnDiv">
		                           <a class='layui-btn layui-btn-normal' onclick="saveJH('save')" id="cjjh">保存</a>
		                           <a class='layui-btn layui-btn-danger' onclick="nextStep()" id="cjjh">下一步>></a>
							    </div>
		                       </div>
		                   </div>
						  <input type="hidden" id="userName" value="${user.username}">
		                  <input type="hidden" id="dates" value="${dates}">
		                  <input type="hidden" id="times" value="${times}">
		                  
		
		               </form>
                       </div>

                   </div>
               </div>
           </div>
   </div>
   <script>
       layui.use(['form','jquery'], function(){
           var form = layui.form
               ,layer = layui.layer,
               eleTree = layui.eleTree,
               $ = layui.jquery;
       });
      $(function(){
    	  laydate.render({
    		 elem: '#startTime'
    	    ,type: 'time'
   		    ,btns: ['clear', 'now','confirm']
   		    ,trigger: 'click'
   		 	,format: 'HH:mm'
    		});
    	  
    	  
    	  laydate.render({
    		 elem: '#endTime'
    	    ,type: 'time'
   		    ,btns: ['clear', 'now','confirm']
   		    ,trigger: 'click'
   		    ,format: 'HH:mm'
    		});
    	  editinput();
    	  
    	  
      }) ;
      function btnFlg(){
    	  $('#btnDiv').css('display','none');
      }
      function editinput(){
    	  var dates = $('#dates').val();
    	  var times = $('#times').val();
    	  console.log(dates);
    	  if(dates!=""){
    		  var ca = dates.split(',');
    		  for(var i=0;i<ca.length;i++){
    			  $('#c'+ca[i]).attr("checked",'true');  
    		  }
    	  }
    	  if(times!=""){
    		  var ta = times.split(',');
    		  if(ta[0]!=""){
    			  $('#startTime').val(ta[0]);
    		  }
    		  if(ta[1]!=""){
    			  $('#endTime').val(ta[1]);
    		  }
    	  }
      }
      function getDates(){
    	  obj = document.getElementsByName("xq");
		    var dates_val = "";
		    for(k in obj){
		        if(obj[k].checked)
		            dates_val+=obj[k].value+",";
		    }
        return dates_val;
      }
      function getTimes(){
    	  return $('#startTime').val()+","+$('#endTime').val();
      }
      
      var param;
      function child(date){
    	  param = date;
      }
      function getParams(){
    	  console.log($('#jmid').val());
    	  param.dates = getDates();
    	  param.times = getTimes();
    	  param.userName = $('#userName').val();
      }
      var id = "";
      function nextStep(){
    	  if(!yz()){
    		  return;
    	  }
    	  saveJH();
    	  layer.open({
        	  id: 'insert-form',
              type: 2,
              content: '${ctx}/jihua/device_list.do?dates='+getDates()
            		  										+'&times='+getTimes()+'&fromPage=1',
              area: ['100%', '100%'],
              offset:'t',
              title : "设备列表",
              btn: ['提交','取消'],
              maxmin: true,
              success: function (layero, index) {
            	// 获取子页面的iframe
                  var iframe = window['layui-layer-iframe' + index];
                  // 向子页面的全局函数child传参
                  iframe.child(param);
              },
              yes: function (index,layero) {
            	  var body = layer.getChildFrame('body', index);
                  var iframeWin = window[layero.find('iframe')[0]['name']];//得到iframe页的窗口对象，执行iframe页的方法：
                  var arr = iframeWin.getCheck();//调用子页面的方法，得到子页面返回的ids
                  var deviceIds =  "";
                  for(var i=0;i<arr.length;i++){
                	  deviceIds+=arr[i]+',';
                  }
                  //关联设备
                    $.ajax({
						url : "${ctx}/jihua/connect.do",
						type : "post",
						dataType : "json",
						data : {
							'id':param.jhId,
							'deviceIds':deviceIds
						},
						success : function(result) {
							if(result.result=="ok"){
								layer.msg('设备关联成功！', {icon: 1,time: 1000}, function () {
										var index_now = parent.layer.getFrameIndex(window.name);  
					            	  	parent.layer.close(index_now);//关闭当前页 
					            	  	layer.closeAll(); 
								});
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							layer.msg('出现错误!', {
	   	                        icon: 2
	   	                    });
						}
					});
                   
                   //window.location.reload();
              } 
              ,end:function(){
            	  var index_now = parent.layer.getFrameIndex(window.name);  
            	  parent.layer.close(index_now);//关闭当前页 
              }
              
          });
    	  
    	  
    	  
  }
      
      function saveJH(f){
    	  if(!yz()){
    		  return;
    	  }
    	  getParams();
    	  console.log(param);
          $.ajax({
				url : "${ctx}/jiemu/saveJMJH.do",
				type : "post",
				dataType : "json",
				data : param,
				success : function(result) {
					param.jhId = result.data;
					if(result.result=="ok"){
						layer.msg('计划保存成功！', {icon: 1,time: 1000}, function () {
							if(f=='save'){
								var index_now = parent.layer.getFrameIndex(window.name);  
			            	  	parent.layer.close(index_now);//关闭当前页 
							}
						});
						
					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("出现错误！");
				}
			});
      }
     function yz(){
    	 if($("input:checkbox[name='xq']:checked").length==0){
   			 layer.msg('请选择播放日!', {icon: 2,time: 1000}, function () {
    			 return false;
				});
    	 }else if($('#startTime').val()==""){
    		 layer.msg('请选择开始时间!', {icon: 2,time: 1000}, function () {
    			 return false;
				});
	     }else if($('#endTime').val()==""){
    		 layer.msg('请选择结束时间!', {icon: 2,time: 1000}, function () {
    			 return false;
				});
	     }else{
	    	 return true;
	     }
    	
     }
      
      
   </script>

</body>
</html>