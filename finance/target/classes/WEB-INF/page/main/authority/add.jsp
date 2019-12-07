<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>添加</title>
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
           <legend>角色添加</legend>
       </fieldset>
       <form class="layui-form layui-form-pane" action="">
           <div class="layui-form-item">
               <label class="layui-form-label">角色名称</label>
               <div class="layui-input-block">
                   <input type="text" name="roleName" maxlength="10" lay-verify="required" autocomplete="off" placeholder="请输入角色名�?" class="layui-input">
               </div>
           </div>
           
           <div class="layui-form-item">
            	 <label class="layui-form-label">楼层权限</label>
                 <div class="layui-input-block" id="place"  lay-filter="place"> 
                 </div>
            </div>
            
          <div class="layui-form-item">
               <label class="layui-form-label">权限菜单</label>
               <div class="layui-input-block eleTree ele3" style="width:auto;overflow: auto;height: 200px;" lay-filter="data3"></div>
          </div>
          
           <div class="layui-form-item layui-form-text">
               <label class="layui-form-label">描述</label>
               <div class="layui-input-block">
                   <textarea placeholder="请输入内�?" class="layui-textarea" name="description"></textarea>
               </div>
           </div>
           
           
           <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
                   <button class="layui-btn save-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                   <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                   <button type="button" class="layui-btn layui-btn-primary" id="back">返回</button>
               </div>
           </div>
       </form>
       
       
   </div>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js"></script>
<script type="text/javascript">
   layui.use(['form','eleTree','jquery','selectPlus'], function(){
       var form = layui.form,
       eleTree = layui.eleTree,
       selectPlus = layui.selectPlus,
       $ = layui.jquery;

       var url = '${ctx}/main/place/floor.do?level=2';
       var data = {};
       var multselect;
   	   var el3;
       $.component.multiDropdown(form,selectPlus,'place',data,url,true,function(select){
         	multselect = select;
       	
       el3 = eleTree.render({
            elem: '.ele3',
            url: "${ctx}/main/menu/rtree.do",
            showCheckbox: true,
            defaultExpandAll: true
        });
        
        eleTree.on("nodeChecked(data3)",function(d) {
           // console.log(d.data.currentData.id);    // 点击节点对于的数�?
           // console.log(d.isChecked);   // input是否被�?�中
            var checks = el3.getChecked(false, true);
        });
       }); 

       //监听提交
       form.on('submit(demo1)', function(data){
    	   var formData = data.field;
    	   var context = $('#myEditor').val();
    	   var imgs = $(context).find('img');
    	   var imgPath = '';
    	   $.each(imgs,function(){
    		   var src = $(this).attr('src');
    		   if (src.indexOf('/') > -1) {
    			   var pathArr = src.split('/');
    			   var len = pathArr.length;
    			   var path = pathArr[len-2] + '/' + pathArr[len-1]
    			   imgPath += path + ',';
    		   }
    	   });
    	   var checks = el3.getChecked(false, true);
    	   var selectVal = multselect.getChecked().data;
    	   $.extend(formData, {imgpath:imgPath,authoritys:checks,floorIds:selectVal});
           var url = '${ctx}/main/role/save.do';
           $.submit.post(data,url);
           return false;
       });

       $('#back').click(function () {
           tabChange('角色管理');
           tabDelete('添加角色');
       });
       
      /*  var url = '${ctx}/main/course/show.do';
       var data = {};
       $.component.dropdown(form,'test',data,url,false); */
   });
</script>

</body>
</html>
