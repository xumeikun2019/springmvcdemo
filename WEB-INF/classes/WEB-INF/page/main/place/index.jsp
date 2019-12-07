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
</head>
<body style="background: #eee;">
   <div class="admin-main">
       <%--菜单树形结构--%>
       <div style="width: 24%;float: left;">
           <div class="layui-card">
               <div class="layui-card-header">会议室菜�?</div>
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
		                       <label class="layui-form-label">上级节点</label>
		                       <div class="layui-input-block">
		                           <input id="menu" type="text" name="title" autocomplete="off" placeholder="请输入菜单名�?" class="layui-input pMenu2" value="" readonly>
		                            <!-- <div class="eleTree ele5" style="z-index: 9999" lay-filter="data5"></div> -->
		                       </div>
		                   </div>
		
                   <div class="layui-form-item">
                       <label class="layui-form-label">节点名称<span style="color: red">*</span></label>
                       <div class="layui-input-block">
                           <input type="text" id = "name" name="name" lay-verify="required" autocomplete="off" placeholder="请输入菜单名�?" class="layui-input">
                       </div>
                   </div>
                   <div class="layui-form-item">
                       <label class="layui-form-label">排序</label>
                       <div class="layui-input-block">
                           <input type="number" id="sort" name="sort" lay-verify="required" autocomplete="off" placeholder="请输入排序编�?" class="layui-input" >
                       </div>
                   </div>
						<div id = "div" class="layui-form-item" >
			              	<label class="layui-form-label">预约权限部门</label>
			                <div class="layui-input-block">
	 							<input type="text" id="department" required="" lay-verify="" placeholder=" 如设置�?�许可部门�?�，则该部门只能预约此会议室（其他部门都可预�?);如不设置则许可所有部门预�?" readonly="" autocomplete="off" class="layui-input" value=""> 
	                      		<input name='orderDeptId' id="departmentval"  type="hidden"   class="layui-input">                
	 					   	 					   
		 					   <div class="xtree_contianer" id='departmentTree'>
				                	<div id="xtree1"  ></div>
						           	<div class="div-btns">
							            <input type="button" id="btn1" value="确定" class="layui-btn save-btn" style="margin-left:200px;" />
							            <input type="button" id="btn2" value="关闭" class="layui-btn save-btn" style="margin-left:50px;" />	            
						       		</div>
			           		  </div>
		 					   
	 					   	</div>
		 					  
		 					<div class="layui-form-item">
							 	<label class="layui-form-label">是否审核</label>
							    <div class="layui-input-block">
								      <input id = "verify1" type="radio" name="verify" value="T" title="�?" >
								      <input id = "verify2" type="radio" name="verify" value="F" title="�?">
							    </div>
						 	</div>
           				</div>
		           		
		            	<div id="opt1">
							<table id="tab1">				
							</table>
						</div>
						<!-- <div class="layui-form-item">
						 	<label class="layui-form-label">是否审核</label>
						    <div class="layui-input-block">
							      <input id = "verify1" type="radio" name="verify" value="T" title="�?" >
							      <input id = "verify2" type="radio" name="verify" value="F" title="�?">
						    </div>
					 	</div>
					 -->
		                   <div class="layui-form-item">
		                       <div class="layui-input-block" style="text-align: center;">
		                       		<input type="hidden" name="id" id="id">
		                           <input type="hidden" id="menu-hide-name">
		                           <button class="layui-btn" lay-submit="" lay-filter="edit">立即提交</button>
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
                       <label class="layui-form-label">上级节点</label>
                       <div class="layui-input-block">
                           <input id="menu" type="text" name="title" autocomplete="off" placeholder="请输入菜单名�?" class="layui-input pMenu" value="" readonly>
                            <!-- <div class="eleTree ele5" style="z-index: 9999" lay-filter="data5"></div> -->
                       </div>
                   </div>

                   <div class="layui-form-item">
                       <label class="layui-form-label">节点名称<span style="color: red">*</span></label>
                       <div class="layui-input-block">
                           <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入菜单名�?" class="layui-input">
                       </div>
                   </div>
                   <div class="layui-form-item">
                       <label class="layui-form-label">排序</label>
                       <div class="layui-input-block">
                           <input type="number" name="sort" lay-verify="required" autocomplete="off" placeholder="请输入排序编�?" class="layui-input" value="${pojo.roleName}">
                       </div>
                   </div>


                   <div class="layui-form-item">
                       <div class="layui-input-block" style="text-align: center;">
                      	 <input type="hidden" name="level" id="menuLevel">
                           <input type="hidden" id="menu-hide-name">
                           <input type="hidden" id="dlevel">
                           <input type="hidden"  id="menu-hide-pid" name="parentId">
                           <button class="layui-btn" lay-submit="" lay-filter="add">立即提交</button>
                       </div>
                   </div>
               </form>
           </div>
       </div>
   </div>

   <script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
   <script type="text/javascript" src="${ctx}/statics/js/layui-xtree.js"></script>
   <script>
   var initfun;
       layui.use(['form','jquery'], function(){
           var form = layui.form
               ,layer = layui.layer,
               eleTree = layui.eleTree,
               $ = layui.jquery;
           $('#departmentTree').hide(); 

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
               var url = '${ctx}/main/place/save.do';
               $.submit.post(data,url,function (data) {
                   var result = data.result;
                   if (result == 'ok') {
/*                        var tree = $.fn.zTree.getZTreeObj("treeDemo");
                       console.log(tree);
                       tree.refresh(); */
                       layer.close(container);
                       initfun();
                   }
               });
               return false;
           });
           
           form.on('submit(edit)', function(data){
               var url = '${ctx}/main/place/save.do';
               $.submit.post(data,url,function (data) {
                   var result = data.result;
                   if (result == 'ok') {
                       //var tree = $.fn.zTree.getZTreeObj("treeDemo");
                       //console.log(tree);
                       //layer.closeAll();
                       //tree.refresh();
                       initfun();
                   }
               });
               return false;
           });
           
           
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

                   	//给节点额外增加属性来控制“重命名”�?��?�删除�?�图标的显示或隐�?

                   	showRenameBtn:showRenameBtn,
                   	showRemoveBtn:showRemoveBtn,
                   	removeTitle: "删除"
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
               	//获取节点�?配置的noRemoveBtn属�?��??
               		return true;
               	}
               initfun = function init() {
                   var url = '${ctx}/main/place/tree.do';
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

               //	initfun();
               initfun();

                   $('#add').on('click',function () {
                       var level = $('#menuLevel').val();
                       if(level ==0){
                    	   layer.msg('请先选择部门!', {
                               icon: 2
                           },function (){
                           }); 
                       }else if(level > 3){
                           layer.msg('无法继续向下添加!', {
                               icon: 2
                           },function (){
                           });
                       }else{
                       	
                   var	pNodeId	= $("#menu-hide-pid").val();
                   var zlevel = $("#menuLevel").val();
                   var pNodeName = $("#menu-hide-name").val();
                   var dlevel = $("#dlevel").val();
                   container = layer.open({
                           type: 2,
                           title: '菜单添加',
                           shade: [0.1],
                           maxmin: true, //�?启最大化�?小化按钮
                           area: ['80%', '80%'],
                           content: '${ctx}/main/place/add.shtml?pNodeName='+pNodeName+'&pNodeId='+pNodeId+'&zlevel='+zlevel+'&dlevel='+dlevel+''
                       });

                       var mname = $('#menu-hide-name').val();
                       $('.pMenu').val(mname);
                       }
                       
                   });
                   
               });

               var placeID = '';
               
               function onClick(event, treeId, treeNode, clickFlag) {
                   var id = treeNode.id;
                   var name = treeNode.name;
                   var pNode = treeNode.getParentNode();
                   var level = treeNode.level;
                   if(level <2){
                	   $("#div").hide();
                   }else{
                	   $("#div").show();
                   }
    //               debugger;
                   $("#dlevel").val(level);
                   if(pNode != null){
                   	var pname = pNode.name;
                       $('.pMenu').val(pname);
                       $('.pMenu2').val(pname);
                   }
                   $('#menu-hide-name').val(name);
                   $('#menu-hide-pid').val(id);
                   placeID = id;
           
                   var path = treeNode.getPath().length; // 获取当前节点 的层级数
//                   console.log(event);
                   $('#menuLevel').val(path+1);
                   var index = treeNode.getIndex(); //  获取同级�? 第几�?
                   //alert(index);
                   //alert(path);
                  var url = '${ctx}/main/place/eshow.do';  
               	  var param = {
               			  'id':id
               		  };
                		  $.post(url,param,function (data) {
               			   var result = data.data;
               			   $('#id').val(result.id);
               			   $('#name').val(result.name);
               			   $('#sort').val(result.sort);
               			   $("#department").val(result.orderDeptId);
               			   var verify = result.verify;
               			   if(verify == "T"){
               				   $(":radio[name='verify'][value='T']").prop('checked','true');
               				 //  debugger;
               			   }else{
               				   $(":radio[name='verify'][value='F']").prop('checked','true');
               			   }
               			   
               			  form.render('radio'); //更新全部
               	      },'json'); 
                		  
                			
                		var xtree1 = new layuiXtree({
                		    elem: 'xtree1'                  //(必填) 放置xtree的容器，样式参照 .xtree_contianer
                		    , form: form                    //(必填) layui �? from
                		    , isopen: false
                		    , data: '${ctx}/main/department/listTree.do?placeID='+placeID+''//(必填) 数据接口，需要返回以上结构的json字符�?
                		});
               }


               function beforeRemove(treeId, treeNode) {
                   	 layer.confirm('确定要删除所选的菜单吗？',{
                   			  cancel: function(index, layero){
                   				  initfun();
                   			  }
                   		 } ,function(){
                   		 
                            	if(treeNode.isParent){
                            	    //判断后做操作
                            	    layer.msg('该节点下有子菜单,请先删除子菜�?!', {
       		                        icon: 2
       		                    });
                            	    initfun();
                            		return false;
                            	}
                                   var id = treeNode.id;
                                   var url = '${ctx}/main/place/del.do';  
                              	  	var param = {
                              			  'id':id
                              		  };
                              		  $.post(url,param,function (data) {
                                           var result = data.result;
                                           if (result == 'ok') {
                                                layer.msg('操作成功!', {
       						                        icon: 1
       						                    },function (){
       					                        	initfun();
       					                        	$(":input").val('');
       					                        });
                                               
                                           }else if(result == 'notuser'){
                                               layer.msg('该部门节点下,有用�?!请先删除用户!', {
       					                        icon: 2
       					                    },function (){
       				                        	initfun();
       				                        });
                                           }
                                           
                              	      },'json'); 
                   	 },function(){
                   		 initfun();
                   	 });
               }
           
           
           
           form.on('radio', function(data){
        	   //alert(data.value)
        	   //console.log(data.elem); //得到radio原始DOM对象
        	   //console.log(data.value); //被点击的radio的value�?
        	 }); 
           
           // debugger;
            
			//构�?�树对象
			var xtree1 = new layuiXtree({
	    	    elem: 'xtree1'                  //(必填) 放置xtree的容器，样式参照 .xtree_contianer
	    	    , form: form                    //(必填) layui �? from
	    	    , isopen: false
	    	    , data: '${ctx}/main/department/listTree.do'//(必填) 数据接口，需要返回以上结构的json字符�?
	    	});
			
			
			$('#btn1').click(function () {
	    	    var oCks = xtree1.GetChecked();
	    		var selectDepartment = '' ;
	    		var selectDepartmentval = '' ;
	    	    for (var i = 0; i < oCks.length; i++) {
	    	        //console.log(oCks[i].value);
	    	        //console.log(oCks[i].title);
	    	        selectDepartment += oCks[i].title + ',';
	    	        selectDepartmentval += oCks[i].value + ',';
	    	    }
	    	    //console.log(selectDepartment);
	    	    $('#department').val(selectDepartment);
	    	    $('#departmentval').val(selectDepartmentval);
	    		$('#departmentTree').hide(500);
	    	});
	    	$('#department').focus(function(){
	    		 $('#departmentTree').show(500);
	    	});
	    	$('#btn2').click(function () {
	    		$('#departmentTree').hide(500);
	    		
	    	});

       });
   </script>

</body>
</html>