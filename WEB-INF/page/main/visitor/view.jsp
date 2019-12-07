<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>访客预约查看</title>
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
      width:200px;
    }
	.layui-form-pane .layui-input-block{
		margin-left: 200px
	}
</style>
<body>

<div class="container">
		<fieldset class="layui-elem-field layui-field-title"
			style="margin-top: 50px;">
			<legend>访客预约查看</legend>
		</fieldset>
		
				<div class="layui-form-item">
		               	<label class="layui-form-label">来访事由</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="remark" name="remark" class="layui-input" value="${list[0].matter}" disabled="disabled">
               			</div>
          		</div>  
          		<div class="layui-form-item">
		               	<label class="layui-form-label">提交时间</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="addTime" name="addTime" class="layui-input" value="${list[0].add_time}" disabled="disabled">
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">审核时间</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="addTime" name="addTime" class="layui-input" value="${list[0].last_time}" disabled="disabled">
               			</div>
          		</div>
          		<div id="personnel" >
          			<c:forEach items="${list}" var="lists" varStatus="status">
	          			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
							<legend>来访人员${status.index + 1}</legend>
						</fieldset>
						<div class="layui-form-item">
			               	<label class="layui-form-label">来访人姓名</label>
			              	<div class="layui-input-block">
	                   			<input type="text" id="user_name" name="user_name" class="layui-input" value="${lists.user_name}" disabled="disabled">
	               			</div>
	          			</div>
	          			<div class="layui-form-item">
			               	<label class="layui-form-label">来访人身份证号</label>
			              	<div class="layui-input-block">
	                   			<input type="text" id="user_card" name="user_card" class="layui-input" value="${lists.user_card}" disabled="disabled">
	               			</div>
	          			</div>
	          			<div class="layui-form-item">
			               	<label class="layui-form-label">来访人联系电话</label>
			              	<div class="layui-input-block">
	                   			<input type="text" id="lxdh" name="lxdh" class="layui-input" value="${lists.vname}" disabled="disabled">
	               			</div>
	          			</div>
	          			<div class="layui-form-item">
			               	<label class="layui-form-label">来访人照片</label>
			              	<div class="layui-input-block">
	                   			<!-- <input type="text" id="img" name="img" class="layui-input" value="${lists.img}" disabled="disabled"> -->
	                   			<ul id="fj" class="ul_pics clearfix">
										<li>
									       <div class="img"><img id="${lists.img}" src="http://localhost:8080/${lists.img}" style="width: 10%;height: 10%"></div>
									    </li>								
								</ul>
	               			</div>
	          			</div>
          			</c:forEach>

				</div>        		        		         		
                 <div class="layui-form-item">
                 <form id="form" class="layui-form layui-form-pane" action="">
               <div class="layui-input-block" style="text-align: center;">
               		<input type="hidden" id="id" name="id"  value="${list[0].id}">
                    <!-- <button class="layui-btn save-btn" lay-submit="" lay-filter="demo1" id="tg">通过</button>
                   <button class="layui-btn save-btn" lay-submit="" lay-filter="demo2" id="btg">不通过</button> -->
                   <button type="button" class="layui-btn layui-btn-primary" id="back">返回</button>
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
	 laydate.render({
			elem : '#addTime',
			format : 'yyyy-MM-dd HH:mm:ss',
			type: 'datetime'
		});
	  //审批通过
      form.on('submit(demo1)', function(data){
          var formData = data.field;
          var url = '${ctx}/main/visitor/sptg.do';
          $.submit.post(data,url,function(json){
        	  if(json.result!="ok"){
//        		  layer.msg(json.message);
        	  }else{
        		  layer.confirm('审批成功！', function(){
        			  window.location.href='${ctx}/main/visitor/approvalList.shtml';
        		  }, function(index, layero){  
        			  window.location.href='${ctx}/main/visitor/approvalList.shtml';
				  })
        	  }       	  
          });
          return false;
      });      
    //审批不通过
      form.on('submit(demo2)', function(data){
          var formData = data.field;
          var url = '${ctx}/main/visitor/spbtg.do';
          $.submit.post(data,url,function(json){
        	  if(json.result!="ok"){
//        		  layer.msg(json.message);
        	  }else{
        		  layer.confirm('审批成功！', function(){
        			  window.location.href='${ctx}/main/visitor/approvalList.shtml';
        		  }, function(index, layero){  
        			  window.location.href='${ctx}/main/visitor/approvalList.shtml';
				  })
        	  }       	  
          });
          return false;
      });      
	       
});


$('#back').click(function () {
	window.location.href='${ctx}/main/visitor/visitorStatistics.shtml';
//	   window.location.href='${ctx}/main/visitor/approvalList.shtml';
});
function uploadExcel(){
	layer.open({
		  type: 2,
		  area: ['700px', '450px'],
		  fixed: false, //不固定
		  maxmin: false,
		  content: '${ctx}/main/meetingOrder/btgym.do?id='+"${pojo.id}"
		}); 
}
</script>
</body>
</html>