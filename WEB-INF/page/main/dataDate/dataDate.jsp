<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会议资料保存时间设置</title>
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
	             <div class="layui-inline">
	                    <label class="layui-form-label">日期</label>
	                    <div class="layui-input-inline">
	                        <input id="time" type="text" autocomplete="off" class="layui-input" placeholder="">
	                    </div>
                </div>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-small search-button" id="searchName">搜索</button> 
            </form>
        </div>
	

        <!-- 按钮操作 -->
        <div class="table_control">
            <div class="table_opera">
             	<button type="button" title="添加" class="layui-btn layui-btn-primary " onclick='add()'>
                    <i class="icon iconfont icon-add-r-o"></i>
                </button>
            </button>
            </div>

             <!-- 搜索区域操作 -->
            <div class="table_search">
                <!-- <input type="text" id="_search" class="keyword" placeholder="请在这里输入关键字" style="height:25px;"> 
	           <div class="layui-form">
	                 <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="explain"  style="width:120px;">高级搜索</button> 
	            </div>-->
            </div>           
    </div>

   
   <!--表格区域  -->
   <form id="gridform">
    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th>
            <th>公司名称</th>
            <th>会议保留时间(天)</th>
            <th>备注</th>
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

    var url = '${ctx}/main/DataDate/list.do';
    var columns = [ //定义列
        {"data": function (obj) {
            return '<input type="checkbox" name="id" class="fly-checkbox" value=' + obj.id + '>';
        }},
        {data: "fgs_id"},
        {data: "date"},
        {data: "bz"},
        {data: function (obj) {
        	return '<a class="layui-btn layui-btn-sm _aa" name="change_btn" href="${ctx}/main/attendanceTime/edit.shtml?id='+obj.id+' " >编辑</a>';     	
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
	
	


 //普通搜索
 function searchGoods(table){
	var place_name = $("#place_name").val();
	var searchValue={'placeName':place_name};
	
	$("#goodsdata").table("search",searchValue);
}
 
//高级搜索
 function searchTable(table){
	 var realname = $("#realname").val();
	 var time = $("#time").val();
	var searchkey={
			'realname':realname,
			'time':time
					
	};
	
	$("#goodsdata").table('search',searchkey);
}

 function add(){
 	window.location.href='${ctx}/main/DataDate/add.shtml';
 }



</script>
</body>
</html>