<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>编辑摄像头</title>
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
			<legend>编辑摄像头</legend>
		</fieldset>
		<form class="layui-form layui-form-pane" lay-filter="example" action="">
			<div class="layui-form-item">
				<label class="layui-form-label">设备名称</label>
				<div class="layui-input-block">
					<input type="text" name="cname"  value="${pojo.cname}" autocomplete="off" placeholder="请输入设备名称" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">设备编号<span style="color: red">*</span></label>
				<div class="layui-input-block">
					<input type="text" name="deviceToken" value="${pojo.deviceToken}" autocomplete="off" placeholder="请输入设备编号" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item" >
				<label class="layui-form-label">楼层<span style="color: red">*</span></label>

				<div class="layui-input-inline">
					<select id="select1"  lay-filter="lc"  name = "placeId">
						<option value="" >请选择楼层</option>
					</select>
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">备注</label>
				<div class="layui-input-block">
					<input type="text" name="remark"  value="${pojo.remark}"  autocomplete="off" placeholder="请输入备注内容" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block" style="text-align: center;">
					<input type="hidden" name="id" value="${pojo.id}">
					<button class="layui-btn" lay-submit lay-filter="sub">立即提交</button>
					<button id = "back" type="button" class="layui-btn layui-btn-primary">返回</button>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript">
		
		
		layui.use([ 'form', 'layer' ], function() {
			var form = layui.form;
			var layer = layui.layer;
			//只存楼层数据
			var floor = JSON.parse( '${floor}');
			//楼层id
			var currFloor='${pojo.placeId}';
			//构造下拉框数据
			for(var i = 0;i<floor.length;i++){
				
				if(currFloor==floor[i].id){
					
					$('#select1').append("<option selected='true' value="+floor[i].id+" >" + floor[i].name+ "</option>");
				
				}else{
					
					$('#select1').append("<option value="+floor[i].id+" >" + floor[i].name+ "</option>");

				}
			} 
				
			form.render('select');
			
		 
			
			
			//监听楼层下拉框
			form.on('select(lc)', function(data){
				   
			}); 
			
			
			//监听提交
			form.on('submit(sub)', function(data) {
				var formData = data.field;
//				console.log(formData);
				var url = "${ctx}/main/device/cdeviceBinding.do";
				$.submit.post(data, url, function(json) {
					if (json.result != "ok") {
						layer.msg('json.message', {
							icon : 2
						});
					}
				});
				return false;
			});

		});
		
		$("#back").click(function(){
			tabChange('摄像头');
            tabDelete('编辑摄像头');
		});
	</script>
</body>
</html>