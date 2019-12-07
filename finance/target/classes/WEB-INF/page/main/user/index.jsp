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
    <script type="text/javascript">
        var setting = {
            edit: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },edit: {

            	enable: false,

            	//给节点额外增加属性来控制“重命名”�?��?�删除�?�图标的显示或隐�?

            	//showRenameBtn:showRenameBtn,
            	//showRemoveBtn:showRemoveBtn
            	},
            callback: {
                onClick: onClick
            }
        };
        var container;
        function  showRenameBtn(treeId, treeNode){
        	return false;
        }
        function showRemoveBtn(treeId, treeNode){
        	//获取节点�?配置的noRemoveBtn属�?��??
        		return true;
        	}
        function init() {
            var url = '${ctx}/main/department/tree.do';
            $.post(url,function (data) {
                var result = data.result;
                if (result == 'ok') {
                    var zNodes = data.data;
                    var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                   // setEdit();
                    var nodes = treeObj.transformToArray(treeObj.getNodes());
                    // 展开除第�?级之外的其他节点
                    for (var i = 0, length_1 = nodes.length; i < length_1; i++) {
                        if(nodes[i].level == 0){
                            continue;
                        }
                        nodes[i].open = true;
                    }
                    //展开第一级节�?
                    treeObj.expandNode(nodes[0], true);
                }
            },'json');
        }
        $(document).ready(function(){
        	init();
        });


        function onClick(event, treeId, treeNode, clickFlag) {
            var id = treeNode.id;
            var name = treeNode.name;
            var pNode = treeNode.getParentNode();
            var path = treeNode.getPath().length;
            console.log(treeNode);
			$("#departmentId").val(id)
		    var searchKey = {'departmentId':id};
		     $('#usertab').table('search',searchKey);
        	
        }


    </script>
</head>
<body style="background: #eee;">
   <div class="admin-main">
       <%--菜单树形结构--%>
       <div style="width: 22%;float: left;">
           <div class="layui-card">
               <div class="layui-card-header">系统菜单</div>
               <div class="layui-card-body">
                   <ul id="treeDemo" class="ztree"></ul>
               </div>
           </div>
       </div>

   <div class="admin-main" style="float: right;width: 72%;">
    <!-- 高级搜索区域 -->
        <div class="page_explain">

            <form class="layui-form" action="">

                <div class="layui-inline">
                    <label class="layui-form-label">用户�?</label>
                    <div class="layui-input-inline">
                        <input name="username" type="text" autocomplete="off" class="layui-input" id="username">
                    </div>
                </div>
                 <div class="layui-inline">
                    <label class="layui-form-label">真实姓名</label>
                    <div class="layui-input-inline">
                        <input name="realname" type="text" autocomplete="off" class="layui-input" id="realname">
                    </div>
                </div>

                <button type="button" class="layui-btn layui-btn-primary layui-btn-small search-button" id="searchName">搜索</button>

            </form>

        </div>

        <!-- 按钮操作 -->
        <div class="table_control">
            <div class="table_opera">
                <button type="button" title="添加" class="layui-btn layui-btn-primary " onclick='add();'>
                    <i class="icon iconfont icon-add-r-o"></i>
                </button>

                <button htype="button" title="编辑" class="layui-btn layui-btn-primary " onclick='edit()'>
                    <i class="icon iconfont icon-edit-o"></i>
                </button>

                <button htype="button" title="删除" class="layui-btn layui-btn-primary " onclick="del()">
                    <i class="icon iconfont icon-delete-o"></i>
                </button>
                <c:if test="${'ddbcb068117611e994d400163e035f23' eq user.id}">
                <button htype="button" title="导入" class="layui-btn layui-btn-primary " onclick="dr()">
                    <i class="icon iconfont icon-import-o"></i>
                </button>
                </c:if>
                <button htype="button" title="导出" class="layui-btn layui-btn-primary " onclick="excelExport()">
                    <i class="icon iconfont icon-export-o"></i>
                </button>
            </div>
            <!-- 搜索区域操作 -->
           <!--  <div class="table_search">
                <input type="text" id="_search" class="keyword" placeholder="请在这里输入关键�?" style="height:25px;">
	           <div class="layui-form">
				 <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="explain"  style="width:120px;">高级搜索</button>
	             <input id="classId" type="hidden">
	            </div>
            </div> -->

    </div>

   <!--表格区域  -->
   <form id="gridform">
    <table id="usertab" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th>
            <th width="10%">用户�?</th>
            <th width="10%">真实姓名</th>
            <th width="10%">�?属部�?</th>
            <th width="10%">�?�?</th>
            <th width="10%">角色</th>
            <th width="10%">修改时间</th>
            <th width="20%">操作</th>
        </tr>
        </thead>
    </table>
    <input type="hidden" id="departmentId" name="departmentId" >
   </form>
