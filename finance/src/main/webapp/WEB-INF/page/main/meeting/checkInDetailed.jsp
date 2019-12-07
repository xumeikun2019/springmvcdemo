<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会议考勤情况详细</title>
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
                    <label class="layui-form-label">人员名称</label>
	                    <div class="layui-input-inline">
	                        <input id="realname" type="text" autocomplete="off" class="layui-input" placeholder="">
	                    </div>
	             </div>
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
	                 <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="explain"  style="width:120px;">高级搜索</button> 
	            </div>
            </div>           
    </div>

   
   <!--表格区域  -->
   <form id="gridform">
    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th>会议名称</th>
            <th>人员名称</th>
            <th>状态</th>
            <th>签到时间</th>
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

    var url = '${ctx}/main/meetingOrder/checkInListDetailed.do?id='+'${id}';
    var columns = [ //定义列
        {data: "meeting_name"},
        {data: "realname"},
        {data: "zt"},
        {data: "add_time"}
    ];
//    $('table.layui-table thead tr th:eq(0)').addClass('layui-hide');
	$('#goodsdata').table({
        'url':url,
        'columns':columns
    },function (data) {
        table = data;
    });
	
	  //高级搜索
	$("#searchName").click(function(){
		searchTable(table);
	})
    

});
//高级搜索
function searchTable(table){
	 var realname = $("#realname").val();
	var searchkey={
			'realname':realname					
	};
	
	$("#goodsdata").table('search',searchkey);
}


</script>
</body>
</html>