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
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/metroStyle/metroStyle.css" />
    <%-- <link rel="stylesheet"  href="${ctx}/statics/css/eleTree.css" /> --%>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.table.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.excheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.exedit.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.form.min.js"></script>
    
</head>
<body style="background: #eee;">
	

   <div class="admin-main">
   <div class="table_control">
            <!--  <div class="table_opera" id="uploadBtn" style="left: 20px;">
                <a class='layui-btn layui-btn-small _aa' onclick="connect_device()">设备关联</a>
                
            </div>  -->
            <!-- 搜索区域操作 -->
           <!--  <div class="table_search" style="width: 480px;float: right; padding:9px 0;">
                 <input type="text" id="search" class="keyword" placeholder="请在这里输入关键字" style="height:23px;"> 
				 <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="explain"  style="width:70px;height:30px;" onclick="search()">搜索</button>
            </div> -->

    </div>
    
   <!--表格区域  -->
   <form id="gridform">
    <table id="usertab" class="layui-table  table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th width="22%" >播放日</th>
            <th width="15%">时间段</th>
            <th width="12%">设备</th>
            <th width="12%">节目</th>
            <th width="6%">预览</th>
            <th width="8%">状态</th>
            <th width="25%">操作</th>
        </tr>
        </thead>
    </table>
    <input type="hidden" id="userName" name="userName" value="${user.username}"> <!-- 当前用户 -->
   </form>
