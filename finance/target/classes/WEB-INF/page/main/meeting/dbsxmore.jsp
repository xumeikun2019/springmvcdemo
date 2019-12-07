<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>待办事项列表</title>
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
	            </div>
	             -->
            </div>                       
    </div>

   
   <!--表格区域  -->
   <form id="gridform">
    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th>
            <th>事项名称</th>
            <th>事项内容</th>
            <th>提交�?</th>
            <th>提交时间</th>
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

    var url = '${ctx}/main/meetingOrder/dbsxmorelist.do';
    var columns = [ //定义�?
    	{"data": function (obj) {
            return '<input type="checkbox" name="id" class="fly-checkbox" value=' + obj.id + '>';
        }},
        {data: "name"},
        {data: "meetingName"},
        {data: "sysName"},
        {data: "add_time"},
        {data: function (obj) {
        	if(obj.name=="会议室申�?"){
        		return "<a class='layui-btn layui-btn-sm _aa' onclick='newTab(\"会议室审批\",\"\",\"${ctx}/main/meetingOrder/edit.shtml?id="+obj.id+"\");'>审批</a>";
//        		return '<a class="layui-btn layui-btn-sm _aa" name="change_btn" href="${ctx}/main/meetingOrder/edit.shtml?id='+obj.id+' " >审批</a>';		//获取�?:data["brand_id"]     
        	}else if(obj.name=="节目审核"){
        		return "<a href='#'  style='color: #0000FF'  onclick='jmsh(\""+obj.id+"\")'>审核</a>";
        	}else{
        		return "<a class='layui-btn layui-btn-sm _aa' onclick='newTab(\"访客审批\",\"\",\"${ctx}/main/visitor/visitor.shtml?id="+obj.id+"\");'>审批</a>";
//        		return '<a class="layui-btn layui-btn-sm _aa" name="change_btn" href="${ctx}/main/visitor/visitor.shtml?id='+obj.id+' " >审批</a>';		//获取�?:data["brand_id"]     
        	}
        		
        }}
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
	
//节目审核
function jmsh(id) {
//	alert(id);
	layer.confirm('', {
		  btn: ['通过','不�?�过'] //按钮
		}, function(){
			$.post('${ctx}/main/meetingOrder/jmshtg.do?id='+id,{},function (json) {
				layer.msg('审核成功', {icon: 1});
			})
			top.location.reload();
		}, function(){
			$.post('${ctx}/main/meetingOrder/jmshbtg.do?id='+id,{},function (json) {
				layer.msg('审核成功', {icon: 1});
			})
			top.location.reload();
		});

}	


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