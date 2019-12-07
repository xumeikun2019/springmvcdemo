<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会议室预约</title>
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
	
	.div-btns{
	   text-align: center;
	   margin-bottom: 30px;
	}
	.btu{
	 width:48px;
	 height:34px;
	 background:#009688;	
	}
</style>
<body>

<div class="container">
		<form id="form" class="layui-form layui-form-pane" action="">
			<!-- 
			<div class="layui-form-item">
				<div class="layui-input-inline">
				     <input id ="pName" type="text" name="pName" placeholder="请输入姓名" autocomplete="off" class="layui-input">
				</div>
				   
				<button type="button"  id="searchBtn" class="btu"> <font color="#FFFFFF">搜索</font>   
				</button>
			</div> -->
            <div id="xtree2"></div>
		    <div class="div-btns">
				 <input type="button" id="btn3" value="确定" class="layui-btn save-btn" />
				 <input type="button" id="btn4" value="关闭" class="layui-btn save-btn" style="margin-left:50px;" />	            
		     </div>
		</form>
	</div>
		<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/layui-xtree.js"></script>
<script type="text/javascript">

layui.use(['form'], function(){
	var message = getUrlVars()["id"];  
	var url="";
	if("ld"==decodeURI(message)){
		url="${ctx}/main/department/ldTree.do";
	}else if("ptyg"==decodeURI(message)){
//		url="${ctx}/main/department/ptygTree.do";
		url="${ctx}/main/department/listTree.do";
	}else{
		url="${ctx}/main/department/userTree.do";
	}
	 var form = layui.form;
      var xtree2 = new layuiXtree({
  	    elem: 'xtree2'                  //(必填) 放置xtree的容器，样式参照 .xtree_contianer
  	    , form: form                    //(必填) layui 的 from
  	    , isopen: true,
  	    data: url//(必填) 数据接口，需要返回以上结构的json字符串
  	});

    	$('#btn3').click(function () {
    	    var oCks = xtree2.GetChecked();
    		var selectDepartment = '' ;
    		var selectDepartmentval = '' ;
    	    for (var i = 0; i < oCks.length; i++) {
    	        selectDepartment += oCks[i].title + ',';
    	        selectDepartmentval += oCks[i].value + ',';
    	    }
    	    if("ld"==decodeURI(message)){
    	    	 window.parent.participantsChooseld(selectDepartmentval,selectDepartment);
    	    }else if("ptyg"==decodeURI(message)){
    	    	 window.parent.participantsChooseptry(selectDepartmentval,selectDepartment);
    		}else{
    			 window.parent.participantsChoose(selectDepartmentval,selectDepartment);
    		}
//    	    window.parent.participantsChoose(selectDepartmentval,selectDepartment);
    	    window.parent.close();
    	});
    	
    	
    	$('#btn4').click(function () {
    		window.parent.close();
    	});
    	
    	$('#close').click(function(){
    		window.parent.close();
    	});
    	
    	//普通搜索
        $("#searchBtn").click(function(){
        	var pName = $("#pName").val();
        	var ock = xtree2.GetChecked();
            var selectDepartmentval = '' ;
    	    for (var i = 0; i < ock.length; i++) {
    	    	selectDepartmentval += ock[i].value + ',';
    	    } 
        	var url = '${ctx}/main/department/userTree.do';
        	var data = {'pName':pName,'selectDepartmentval':selectDepartmentval};
        	$.post(url,data ,function(data){
        		var xtree2 = new layuiXtree({
        	  	    elem: 'xtree2'                  //(必填) 放置xtree的容器，样式参照 .xtree_contianer
        	  	    , form: form                    //(必填) layui 的 from
        	  	    , isopen: true,
        	  	      data:data//(必填) 数据接口，需要返回以上结构的json字符串
        	  	});
        	 });
        	
        	//debugger;
        });
      
});

function getUrlVars(){  
	   var vars = [], hash;  
	   var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');  
	   for(var i = 0; i < hashes.length; i++){  
	       hash = hashes[i].split('=');  
	       vars.push(hash[0]);  
	       vars[hash[0]] = hash[1];  
	   }  
	   return vars;  
	} 
</script>
</body>
</html>