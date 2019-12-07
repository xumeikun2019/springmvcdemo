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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx}/statics/css/common.css" />
<link rel="stylesheet" href="${ctx}/statics/css/metroStyle/metroStyle.css" />
<%-- <link rel="stylesheet"  href="${ctx}/statics/css/eleTree.css" /> --%>
<script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.core.min.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.excheck.min.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.exedit.min.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/layui-xtree.js"></script>
</head>
<body style="background: #eee;">
	<div class="admin-main">
		<div class="layui-card">
			<div class="layui-card-body">

				<div class="container">
					<form class="layui-form" style="margin: 10px;">

						<div class="layui-form-item">
							<label class="layui-form-label">上级节点</label>
							<div class="layui-input-block">
								<input id="menu" type="text" name="title" autocomplete="off" placeholder="请输入菜单名�?" class="layui-input pMenu2" value="${param.pNodeName}" readonly>
								<!-- <div class="eleTree ele5" style="z-index: 9999" lay-filter="data5"></div> -->
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label">节点名称<span
								style="color: red">*</span></label>
							<div class="layui-input-block">
								<input type="text" id="name" name="name" lay-verify="required" autocomplete="off" placeholder="请输入菜单名�?" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">排序</label>
							<div class="layui-input-block">
								<input type="number" id="sort" name="sort" lay-verify="required" autocomplete="off" placeholder="请输入排序编�?" class="layui-input">
							</div>
						</div>
						
						<c:if test="${param.dlevel>=1}">
						<div class="layui-form-item" >
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
           				</div>
		           		
		            	<div id="opt1">
							<table id="tab1">				
							</table>
						</div>
						<div class="layui-form-item">
						 	<label class="layui-form-label">是否审核</label>
						    <div class="layui-input-block">
							      <input type="radio" name="verify" value="T" title="�?" checked="">
							      <input type="radio" name="verify" value="F" title="�?">
						    </div>
					 	</div>
						</c:if>
						
						<!-- <div class="layui-form-item">
						 	<label class="layui-form-label">是否审核</label>
						    <div class="layui-input-block">
							      <input type="radio" name="verify" value="T" title="�?" checked="">
							      <input type="radio" name="verify" value="F" title="�?">
						    </div>
					 	</div> -->
						
						<div class="layui-form-item">
							<div class="layui-input-block" style="text-align: center;">
								<!-- <input type="hidden" name="id" id="id"> -->
								<input type="hidden" name="parentId" value ="${param.pNodeId}">
								<input type="hidden" name="level" value="${param.zlevel}">
								<button class="layui-btn" lay-submit="" lay-filter="save">立即提交</button>
								<!-- <button type="reset" id="resetBtn2" class="layui-btn layui-btn-primary">重置</button> -->
							</div>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

	<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
	<script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
	<script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
	<script>
		layui.use([ 'form', 'jquery' ],function() {
							var form = layui.form,
								layer = layui.layer, 
								eleTree = layui.eleTree, 
								$ = layui.jquery;
							$('#departmentTree').hide(); 

							//自定义验证规�?
							form.verify({
								categroy : function(value) {
									if (value.length < 5) {
										return '标题至少�?5个字符啊';
									}
								}
							});
							
							//监听提交
							form.on('submit(save)', function(data) {
								var url = '${ctx}/main/place/save.do';
								$.submit.post(data, url, function(data) {
									var result = data.result;
									if (result == 'ok') {
										//var tree = $.fn.zTree.getZTreeObj("treeDemo");
										//console.log(tree);
										//layer.closeAll();
										//tree.refresh();
										window.location.href="${ctx}/main/place/add.shtml";
										parent.window.initfun();
									}
								});
								return false;
							});
							
							//监听单�?�框
							form.on('radio', function(data){
								 // console.log(data.elem); //得到radio原始DOM对象
								 // console.log(data.value); //被点击的radio的value�?
								});  
							
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