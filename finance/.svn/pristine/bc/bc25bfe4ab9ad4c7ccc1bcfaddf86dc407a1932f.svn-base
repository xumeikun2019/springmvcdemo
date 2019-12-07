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
           <legend>编辑</legend>
       </fieldset>
       <form class="layui-form layui-form-pane" action="">
       
       		<div class="layui-form-item">
               <label class="layui-form-label">用户名<span style="color: red">*</span></label>
               <div class="layui-input-block">
                   <input type="text" name="username" lay-verify="pass" maxlength="20" autocomplete="off" placeholder="请输入用户名" class="layui-input layui-disabled" disabled value="${pojo.username}">
               </div>
           </div>
           
           
           <div class="layui-form-item">
               <label class="layui-form-label">真实姓名<span style="color: red">*</span></label>
               <div class="layui-input-block">
                   <input type="text" name="realname" lay-verify="required" maxlength="20" autocomplete="off" placeholder="请输入真实姓名" class="layui-input" value="${pojo.realname}">
               </div>
           </div>
           
                      <div class="layui-form-item">
               <label class="layui-form-label">身份证</label>
               <div class="layui-input-block">
                   <input type="number" name="idcard" value="${pojo.idcard}"  maxlength="20" autocomplete="off"  class="layui-input">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">电话</label>
               <div class="layui-input-block">
                   <input type="number" name="phone" value="${pojo.phone}"  maxlength="20" autocomplete="off" class="layui-input">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">工种</label>
               <div class="layui-input-block">
               		<select name="workType"  id="workType" value="${pojo.workType}"> </select>
                   <%-- <input type="text" name="workType" value="${pojo.workType}" maxlength="20" autocomplete="off" class="layui-input"> --%>
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">工作时间</label>
               <div class="layui-input-block">
                   <input type="text" name="workDate" id="workDate" value="${pojo.strWorkDate}" maxlength="20" autocomplete="off" class="layui-input">
               </div>
           </div>
           
            <div class="layui-form-item">
               <label class="layui-form-label">权限选择</label>
               <div class="layui-input-block">
               	<c:if test="${pojo.dept == '1'}">
                   <select name="dept"  >
                   		<option value="0">普通用户</option>
                   		<option value="1" selected="selected">管理员</option>
                    </select>
                    </c:if>
                  <c:if test="${pojo.dept == '0'}">
                   <select name="dept"  >
                   		<option value="0" selected="selected">普通用户</option>
                   		<option value="1" >管理员</option>
                    </select>
                    </c:if>
                   <c:if test="${pojo.dept == null}">
                   <select name="dept"  >
                   		<option value="0">普通用户</option>
                   		<option value="1">管理员</option>
                    </select>
                    </c:if>
               </div>
           </div>
           
           <div class="layui-form-item">
               <label class="layui-form-label">简介</label>
               <div class="layui-input-block">
                   <input type="text" name="remark" maxlength="255" autocomplete="off" placeholder="请输入简介" class="layui-input" value="${pojo.remark}">
               </div>
           </div>
       		
       		<div class="layui-form-item">
            	 <label class="layui-form-label">角色<span style="color: red">*</span></label>
                 <div class="layui-input-block" id="role" value="${pojo.stringRoleIds}"  lay-filter="role"> 
                 </div>
            </div>

           <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
                   <input type="hidden" name="id" value="${pojo.id}">
                   <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
               </div>
           </div>
       </form>
   </div>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
<script>
    layui.use(['form','selectPlus','laydate'], function(){
        var form = layui.form,
            layer = layui.layer,
            selectPlus = layui.selectPlus,
            laydate = layui.laydate;
      	 laydate = layui.laydate;
 		laydate.render({
 			elem: '#workDate' //指定元素
 			});
      //自定义验证规则
        form.verify({
            pass: function(value){
            	var myreg = /^[a-zA-Z0-9_-]{4,20}$/;
               if(!myreg.test(value)){
                   return '用户名只能包含：4到20位（字母，数字，下划线，减号）';
                }
            }
        });

        //监听提交
        form.on('submit(demo1)', function(data){
        	var formData = data.field;
            var url = '${ctx}/main/user/save.do';
            var selectVal = multselect.getChecked().data;
            console.log(selectVal);
            $.extend(formData, {roleids:selectVal});
            $.submit.post(data,url);
            return false;
        });

        $('#back').click(function () {
            tabChange('人员设置');
            tabDelete('编辑人员内容');
        });
      //学校选择
       // $.component.dropdown(form,'choosecls',{},'${ctx}/main/school/show.do',true); 
        $.component.dropdown(form,'workType',{},'${ctx}/main/dictiomary/findDictiomaryByParent.do?id=31',true);
        var url = '${ctx}/main/role/show.do';
        var data = {};
        var multselect;
        $.component.multiDropdown(form,selectPlus,'role',data,url,true,function(select){
        	multselect = select;
        });
      
    });
</script>

</body>
</html>
