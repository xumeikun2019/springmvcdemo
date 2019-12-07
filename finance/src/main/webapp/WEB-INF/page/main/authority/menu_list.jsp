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
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.excheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.exedit.min.js"></script>
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

            	enable: true,

            	//给节点额外增加属性来控制“重命名”、“删除”图标的显示或隐藏

            	showRenameBtn:showRenameBtn,
            	showRemoveBtn:showRemoveBtn
            	},
            callback: {
                onClick: onClick,
                beforeRemove: beforeRemove
            }
        };
        var container;
        function  showRenameBtn(treeId, treeNode){
        	return false;
        }
        function showRemoveBtn(treeId, treeNode){
        	//获取节点所配置的noRemoveBtn属性值
        		return true;
        	}
        function init() {
            var url = '${ctx}/main/menu/menu.do?id=1';
            $.post(url,function (data) {
                var result = data.result;
                if (result == 'ok') {
                    var zNodes = data.data;
                    var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                   // setEdit();
                    var nodes = treeObj.transformToArray(treeObj.getNodes());
                    // 展开除第一级之外的其他节点
                    for (var i = 0, length_1 = nodes.length; i < length_1; i++) {
                        if(nodes[i].level == 0){
                            continue;
                        }
                        nodes[i].open = true;
                    }
                    //展开第一级节点
                    treeObj.expandNode(nodes[0], true);
                }
            },'json');
        }
        $(document).ready(function(){

        	init();

            $('#add').on('click',function () {
                //iframe窗

                /*layer.open({
                    type: 2,
                    title: '很多时候，我们想最大化看，比如像这个页面。',
                    shadeClose: true,
                    shade: [0.1],
                    maxmin: true, //开启最大化最小化按钮
                    area: ['393px', '300px'],
                    content: '//fly.layui.com/'
                });*/

            container = layer.open({
                    type: 1,
                    title: '菜单添加',
                    shade: [0.1],
                    maxmin: true, //开启最大化最小化按钮
                    area: ['80%', '80%'],
                    content: $('#form-container').html()
                });

                var mname = $('#menu-hide-name').val();
                $('.pMenu').val(mname);
                
/*                 var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                
                var url = '${ctx}/main/menu/eshow.do';  
          	  var param = {
          			  'id':id
          		  };
          		  $.post(url,param,function (data) {
          			   var result = data.data;
          			   $('#id').val(result.id);
          			   $('#menuName').val(result.menuName);
          			   $('#dataUrl').val(result.dataUrl);
          			   $('#sort').val(result.sort);
          	      },'json'); */
                
            });
            
        });


        function onClick(event, treeId, treeNode, clickFlag) {
            var id = treeNode.id;
            var name = treeNode.name;
            var pNode = treeNode.getParentNode();
            
            if(pNode != null){
            	var pname = pNode.name;
                $('.pMenu').val(pname);
                $('.pMenu2').val(pname);
            }
            $('#menu-hide-name').val(name);
            $('#menu-hide-pid').val(id);
            var path = treeNode.getPath().length; // 获取当前节点 的层级数
            $('#menuLevel').val(path+1);
            var index = treeNode.getIndex(); //  获取同级别 第几个
            //alert(index);
            //alert(path);
            var url = '${ctx}/main/menu/eshow.do';  
        	  var param = {
        			  'id':id
        		  };
        		  $.post(url,param,function (data) {
        			   var result = data.data;
        			   $('#menuId').val(result.id);
        			   $('#menuName').val(result.menuName);
        			   $('#dataUrl').val(result.dataUrl);
        			   $('#iconA').val(result.icon);
        			   $('#sort').val(result.sort);
        	      },'json');
        		  
        	
        }


        function beforeRemove(treeId, treeNode) {
            	 layer.confirm('确定要删除所选的菜单吗？',{
            			  cancel: function(index, layero){
            				  init();
            			  }
            		 } ,function(){
            		 
                     	if(treeNode.isParent){
                     	    //判断后做操作
                     	    layer.msg('该节点下有子菜单,请先删除子菜单!', {
		                        icon: 2
		                    });
                     		return false;
                     	}
                            var id = treeNode.id;
                            var url = '${ctx}/main/menu/del.do';  
                       	  	var param = {
                       			  'id':id
                       		  };
                       		  $.post(url,param,function (data) {
                                    var result = data.result;
                                    if (result == 'ok') {
                                         layer.msg('操作成功!', {
						                        icon: 1
						                    },function (){
					                        	init();
					                        });
                                        
                                    }
                                    
                       	      },'json'); 
                     
                         
            	 },function(){
            		 init();
            	 });
        }
    </script>
