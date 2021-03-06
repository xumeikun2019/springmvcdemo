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
                   <input type="text" name="gname" lay-verify="required" autocomplete="off" placeholder="请输入商品名称" class="layui-input">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">分类</label>
               <div class="layui-input-inline">
                   <input type="text" name="categroy" lay-verify="categroy" placeholder="请输入" autocomplete="off" class="layui-input">
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
                   <input type="password" name="password" placeholder="请输入密码" autocomplete="off" class="layui-input">
               </div>
               <div class="layui-form-mid layui-word-aux">请务必填写用户名</div>
           </div>--%>

           <div class="layui-form-item">
               <div class="layui-inline">
                   <label class="layui-form-label">价格</label>
                   <div class="layui-input-inline">
                       <input type="text" name="price" placeholder="￥" autocomplete="off" class="layui-input">
                   </div>
               </div>
           </div>

           <%--<div class="layui-form-item">
               <label class="layui-form-label">单行选择框</label>
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
               <label class="layui-form-label">行内选择框</label>
               <div class="layui-input-inline">
                   <select name="quiz1">
                       <option value="">请选择省</option>
                       <option value="浙江" selected="">浙江省</option>
                       <option value="你的工号">江西省</option>
                       <option value="你最喜欢的老师">福建省</option>
                   </select>
               </div>
               <div class="layui-input-inline">
                   <select name="quiz2">
                       <option value="">请选择市</option>
                       <option value="杭州">杭州</option>
                       <option value="宁波" disabled="">宁波</option>
                       <option value="温州">温州</option>
                       <option value="温州">台州</option>
                       <option value="温州">绍兴</option>
                   </select>
               </div>
               <div class="layui-input-inline">
                   <select name="quiz3">
                       <option value="">请选择县/区</option>
                       <option value="西湖区">西湖区</option>
                       <option value="余杭区">余杭区</option>
                       <option value="拱墅区">临安市</option>
                   </select>
               </div>
           </div>
           <div class="layui-form-item" pane="">
               <label class="layui-form-label">开关-开</label>
               <div class="layui-input-block">
                   <input type="checkbox" checked="" name="open" lay-skin="switch" lay-filter="switchTest" title="开关">
               </div>
           </div>
           <div class="layui-form-item" pane="">
               <label class="layui-form-label">单选框</label>
               <div class="layui-input-block">
                   <input type="radio" name="sex" value="男" title="男" checked="">
                   <input type="radio" name="sex" value="女" title="女">
                   <input type="radio" name="sex" value="禁" title="禁用" disabled="">
               </div>
           </div>
           <div class="layui-form-item layui-form-text">
               <label class="layui-form-label">文本域</label>
               <div class="layui-input-block">
                   <textarea placeholder="请输入内容" class="layui-textarea"></textarea>
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

        //创建一个编辑器
        var editIndex = layedit.build('LAY_demo_editor');

        //自定义验证规则
        form.verify({
            categroy: function(value){
                if(value.length < 5){
                    return '标题至少得5个字符啊';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,content: function(value){
                layedit.sync(editIndex);
            }
        });

        //监听指定开关
        form.on('switch(switchTest)', function(data){
            layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
                offset: '6px'
            });
            layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            var url = '${ctx}/main/goods/save.do';
            $.submit.post(data,url);
            return false;
        });

        //表单初始赋值
        form.val('example', {
            "username": "贤心" // "name": "value"
            ,"password": "123456"
            ,"interest": 1
            ,"like[write]": true //复选框选中状态
            ,"close": true //开关状态
            ,"sex": "女"
            ,"desc": "我爱 layui"
        })


    });
</script>

</body>
</html>
