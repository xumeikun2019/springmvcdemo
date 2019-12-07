<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会议室预�?</title>
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
	     <link rel="stylesheet" href="${ctx}/statics/css/style.upload.css" />
	
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
		<form id="form" class="layui-form layui-form-pane" style="margin-top:15px;" action="">
                <div class="layui-form-item">
		               <label class="layui-form-label">预约部门</label>
		               <div class="layui-input-block">
 							<input type="text" id="department" required="" lay-verify="required" placeholder="--请�?�择--" readonly="" autocomplete="off" class="layui-input" disabled="disabled"> 
                      		<input name='orderDeptId' id="departmentval"  type="hidden"   class="layui-input" >                
 					   </div>
           		</div>
           		<div class="xtree_contianer" id='departmentTree'>
	                <div id="xtree1"  ></div>
		           	<div class="div-btns">
			            <input type="button" id="btn1" value="确定" class="layui-btn save-btn" style="margin-left:200px;" />
			            <input type="button" id="btn2" value="关闭" class="layui-btn save-btn" style="margin-left:50px;" />	            
		       		</div>
           		</div>
            	<div id="opt1">
					<table id="tab1">				
					</table>
				</div>
           		<div class="layui-form-item">
		               	<label class="layui-form-label">预约�?</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="orderUserId" name="orderUserId" class="layui-input" value="${user.realname}" disabled="disabled">          
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">预约人联系方�?</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="orderUserLxfs" name="orderUserLxfs" class="layui-input">          
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">主持�?</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="orderZcrId" name="orderZcrId" class="layui-input">          
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">预计参会人数</label>
		              	<div class="layui-input-block">
                   			<input type="number" id="orderRs" name="orderRs" class="layui-input" lay-verify="number">          
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">会议资料</label>
		              	<div class="layui-input-block">
		  					<a class="layui-btn" id="btn">上传会议资料</a> �?�?200m(txt,ppt,docx,pdf)
							<ul id="ul_pics" class="ul_pics clearfix"></ul>
						</div> 
          		</div>
          		
          		<div class="layui-form-item">
		               	<label class="layui-form-label">预约地点</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="orderPlace" name="orderPlace"  readonly="readonly" value="${param.name}" class="layui-input"> 
                      		<input name='orderPlaceId' id="orderPlaceId"  type="hidden" value="${param.meetingRoomId}"  class="layui-input">     
               			</div>
          		</div>
          		<div class="xtree_contianer" id='placeTree'>
	                <div id="xtree3"  ></div>
		           	<div class="div-btns">
			            <input type="button" id="btn5" value="确定" class="layui-btn save-btn" style="margin-left:200px;" />
			            <input type="button" id="btn6" value="关闭" class="layui-btn save-btn" style="margin-left:50px;" />	            
		       		</div>
           		</div>
            	<div id="opt3">
					<table id="tab3">				
					</table>
				</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">会议名称</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="meetingName" name="meetingName" class="layui-input">
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">参会领导</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="ld" required="" lay-verify="required" placeholder="--请�?�择--" readonly="" autocomplete="off" class="layui-input"> 
                      		<input name="orderLduserId" id="ldID"  type="hidden"   class="layui-input">     
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">参会部门</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="participants" name="userId" required="" lay-verify="required" placeholder="--请�?�择--" readonly="" autocomplete="off" class="layui-input"> 
                      		<input name='state' id="participantsID"  type="hidden"   class="layui-input">     
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
		               	<label class="layui-form-label">会议时间�?</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="time_start" name="timeStart" class="layui-input" value="${param.day} ${param.startTime}:00" readonly="readonly">
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">会议时间�?</label>
		              	<div class="layui-input-block">
                   			<input type="text" id="time_end" name="timeEnd" class="layui-input" value="${param.day} ${param.endTime}:00" readonly="readonly">
               			</div>
          		</div>
          		<div class="layui-form-item">
		               	<label class="layui-form-label">会议提醒时间(分钟)</label>
		              	<div class="layui-input-block">
                   			<input type="number" id="remindTime" name="remindTime" class="layui-input" value="20" lay-verify="number">
               			</div>
          		</div>
          		<!-- <div class="layui-form-item">
		               	<label class="layui-form-label">会议审核类型</label>
		              	<div class="layui-input-block">
                   			<select type="text" id="auditType" name="auditType" class="layui-input">
                   				<option value="auto">自动审核</option>
                   				<option value="manual">手动审核</option>
                   			</select>
               			</div>
          		</div> -->
          		<div class="layui-form-item">
		               	<label class="layui-form-label">备注</label>
		              	<div class="layui-input-block">
                   			<!-- <input type="text" id="remark" name="remark" class="layui-input"> -->
                   			<textarea name="remark"  id="remark" class="layui-textarea" autocomplete="off"></textarea>
               			</div>
          		</div>         		         		
                 <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
                   <input type="hidden" name="auditType" value="${param.verify}">
                   <button class="layui-btn save-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                   <!-- <button type="reset" class="layui-btn layui-btn-primary">重置</button> -->
                   <button id="close" class="layui-btn layui-btn-primary">关闭</button>
                   <!-- <button type="button" class="layui-btn layui-btn-primary" id="back">返回</button> -->
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
      <script type="text/javascript" src="${ctx}/statics/js/plupload.full.min.js"></script>
