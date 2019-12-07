<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改</title>
    <%@ include file="/common/taglibs.jsp"%>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet"  href="${ctx}/statics/css/eleTree.css" />
    <link rel="stylesheet"  href="${ctx}/statics/plugins/layui/css/layui.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
</head>
<body>
   <div class="container">
       <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
           <legend>角色修改</legend>
       </fieldset>
       <form class="layui-form layui-form-pane" action="">
           <div class="layui-form-item">
               <label class="layui-form-label">角色名称</label>
               <div class="layui-input-block">
                   <input type="text" name="roleName" lay-verify="required" autocomplete="off" placeholder="请输入角色名称" class="layui-input" value="${pojo.roleName}">
               </div>
           </div>

		 <div class="layui-form-item">
            	 <label class="layui-form-label">楼层权限</label>
                 <div class="layui-input-block" id="place"  lay-filter="place" value="${pojo.floorIdsStr}"> 
                 </div>
            </div>
           
          <div class="layui-form-item">
               <label class="layui-form-label">权限菜单</label>
               <div class="layui-input-block eleTree ele3" style="width:auto;overflow: auto;height: 200px;" lay-filter="data3"></div>
          </div>
          
          <div class="layui-form-item layui-form-text">
               <label class="layui-form-label">描述</label>
               <div class="layui-input-block">
                   <textarea placeholder="请输入内容" class="layui-textarea" name="description">${pojo.description}</textarea>
               </div>
           </div>

           <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
                   <input type="hidden" name="id" value="${pojo.id}">
                   <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                   <button type="button" class="layui-btn layui-btn-primary" id="back">返回</button>
               </div>
           </div>
       </form>
   </div>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
<script>
    layui.use(['form','eleTree','jquery','selectPlus'], function(){
        var form = layui.form
            ,layer = layui.layer,
            eleTree = layui.eleTree,
            selectPlus = layui.selectPlus,
            $ = layui.jquery;

        var url = '${ctx}/main/place/floor.do?level=2';
        var data = {};
        var multselect;
        var el3;
        $.component.multiDropdown(form,selectPlus,'place',data,url,true,function(select){
          	multselect = select;
          	
          	var url = '${ctx}/main/menu/stree.do?id=${pojo.id}';
            $.post(url,function (data) {
                var result = data.data;
                	el3=eleTree.render({
                    elem: '.ele3',
                    url: "${ctx}/main/menu/rtree.do?id=${pojo.id}",
                    showCheckbox: true,
                    defaultExpandAll: true,
                    defaultCheckedKeys: result
                    
                });
                
            },'json');
        });
            
        //监听提交
        form.on('submit(demo1)', function(data){
     	   var formData = data.field;
     	   var checks = el3.getChecked(false, true);
     	  var selectVal = multselect.getChecked().data;
     	   $.extend(formData, {authoritys:checks,floorIds:selectVal});
            var url = '${ctx}/main/role/save.do';
            $.submit.post(data,url);
            return false;
        });

        $('#back').click(function () {
            tabChange('角色管理');
            tabDelete('编辑角色');
        });


    });
</script>

</body>
</html>
