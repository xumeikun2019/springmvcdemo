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
</head>
<body>
	<div  class="admin-main">
   <div>
    	<!-- 提示区域 -->
        <div class="page_explain">
        	<h2>操作提示</h2>
            <ul>
                <li><span>·</span>上架状�?�分为：出售中�?�仓库中和禁售三种状�?</li>
                <li><span>·</span>审核状�?�分为：审核通过、等待审核和审核失败三种状�??</li>
                <li><span>·</span>商品只有在审核�?�过并且出售中的商品才能正常出售。商品是否需要审核可以在“商品设置�?�中由管理员进行设置�?</li>
                <li><span>·</span>禁售或审核失败的商品，商家只能重新编辑后才能够进行出售�??</li>
            </ul>
        </div>
        <!-- 按钮操作 -->
        <div class="table_control">
            <div class="table_opera">
                <button type="button" title="添加" class="layui-btn layui-btn-primary " onclick='newTab("添加商品","${ctx}/shop/admin/goods/select-cat.do");'>
                    <i class="icon iconfont icon-add-r-o"></i>
                </button>

                <button htype="button" title="删除" class="layui-btn layui-btn-primary " onclick="del()">
                    <i class="icon iconfont icon-delete-o"></i>
                </button>

                
                <button type="button" title="回收�?" class="layui-btn layui-btn-primary " onclick='newTab("商品回收�?","${ctx}/shop/admin/goods/trash-list.do");'>
                    <i class="icon iconfont icon-delete_light"></i>
                </button>
                <button type="button" title="提示" class="layui-btn layui-btn-primary " id="explain">
                    <i class="icon iconfont icon-info-r-o"></i>
                </button>


            </div>
            
            <!-- 搜索区域操作 -->
            <div class="table_search">
                <input type="text" id="_search" class="keyword" placeholder="请在这里输入关键�?" style="height:25px;">
                <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="searchBtn"><i class="layui-icon">&#xe615;</i></button>
                <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="high_search">高级搜索</button>
              <!--   高级搜索区域 -->
                <div class="high_searchcontent">
                    <div class="content_title"><span>高级搜索</span></div>
                    <form id="search_form" class="layui-form" action="post">
                        <div class="layui-form-item">
                            <label class="layui-form-label" >商品名称:</label>
                            <div class="layui-input-block">
                                <input type="text" id="goods_name" name="goods_name" lay-verify="title" autocomplete="off" placeholder="请输入标�?" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <label class="layui-form-label" >商品编号:</label>
                            <div class="layui-input-block">
                                <input type="text" id="goods_num" name="goods_num" lay-verify="title" autocomplete="off" placeholder="请输入编�?" class="layui-input">
                            </div>
                        </div>


                        <div class="layui-form-item">
                            <label class="layui-form-label">类别:</label>
                            <div class="layui-input-block">                    
                                <input type="text" id="cat_name" value="" style="width: 200px;height: 25px;position: relative;" />
								<input type="hidden" id="cat_id" name="cat_id" value="" />
                            </div>
                        </div>
                        <ul>
                            <li class="reset">
                                <button type="reset" id="reset_btn" class="layui-btn  layui-btn-primary">重置</button>
                            </li>
                            <li class="submit">
                                <button type="button" class="layui-btn layui-btn-primary" id="submit_btn"  lay-submit="" lay-filter="highsearch" >�?始搜�?</button>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--高级搜索生成内容  -->
   <div class="high_search" >
		 <form action="" class="layui-form layui-form-one" action=""></form> 	
   </div>
   
   <div class="kelong" style="display:none;">
   		<ul  class="search_conditions " style="width:98%; ">
 			<li>
 				 <div class="layui-form-item _select">
                       	<label class="layui-form-label  _label" >商品名称</label>
	                 <div class="layui-input-block _layui-input-block">
	                   	<input type="text" id="goods_name_one" name="goods_name" readonly="true" class="layui-input">
	                 </div>
               	</div>
                <span>
                	<a class="closeSelf" href="javascript:void (0)">
                		<i class="layui-icon" style="color: #5f8bca;">&#x1006;</i>
               		</a>
                </span>
 			</li>
			<li>
				<div class="layui-form-item _select">
                    <label class="layui-form-label  _label" >商品编号</label>
	               <div class="layui-input-block _layui-input-block">
	                     <input type="text" id="goods_num_one" name="goods_num" readonly="true" class="layui-input">
	               </div>
               </div>
               <span>
	               	<a class="closeSelf" href="javascript:void (0)">
	               		<i class="layui-icon" style="color: #5f8bca;">&#x1006;</i>
	              	</a>
               </span>
 			</li>
 			<li>
 			  <div class="layui-form-item _select">
                  <label class="layui-form-label _label">类别</label>
               <div class="layui-input-block  _layui-input-block" style="margin-top:-5px;">                    
                    <input type="text" id="cat_name_one" value="" placeholder="请输入类�?" readonly="true" />
                    <input type="hidden" id="cat_id" name="cat_id" value=""  readonly="true"/>
                </div>
              </div>
               <span>
	               	<a class="closeSelf" href="javascript:void (0)">
	               		<i class="layui-icon" style="color: #5f8bca;">&#x1006;</i>
	              	</a>
              </span>
 			</li>
 		</ul>
   </div>
   
   <!--表格区域  -->
   <form id="gridform">
    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
            <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th>
            <th width="70px">商品图片</th>
            <th>商品编号</th>
            <th width="350px">商品名称</th>
            <th>分类</th>
            <th>�?售价�?</th>
            <th>上架</th>
            <th>品牌</th>
            <th>操作</th>
        </tr>
        </thead>
    </table>
    <!-- 传�?�等区域(暂定) -->
    <div id="addBrand" ></div>
   </form>