<script type="text/javascript">

$(function(){
	$.post('${ctx}/main/attendanceRecord/findbm1.do',{"id":"${user.id}"},function (json) {
		$("#department").val(json.data[0].name);
		$("#departmentval").val(json.data[0].id);
	})
});
var openIndex = 0;
layui.use(['form', 'layedit','eleTree','laydate','upload'], function(){
	 var form = layui.form
     ,layer = layui.layer
     ,layedit = layui.layedit
     ,laydate = layui.laydate
     ,upload = layui.upload
	 $('#departmentTree').hide(); 
	 $('#userTree').hide(); 
	 $('#placeTree').hide(); 

    	
//    	$.extend(formData, {video:map});
	  //监听提交
      form.on('submit(demo1)', function(data){
    	  var url="";
   	  	$.each($('#ul_pics li'),function(){
  		    	var originalName = $(this).find("input[id='originalName']").val();
  		    	url = $(this).find("input[id='url']").val();
  		    });
          var formData = data.field;
          $.extend(formData, {hyzl:url});
          var url = '${ctx}/main/meetingOrder/save.do';
          $.submit.post(data,url,function(json){
        	  if(json.result!="ok"){
        		  layer.msg(json.message);
        	  } else {
        		  window.parent.close();
        	  }    	  
//        	  console.log(json);
//        	  table.ajax.url("${ctx}/main/lowsecuritycountry/list.do?id=${pojo.id}").load();
          });
          return false;
      });
	  
      var xtree1 = new layuiXtree({
    	    elem: 'xtree1'                  //(必填) 放置xtree的容器，样式参照 .xtree_contianer
    	    , form: form                    //(必填) layui �? from
    	    , isopen: false
    	    , data: '${ctx}/main/department/listTree.do'//(必填) 数据接口，需要返回以上结构的json字符�?
    	});
      var xtree2 = new layuiXtree({
  	    elem: 'xtree2'                  //(必填) 放置xtree的容器，样式参照 .xtree_contianer
  	    , form: form                    //(必填) layui �? from
  	    , isopen: false
  	    , data: '${ctx}/main/department/userTree.do'//(必填) 数据接口，需要返回以上结构的json字符�?
  	});
      
      var xtree3 = new layuiXtree({
    	    elem: 'xtree3'                  //(必填) 放置xtree的容器，样式参照 .xtree_contianer
    	    , form: form                    //(必填) layui �? from
    	    , isopen: false
    	    , data: '${ctx}/main/department/placeTree.do'//(必填) 数据接口，需要返回以上结构的json字符�?
    	});
      
      $('#btn1').click(function () {
    	    var oCks = xtree1.GetChecked();
    		var selectDepartment = '' ;
    		var selectDepartmentval = '' ;
    	    for (var i = 0; i < oCks.length; i++) {
    	        //console.log(oCks[i].value);
    	        //console.log(oCks[i].title);
    	        selectDepartment += oCks[i].title + ',';
    	        selectDepartmentval += oCks[i].value + ',';
    	    }
    	    //console.log(selectDepartment);
    	    $('#department').val(selectDepartment);
    	    $('#departmentval').val(selectDepartmentval);
    		$('#departmentTree').hide(500);
    	});
    	$('#department').focus(function(){
    		 $('#departmentTree').show(500);
    	});
    	$('#btn2').click(function () {
    		$('#departmentTree').hide(500);
    		
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
                 title: '参会人员',
                 shade: [0.1],
                 closeBtn: 1,
                 maxmin: true, //�?启最大化�?小化按钮
                 area: ['80%', '80%'],
                 content: '${ctx}/main/meeting/participants.shtml?id=ptyg',
             }); 
    	});
    	
    	$('#ld').click(function(){
   		 openIndex = layer.open({
                type: 2,
                title: '参会领导',
                shade: [0.1],
                closeBtn: 1,
                maxmin: true, //�?启最大化�?小化按钮
                area: ['80%', '80%'],
                content: '${ctx}/main/meeting/participants.shtml?id=ld',
            }); 
   	});
    	$('#btn4').click(function () {
    		$('#userTree').hide(500);
    		
    	});
    	
    	$('#btn5').click(function () {
    	    var oCks = xtree3.GetChecked();
    		var selectDepartment = '' ;
    		var selectDepartmentval = '' ;
    	    for (var i = 0; i < oCks.length; i++) {
    	        //console.log(oCks[i].value);
    	        //console.log(oCks[i].title);
    	        selectDepartment += oCks[i].title + ',';
    	        selectDepartmentval += oCks[i].value + ',';
    	    }
    	    //console.log(selectDepartment);
    	    $('#orderPlace').val(selectDepartment);
    	    $('#orderPlaceId').val(selectDepartmentval);
    		$('#placeTree').hide(500);
    	});
    	/*  $('#orderPlace').focus(function(){
    		 $('#placeTree').show(500);
    	});  */
    	$('#btn6').click(function () {
    		$('#placeTree').hide(500);
    		
    	});
    	
    	$('#close').click(function(){
    		window.parent.close();
    	});
});

