<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>预约记录列表</title>
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

                <div class="layui-inline">
                    <label class="layui-form-label">预约�?</label>
                    <div class="layui-input-inline">
                        <input type="text" autocomplete="off" class="layui-input" id="orderName">
                    </div>
                </div>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-small search-button" id="searchName">搜索</button>
            </form>
        </div>
	

        <!-- 按钮操作 -->
        <div class="table_control">
            <div class="table_opera">
                <%-- <button type="button" title="添加" class="layui-btn layui-btn-primary " onclick='newTab("人员添加","","${ctx}/main/people/add.shtml");'>
                    <i class="icon iconfont icon-add-r-o"></i>
                </button> --%>

                <!-- <button type="button" title="编辑" class="layui-btn layui-btn-primary " onclick='edit()'>
                    <i class="icon iconfont icon-edit-o"></i>
                </button> 

                <button type="button" title="取消预约" class="layui-btn layui-btn-primary " onclick="del()">
                    <i class="icon iconfont icon-delete-o"></i>-->
                </button>
            </div>

             <!-- 搜索区域操作 -->
            <div class="table_search">
                <!-- <input type="text" id="_search" class="keyword" placeholder="请在这里输入关键�?" style="height:25px;"> -->
	           <div class="layui-form">
		            <div class="layui-inline">
	                    <label class="layui-form-label">会议室搜�?</label>
	                    <div class="layui-input-inline">
	                        <input id="place_name" type="text" autocomplete="off" class="layui-input" placeholder="">
	                    </div>
	                </div>
	                 <button type="button" class="layui-btn layui-btn-primary" id="searchBtn"><i class="layui-icon layui-icon-search"></i></button>
	                 <!-- 
	                 <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="explain"  style="width:120px;">高级搜索</button> -->
	            </div>
            </div>           
    </div>

   
   <!--表格区域  -->
   <form id="gridform">
    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th>
            <th>预约部门</th>
            <th>预约�?</th>
            <th>预约地点</th>
            <th>会议名称</th>
            <th>会议时间�?</th>
            <th>会议时间�?</th>
            <th>审批状�??</th>
            <!-- 
            <c:if test="${user.dept==0}">
            <th>审批状�??</th>
            </c:if>
            <c:if test="${user.dept==1}">
            <th style="display: none;">审批状�??</th>
            </c:if> -->
            <th>操作</th>
        </tr>
        </thead>
    </table>
   </form>
</div>


<script type="text/javascript">
	layui.use(['form'], function(){
    var form = layui.form;
  
});

var table;
$(function(){

    var url = '${ctx}/main/meetingOrder/list.do';
    var columns = [ //定义�?
        {"data": function (obj) {
            return '<input type="checkbox" name="id" class="fly-checkbox" value=' + obj.id + '>';
        }},
        {data: "departmentName"},
        {data: "sysName"},
        {data: "placeName"},
        {data: "meetingName"},
        {data: "timeStart"},
        {data: "timeEnd"},
        {data: function (obj) {
        	if("${user.dept}"=="0"){
        		return obj.zt;
        	}else{
        		return "1";
        	}     	
        }},
        {data: function (obj) {
        	return '<a class="layui-btn layui-btn-sm _aa" name="change_btn" href="${ctx}/main/meetingOrder/view.shtml?id='+obj.id+' " >查看</a>';		//获取�?:data["brand_id"]        	
        }}
    ];
//    $('table.layui-table thead tr th:eq(0)').addClass('layui-hide');
if("${user.dept}"=="0"){
	$('#goodsdata').table({
        'url':url,
        'columns':columns
    },function (data) {
        table = data;
    });
}else{
	$('#goodsdata').table({
        'url':url,
        'columns':columns,
        'columnDefs':{
            'targets':7,
            'visible':false
           }
    },function (data) {
        table = data;
    });
}

    

  //普�?�搜�?
    $("#searchBtn").click(function(){
	   searchGoods(table);
    });
  
  //高级搜索
	$("#searchName").click(function(){
		searchTable(table);
	})
});
	
	


 //普�?�搜�?
 function searchGoods(table){
	var place_name = $("#place_name").val();
	var searchValue={'placeName':place_name};
	
	$("#goodsdata").table("search",searchValue);
}
 
//高级搜索
 function searchTable(table){
	 var place_name = $("#place_name").val();
	 var orderName = $("#orderName").val();
	var searchkey={
			'sysName':orderName,
			'placeName':place_name
					
	};
	
	$("#goodsdata").table('search',searchkey);
}

//取消预约
function qx(id){	
//	alert(id);
	layer.confirm('确定要取消预约吗�?', function(){
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