</div>
</body>
<script type="text/javascript">
//转换静�?�路�?
function convertToUrl(path){
	if(path == undefined){
		path = "";
	}
	return path.replace("fs:", "${staticserver}");
}


layui.use(['form', 'layedit', 'laydate'], function(){
    var form = layui.form()
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
	
	//高级搜索框的显示隐藏
    $("#high_search").on("click",function(event){
    	event.stopPropagation();
     	event.stopImmediatePropagation();
        $(".high_searchcontent").toggle();
    })
	
	
	table = $('#goodsdata').DataTable({
		"language": {
	        "url": "${ctx}/statics/plugins/datatables/zh_CN.txt"
	    },
	    "processing": true,
	    "serverSide": true,
	    "initComplete": function(settings, json) {
	    	 $(".dataTables_paginate").on("click", "a", function() {
	    		 if($('#goodsdata_processing')[0].style.display=="block"){
					  $(".dataTables_paginate li").addClass("disabled");
				  }  
	         });   
		  },
	    "ordering": false,
	    "searching": false,
	    "lengthChange": false,
	    ajax: {
	        //指定数据�?
	        type:"post",
	        url: '${ctx}/statics/json/list.json',
	    },
	    columns: [ //定义�?
            {"data": function (obj) {
                return '<input type="checkbox" name="goods_id" class="fly-checkbox" value=' + obj.goods_id + '>';
            }},
            {data: function (obj) {
            	if(obj.thumbnail == null){
            		return '<a href="${ctx}/goods-'+obj.goods_id+'.html" target="_blank"><img alt="" style="height: 60px;" src="'+convertToUrl("${ctx}/statics/images/no_picture.jpg")+'"></a>';
            	}else{
            		 return '<a href="${ctx}/goods-'+obj.goods_id+'.html" target="_blank"><img alt="" style="height: 60px;" src="'+convertToUrl(obj.thumbnail)+'"></a>';
            	}
            }},	
	        {data: "sn"},
	        {data: function (obj) {
                return '<a href="${ctx}/goods-'+obj.goods_id+'.html" target="_blank">'+obj.name+'</a>';
            }},
	        {data: "cat_name"},
	        {data: function (obj) {
                return '�?'+obj.price;
            }},
	        {data: function (obj) {
	        	if(obj.market_enable==1){
	        		return "售卖�?";
	        	}else if(obj.market_enable==0){
	        		return "已下�?";
	        	}else{
	        		return "预览商品";
	        	}
            }},
	        {data: "brand_name"},
	        {data: function (obj) {
	        	return "<a class='layui-btn layui-btn-small _aa' name='change_btn' onclick='newTab(\""+obj.name+"\",\"${ctx}/shop/admin/goods/edit.do?goodsId="+obj.goods_id+"\")' >操作</a>";		//获取�?:data["brand_id"]
	       	}}
	     ]
	});
	
	//普�?�搜�?
	$("#searchBtn").click(function(){
		searchGoods(table);
	});
	
	//高级搜索
	$("#submit_btn").click(function(){
		highSearchGoods(table);
	});
	
	$("#if-reload").click(function(){
		//var index = parent.layer.getFrameIndex(window.name); 
        //parent.layer.close(index);
        parent.closeOther();
        
        //console.log(window.parent.name);
	})
	
});




//普�?�搜�?
 function searchGoods(table){
	var keyword = $(".keyword").val();
	var param = "&keyword="+keyword+"&stype="+0;
	var url = table.ajax.url("${ctx}/shop/admin/goods/list-json.do"+param);
	url.load();
}

//高级搜索
function highSearchGoods(table){
	var keyword = $(".keyword").val();
	var name = $("#goods_name").val();
	var sn = $("#goods_num").val();
	var catid = $("#cat_id").val();
	var param = "&keyword="+keyword+"&stype="+1+"&name="+name+"&sn="+sn+"&catid="+catid;
	var url = table.ajax.url("${ctx}/shop/admin/goods/list-json.do"+param);
	url.load();
}

//删除商品
function del(){
	var ch_goodsId = $("input[name='goods_id']").is("input:checked");
	if(ch_goodsId == false){
		alert("请�?�择要放入回收站的商�?");
		return false;
	}
	if (!confirm("确定要把这些商品放入回收站吗�?")) {
		return;
	}
	var options = {
			url:ctx+"/shop/admin/goods/delete.do",
			type:"post",
			dataType:"json",
			success:function(data){
				if(data.result==1){
					$.Loading.success(data.message);
					table.ajax.url(ctx+"/shop/admin/goods/list-json.do?market_enable=").load();
				}
				if(data.result==0){
					$.Loading.error(data.message);
				}
			}
	};
	$("#gridform").ajaxSubmit(options);
} 

</script>
</html>