function participantsChoose (ids,names) {
	 $('#participantsID').val(ids);
	 $('#participants').val(names);
}
function participantsChooseptry (ids,names) {
	 $('#participantsID').val(ids);
	 $('#participants').val(names);
}
function participantsChooseld (ids,names) {
	 $('#ldID').val(ids);
	 $('#ld').val(names);
}


function close(){
	   layer.close(openIndex);
}

$('#back').click(function () {
	   window.location.href='${ctx}/main/lowsecuritycountry/index.shtml';
});

var uploader = new plupload.Uploader({ //创建实例的构造方�?
	runtimes: 'html5,flash,silverlight,html4', //上传插件初始化�?�用那种方式的优先级顺序
	browse_button: 'btn', // 上传按钮 
	url: "${ctx}/upload/common/files.do", //远程上传地址
	/* flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
	silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址 */
	filters: {
		max_file_size: '200mb', //�?大上传文件大小（格式100b, 10kb, 10mb, 1gb�?
		mime_types: [ //允许文件上传类型
			{
				title: "files",
				extensions: "txt,ppt,docx,pdf"
			}
		]
	},
	multi_selection: true, //true:ctrl多文件上�?, false 单文件上�?
	init: {
		FilesAdded: function(up, files) { //文件上传�?
			var li = '';
			plupload.each(files, function(file) { //遍历文件
				li += "<li style='border:0px;' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></li>";
			});
			$("#ul_pics").append(li);
			uploader.start();
			/*
		 	if ($("#ul_pics").children("li").length > 0) {
				 layer.msg('上传文件不超�?1�?!', {
                    icon: 2
                }); 
			} else { 
				var li = '';
				plupload.each(files, function(file) { //遍历文件
					li += "<li style='border:0px;' id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></li>";
				});
				$("#ul_pics").append(li);
				uploader.start();					
			}*/
		},
		UploadProgress: function(up, file) { //上传中，显示进度�?
			var percent = file.percent;
			$("#" + file.id).find('.bar').css({
				"width": percent + "%"
			});
			$("#" + file.id).find(".percent").text(percent + "%");
		},
		FileUploaded: function(up, file, info) { //文件上传成功的时候触�?
			var data = eval("(" + info.response + ")");
		    console.log(data);
		    console.log(file);
		    console.log(info);
			$("#" + file.id).html("<input type='text' id='originalName' value='"+file.name+"' hidden='hidden'/><input type='text' id='url' value='"+data.name+"' hidden='hidden'/><a href='javascript:;'>"+file.name+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button type='button' onclick='del(\""+file.id+"\")' >删除</button>");
		},
		Error: function(up, err) { //上传出错的时候触�?
		   var code = err.code;
		    	layer.msg('上传失败请重新上�?!', {
                    icon: 2
                });
		}
	}
});
uploader.init();
function del(id){
	$("#"+id).remove();
}
</script>
</body>
</html>