</head>
<body style="background: #eee;">
   <div class="admin-main">
       <%--菜单树形结构--%>
       <div style="width: 24%;float: left;">
           <div class="layui-card">
               <div class="layui-card-header">系统菜单</div>
               <div class="layui-card-body">
                   <ul id="treeDemo" class="ztree"></ul>
               </div>
           </div>
       </div>

           <div style="float: right;width: 75%;">

               <div class="layui-card">
                   <div class="layui-card-header"><button id="add" class="layui-btn">新增</button></div>
                   <div class="layui-card-body">

                       <div class="container">
							<form class="layui-form" style="margin: 10px;">
		
		                   <div class="layui-form-item">
		                       <label class="layui-form-label">上级菜单</label>
		                       <div class="layui-input-block">
		                           <input id="menu" type="text" name="title" autocomplete="off" placeholder="请输入菜单名称" class="layui-input pMenu2" value="" readonly>
		                            <!-- <div class="eleTree ele5" style="z-index: 9999" lay-filter="data5"></div> -->
		                       </div>
		                   </div>
		
		                   <div class="layui-form-item">
		                       <label class="layui-form-label">菜单名称<span style="color: red">*</span></label>
		                       <div class="layui-input-block">
		                           <input type="text" id="menuName" name="menuName" lay-verify="required" autocomplete="off" placeholder="请输入菜单名称" class="layui-input">
		                       </div>
		                   </div>
		
		                   <div class="layui-form-item">
		                       <label class="layui-form-label">菜单地址</label>
		                       <div class="layui-input-block">
		                           <input type="text" id="dataUrl" name="dataUrl"  autocomplete="off" placeholder="请输入菜单地址" class="layui-input">
		                       </div>
		                   </div>
		                   
		                   	 <div class="layui-form-item">
		                       <label class="layui-form-label">图标</label>
		                       <div class="layui-input-block">
		                           <input type="text" id="iconA" name="icon"  autocomplete="off" placeholder="请输入菜单地址" class="layui-input">
		                       </div>
		                   </div>
		
		                   <div class="layui-form-item">
		                       <label class="layui-form-label">排序</label>
		                       <div class="layui-input-block">
		                           <input type="number" id="sort" name="sort" lay-verify="required" autocomplete="off" placeholder="请输入排序编号" class="layui-input" value="${pojo.roleName}">
		                       </div>
		                   </div>
		
		
		                   <div class="layui-form-item">
		                       <div class="layui-input-block" style="text-align: center;">
		                       		<input type="hidden" name="id" id="menuId">
		                           <input type="hidden" id="menu-hide-name">
		                           <button class="layui-btn" lay-submit="" lay-filter="menu-edit">立即提交</button>
		                           <!-- <button type="reset" id="resetBtn2" class="layui-btn layui-btn-primary">重置</button> -->
		                       </div>
		                   </div>
		               </form>
                       </div>

                   </div>
               </div>
           </div>

       <div class="popup-content">
           <div id="form-container">
               <form class="layui-form layui-form-pane" style="margin: 10px;">

                   <div class="layui-form-item">
                       <label class="layui-form-label">上级菜单</label>
                       <div class="layui-input-block">
                           <input id="menu" type="text" name="title" autocomplete="off" placeholder="请输入菜单名称" class="layui-input pMenu" value="" readonly>
                            <!-- <div class="eleTree ele5" style="z-index: 9999" lay-filter="data5"></div> -->
                       </div>
                   </div>

                   <div class="layui-form-item">
                       <label class="layui-form-label">菜单名称<span style="color: red">*</span></label>
                       <div class="layui-input-block">
                           <input type="text" name="menuName" lay-verify="required" autocomplete="off" placeholder="请输入菜单名称" class="layui-input">
                       </div>
                   </div>

                   <div class="layui-form-item">
                       <label class="layui-form-label">菜单地址</label>
                       <div class="layui-input-block">
                           <input type="text" name="dataUrl" autocomplete="off" placeholder="请输入菜单地址" class="layui-input">
                       </div>
                   </div>
                   
                   		<div class="layui-form-item">
		                       <label class="layui-form-label">图标</label>
		                       <div class="layui-input-block">
		                           <input type="text" id="iconA" name="icon"  autocomplete="off" placeholder="请输入菜单地址" class="layui-input">
		                       </div>
		                   </div>

                   <div class="layui-form-item">
                       <label class="layui-form-label">排序</label>
                       <div class="layui-input-block">
                           <input type="number" name="sort" lay-verify="required" autocomplete="off" placeholder="请输入排序编号" class="layui-input" value="${pojo.roleName}">
                       </div>
                   </div>


                   <div class="layui-form-item">
                       <div class="layui-input-block" style="text-align: center;">
                      	 <input type="hidden" name="menuLevel" id="menuLevel">
                           <input type="hidden" id="menu-hide-name">
                           <input type="hidden"  id="menu-hide-pid" name="parentMenucode">
                           <button class="layui-btn" lay-submit="" lay-filter="menu-add">立即提交</button>
                       </div>
                   </div>
               </form>
           </div>
       </div>
   </div>

   <script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
   <script>
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

           //自定义验证规则
           form.verify({
               categroy: function(value){
                   if(value.length < 5){
                       return '标题至少得5个字符啊';
                   }
               }
           });
           //监听提交
           form.on('submit(menu-add)', function(data){
               var url = '${ctx}/main/menu/save.do';
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
           
           form.on('submit(menu-edit)', function(data){
               var url = '${ctx}/main/menu/save.do';
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
   </script>

</body>
</html>