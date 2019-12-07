<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>月打印统�?</title>
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
   	<div class="layui-tab">
		<ul class="layui-tab-title">
		    <li class="layui-this">部门</li>
		    <li>打印�?</li>
		</ul>
		<div class="layui-tab-content">
		    <div class="layui-tab-item layui-show">
		    	        <!-- 按钮操作 -->
			        <div class="table_control">
			             <!-- 搜索区域操作 -->
			            <div class="table_control">
				             <div class="table_search" style="width: auto;">
				            <div class="layui-form">
				                <div class="layui-inline">
					                    <label class="layui-form-label">部门名称</label>
					                    <!-- 
					                    <div class="layui-input-inline">
					                        <input id="name" type="text" autocomplete="off" class="layui-input" name="name">
					                    </div> -->
					                    <div class="layui-input-block">
				                   			<input type="text" id="participants" name="userId" required="" lay-verify="required" placeholder="--请�?�择--" readonly="" autocomplete="off" class="layui-input"> 
				                      		<input name='state' id="name"  type="hidden"   class="layui-input">     
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
			            <th>部门名称</th>
			            <th>打印次数</th>
			            <th>打印页数</th>
			            <th>打印时间</th>
			            <th>操作</th>
			        </tr>
			        </thead>
			    </table>
			   </form>
		    </div>
		    <div class="layui-tab-item">
		    	 <!-- 按钮操作 -->
			        <div class="table_control">
			             <!-- 搜索区域操作 -->
			            <div class="table_control">
				             <div class="table_search" style="width: auto;">
				            <div class="layui-form">
				                <div class="layui-inline">
					                    <label class="layui-form-label">打印机名�?</label>
					                    <div class="layui-input-inline">
					                        <input id="name1" type="text" autocomplete="off" class="layui-input" name="name1">
					                    </div>
				                </div>
				                <div class="layui-inline">
					                    <label class="layui-form-label">打印时间</label>
					                    <div class="layui-input-inline">
					                        <input id="sj1" type="text" autocomplete="off" class="layui-input" name="sj1">
					                    </div>
				                </div>
			                	<button type="button" class="layui-btn layui-btn-primary" id="searchBtn1"><i class="layui-icon layui-icon-search"></i></button>
			              </div>
			              </div>
			            </div>           
			    </div>
		    	<!--表格区域  -->
			   <form id="gridform1">
			    <table id="goodsdata1" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
			        <thead>
			        <tr>
			            <th>打印机名�?</th>
			            <th>打印次数</th>
			            <th>打印页数</th>
			            <th>打印时间</th>
			        </tr>
			        </thead>
			    </table>
			   </form>
		    </div>
		</div>		

   	</div>
</div>


<script type="text/javascript">
	layui.use(['form','laydate'], function(){
    var form = layui.form,laydate = layui.laydate;
	 laydate.render({
			elem : '#sj',
			format : 'yyyy-MM-dd'
		});
	 laydate.render({
			elem : '#sj1',
			format : 'yyyy-MM-dd'
		});
	 $('#participants').click(function(){
		 //$('#userTree').show(500);
		 openIndex = layer.open({
             type: 2,
             title: '部门名称',
             shade: [0.1],
             closeBtn: 1,
             maxmin: true, //�?启最大化�?小化按钮
             area: ['80%', '80%'],
             content: '${ctx}/main/meeting/participants.shtml?id=ptyg',
         }); 
	});
});

var table;
var table1;
$(function(){
	var url = '${ctx}/main/print/list_day.do';   
    var columns = [ //定义�?
        {data: "name"},
        {data: "dycs"},
        {data: "dyys"},
        {data: "dysj"},
        {data: function (obj) {
       	 return "<a class='layui-btn layui-btn-sm _aa' onclick='newTab(\"日打印统�?(人员)\",\"\",\"${ctx}/main/print/index_day.shtml?depid="+obj.department_id+"&sj="+obj.dysj+"\");'>查看</a>";
       }}
    ];
//    $('table.layui-table thead tr th:eq(0)').addClass('layui-hide');
	$('#goodsdata').table({
        'url':url,
        'columns':columns
    },function (data) {
        table = data;
    });

	var url1 = '${ctx}/main/print/list_day_dyj.do';   
    var columns1 = [ //定义�?
        {data: "cname"},
        {data: "dycs"},
        {data: "dyys"},
        {data: "dysj"}
    ];
//    $('table.layui-table thead tr th:eq(0)').addClass('layui-hide');
	$('#goodsdata1').table({
        'url':url1,
        'columns':columns1
    },function (data) {
        table1 = data;
    });

    

  //普�?�搜�?
    $("#searchBtn").click(function(){
	   searchGoods(table);
    });
  
    $("#searchBtn1").click(function(){
 	   searchGoods1(table1);
     });

});
function participantsChooseptry (ids,names) {
	 $('#name').val(ids.slice(0,32));
	 $('#participants').val(names);
}
function close(){
	   layer.close(openIndex);
}

 //普�?�搜�?
 function searchGoods(table){
		 var name = $("#name").val();
		 var sj = $("#sj").val();
		 /*
		var searchkey={
				'name':name,
				'fwr':fwr
		};	
	$("#goodsdata").table("search",searchValue);*/
		 var param = "?name="+name+"&sj="+sj;
			var url = table.ajax.url("${ctx}/main/print/list_day.do"+param);
			url.load();
}
 function searchGoods1(table1){
	 var name = $("#name1").val();
	 var sj = $("#sj1").val();
	 var param = "?name="+name+"&sj="+sj;
		var url = table1.ajax.url("${ctx}/main/print/list_day_dyj.do"+param);
		url.load();
}


</script>
</body>
</html>