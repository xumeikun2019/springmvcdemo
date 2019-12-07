<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>摄像头视频查看</title>
	<%@ include file="/common/taglibs.jsp"%>
    <%@ include file="/common/table.jsp"%>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<!-- <meta name="apple-mobile-web-app-status-bar-style" content="black"> -->
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="${ctx}/statics/js/jquery.table.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.form.min.js"></script>
     <link rel="stylesheet"  href="${ctx}/statics/plugins/layui/css/layui.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
</head>
<body>
	<div class="layui-tab">
		<ul class="layui-tab-title">
		    <li class="layui-this">实时</li>
		    <li>回放</li>
		</ul>
		<div class="layui-tab-content">
			<div class="layui-tab-item layui-show">
					<iframe name="videoFrame" src="${ctx}/main/place/jk/sxtURL.do?cameraIndexCode=373668a66d90456586e4291f81cbd9f7&onlyZb=true"
	 				style="width:100%;height:100%" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
			</div>
			<div class="layui-tab-item">				
				<table >
					<tr id="firstTr">
						<td><input type="datetime-local" id="beginTime"/>至<input type="datetime-local" id="endTime"/><button onclick="huifang()">回放</button></td>
						<td><button style="color:red;font-weight:bold;display:none" id="err">请填全年月日时分，前后相差3日之内！</button></td>
						<td align="right"><button onclick="window.parent.closeVideo()">关闭</button></td>
					</tr>
				</table>  
				<video id="video" style="width:100%;height:95%"></video>  	
			</div>		
		</div>
	</div>  

<script type="text/javascript" src="${ctx}/statics/js/jiankong/jquery-1.12.4.min.js"></script>
<script src="${ctx}/statics/js/jiankong/jsencrypt.min.js"></script>
<script src="${ctx}/statics/js/jiankong/jsWebControl-1.0.0.min.js"></script>
<script src="${ctx}/statics/js/jiankong/hls.min.js"></script>
<script type="text/javascript">

</script>
</body>
</html>