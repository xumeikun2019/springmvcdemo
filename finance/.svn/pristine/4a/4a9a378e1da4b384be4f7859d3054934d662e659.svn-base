<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>部门考勤</title>
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
	
	<!-- 高级搜索区域 -->
        <div class="page_explain">

            <form class="layui-form" action="">
            	<!-- 
	             <div class="layui-inline">
	                    <label class="layui-form-label">日期</label>
	                    <div class="layui-input-inline">
	                        <input id="time" type="text" autocomplete="off" class="layui-input" placeholder="">
	                    </div>
                </div> -->
                <button type="button" class="layui-btn layui-btn-primary layui-btn-small search-button" id="searchName">搜索</button> 
            </form>
        </div>
	

        <!-- 按钮操作 -->
        <div class="table_control">
            <div class="table_opera">
            </button>
            </div>

             <!-- 搜索区域操作 -->
            <div class="table_search">
                <!-- <input type="text" id="_search" class="keyword" placeholder="请在这里输入关键字" style="height:25px;"> -->
                <div class="layui-form">
                <div class="layui-inline">
	                    <label class="layui-form-label">日期</label>
	                    <div class="layui-input-inline">
	                        <input id="time" type="text" autocomplete="off" class="layui-input" placeholder="">
	                    </div>
                </div>
                <button type="button" class="layui-btn layui-btn-primary" id="searchBtn"><i class="layui-icon layui-icon-search"></i></button>
                </div>
                <!-- 
	           <div class="layui-form">
	                 <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="explain"  style="width:120px;">高级搜索</button> 
	            </div> -->
            </div>           
    </div>

   
   <!--表格区域  -->
   <form id="gridform">
    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th>
            <th>时间</th>
            <th>审核状态</th>
            <th>访问事由</th>
            <th>访问人</th>           
            <th>操作</th>
        </tr>
        </thead>
    </table>
   </form>
</div>


<script type="text/javascript">
	layui.use(['form','laydate'], function(){
    var form = layui.form,laydate = layui.laydate;
	 laydate.render({
			elem : '#time',
			format : 'yyyy-MM',
			type: 'month'
		});
  
});

var table;
$(function(){
	var url = '${ctx}/main/visitor/statisticsList_mixi.do';   
    var columns = [ //定义列
        {"data": function (obj) {
            return '<input type="checkbox" name="id" class="fly-checkbox" value=' + obj.id + '>';
        }},
        {data: "add_time"},  
        {data: "state"},   
        {data: "meetingName"},   
        {data: "sysName"},          
        {data: function (obj) {
        	return '<a class="layui-btn layui-btn-sm _aa" name="change_btn" href="${ctx}/main/visitor/view.shtml?id='+obj.id+' " >查看</a>';		//获取值:data["brand_id"]  
        }}
    ];
//    $('table.layui-table thead tr th:eq(0)').addClass('layui-hide');
	$('#goodsdata').table({
        'url':url,
        'columns':columns
    },function (data) {
        table = data;
    });

    

  //普通搜索
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


 //普通搜索
 function searchGoods(table){
	 var sj = $("#time").val();
		var searchkey={
				'sj':sj					
		};	
		$("#goodsdata").table('search',searchkey);
}
 
//高级搜索
 function searchTable(table){
	 var sj = $("#time").val();
	var searchkey={
			'sj':sj					
	};	
	$("#goodsdata").table('search',searchkey);
}

//取消预约
function qx(id){	
//	alert(id);
	layer.confirm('确定要取消预约吗？', function(){
		  var options = {
					url:'${ctx}/main/meetingOrder/qx.do?id='+id,
					type:"post",
					dataType:"json",
					success:function(data){
						if(data.result=='ok'){
		                    layer.msg('取消预约成功!', {
		                        icon: 1
		                    });
							table.ajax.url("${ctx}/main/meetingOrder/list.do").load();
						}
						if(data.result=='fail'){
		                    layer.msg('取消预约失败!', {
		                        icon: 2
		                    });
						}
					}
			};
			$("#gridform").ajaxSubmit(options);
	});
}

</script>
</body>
</html>