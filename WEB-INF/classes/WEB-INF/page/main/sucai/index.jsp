<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>列表</title>
	<%@ include file="/common/taglibs.jsp"%>
    <%@ include file="/common/table.jsp"%>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <script type="text/javascript" src="${ctx}/statics/js/jquery.table.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.form.min.js"></script>
</head>
<body>
   <div class="admin-main">

       <!-- 高级搜索区域 -->
        <div class="page_explain">

            <form class="layui-form" action="">

                <div class="layui-inline">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-inline">
                        <input id="role-name-search" type="text" autocomplete="off" class="layui-input">
                    </div>
                </div>

                <button type="button" class="layui-btn layui-btn-primary layui-btn-small search-button" id="search">搜索</button>

            </form>

        </div>
        <!-- 按钮操作 -->
        <div class="table_control">
            <div class="table_opera">
                <button type="button" title="添加" class="layui-btn layui-btn-primary " onclick='newTab("添加角色","","${ctx}/main/role/add.shtml");'>
                      <i class="icon iconfont icon-add-r-o"></i>
                </button>

                <button htype="button" title="编辑" class="layui-btn layui-btn-primary " onclick='edit()'>
                    <i class="icon iconfont icon-edit-o"></i>
                </button>

                <button htype="button" title="删除" class="layui-btn layui-btn-primary " onclick="del()">
                    <i class="icon iconfont icon-delete-o"></i>
                </button>
            </div>

            <!-- 搜索区域操作 -->
           <!--  <div class="table_search">
                <input type="text" id="_search" class="keyword" placeholder="请在这里输入关键�?" style="height:25px;">
                <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="searchBtn"><i class="layui-icon layui-icon-search"></i></button>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="explain">高级搜索</button>
            </div> -->
    </div>

   
   <!--表格区域  -->
   <form id="gridform">
    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th>
            <th>角色名称</th>
            <th width="350px">描述</th>
            <th>操作</th>
        </tr>
        </thead>
    </table>
   </form>
</div>


<script type="text/javascript">

layui.use(['form', 'layedit', 'laydate'], function(){
    var form = layui.form
        ,layer = layui.layer
        ,layedit = layui.layedit
        ,laydate = layui.laydate;
	form.on('submit(highsearch)', function(data){
		 $(".layui-form-one>ul").remove();
	$(".high_search").css("display","block");
	 
	var kelo=$(".kelong ul").clone();
	kelo.appendTo($(".high_search form"));
	var gjname=$("#goods_name").val();
	$("#goods_name_one").val(gjname);
	var gjnum=$("#goods_num").val();
	$("#goods_num_one").val(gjnum);
	var gjcatname=$("#cat_name").val();
	$("#cat_name_one").val(gjcatname);
	var gjcatid=$("#cat_id").val();
	$("#cat_id_one").val(gjcatid);
	$(".closeSelf").click(function(){
		$(this).parent().parent().detach();
		})
	});
});

var table;
$(function(){

    var url = '${ctx}/main/role/list.do';
    var columns = [ //定义�?
        {"data": function (obj) {
            return '<input type="checkbox" name="id" class="fly-checkbox" value=' + obj.id + '>';
        }},
        {data: "role_name"},
        {data: "description"},
        {data: function (obj) {
            return "<a class='layui-btn layui-btn-small _aa' name='change_btn' onclick='newTab(\"编辑角色\",\"\",\"${ctx}/main/role/edit.shtml?id="+obj.id+"\")' >编辑</a>";		//获取�?:data["brand_id"]
        }}
    ];

    $('#goodsdata').table({
        'url':url,
        'columns':columns
    },function (data) {
        table = data;
    });


    $("#searchBtn").click(function(){
	//普�?�搜�?
		var keyword = $(".keyword").val();
	    var searchKey = {'roleName':keyword};
	     $('#goodsdata').table('search',searchKey);
    });

    // 高级搜索
    $('#search').click(function () {
        highSearchGoods(table);
    });

});




//普�?�搜�?
 function searchGoods(table){
	var keyword = $(".keyword").val();
	var param = "?roleName="+keyword;
	var url = table.ajax.url("${ctx}/main/role/list.do"+param);
	url.load();
}

//高级搜索
function highSearchGoods(table){
	var roleName = $("#role-name-search").val();
	var param = "?roleName=" + roleName;
	var url = table.ajax.url("${ctx}/main/role/list.shtml"+param);
	url.load();
}

function edit() {
    var ischeck = $("input[name='id']").is("input:checked");
    if (ischeck == false) {
        layer.msg('请�?�择要编辑的数据', {
            icon: 7
        });
    } else {
        var id = $("input[name='id']").val();
        newTab("编辑角色","","${ctx}/main/role/edit.shtml?id=" + id);
    }
}

//删除
function del(){
	var ch_goodsId = $("input[name='id']").is("input:checked");
	var id = $("input[name='id']").val();
	if(ch_goodsId == false){
        layer.msg('请�?�择要删除的数据', {
            icon: 7
        });
		return false;
	}
	layer.confirm('确定要删除所选的数据吗？', function(){
		var options = {
				url:'${ctx}/main/role/del.do',
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.result=='ok'){
	                    layer.msg('删除成功!', {
	                        icon: 1
	                    });
						table.ajax.url("${ctx}/main/role/list.do").load();
					}
					if(data.result=='fail'){
	                    layer.msg('删除失败!', {
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