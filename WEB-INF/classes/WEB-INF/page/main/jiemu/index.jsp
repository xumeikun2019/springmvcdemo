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
            <div class="table_opera" id="uploadBtn" style="left: 20px;">
                <a class='layui-btn layui-btn-small _aa' onclick="openJM()">新建节目</a>
                <!-- <a class='layui-btn layui-btn-small _aa' onclick="testJM()">测试节目</a>  -->
                
            </div>
            <!-- 搜索区域操作 -->
           <!--  <div class="table_search" style="width: 480px;float: right; padding:9px 0;">
                 <input type="text" id="search" class="keyword" placeholder="请在这里输入关键�?" style="height:23px;"> 
				 <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="explain"  style="width:70px;height:30px;" onclick="search()">搜索</button>
            </div> -->

    </div>
   <!--表格区域  -->
   <form id="gridform">
    <table id="usertab" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th width="15%">节目名称</th>
            <th width="15%">预览</th>
            <th width="15%">发布�?</th>
            <th width="15%">创建时间</th> 
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

       var url = '${ctx}/jiemu/list.do?userName='+$("#userName").val();
       var columns = [ //定义�?
           {data: "name"},
 			{"data": function (data) {
        	   
               return '<a href="javaScript:void(0);" onclick="showSC(\''+data.sucaiIds+'\')">'+
               			'<i class="layui-icon layui-icon-play" style="font-size: 30px; color: #1E9FFF;"></i>  '+
               			'</a>';
           }},
           {data: "creater"},
            {data: "cTime"}, 
           {data: function (obj) {
               return "<a class='layui-btn layui-btn-danger' onclick=createJH('"+obj.id+"','"+obj.name+"') >创建计划</a> "+
               			"<a class='layui-btn layui-btn-small _aa' name='change_btn' onclick=deleteJH('"+obj.id+"') >删除</a>";		//获取�?:data["brand_id"]
           }}
       ];

       $('#usertab').table({
           'url':url,
           'columns':columns
       },function (data) {
           table = data;
       });
       
       $("#searchName").click(function(){
    	   searchNs(table);
        });
   });
   
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
   function getLocalTime(nS) { 
   	//将时间戳（十三位时间搓，也就是带毫秒的时间搓）转换成时间格式
   	// d.cTime = 1539083829787
   	let date = new Date(nS);
   	let year = date.getFullYear();
   	let month = date.getMonth()+1;
   	let day = date.getDate();
   	
   	let hh = date.getHours();
   	let mm = date.getMinutes();
   	let ss = date.getSeconds();
   	month = month < 10 ? "0"+month:month;
   	day = day < 10 ? "0"+day:day;
   	date = year+'-'+month+'-'+day+' '+hh+":"+mm+":"+ss;
   	return date;
   } 
   
   function searchNs(table){
		var username = $("#username").val();
		var realname = $("#realname").val();
		var param = "?username="+username+"&realname="+realname;
		var url = table.ajax.url("${ctx}/main/user/list.do"+param);
		url.load();
	}
   function preview(paths,jg){
		  console.log("paths::"+paths);
		  console.log("jg::"+paths);
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


           //自定义验证规�?
           form.verify({
               categroy: function(value){
                   if(value.length < 5){
                       return '标题至少�?5个字符啊';
                   }
               }
           });
           //监听提交
           form.on('submit(add)', function(data){
               var url = '${ctx}/main/department/save.do';
               $.submit.post(data,url,function (data) {
                   var result = data.result;
                   if (result == 'ok') {
/*                        var tree = $.fn.zTree.getZTreeObj("treeDemo");
                       console.log(tree);
                       tree.refresh(); */
                       layer.close(container);
                       init();
                   }
               });
               return false;
           });
           
           form.on('submit(edit)', function(data){
               var url = '${ctx}/main/department/save.do';
               $.submit.post(data,url,function (data) {
                   var result = data.result;
                   if (result == 'ok') {
                       //var tree = $.fn.zTree.getZTreeObj("treeDemo");
                       //console.log(tree);
                       //layer.closeAll();
                       //tree.refresh();
                       init();
                   }
               });
               return false;
           });
       });
      
       function dr(){
    		layer.open({
    			  type: 2,
    			  area: ['700px', '450px'],
    			  fixed: false, //不固�?
    			  maxmin: false,
    			  content: '${ctx}/main/department/import.shtml'
    			}); 
    	}
       function excelExport(){
    		
    		location.href="${ctx}/download/fileDownLoad.do?originalName=人员模板.xls&path=rymb.xls";
    	}
       
       function edit(id){
     	    layer.open({
     	        type: 2,
     	        title: '编辑用户',
     	        shadeClose: true,
     	        shade: false,
     	        maxmin: true, //�?启最大化�?小化按钮
     	        area: ['893px', '600px'],
     	        content: '${ctx}/main/user/edit.shtml?id='+id
     	      });
     	   
        }
       
     
     
       function openJM(){
	        //  var classVideo = document.getElementById("videourl").value;
	          var index = layer.open({
	              type: 2,
	              content: '${ctx}/jiemu/jmpage.do',
	              area: ['100%', '100%'],
	              title:'节目制作',
	              offset:'t',
	              maxmin: true,
	              end: function () {
	  
	              }
	          });
	   }
       function testJM(){
    	   
    	   window.open('${ctx}/jiemu/testJM.do');
	        //  var classVideo = document.getElementById("videourl").value;
	          /* var index = layer.open({
	              type: 2,
	              content: '${ctx}/jiemu/testJM.do',
	              area: ['100%', '100%'],
	              title:'节目制作',
	              offset:'t',
	              maxmin: true,
	              end: function () {
	  
	              }
	          }); */
	   }
     function createJH(id,title){
    	 //跳转设置节目计划
		   
	          var index = layer.open({
	        	  id: 'insert-form',
	              type: 2,
	              title: title,
	              content: '${ctx}/jiemu/setJM.do',
	              area: ['90%', '80%'],
	              offset:'t',
	              btn: ['提交','取消'],
	              maxmin: true,
	              success: function (layero, index) {
	            	  var iframe = window['layui-layer-iframe' + index];
	                  // 向子页面的全�?函数child传参
	                  iframe.btnFlg();
	              },
	              yes: function (index,layero) {
	            	  var body = layer.getChildFrame('body', index);
	                  var iframeWin = window[layero.find('iframe')[0]['name']];//得到iframe页的窗口对象，执行iframe页的方法�?
	                  var dates = iframeWin.getDates();//调用子页面的方法，得到子页面返回的ids
	                  var times = iframeWin.getTimes();//调用子页面的方法，得到子页面返回的ids
	                  var yz = iframeWin.yz();//调用子页面的方法，得到子页面返回的ids
	                  if(!yz){
	            		  return;
	            	  }
	                  //节目和计划提�? 
	                   $.ajax({
							url : "${ctx}/jiemu/saveJH.do",
							type : "post",
							dataType : "json",
							data : {
								'id':id,
								'userName': $('#userName').val(),
								'dates':dates,
								'times':times
							},
							success : function(result) {
								if(result.result=="ok"){
									 layer.msg('操作成功�?', {icon: 1,time: 1000}, function () {
					                	 layer.closeAll();
						                   window.location.reload();
										});
								}
							},
							error: function (XMLHttpRequest, textStatus, errorThrown) {
								alert("出现错误�?");
							}
						});
	                   
	                  /* layer.close(index);//�?要手动关闭窗�?
	                  window.parent.location.reload(); */
	              } 
	          });
     }
     function deleteJH(id){
    	 layer.confirm('您确定要执行该项操作吗？', function(){
    	 	$.ajax({
				url : "${ctx}/jiemu/deleteJM.do",
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
   	                 var url = '${ctx}/jiemu/list.do?userName='+$("#userName").val();
   	                    table.ajax.url(url).load();
   					}else if(data.result=='fail'){
   	                    layer.msg('操作失败!', {
   	                        icon: 2
   	                    });
   					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("出现错误�?");
				}
			});
    	 });
     }
   </script>

</body>
</html>