</div>
   </div>

   <script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
   <script>
   var table;
   $(function(){

       var url = '${ctx}/main/user/list.do';
       var columns = [ //定义�?
           {"data": function (obj) {
               return '<input type="checkbox" name="id" class="fly-checkbox" value=' + obj.id + '>';
           }},
           {data: "username"},
           {data: "realname"},
           {data: "name"},
           {data: "remark"},
           {data: "rname"},
           {data: "ltime"},
           {data: function (obj) {
               return "<a class='layui-btn layui-btn-small _aa' name='change_btn' onclick=editState('"+obj.id+"') >"+obj.state+"</a>  <a class='layui-btn layui-btn-danger' onclick=resetting('"+obj.id+"','"+obj.username+"') >重置密码</a> <a class='layui-btn layui-btn-small _aa' name='change_btn' onclick=edit('"+obj.id+"') >编辑</a>";		//获取�?:data["brand_id"]
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
   
   function searchNs(table){
		var username = $("#username").val();
		var realname = $("#realname").val();
		var param = "?username="+username+"&realname="+realname;
		var url = table.ajax.url("${ctx}/main/user/list.do"+param);
		url.load();
	}
   
   
       layui.use(['form','jquery'], function(){
           var form = layui.form
               ,layer = layui.layer,
               eleTree = layui.eleTree,
               $ = layui.jquery;

           /* var el5;
           $(document).on("click","#menu",function(e){
        	   e.stopPropagation();
               if(!el5){
                   el5=eleTree.render({
                       elem: '.ele5',
                       url: "${ctx}/statics/json/tree.json",
                       defaultExpandAll: true,
                       expandOnClickNode: false,
                       highlightCurrent: true
                   });
               }
               $(".ele5").toggle();
       	   });

           eleTree.on("nodeClick(data5)",function(d) {
               $("[name='title']").val(d.data.currentData.label)
               $(".ele5").hide();
           }); 
           $(document).on("click",function() {
               $(".ele5").hide();
           });  */

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
       function add(){
    	  var id =  $("#departmentId").val();
    	  if(id==''){
       	    layer.msg('请先选择�?个部门节�?!', {
                icon: 2
            });
    	  }else{
        	  console.log(id);
      	    layer.open({
      	        type: 2,
      	        title: '新增用户',
      	        shadeClose: true,
      	        shade: false,
      	        maxmin: true, //�?启最大化�?小化按钮
      	        area: ['893px', '600px'],
      	        content: '${ctx}/main/user/add.shtml?departmentId='+id
      	      });
    	  }

       }
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
       
     //人员状�??
       function editState(index){
       	layer.confirm('您确定要执行该项操作吗？', function(){
       		var options = {
       				url:'${ctx}/main/user/state.do?pid='+index,
       				type:"post",
       				dataType:"json",
       				success:function(data){
       					if(data.result=='ok'){
       	                    layer.msg('操作成功!', {
       	                        icon: 1
       	                    });
       	                    table.ajax.url("${ctx}/main/user/list.do").load();
       					}else if(data.result=='fail'){
       	                    layer.msg('操作失败!', {
       	                        icon: 2
       	                    });
       					}
       				}
       		};
       		$("#usertab").ajaxSubmit(options);
       	});
       }
       //重置密码
       function resetting(id,username){
       	//var url = '${ctx}/main/user/resetpwd.do?id='+id;
       	layer.confirm('确定要重置密码吗�?', function(){
       		  var options = {
       					url:'${ctx}/main/user/resetpwd.do?id='+id+'&username='+username,
       					type:"post",
       					dataType:"json",
       					success:function(data){
       						if(data.result=='ok'){
       		                    layer.msg('重置密码成功!', {
       		                        icon: 1
       		                    });
       							table.ajax.url("${ctx}/main/user/list.do").load();
       						}
       						if(data.result=='fail'){
       		                    layer.msg('重置密码失败!', {
       		                        icon: 2
       		                    });
       						}
       					}
       			};
       			$("#usertab").ajaxSubmit(options);
       	});
       }
       
       
     //删除
       function del(){
           var ch_goodsId = $("input[name='id']").is("input:checked");
           var id = $("input[name='id']").val();
           if(ch_goodsId == false){
               layer.msg('请�?�择要删除的数据', {
                   icon: 7
               });
               return false;
           }
           
            layer.confirm('确定要删除所选的数据吗？', function(){
                 var options = {
                           url:'${ctx}/main/user/del.do',
                           type:"post",
                           dataType:"json",
                           success:function(data){
                               if(data.result=='ok'){
                                   layer.msg('删除成功!', {
                                       icon: 1
                                   });
                                   table.ajax.url("${ctx}/main/user/list.do").load();
                               }
                               if(data.result=='fail'){
                                   layer.msg('删除失败!', {
                                       icon: 2
                                   });
                               }
                           }
                   };
                   $("#gridform").ajaxSubmit(options);
           });
       } 

   </script>

</body>
</html>