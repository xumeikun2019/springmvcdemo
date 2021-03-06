<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>打印明细</title>
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
   <div class="admin-main">
        <!-- 按钮操作 -->
        <div class="table_control">
             <!-- 搜索区域操作 -->
            <div class="table_control">
	             <div class="table_search" style="width: auto;">
	            <div class="layui-form">
	            	<div class="layui-inline">
		                    <label class="layui-form-label">打印人员</label>
		                    <div class="layui-input-inline">
		                        <input id="username" type="text" autocomplete="off" class="layui-input" name="username">
		                    </div>
	                </div>
	                <div class="layui-inline">
		                    <label class="layui-form-label">打印机名�?</label>
		                    <div class="layui-input-inline">
		                        <input id="name" type="text" autocomplete="off" class="layui-input" name="name">
		                    </div>
	                </div>
	                <div class="layui-inline">
		                    <label class="layui-form-label">打印时间</label>
		                    <div class="layui-input-inline">
		                        <input id="sj" type="text" autocomplete="off" class="layui-input" name="sj">
		                    </div>
	                </div>
                	<button type="button" class="layui-btn layui-btn-primary" id="searchBtn"><i class="layui-icon layui-icon-search"></i></button>
              </div>
              </div>
            </div>           
    </div>

   
   <!--表格区域  -->
   <form id="gridform">
    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th>打印机名�?</th>
            <th>打印人员</th>
            <th>打印部门</th>
            <th>打印页数</th>
            <th>打印时间</th>
        </tr>
        </thead>
    </table>
   </form>
</div>


<script type="text/javascript">
	layui.use(['form','laydate'], function(){
    var form = layui.form,laydate = layui.laydate;
	 laydate.render({
			elem : '#sj',
			format : 'yyyy-MM-dd'
		});
  
});

var table;
$(function(){
	var url = '${ctx}/main/print/list.do';   
    var columns = [ //定义�?
    	{data: "sbid"},
        {data: "realname"},
        {data: "name"},       
        {data: "dyys"},
        {data: "dysj"}
    ];
//    $('table.layui-table thead tr th:eq(0)').addClass('layui-hide');
	$('#goodsdata').table({
        'url':url,
        'columns':columns
    },function (data) {
        table = data;
    });

    

  //普�?�搜�?
    $("#searchBtn").click(function(){
	   searchGoods(table);
    });
  
  //高级搜索
	$("#searchName").click(function(){
		searchTable(table);
	})
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


 //普�?�搜�?
 function searchGoods(table){	
		 var name = $("#name").val();
		 var fwr = $("#sj").val();
		 var username = $("#username").val();
		 /*
		var searchkey={
				'name':name,
				'sj':fwr
		};
		 alert(searchkey);
	$("#goodsdata").table("search",searchValue);*/
	var param = "?name="+name+"&sj="+fwr+"&username="+username;
	var url = table.ajax.url("${ctx}/main/print/list.do"+param);
	url.load();
}


</script>
</body>
</html>