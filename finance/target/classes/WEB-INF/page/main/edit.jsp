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
    <link rel="stylesheet"  href="${ctx}/statics/plugins/layui/css/layui.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
</head>
<body>
   <div class="container">
       <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
           <legend>商品修改</legend>
       </fieldset>
       <form class="layui-form layui-form-pane" action="">
           <div class="layui-form-item">
               <label class="layui-form-label">商品名称</label>
               <div class="layui-input-block">
                   <input type="text" name="gname" lay-verify="required" autocomplete="off" placeholder="请输入商品名�?" class="layui-input" value="${goods.gname}">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">分类</label>
               <div class="layui-input-inline">
                   <input type="text" name="categroy" lay-verify="categroy" placeholder="请输�?" autocomplete="off" class="layui-input" value="${goods.categroy}">
               </div>
           </div>

           <div class="layui-form-item">
               <div class="layui-inline">
                   <label class="layui-form-label">价格</label>
                   <div class="layui-input-inline">
                       <input type="text" name="price" placeholder="�?" autocomplete="off" class="layui-input" value="${goods.price}">
                   </div>
               </div>
           </div>

           <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
                   <input type="hidden" name="id" value="${goods.id}">
                   <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                   <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                   <button type="button" class="layui-btn layui-btn-primary" id="back">返回</button>
               </div>
           </div>
       </form>
   </div>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
<script>
    layui.use(['form'], function(){
        var form = layui.form
            ,layer = layui.layer;


        //自定义验证规�?
        form.verify({
            categroy: function(value){
                if(value.length < 5){
                    return '标题至少�?5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6�?12�?']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            var url = '${ctx}/main/goods/save.do';
         //   tabChange('数据表格');
//            test('ll');
            $.submit.post(data,url);
          //  tabDelete('编辑商品');
            return false;
        });

        $('#back').click(function () {
            tabChange('数据表格');
            tabDelete('编辑商品');
        });


    });
</script>

</body>
</html>
