<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>临时卡发放</title>
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
    <link rel="stylesheet"  href="${ctx}/statics/css/eleTree.css" />
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
			<legend>临时卡发放</legend>
		</fieldset>
		<form id="form" class="layui-form layui-form-pane" action="">
           		<div class="layui-form-item">
		               	<label class="layui-form-label">姓名<span style="color: red">*</span></label>
		              	<div class="layui-input-block">
                   			<input type="text" id="name" name="name" class="layui-input" lay-verify="required">
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">证件号码</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="zjhm" name="zjhm" class="layui-input">
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">联系方式</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="lxfs" name="lxfs" class="layui-input">
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">卡号<span style="color: red">*</span></label>
		              	<div class="layui-input-block">
                   			<input type="text" id="kh" name="kh" class="layui-input" lay-verify="required">
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">被访问人<span style="color: red">*</span></label>
		              	<div class="layui-input-block">
                   			<input type="text" id="participants" required="" lay-verify="required" placeholder="--请选择--" readonly="" autocomplete="off" class="layui-input"> 
                      		<input  name="fwr" id="participantsID"  type="hidden"   class="layui-input">     
               			</div>
          		</div>
          		<div class="xtree_contianer" id='userTree'>
	                <div id="xtree2"  ></div>
		           	<div class="div-btns">
			            <input type="button" id="btn3" value="确定" class="layui-btn save-btn" style="margin-left:200px;" />
			            <input type="button" id="btn4" value="关闭" class="layui-btn save-btn" style="margin-left:50px;" />	            
		       		</div>
           		</div>
            	<div id="opt2">
					<table id="tab2">				
					</table>
				</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">访问楼层<span style="color: red">*</span></label>
		              	<div class="layui-input-block">
                   			<input type="text" id="fwlc" class="layui-input" lay-verify="required" disabled="disabled">
                   			<input  name="fwlc" id="fwlcid"  type="hidden"   class="layui-input">     
               			</div>
          		</div>          		
                 <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
               		<input type="hidden" id="idno" name="idno" value="${pojo.id}">
               		<input type="hidden" id="id" name="id">
                   <button class="layui-btn save-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                   <button type="reset" class="layui-btn layui-btn-primary">重置</button>
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

});

layui.use(['form','laydate','eleTree'], function(){
	 var form = layui.form,upload = layui.upload,
    laydate = layui.laydate;
	 $('#userTree').hide(); 
	  //监听提交
      form.on('submit(demo1)', function(data){
          var formData = data.field;
//          console.log(formData);
          var url = '${ctx}/main/TemporaryCard/save.do';
          $.submit.post(data,url,function(){
        	  table.ajax.url("${ctx}/main/TemporaryCard/list.do?id=${pojo.id}").load();
          });
          return false;
      });
      var xtree2 = new layuiXtree({
    	    elem: 'xtree2'                  //(必填) 放置xtree的容器，样式参照 .xtree_contianer
    	    , form: form                    //(必填) layui 的 from
    	    , isopen: false
    	    , data: '${ctx}/main/department/userTree.do'//(必填) 数据接口，需要返回以上结构的json字符串
    	});
	  
      $('#btn3').click(function () {
  	    var oCks = xtree2.GetChecked();
  		var selectDepartment = '' ;
  		var selectDepartmentval = '' ;
  	    for (var i = 0; i < oCks.length; i++) {
  	        //console.log(oCks[i].value);
  	        //console.log(oCks[i].title);
  	        selectDepartment += oCks[i].title + ',';
  	        selectDepartmentval += oCks[i].value + ',';
  	    }
  	    //console.log(selectDepartment);
  	    $('#participants').val(selectDepartment);
  	    $('#participantsID').val(selectDepartmentval);
  		$('#userTree').hide(500);
  	});
  	$('#participants').click(function(){
  		 //$('#userTree').show(500);
  		 openIndex = layer.open({
               type: 2,
               title: '被访问人',
               shade: [0.1],
               closeBtn: 1,
               maxmin: true, //开启最大化最小化按钮
               area: ['80%', '80%'],
               content: '${ctx}/main/meeting/participants.shtml',
           }); 
  	});
  	$('#btn4').click(function () {
  		$('#userTree').hide(500);
  		
  	});
});
function participantsChoose (ids,names) {
	 $('#participantsID').val(ids);
	 $('#participants').val(names);
//	 $('#fwlc').val("296e0d39ee4311e9833900e081bbbd32");
	$.post('${ctx}/main/attendanceRecord/findlc.do',{"id":ids},function (json) {
//		console.log(json);
		$('#fwlc').val(json.data[0].name);
		$('#fwlcid').val(json.data[0].id);
	})


}
function close(){
	   layer.close(openIndex);
}

$('#back').click(function () {
	   window.location.href='${ctx}/main/temporaryCard/index.shtml';
});
</script>
</body>
</html>