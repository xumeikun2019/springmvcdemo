<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会议文件保存时间修改</title>
	<%@ include file="/common/taglibs.jsp"%>
    <%@ include file="/common/table.jsp"%>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="${ctx}/statics/js/jquery.table.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.form.min.js"></script>
    <link rel="stylesheet" href="${ctx}/statics/plugins/layui/css/layui.css" />
<link rel="stylesheet" href="${ctx}/statics/css/common.css" />
</head>
<style type="text/css">
    .layui-form-pane .layui-form-label{
      width:200px;
    }
	.layui-form-pane .layui-input-block{
		margin-left: 200px
	}
	.laydate-time-list{padding-bottom:0;overflow:hidden}
    .laydate-time-list>li{width:50%!important;}
    .laydate-time-list>li:last-child { display: none;}
</style>
<body>

<div class="container">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>会议文件保存时间修改</legend>
		</fieldset>
		<form id="form" class="layui-form layui-form-pane" action="">
                <div class="layui-form-item">
		               <label class="layui-form-label">公司名称</label>
		               <div class="layui-input-block">
 							<input id="fgsId" name="fgsId" type="text" autocomplete="off" class="layui-input" lay-filter="dq" value="${parentName}" disabled="disabled"></input>		               
 						</div>
           		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">下班时间</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="date" name="date" class="layui-input" value="${pojo.date}">
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">备注</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="bz" name="bz" class="layui-input" value="${pojo.bz}">
               			</div>
          		</div> 
                 <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
               		<input type="hidden" id="id" name="id" value="${pojo.id}">
               		<input type="hidden" id="fgsId" name="fgsId" value="${parentId}">
                   <button class="layui-btn save-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                   
                   <button type="button" class="layui-btn layui-btn-primary" id="back">返回</button>
                   <input type="hidden" lay-verify="croomtea">
               </div>
           </div>
		</form>
	</div>
<script type="text/javascript">

$(function(){

});

layui.use(['form','laydate'], function(){
	 var form = layui.form,upload = layui.upload,
    laydate = layui.laydate;
	 laydate.render({
			elem : '#timeStart',
			format : 'HH:mm',
			type: 'time'
		});
	 laydate.render({
			elem : '#timeEnd',
			format : 'HH:mm',
			type: 'time'
		});
	 
	  //监听提交
      form.on('submit(demo1)', function(data){
          var formData = data.field;
//          console.log(formData);
          var url = '${ctx}/main/attendanceTime/save.do';
          $.submit.post(data,url,function(){
        	  table.ajax.url("${ctx}/main/attendanceTime/list.do?id=${pojo.id}").load();
          });
          return false;
      });
});
$('#back').click(function () {
	   window.location.href='${ctx}/main/commute/index.shtml';
});
</script>
</body>
</html>