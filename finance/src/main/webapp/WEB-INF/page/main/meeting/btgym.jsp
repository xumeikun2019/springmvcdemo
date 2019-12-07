<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会议室预约审批</title>
	<%@ include file="/common/taglibs.jsp"%>
    <%@ include file="/common/table.jsp"%>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet"  href="${ctx}/statics/plugins/layui/css/layui.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
    <link href="${ctx}/statics/plugins/umeditor/themes/default/_css/umeditor.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet"  href="${ctx}/statics/css/eleTree.css" />
    <link rel="stylesheet" href="${ctx}/statics/plugins/page-select/css/cyType.css" />
	<link rel="stylesheet" href="${ctx}/statics/plugins/page-select/css/cyStyle.css" />
	<link rel="stylesheet" href="${ctx}/statics/plugins/page-select/css/font-awesome.min.css" />
	
    <script type="text/javascript" src="${ctx}/statics/plugins/umeditor/third-party/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/plugins/umeditor/third-party/template.min.js"></script>
    
    <script type="text/javascript" charset="utf-8" src="${ctx}/statics/plugins/umeditor/umeditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/statics/plugins/umeditor/editor_api.js"></script>
    <script type="text/javascript" src="${ctx}/statics/plugins/umeditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style type="text/css">
    .layui-form-pane .layui-form-label{
      width:100px;
    }
	.layui-form-pane .layui-input-block{
		margin-left: 100px
	}
</style>
<body>

<div class="container">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>会议室预约审批不通过原因</legend>
		</fieldset>
		<form id="form" class="layui-form layui-form-pane" action="">
    		<div class="layui-form-item">
		               	<label class="layui-form-label">审核原因</label>
		              	<div class="layui-input-block">
                   			<textarea class="layui-textarea" name="remark" id="remark"></textarea>
               			</div>
          		</div>
                 <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
               		<input type="hidden" id="meetingId" name="meetingId"  value="${meetingid}">
               		<input type="hidden" id="userId" name="userId"  value="${user.id}">
               		<input type="hidden" id="state" name="state"  value="F">
                   <button id="tj" class="layui-btn save-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                   <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                   <button type="button" class="layui-btn layui-btn-primary" id="back">返回</button> -->
                   <input type="hidden" lay-verify="croomtea">
               </div>
           </div>
		</form>
	</div>
		<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/ckplayer.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/layui-xtree.js"></script>
   <script type="text/javascript" src="${ctx}/statics/plugins/page-select/js/utils.js"></script>
   <script type="text/javascript" src="${ctx}/statics/plugins/page-select/js/selectPageTool.js"></script>
<script type="text/javascript">

$(function(){
//	console.log("${user}");
});
layui.use(['form', 'layedit','eleTree','laydate','upload'], function(){
	var form = layui.form
    ,layer = layui.layer
    ,layedit = layui.layedit
    ,laydate = layui.laydate
  //审批不通过
    form.on('submit(demo1)', function(data){
        var formData = data.field;
        var url = '${ctx}/main/meetingOrder/spbtg.do';
        $.submit.post(data,url,function(json){
      	  if(json.result!="ok"){
//      		 layer.close(openIndex);
//      		table.ajax.url("${ctx}/main/meetingOrder/list.do?id=${pojo.id}").load();
      		window.location.href='${ctx}/main/meeting/reservationApproval.shtml';
      	  }else{
      			top.location.reload();
//      		window.location.href='${ctx}/main/meeting/reservationApproval.shtml';
//      		layer.close(openIndex);
      	  }       	  
        });
        return false;
    });
})
</script>
</body>
</html>