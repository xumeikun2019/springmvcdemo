<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>添加平板</title>
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
	<div class="container">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 30px;">
			<legend>添加平板</legend>
		</fieldset>
		<form class="layui-form layui-form-pane" lay-filter="example" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">设备名称</label>
				<div class="layui-input-block">
					<input type="text" name="cname" autocomplete="off" placeholder="请输入设备名�?" class="layui-input">
				</div>
			</div>
			<!-- <div class="layui-form-item">
				<label class="layui-form-label">Mac地址<span style="color: red">*</span></label>
				<div class="layui-input-block">
					<input type="text" name="mac" lay-verify="required" autocomplete="off" placeholder="请输入Mac地址" class="layui-input">
				</div>
			</div> -->
			<div class="layui-form-item">
				<label class="layui-form-label">ip地址<span style="color: red">*</span></label>
				<div class="layui-input-block">
					<input id="ip" type="text" name="ip"  lay-verify="required" autocomplete="off" placeholder="请输入ip地址" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" >
				<label class="layui-form-label">会议室名�?<span style="color: red">*</span></label>

				<div class="layui-input-inline">
					<select id="select1"  lay-filter="lc" >
						<option value="" >请�?�择楼层</option>
					</select>
				</div>

				<div class="layui-input-inline" >
					<select class="layui-input" id="select2"  name="placeId" lay-verify="required">
						<option value="" >请�?�择会议�?</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">备注</label>
				<div class="layui-input-block">
					<input type="text" name="remark" autocomplete="off" placeholder="请输入备注内�?" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block" style="text-align: center;">
					<button class="layui-btn" lay-submit lay-filter="sub">立即提交</button>
					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
					<button type="button" class="layui-btn layui-btn-primary" onclick="back()">返回</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		
		
		layui.use([ 'form', 'layer' ], function() {
			var form = layui.form;
			var layer = layui.layer;

			//选择楼层
			var url = '${ctx}/app/plance/findByParam.do?level=2&token=123';
			$.post(url, function(data) {
				$.each(data.list, function(i, item) {
//					console.log(item.id);
//					console.log(item.name);
					$('#select1').append("<option value="+item.id+" >" + item.name+ "</option>");
				});
				
				form.render('select');
			}, 'json');
			
			
			//监听楼层下拉�?
			form.on('select(lc)', function(data){
				var url = "${ctx}/app/plance/findByParam.do?parentId="+data.value+"&token=123";
				//清除之前的下拉�?�项
				$("option[name='option']").html('');
				//渲染会议室下拉框
				$.post(url, function(data) {
					$.each(data.list, function(i, item) {
						$('#select2').append("<option name='option' value="+item.id+" >" + item.name+ "</option>");
					});
					form.render('select');
				}, 'json');
				   
			}); 
			
			
			//监听提交
			form.on('submit(sub)', function(data) {
				var formData = data.field;
//				console.log(formData);
				var url = "${ctx}/main/device/webBinding.do";
				$.submit.post(data, url, function(json) {
					if (json.result != "ok") {
						layer.msg(json.message, {
							icon : 2
						});
					}
				});
				return false;
			});

			$("#ip").focusout(function() {
				var ip = $("#ip").val();
				var param = {"ip":ip};
				var url = '${ctx}/main/device/ajax.do'
				$.post(url,param,function(data){
					if (data.result == "fail") {
						layer.msg(data.message, {
							icon : 2,
							time: 2000
						});
						$("#ip").val('');
					}
				});
				
			});	
			
		});
		
		//返回
		function back(){
	            tabChange('会议室平�?');
	            tabDelete('添加平板');
		}
	</script>
</body>
</html>