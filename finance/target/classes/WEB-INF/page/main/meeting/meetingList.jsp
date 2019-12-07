<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会议室资源统�?</title>
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
		    <li class="layui-this">本周</li>
		    <li>下周</li>
		</ul>
		<div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
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
				                </button>
				            </div>
				
				             <!-- 搜索区域操作 -->
				            <div class="table_search">
				                <!-- <input type="text" id="_search" class="keyword" placeholder="请在这里输入关键�?" style="height:25px;"> -->
				                <!-- 
					           <div class="layui-form">
						            <div class="layui-inline">
					                    <label class="layui-form-label">会议室搜�?</label>
					                    <div class="layui-input-inline">
					                        <input id="place_name" type="text" autocomplete="off" class="layui-input" placeholder="">
					                    </div>
					                </div>
					                 <button type="button" class="layui-btn layui-btn-primary" id="searchBtn"><i class="layui-icon layui-icon-search"></i></button>
					            </div> -->
				            </div>           
				    </div>
				
				   
				   <!--表格区域  -->
				   <form id="gridform">
				    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
				        <thead>
				        <tr>
				            <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th>
				            <th>会议室名�?</th>
				            <th>星期�?</th>
				            <th>星期�?</th>           
				            <th>星期�?</th>
				           	<th>星期�?</th>
				           	<th>星期�?</th>
				           	<th>星期�?</th>
				           	<th>星期�?</th>
				        </tr>
				        </thead>
				    </table>
				   </form>
				</div>
				
			</div>
		    <div class="layui-tab-item">
		    	<div class="layui-tab-item layui-show">
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
				                </button>
				            </div>
				
				             <!-- 搜索区域操作 -->
				            <div class="table_search">
				                <!-- <input type="text" id="_search" class="keyword" placeholder="请在这里输入关键�?" style="height:25px;"> -->
				                <!-- 
					           <div class="layui-form">
						            <div class="layui-inline">
					                    <label class="layui-form-label">会议室搜�?</label>
					                    <div class="layui-input-inline">
					                        <input id="place_name" type="text" autocomplete="off" class="layui-input" placeholder="">
					                    </div>
					                </div>
					                 <button type="button" class="layui-btn layui-btn-primary" id="searchBtn"><i class="layui-icon layui-icon-search"></i></button>
					            </div> -->
				            </div>           
				    </div>
				
				   
				   <!--表格区域  -->
				   <form id="gridform">
				    <table id="goodsdata1" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
				        <thead>
				        <tr>
				            <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th>
				            <th>会议室名�?</th>
				            <th>星期�?</th>
				            <th>星期�?</th>           
				            <th>星期�?</th>
				           	<th>星期�?</th>
				           	<th>星期�?</th>
				           	<th>星期�?</th>
				           	<th>星期�?</th>
				        </tr>
				        </thead>
				    </table>
				   </form>
				</div>
				
		    </div>
		</div>		
	</div>
   


<script type="text/javascript">
	layui.use(['form'], function(){
    var form = layui.form;
  
});

var table;
$(function(){

    var url = '${ctx}/main/meetingOrder/meetingList.do';
    var columns = [ //定义�?
        {"data": function (obj) {
            return '<input type="checkbox" name="id" class="fly-checkbox" value=' + obj.id + '>';
        }},  
        {data: "name"},   
        {data: "xq1"},   
        {data: "xq2"},  
        {data: "xq3"},  
        {data: "xq4"},  
        {data: "xq5"},  
        {data: "xq6"},  
        {data: "xq7"}
    ];
	$('#goodsdata').table({
        'url':url,
        'columns':columns
    },function (data) {
        table = data;
    });
	
	var url1 = '${ctx}/main/meetingOrder/meetingListxz.do';
    var columns1 = [ //定义�?
        {"data": function (obj) {
            return '<input type="checkbox" name="id" class="fly-checkbox" value=' + obj.id + '>';
        }},  
        {data: "name"},   
        {data: "xq1"},   
        {data: "xq2"},  
        {data: "xq3"},  
        {data: "xq4"},  
        {data: "xq5"},  
        {data: "xq6"},  
        {data: "xq7"}
    ];
	$('#goodsdata1').table({
        'url':url1,
        'columns':columns1
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

</script>
</body>
</html>