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
    <link rel="stylesheet"  href="${ctx}/statics/plugins/layui/css/layui.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
</head>
<body>
   <div class="container">
       <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
           <legend>商品添加</legend>
       </fieldset>
       <form class="layui-form layui-form-pane" action="">
           <div class="layui-form-item">
               <label class="layui-form-label">商品名称</label>
               <div class="layui-input-block">
                   <input type="text" name="gname" lay-verify="required" autocomplete="off" placeholder="请输入商品名�?" class="layui-input">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">分类</label>
               <div class="layui-input-inline">
                   <input type="text" name="categroy" lay-verify="categroy" placeholder="请输�?" autocomplete="off" class="layui-input">
               </div>
           </div>

           <%--<div class="layui-form-item">
               <div class="layui-inline">
                   <label class="layui-form-label">日期选择</label>
                   <div class="layui-input-block">
                       <input type="text" name="date" id="date1" autocomplete="off" class="layui-input">
                   </div>
               </div>
               <div class="layui-inline">
                   <label class="layui-form-label">行内表单</label>
                   <div class="layui-input-inline">
                       <input type="text" name="number" autocomplete="off" class="layui-input">
                   </div>
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">密码</label>
               <div class="layui-input-inline">
                   <input type="password" name="password" placeholder="请输入密�?" autocomplete="off" class="layui-input">
               </div>
               <div class="layui-form-mid layui-word-aux">请务必填写用户名</div>
           </div>--%>

           <div class="layui-form-item">
               <div class="layui-inline">
                   <label class="layui-form-label">价格</label>
                   <div class="layui-input-inline">
                       <input type="text" name="price" placeholder="�?" autocomplete="off" class="layui-input">
                   </div>
               </div>
           </div>

           <%--<div class="layui-form-item">
               <label class="layui-form-label">单行选择�?</label>
               <div class="layui-input-block">
                   <select name="interest" lay-filter="aihao">
                       <option value=""></option>
                       <option value="0">写作</option>
                       <option value="1" selected="">阅读</option>
                       <option value="2">游戏</option>
                       <option value="3">音乐</option>
                       <option value="4">旅行</option>
                   </select>
               </div>
           </div>

           <div class="layui-form-item">
               <label class="layui-form-label">行内选择�?</label>
               <div class="layui-input-inline">
                   <select name="quiz1">
                       <option value="">请�?�择�?</option>
                       <option value="浙江" selected="">浙江�?</option>
                       <option value="你的工号">江西�?</option>
                       <option value="你最喜欢的�?�师">福建�?</option>
                   </select>
               </div>
               <div class="layui-input-inline">
                   <select name="quiz2">
                       <option value="">请�?�择�?</option>
                       <option value="杭州">杭州</option>
                       <option value="宁波" disabled="">宁波</option>
                       <option value="温州">温州</option>
                       <option value="温州">台州</option>
                       <option value="温州">绍兴</option>
                   </select>
               </div>
               <div class="layui-input-inline">
                   <select name="quiz3">
                       <option value="">请�?�择�?/�?</option>
                       <option value="西湖�?">西湖�?</option>
                       <option value="余杭�?">余杭�?</option>
                       <option value="拱墅�?">临安�?</option>
                   </select>
               </div>
           </div>
           <div class="layui-form-item" pane="">
               <label class="layui-form-label">�?�?-�?</label>
               <div class="layui-input-block">
                   <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" title="�?�?">
               </div>
           </div>
           <div class="layui-form-item" pane="">
               <label class="layui-form-label">单�?�框</label>
               <div class="layui-input-block">
                   <input type="radio" name="sex" value="�?" title="�?" checked="">
                   <input type="radio" name="sex" value="�?" title="�?">
                   <input type="radio" name="sex" value="�?" title="禁用" disabled="">
               </div>
           </div>
           <div class="layui-form-item layui-form-text">
               <label class="layui-form-label">文本�?</label>
               <div class="layui-input-block">
                   <textarea placeholder="请输入内�?" class="layui-textarea"></textarea>
               </div>
           </div>--%>
           <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
                   <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                   <button type="reset" class="layui-btn layui-btn-primary">重置</button>
               </div>
           </div>
       </form>
   </div>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });

        //创建�?个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

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

        //监听指定�?�?
        form.on('switch(switchTest)', function(data){
            layer.msg('�?关checked�?'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意�?关状态的文字可以随意定义，�?�不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            var url = '${ctx}/main/goods/save.do';
            $.submit.post(data,url);
            return false;
        });

        //表单初始赋�??
        form.val('example', {
            "username": "贤心" // "name": "value"
            ,"password": "123456"
            ,"interest": 1
            ,"like[write]": true //复�?�框选中状�??
            ,"close": true //�?关状�?
            ,"sex": "�?"
            ,"desc": "我爱 layui"
        })


    });
</script>

</body>
</html>