</div>

   <script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
   <script>
   var table;
   $(function(){

       var url = '${ctx}/jihua/list.do?userName='+$("#userName").val();
       var columns = [ //定义列
 			{"data": function (data) {
 				var text = "";
 				var d = data.dates;
 				
        	   if(d!=""&&d!=null){
        		   d = d.substring(0,d.length-1);
        		  d = d.replace('1','<span class="layui-badge layui-bg-green">一</span>');
        		  d = d.replace('2','<span class="layui-badge layui-bg-green">二</span>');
        		  d = d.replace('3','<span class="layui-badge layui-bg-green">三</span>');
        		  d = d.replace('4','<span class="layui-badge layui-bg-green">四</span>');
        		  d = d.replace('5','<span class="layui-badge layui-bg-green">五</span>');
        		  d = d.replace('6','<span class="layui-badge layui-bg-green">六</span>');
        		  d = d.replace('7','<span class="layui-badge layui-bg-green">日</span>');
        		  
        		  d = d.replace(new RegExp(",","gm"),"&nbsp;");
        		  text = d;

        	   }
        	  //var str = ' <span class="layui-badge layui-bg-green">绿</span>';
               return text;
           }},
			{"data": function (data) {
				var text = "";
        	   
        		   var da = data.times.split(',');
        		   if(da[0]!=""&&da[1]!=""){
        			   text = da[0]+'   <span class="layui-badge layui-bg-orange">至</span>   '+da[1];
        		   }
               return  text;
           }},
           {"data": function (data) {
        	   var d = data.sbmc;
        	   if(d==null){
        		   d = "未关联";
        	   }
				
            return  '<a href="javaScript:void(0)" title="'+d+'">'+d+'</a>';
        }},
           {"data": function (data) {
				
            return  '<a href="javaScript:void(0)" title="'+data.jmName+'">'+data.jmName+'</a>';
        }},
 			{"data": function (data) {
        	   
               return '<a href="javaScript:void(0);" onclick="showSC(\''+data.sucaiIds+'\')">'+
               			'<i class="layui-icon layui-icon-play" style="font-size: 30px; color: #1E9FFF;"></i>  '+
               			'</a>';
           }},
           {"data": function (data) {
        	   var s = data.ispass;
        	   if(s==0){
        		   return '<span class="layui-badge layui-bg-orangegreen">未通过</span>';
        	   }else if(s==1){
        		   
        		   return '<span class="layui-badge layui-bg-green">已通过</span>';
        	   }else if(s==2){
        		   
        		   return '<span class="layui-badge layui-bg-blue">已提交</span>';
        	   }else if(s==3){
        		   return '<span class="layui-badge layui-bg-warm">已发布</span>';
        		   
        	   }else{
        		   return '<span class="layui-badge layui-bg-gray">新建计划</span>';
        	   }
           }},
        /*    {"data": "creater"},
			{data:"cTime"}, */
			
           {data: function (obj) {
        	   console.log(obj.ispass);
        	   //null新建         2提交     1 通过              0未通过
                var html="";
                if(obj.ispass==2){
                	html+='<span class="layui-badge layui-bg-gray"><font size="2px;">计 划 审 核 中 . . .</font></span>';
                }else if(obj.ispass==null||obj.ispass==0){
	                html+="<a class='layui-btn layui-btn-small _aa'  onclick=connect_device('"+obj.id+"','"+obj.deviceIds+"','"+obj.dates+"','"+obj.times+"') >关联设备</a> ";
	           		html+=	"<a class='layui-btn layui-btn-small _aa' onclick=editJH('"+obj.id+"','"+obj.dates+"','"+obj.times+"','"+obj.jmName+"') >修改</a> ";
	           		html+=	"<a class='layui-btn layui-btn-danger'  onclick=deleteJH('"+obj.id+"') >删除</a> ";		
	           		html+=	"<a class='layui-btn layui-btn-normal'  onclick=subJH('"+obj.id+"','"+obj.deviceIds+"') >提交</a>";		
                	
                }else if(obj.ispass==1){
	           		html+=	'<a class="layui-btn layui-btn-warm"  onclick="fabu(\''+obj.id+'\','+obj.ispass+',\''+obj.deviceIds+'\')" >发布计划</a>';		
                }else if(obj.ispass==3){
	           		html+=	"<a class='layui-btn layui-btn-danger'  onclick=deleteJH('"+obj.id+"') >删除</a> ";		
                	
                }
        	   	return html;
           }}
       ];

       $('#usertab').table({
           'url':url,
           'columns':columns
       },function (data) {
           table = data;
          
       });
      
      /*  $("#searchName").click(function(){
    	   searchNs(table);
        }); */
   });
   
   
   function shenhe(id,deviceIds){
	   if(deviceIds==null||deviceIds==""||deviceIds=="undefined"){
		   layer.alert("还未关联设备！");
		   return false;
	   }
	   layer.confirm('是否通过审核？', {
		   btn: ['通过','不通过'] //按钮
		 }, function(){
			 $.ajax({
					url : "${ctx}/jihua/shenhe.do?id="+id+"&flg=1&userName="+$('#userName').val(),
					type : "post",
					dataType : "json",
					success : function(result) {
						if(result.result=="ok"){
							 layer.msg("计划已通过！");
							 window.location.reload();
						}
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
						alert("出现错误！");
					}
				});
		 }, function(){
			 $.ajax({
					url : "${ctx}/jihua/shenhe.do?id="+id+"&flg=0&userName="+$('#userName').val(),
					type : "post",
					dataType : "json",
					success : function(result) {
						if(result.result=="ok"){
							 layer.msg("计划未通过！");
							 window.location.reload();
						}
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
						alert("出现错误！");
					}
				});
		 });
   	 	
   }
   var i;
   function fabu(id,ispass,deviceIds){
	   if(ispass==null||ispass==""||ispass=="undefined"){
		   layer.alert("还未审核！");
		   return false;
	   }
	   layer.confirm('是否发布计划到设备？', {
		   btn: ['发布','取消'] //按钮
		 }, function(){
			 $.ajax({
					url : "${ctx}/jihua/fabu.do?id="+id
													+"&deviceIds="+deviceIds
													+"&userName="+$('#userName').val(),
					type : "post",
					dataType : "json",
					async: true,
                    cache: false,
                    beforeSend: function () {
                        i=showLoad();
                    },
					success : function(result) {
						if(result.result=="ok"){
							 closeLoad(i);
							 //layer.msg('发布成功！',{time: 1000,offset: 'auto'});
							 
							 layer.msg('发布成功', {
								    time: 1000 //1秒关闭（如果不配置，默认是3秒）
								}, function () {
								    window.location.reload();
								});
						}else{
							layer.msg("发布出现错误,请检查！");
						}
					},
					error: function (XMLHttpRequest, textStatus, errorThrown) {
						closeLoad(i);
						layer.msg("发布出现错误！");
					}
				});
		 }, function(){
			
		 });
	 
   }
   function showLoad() {
	   
       return layer.msg('发布中...', {icon: 16,shade: [0.5, '#f5f5f5'],scrollbar: false,offset: 'auto', time:100000});
       
   }
   function closeLoad(index) {
       layer.close(index);
       
   }
  
   
   
   function showSC(scIds){
       var index = layer.open({
           type: 2,
           content: '${ctx}/jiemu/openShow.do?sucaiIds='+scIds,
           area: ['100%', '100%'],
           title:'节目制作',
           offset:'t',
           maxmin: true,
           success: function(layero, index){
         	   
           }
       });
}
   
   
   
   function searchNs(table){
		var username = $("#username").val();
		var realname = $("#realname").val();
		var param = "?username="+username+"&realname="+realname;
		var url = table.ajax.url("${ctx}/main/user/list.do"+param);
		url.load();
	}
   function preview(paths,jg){
		 
		          var index = layer.open({
		              type: 2,
		              content: '${ctx}/jiemu/preview.do?&jg='+jg
		            		  								  +'&vvv='+paths,
		              area: ['70%', '90%'],
		              offset:'t',
		              maxmin: true,
		              end: function () {
		  
		              }
		          });
   }
   
       layui.use(['form','jquery'], function(){
           var form = layui.form
               ,layer = layui.layer,
               eleTree = layui.eleTree,
               $ = layui.jquery;

           
       });
      
     
     function editJH(jhId,dates,times,jmName){
    	 //跳转设置节目计划
		   
	          var index = layer.open({
	        	  id: 'insert-form',
	              type: 2,
	              content: '${ctx}/jiemu/setJM.do?dates='+dates+'&times='+times,
	              area: ['100%', '100%'],
	              offset:'t',
	              title : "节目 : "+jmName,
	              btn: ['提交','取消'],
	              maxmin: true,
	              success: function (layero, index) {
	            	  var iframe = window['layui-layer-iframe' + index];
	                  // 向子页面的全局函数child传参
	                  iframe.btnFlg();
	              },
	              yes: function (index,layero) {
	            	  var body = layer.getChildFrame('body', index);
	                  var iframeWin = window[layero.find('iframe')[0]['name']];//得到iframe页的窗口对象，执行iframe页的方法：
	                  var dates = iframeWin.getDates();//调用子页面的方法，得到子页面返回的ids
	                  var times = iframeWin.getTimes();//调用子页面的方法，得到子页面返回的ids
	                  var yz = iframeWin.yz();//调用子页面的方法，得到子页面返回的ids
	                  if(!yz){
	            		  return;
	            	  }
	                  //节目和计划提交 
	                   $.ajax({
							url : "${ctx}/jihua/editJH.do",
							type : "post",
							dataType : "json",
							data : {
								'id':jhId,
								//'userName': $('#userName').val(),
								'dates':dates,
								'times':times
							},
							success : function(result) {
								if(result.result=="ok"){
									layer.msg('操作成功!', {
			   	                        icon: 1
			   	                    });
								}
							},
							error: function (XMLHttpRequest, textStatus, errorThrown) {
								layer.msg('出现错误!', {
		   	                        icon: 1
		   	                    });
							}
						});
	                   layer.closeAll();
	                  /* layer.close(index);//需要手动关闭窗口
	                  window.parent.location.reload(); */
	              } 
	          });
     }
     function deleteJH(id){
    	 layer.confirm('您确定要执行该项操作吗？', function(){
    	 	$.ajax({
				url : "${ctx}/jihua/deleteJH.do",
				type : "post",
				dataType : "json",
				data : {
					'id':id
				},
				success : function(data) {
					if(data.result=='ok'){
   	                    layer.msg('操作成功!', {
   	                        icon: 1
   	                    });
   	                 var url = '${ctx}/jihua/list.do?userName='+$("#userName").val();
   	                    table.ajax.url(url).load();
   					}else if(data.result=='fail'){
   	                    layer.msg('操作失败!', {
   	                        icon: 2
   	                    });
   					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("出现错误！");
				}
			});
    	 });
     }
     
     function connect_device(id,deviceIds,dates,times){
    	  var index = layer.open({
        	  id: 'insert-form',
              type: 2,
              content: '${ctx}/jihua/device_list.do?deviceIds='+deviceIds
        		  											+'&dates='+dates
        		  											+'&times='+times,
              area: ['100%', '100%'],
              offset:'t',
              title : "设备列表",
              btn: ['提交','取消'],
              maxmin: true,
              success: function (layero, index) {
            	
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
							'id':id,
							'deviceIds':deviceIds
						},
						success : function(result) {
							if(result.result=="ok"){
								layer.msg('设备关联成功！', {icon: 1,time: 1000}, function () {
									//var index_now = parent.layer.getFrameIndex(window.name);  
				            	  	//parent.layer.close(index_now);//关闭当前页 
								layer.closeAll(); 
				                   window.location.reload();
							});
								
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							layer.msg('出现错误!', {
	   	                        icon: 2
	   	                    });
						}
					});
                   
                  /* layer.close(index);//需要手动关闭窗口
                  window.parent.location.reload(); */
              } 
          });
     }
     
     function subJH(id,deviceIds){
    	 if(deviceIds==null||deviceIds==""||deviceIds=="undefined"){
  		   layer.alert("还未关联设备！");
  		   return false;
  	   }
  	   layer.confirm('是否提交计划？', {
  		   btn: ['是','否'] //按钮
  		 }, function(){
    	 
    	 $.ajax({
				url : "${ctx}/jihua/subJH.do",
				type : "post",
				dataType : "json",
				data : {
					'id':id
				},
				success : function(result) {
					if(result.result=="ok"){
						
						layer.msg('已提交，等待审核!', {icon: 1,time: 1000}, function () {
						    window.location.reload();
						});
						
					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					layer.msg('出现错误!', {
	                        icon: 1
	                    });
				}
			});
  		 });
     }
     
     
     function editJM(jhId){
   	  var index = layer.open({
       	  id: 'insert-form',
             type: 2,
             content: '${ctx}/jihua/editJM.do?jhId='+jhId,
             area: ['100%', '100%'],
             offset:'t',
             title : "节目列表",
             btn: ['提交','取消'],
             maxmin: true,
             success: function (layero, index) {
           	
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
							'id':id,
							'deviceIds':deviceIds
						},
						success : function(result) {
							if(result.result=="ok"){
								layer.msg('设备关联成功！', {icon: 1,time: 1000}, function () {
									//var index_now = parent.layer.getFrameIndex(window.name);  
				            	  	//parent.layer.close(index_now);//关闭当前页 
								layer.closeAll(); 
				                   window.location.reload();
							});
								
							}
						},
						error: function (XMLHttpRequest, textStatus, errorThrown) {
							layer.msg('出现错误!', {
	   	                        icon: 2
	   	                    });
						}
					});
             } 
         });
    }
   </script>

</body>
</html>