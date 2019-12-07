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
    <link rel="stylesheet" href="${ctx}/statics/css/style.upload.css" />
</head>
<body>
   <div class="container">
       <fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
           <legend>人员添加</legend>
       </fieldset>
       <form class="layui-form layui-form-pane" action="">
           
           
           <div class="layui-form-item">
               <label class="layui-form-label">用户�?<span style="color: red">*</span></label>
               <div class="layui-input-block">
                   <input type="text" name="username" lay-verify="pass" maxlength="20" autocomplete="off" placeholder="请输入用户名" class="layui-input" lay-verify="required">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">真实姓名<span style="color: red">*</span></label>
               <div class="layui-input-block">
                   <input type="text" name="realname" lay-verify="required" maxlength="20" autocomplete="off" placeholder="请输入真实姓�?" class="layui-input">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">�?在楼�?<span style="color: red">*</span></label>
               <div class="layui-input-block">
					<select id="select1"  lay-filter="lc"  name = "szlc" lay-verify="required" >
						<option value="" >请�?�择楼层</option>
					</select>
			   </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">卡号<span style="color: red">*</span></label>
               <div class="layui-input-block">
                   <input type="text" name="kh" lay-verify="required" maxlength="20" autocomplete="off" placeholder="请输入卡�?" class="layui-input">
               </div>
           </div>
           <div class="layui-form-item">
			    <label class="layui-form-label">照片</label>
			    <div class="layui-input-block">
  					<a class="layui-btn" id="btn">上传照片</a> �?�?500KB，支持jpg格式�?
					<ul id="fj" class="ul_pics clearfix"></ul>
				</div> 
			</div>
           <div class="layui-form-item">
               <label class="layui-form-label">身份�?</label>
               <div class="layui-input-block">
                   <input type="number" name="idcard"  maxlength="20" autocomplete="off"  class="layui-input">
               </div>
           </div>
           <div class="layui-form-item">
               <label class="layui-form-label">电话</label>
               <div class="layui-input-block">
                   <input type="number" name="phone"  maxlength="20" autocomplete="off" class="layui-input">
               </div>
           </div>
			
			<div class="layui-form-item">
            	 <label class="layui-form-label">角色<span style="color: red">*</span></label>
                 <div class="layui-input-block" id="role"  lay-filter="role"> 
                 </div>
            </div>
            
            <div class="layui-form-item">
               <label class="layui-form-label">权限选择</label>
               <div class="layui-input-block">
                   <select name="dept"  >
                   		<option value="0">普�?�用�?</option>
                   		<option value="1">管理�?</option>
                    </select>
               </div>
           </div>
            
             <div class="layui-form-item">
               <label class="layui-form-label">�?�?</label>
               <div class="layui-input-block">
                   <input type="text" name="remark" maxlength="255" autocomplete="off" placeholder="请输入简�?" class="layui-input">
               </div>
           </div>
           
           <div class="layui-form-item">
               <div class="layui-input-block" style="text-align: center;">
               	<input type="hidden" name="departmentId" value="${departmentId}">
                   <button class="layui-btn save-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                   <button type="reset" class="layui-btn layui-btn-primary">重置</button>
               </div>
           </div>
       </form>
   </div>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/plupload.full.min.js"></script> 
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js"></script>
<script>
    layui.use(['form', 'layedit', 'selectPlus', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,selectPlus = layui.selectPlus
            ,upload = layui.upload,
            laydate = layui.laydate;
   	 laydate = layui.laydate;
		laydate.render({
			elem: '#workDate' //指定元素
			});
		//选择楼层

		var url = '${ctx}/app/plance/findByParam.do?level=2&token=123';
		$.post(url, function(data) {
			$.each(data.list, function(i, item) {
//				console.log(item.id);
//				console.log(item.name);
				$('#select1').append("<option value="+item.id+" >" + item.name+ "</option>");
			});
			
			form.render('select');
		}, 'json');
        //自定义验证规�?
        form.verify({
            pass: function(value){
            	var myreg = /^[a-zA-Z0-9_-]{4,20}$/;
               if(!myreg.test(value)){
                   return '用户名只能包含：4�?20位（字母，数字，下划线，减号�?';
                }
            }
        });
        $.component.dropdown(form,'workType',{},'${ctx}/main/dictiomary/findDictiomaryByParent.do?id=31',true);
        var url = '${ctx}/main/role/show.do';
        var data = {};
        var multselect;
        $.component.multiDropdown(form,selectPlus,'role',data,url,true,function(select){
        	multselect = select;
        });
        //监听提交
        form.on('submit(demo1)', function(data){
        	var formData = data.field;
            var url = '${ctx}/main/user/save.do';
            var selectVal = multselect.getChecked().data;
//            console.log(selectVal);
			var pics = '';
		    $.each($('#fj .img img'),function(){
		    	var id = $(this).attr('id');
		    	pics = id;
		    });
            $.extend(formData, {roleids:selectVal,feature:pics});
            $.submit.post(data,url,function(){
           	   parent.location.reload();
           	   //parent.layer.closeAll('iframe');
           	   
              });            
            return false;
        });

        $('#back').click(function () {
            tabChange('人员设置');
            tabDelete('人员添加');
        });
        
        form.on('select(role-select)', function(data){
       	 $("#roleid").val(data.value)
       }); 
        
        form.on('select(test)',function(data){
			console.dir(data);
		})
    });
    
    var uploader = new plupload.Uploader({ //创建实例的构造方�?
		runtimes: 'html5,flash,silverlight,html4', //上传插件初始化�?�用那种方式的优先级顺序
		browse_button: 'btn', // 上传按钮 
		url: "${ctx}/upload/common/image.do", //远程上传地址
		/* flash_swf_url: 'plupload/Moxie.swf', //flash文件地址
		silverlight_xap_url: 'plupload/Moxie.xap', //silverlight文件地址 */
		filters: {
			max_file_size: '5000kb', //�?大上传文件大小（格式100b, 10kb, 10mb, 1gb�?
			mime_types: [ //允许文件上传类型
				{
					title: "files",
					extensions: "jpg"
				}
			]
		},
		multi_selection: false, //true:ctrl多文件上�?, false 单文件上�?
		init: {
			FilesAdded: function(up, files) { //文件上传�?
					var li = '';
					plupload.each(files, function(file) { //遍历文件
						li += "<li id='" + file['id'] + "'><div class='progress'><span class='bar'></span><span class='percent'>0%</span></div></li>";
					});
					$("#fj").append(li);
					uploader.start();
			//	}
			},
			UploadProgress: function(up, file) { //上传中，显示进度�?
				var percent = file.percent;
				$("#" + file.id).find('.bar').css({
					"width": percent + "%"
				});
				$("#" + file.id).find(".percent").text(percent + "%");
			},
			FileUploaded: function(up, file, info) { //文件上传成功的时候触�?
				var data = eval("(" + info.response + ")");
			    console.log(data);
				$("#" + file.id).html("<img class='del' imgid='"+ data.name +"' src='${ctx}/statics/images/cancel.png'><div class='img'><img id='" + data.name + "' src='${ctx}" + data.url + "'/></div>");
				$('#fj li img.del').click(function(){
					var thiz = $(this);
					thiz.parent().remove();
				});
			},
			Error: function(up, err) { //上传出错的时候触�?
			   var code = err.code;
			    if (code == -600) {
			    	layer.msg('图片大小超出限制,请上传小�?500kb的图�?!', {
                        icon: 2
                    });
			    } else {
			    	layer.msg('上传图片失败请重新上�?!', {
                        icon: 2
                    });
			    }
			}
		}
	});
	uploader.init();   
    
</script>
 <script type="text/javascript" src="${ctx}/statics/js/common.js"></script> 
</body>
</html>
