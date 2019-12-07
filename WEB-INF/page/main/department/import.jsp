<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>合同添加</title>
<%@ include file="/common/taglibs.jsp"%>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="${ctx}/statics/plugins/layui/css/layui.css" />
<link rel="stylesheet"  href="${ctx}/statics/css/eleTree.css" />
<link rel="stylesheet" href="${ctx}/statics/plugins/page-select/css/cyType.css" />
<link rel="stylesheet" href="${ctx}/statics/plugins/page-select/css/cyStyle.css" />
<link rel="stylesheet" href="${ctx}/statics/plugins/page-select/css/font-awesome.min.css" />
<link rel="stylesheet" href="${ctx}/statics/css/common.css" />
<link rel="stylesheet" href="${ctx}/statics/css/style.upload.css" />
<style type="text/css">
    .layui-form-pane .layui-form-label{
      width:130px;
    }
	.layui-form-pane .layui-input-block{
		margin-left: 130px
	}
</style>
</head>
<body>
	<div class="container">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>人员导入</legend>
		</fieldset>
		<form id="form" class="layui-form layui-form-pane" action="">
			<div class="layui-form-item">
               <label class="layui-form-label">导入<span style="color: red">*</span></label>
               <div class="layui-input-block">
                <a class="layui-btn" id="btn">人员导入</a> 最大1M，支持xls格式。
				   <ul id="ul_pics" class="ul_pics clearfix">
				   </ul>
               </div>
           </div>
		</form>
	</div>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/jquery.form.min.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/plupload.full.min.js"></script>
   <script type="text/javascript" src="${ctx}/statics/plugins/page-select/js/utils.js"></script>
   <script type="text/javascript" src="${ctx}/statics/plugins/page-select/js/selectPageTool.js"></script>
<script type="text/javascript">
   layui.use(['form','laydate','eleTree','jquery'], function(){
       var form = layui.form,
       upload = layui.upload,
       $ = layui.jquery;
 

	});
   var uploader = new plupload.Uploader({ //创建实例的构造方法
		runtimes: 'html5,flash,silverlight,html4', //上传插件初始化选用那种方式的优先级顺序
		browse_button: 'btn', // 上传按钮 
		url: "${ctx}/upload/common/ryfiles.do", //远程上传地址
		filters: {
			max_file_size: '200mb', //最大上传文件大小（格式100b, 10kb, 10mb, 1gb）
			mime_types: [ //允许文件上传类型
				{
					title: "files",
					extensions: "xls"
				}
			]
		},
		multi_selection: false, //true:ctrl多文件上传, false 单文件上传
		init: {
			FilesAdded: function(up, files) { //文件上传前
			 	if ($("#ul_pics").children("li").length > 0) {
					 layer.msg('请单文件上传!', {
                       icon: 2
                   }); 
					//uploader.destroy();
				} else { 
					var li = '';
					plupload.each(files, function(file) { //遍历文件
						li += "<li style='border:0px;' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></li>";
					});
					$("#ul_pics").append(li);
					uploader.start();
				}
			},
			UploadProgress: function(up, file) { //上传中，显示进度条
				var percent = file.percent;
				$("#" + file.id).find('.bar').css({
					"width": percent + "%"
				});
				$("#" + file.id).find(".percent").text(percent + "%");
			},
			FileUploaded: function(up, file, info) { //文件上传成功的时候触发
				var data = eval("(" + info.response + ")");
				$("#" + file.id).html("<input type='text' id='originalName' value='"+file.name+"' hidden='hidden'/><input type='text' id='url' value='"+data.name+"' hidden='hidden'/><a href='javascript:;'>"+file.name+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ");
				if(data.xx != ""){
					alert("导入失败,用户名："+data.xx+"重复！");
				}else{
			    	layer.msg('导入成功!', {
	                    icon: 1
	                });
				}
				

//		    	parent.location.reload();
//	        	parent.layer.closeAll('iframe');
			},
			Error: function(up, err) { //上传出错的时候触发
			   var code = err.code;
			    	layer.msg('上传失败请重新上传!', {
                       icon: 2
                   });
			}
		}
	});
	uploader.init();

</script>

</body>
</html>
