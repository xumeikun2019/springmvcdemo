<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1">
  <title>考试信息填写</title>

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/png" href="assets/i/favicon.png">

  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">

  <link rel="stylesheet" href="${ctx}/statics/plugins/amazeui/css/amazeui.min.css">
  <link rel="stylesheet" href="${ctx}/statics/plugins/amazeui/css/app.css">
      <link rel="stylesheet" href="${ctx}/statics/plugins/layui/css/layui.css" />
  <style type="text/css">
    html,body{
       height: 100%;
    }
  
     [class*=am-u-] {
        padding-left: 0;
        padding-right: 0;
     }
	
  </style>
</head>
<body>
    <div class="am-g">
      <div class="am-u-sm-12">
        <div class="am-panel am-panel-secondary">
            <div class="am-panel-hd">考试信息填写</div>
              <div class="am-panel-bd">
<form id="myform" class="am-form am-form-horizontal">
      <div class="layui-form-item">
         <label class="layui-form-label">姓名<span style="color: red">*</span></label>
         <div class="layui-input-block">
             <input type="text" name="realname" id="realname" lay-verify="required"  autocomplete="off"  class="layui-input">
         </div>
   		</div>
   		      <div class="layui-form-item">
         <label class="layui-form-label">身份证<span style="color: red">*</span></label>
         <div class="layui-input-block">
             <input type="text" name="idcard" id="idcard" lay-verify="required"   autocomplete="off"  class="layui-input">
         </div>
   		</div>
   		      <div class="layui-form-item">
         <label class="layui-form-label">手机号<span style="color: red">*</span></label>
         <div class="layui-input-block">
             <input type="text" name="phone" id="phone" lay-verify="required"   autocomplete="off"  class="layui-input">
         </div>
   		</div>
   		 

 <input type="hidden" name="examid" id="examid" value="${param.examid}"> 
  <input type="hidden" name="id" id="id" value="${param.id}"> 
 
  <div class="am-form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" lay-filter="save" id="save"  class=" am-btn am-btn-primary am-btn-block cando">开始考试</button>
    </div>
  </div>
</form>
              </div>
		</div>
      </div>
    </div>

    	<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
    <script type="text/javascript">
	layui.use(['form','laydate'], function(){
		var form = layui.form,upload = layui.upload,
	    laydate = layui.laydate;
    	$('#save').click(function(){
   		var url = '${ctx}/web/save.do';
   		//var formDataArr = $('form[id="myform"]').serializeArray();
   		var realname = $("#realname").val();
   		var idcard = $("#idcard").val();
   		var phone = $("#phone").val();
   		var regIdcard = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/; 
   		var regPhone = /^1(3|4|5|6|7|8|9)\d{9}$/;
       
   		if(realname == ''){
	    	 layer.msg('请填写姓名!', {
	             icon: 7
	         });
	    	 return;
   		}
   		
   		if(idcard == ''){
	    	 layer.msg('请填写身份证号!', {
	             icon: 7
	         });
	    	 return;
   		}
   		if(phone == ''){
	    	 layer.msg('请填写正确的手机号', {
	             icon: 7
	         });
	    	 return;
   		}
   		
	   	 if(regIdcard.test(idcard) == false) { 
	         //alert("身份证输入不合法"); 
	         layer.msg('身份证号有误，请重填', {
	             icon: 7
	         });
	         return ; 
	     } 
	   	if(regPhone.test(phone) == false) { 
	        //alert("身份证输入不合法"); 
	        layer.msg('手机号码有误，请重填', {
	            icon: 7
	        });
	        return ; 
	    } 
   		
   		var id = $("#id").val();
   		var examid = $("#examid").val();
   		var uid;
   		
   	    console.log($(this).attr('class').indexOf('cando'));
   		if($(this).attr('class').indexOf('cando')==-1){
	   		 console.log('no');
	   		 return;
   		}else {
   		  $('#save').removeClass('cando');
   		
   			 $.ajax({
                url:url,
                type:'POST',
                async:false,
                dataType:'json',
                data:{'realname':realname,'idcard':idcard,'phone':phone,'examinationId':id},
                success: function (response) {
                    console.log(response);
                    if(response.result == 'ok'){
                        window.location.href='${ctx}/web/exam.do?id='+id+'&exam_id='+examid+'&uid='+response.data+'&uname='+realname+'&idcard='+idcard+'&phone='+phone;
                   }
             } 
        }); 
   		
   		}
   		console.log(id);
   		//console.log(JSON.stringify(formDataArr));
	    
   	  });
    });
    	 
</script>
</body>
</html>