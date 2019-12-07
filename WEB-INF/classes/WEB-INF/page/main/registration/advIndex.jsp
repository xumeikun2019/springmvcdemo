<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>广告�?</title>
<%@ include file="/common/taglibs.jsp"%>
<%@ include file="/common/table.jsp"%>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<!-- <meta name="apple-mobile-web-app-status-bar-style" content="black"> -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<script type="text/javascript" src="${ctx}/statics/js/jquery.table.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
<script type="text/javascript"
	src="${ctx}/statics/js/jquery.form.min.js"></script>
<link rel="stylesheet" href="${ctx}/statics/plugins/layui/css/layui.css" />
<link rel="stylesheet" href="${ctx}/statics/css/common.css" />
</head>
<body>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 30px;">
		<legend>广告�?</legend>
	</fieldset>
	<div class="admin-main">
		<!-- 高级搜索区域 -->
		<!--   <div class="page_explain">

            <form class="layui-form" action="">

                <div class="layui-inline">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-inline">
                        <input id="role-name-search" type="text" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <button type="button" class="layui-btn layui-btn-primary layui-btn-small search-button" id="search">搜索</button>

            </form>

        </div> -->
		<!-- 按钮操作 -->
		<div class="table_control">
			<div class="table_opera">
				<button type="button" title="添加"
					class="layui-btn layui-btn-primary "
					onclick='newTab("添加广告�?","","${ctx}/main/registration/advAdd.shtml");'>
					<i class="icon iconfont icon-add-r-o"></i>
				</button>

				<button type="button" title="编辑"
					class="layui-btn layui-btn-primary " onclick='edit()'>
					<i class="icon iconfont icon-edit-o"></i>
				</button>

				<button type="button" title="删除"
					class="layui-btn layui-btn-primary " onclick="del()">
					<i class="icon iconfont icon-delete-o"></i>
				</button>
			</div>
			<!-- 搜索区域操作 -->
			<div class="table_search">
				<input type="text" id="_search" class="keyword"
					placeholder="请在这里输入关键�?" style="height: 25px;">
				<button type="button"
					class="layui-btn layui-btn-primary layui-btn-small" id="searchBtn">
					<i class="layui-icon layui-icon-search"></i>
				</button>
				<!-- <button type="button"
					class="layui-btn layui-btn-primary layui-btn-small" id="searchName">高级搜索</button> -->
			</div>
			
		</div>
		<!--表格区域  -->
		<form id="gridform">
			<table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line">
				<thead>
					<tr>
						<th width="10px"><input type='checkbox'class='btn-checkall fly-checkbox' id='selected-all'></th>
						<th>设备名称</th>
						<th>ip地址</th>
						<th>楼层</th>
						<th>备注</th>
						<th>状�??</th>
						<th>绑定时间</th>
						<th>操作</th>
					</tr>
				</thead>
			</table>
		</form>	
	</div>
	<script type="text/javascript">
		layui.use([ 'form' ], function() {
			var form = layui.form;

		});

		var table;
		$(function() {
			var url = '${ctx}/main/device/list.do?type=adv';
			var columns = [ //定义�?
					{"data" : function(obj) {
						return '<input type="checkbox" name="id" class="fly-checkbox" value=' + obj.id + '>';
					}},
					{data : "cname"},
					{data : "ip"},
					{data : "name"},
					{data : "remark"},
					{data : function(obj) {
							if (obj.state == "T") {
								return "启用"
							} else {
								return "禁用"
							}}},
					{data : "addTime"},
					{data : function(obj){
							if(obj.state == "T"){
								return '<button type="button" class="layui-btn layui-btn-danger layui-btn-sm" onclick="btnT(\''+obj.id+'\')">禁用</button>'
							}else{
								return '<button type="button" class="layui-btn layui-btn-sm" onclick="btnF(\''+obj.id+'\')">启用</button>'
							}	
					}}
					];
			$('#goodsdata').table({
				'url' : url,
				'columns' : columns
			}, function(data) {
				table = data;
			});
			
			//普�?�搜�?
				$("#searchBtn").click(function() {
					searchGoods(table);
				});

				//高级搜索
			/*	$("#searchName").click(function() {
					searchTable(table);
				}) */
			
				
		});
		
		

			//普�?�搜�?
			function searchGoods(table) {
				var seachName = $("#_search").val();
				var searchValue = {
					'seachAttendance' : seachName
				};

				$("#goodsdata").table("search", searchValue);
			}

			//高级搜索
		/*	function searchTable(table) {
				var place_name = $("#place_name").val();
				var orderName = $("#orderName").val();
				var searchkey = {
					'sysName' : orderName,
					'placeName' : place_name

				};

				$("#goodsdata").table('search', searchkey);
			} */
			
			//修改设备
			 function edit() {
			    var size = $("input[name='id']:checked").size();
			    if (size == 0) {
			    	 layer.msg('请�?�择要编辑的数据', {
			             icon: 7
			         });
			    } else if (size == 1) {
			    	 var id = $("input[name='id']:checked").val();
			         newTab("编辑广告�?","","${ctx}/main/device/editAdvCdevice.do?id=" + id);
			    } else if (size > 1) {
			    	 layer.msg('只能选择�?条数据进行编�?', {
			             icon: 7
			         });
			    }
			}
			
			//删除设备
			function del(){
				var ch_goodsId = $("input[name='id']").is("input:checked");
				var id = $("input[name='id']").val();
				var size = $("input[name='id']:checked").size();
				if(ch_goodsId == false){
			        layer.msg('请�?�择要删除的数据!', {
			            icon: 7
			        });
					return false;
				}else if (size > 1) {
					layer.msg('只能删除�?条数�?!', {
			             icon: 7
			         });
				}else if(size == 1){
					layer.confirm('确定要删除所选的数据吗？', function(){
						var options = {
								url:'${ctx}/main/device/del.do',
								type:"post",
								dataType:"json",
								success:function(data){
									if(data.result=='ok'){
					                    layer.msg('删除成功!', {
					                        icon: 1
					                    });
										table.ajax.url("${ctx}/main/device/list.do?type=adv").load();
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
			//禁用启用设备
			function btnT(id) {
				var url = "${ctx}/main/device/editState.do";
				var param = {
						"id":id,
						"state":"F"
						};
				$.post(url,param,function(data){
					if(data.result == 'ok'){
						 layer.msg('修改成功', {
		                        icon: 1,
		                        time:1000
		                    });
						table.ajax.url("${ctx}/main/device/list.do?type=adv").load();
						}else{
							layer.msg('修改失败', {
		                        icon: 2,
		                        time:1000
		                    });
						}
					});
			}
			
			function btnF(id) {
				var url = "${ctx}/main/device/editState.do";
				var param = {
						"id":id,
						"state":"T"
						}
				$.post(url,param,function(data){
					if(data.result == 'ok'){
						 layer.msg('修改成功', {
		                        icon: 1,
		                        time:1000
		                    });
						table.ajax.url("${ctx}/main/device/list.do?type=adv").load();
						}else{
							layer.msg('修改失败', {
		                        icon: 2,
		                        time:1000
		                    });
						}
				});
			}
			
	</script>
</body>
</html>