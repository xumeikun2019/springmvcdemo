<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加</title>
    <%@ include file="/common/taglibs.jsp"%>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet"  href="${ctx}/statics/plugins/layui/css/layui.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
    <link rel="stylesheet"  href="${ctx}/statics/plugins/ueditor/utf8-jsp/themes/default/css/ueditor.css" />
</head>
<body>
   <div class="container">
       <form class="layui-form layui-form-pane" action="">
           <div id="editor"></div>
       </form>
   </div>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>

<script type="text/javascript" src="${ctx}/statics/plugins/ueditor/utf8-jsp/ueditor.config.js"></script>
<script type="text/javascript" src="${ctx}/statics/plugins/ueditor/utf8-jsp/ueditor.all.js"></script>
<script type="text/javascript" src="${ctx}/statics/plugins/ueditor/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
  
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js"></script>
<script>
var ue = UE.getEditor('editor');


    
</script>
 <script type="text/javascript" src="${ctx}/statics/js/common.js"></script> 
</body>
</html>
