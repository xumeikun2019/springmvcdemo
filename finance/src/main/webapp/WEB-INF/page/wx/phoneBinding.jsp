<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title></title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet" href="${ctx}/statics/plugins/layui/css/layui.css" />
	<link rel="stylesheet" href="${ctx}/statics/css/common.css" />
	<link rel="stylesheet" href="${ctx}/statics/css/style.upload.css" />
<style>
#iphone {
    width: 98%;
    height: 90%;
    margin: auto;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
}

.layui-form-pane .layui-input-block{
	margin-left: 0
}
</style>
</head>
<body bgcolor="#015cb7">
	<div id="iphone" >
		<form id="form" class="layui-form layui-form-pane" action="">
           
            <div class="layui-form-item">
               <div class="layui-input-block">
                   <input type="text" name="phone" id="phone" lay-verify="required|phone|number" maxlength="11" autocomplete="off" placeholder="请输入手机号码" class="layui-input">
               </div>
           </div> 
           <div class="layui-form-item">
               <div class="layui-input-block">
                   <input type="text" name="phone2" id="phone2" lay-verify="required|phone|number" maxlength="11" autocomplete="off" placeholder="再次确认" class="layui-input">
               </div>
           </div> 

           <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
                   <button class="layui-btn save-btn" style="width: 100%" lay-submit="" lay-filter="submit_btn">确认绑定</button>
               </div>
           </div>
		</form>
	</div>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/createtab.js"></script>
<script type="text/javascript">
layui.use(['layer', 'form'], function(){
	  var layer = layui.layer
	  ,form = layui.form;

      form.on('submit(submit_btn)', function(data){
    	  var url = '${ctx}/wx/wxchat/phoneBinding.do';
		  var phone = $('#phone').val();
		  var phone2 = $('#phone2').val();
		  var param = {
				  'phone':phone,
				  'openId':'${openId}'
			  };
		  if(phone != phone2){
			  layer.msg('两次输入的电话不一致!');
			  return false;
		  }else{
			  $.post(url,param,function (res) {
				  var result = res.result;
				  if(result == 'ok'){
					  layer.msg('操作成功!');
					  $('#phone').val('');
					  $('#phone2').val('');
					  return false; 
				  }
					  layer.msg('未查到该电话号码!');
					  return false; 
				  
		      },'json');
			  return false; 
		  }
		  return false; 
      });
	});  


    
</script>
</body>
</html>