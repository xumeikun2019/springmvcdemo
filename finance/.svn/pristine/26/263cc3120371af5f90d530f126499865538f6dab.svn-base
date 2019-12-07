<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>菜单管理</title>
	<%@ include file="/common/taglibs.jsp"%>
    <%@ include file="/common/table.jsp"%>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
    <link rel="stylesheet"  href="${ctx}/statics/css/metroStyle/metroStyle.css" />
    <%-- <link rel="stylesheet"  href="${ctx}/statics/css/eleTree.css" /> --%>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.table.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.excheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.exedit.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.form.min.js"></script>
    
    <style type="text/css">
    body,html {margin:0; height:100%;}
	.mainDiv{height:100%; background:#eee;width:100%;}
        .aaa{box-shadow:0 0 5px green;width:95%;height:95%;margin:5px; }
        
        #weather {
		    background-color: #F5F8FC;
		    height: 100%;
		    width: 100%;
		    overflow: hidden;
		    font-family: 'Open Sans', sans-serif;
		}
		#mainArea {
		    margin-bottom: 15px;
		    border-radius: 2px;
		    background-color: #fff;
		    box-shadow: 5px 5px 5px 0 rgba(0, 0, 0, .05);
		    -webkit-box-shadow: #d4d2d2 0px 0px 10px;
		    -moz-box-shadow: #d4d2d2 0px 0px 10px;
		}
		#div_con {
            position: relative;
            width: 800px;
            height: 750px;
            margin: 20px;
            overflow: hidden;
        }
        #div_msg {
            position: absolute;
 
            width: 1000px;
            height: auto;
            margin: 0;
            padding: 10px;
 
            border: 0px solid red;
        }
    </style>
    
    <script type="text/javascript">
    
        
	
    </script>
</head>
<body >
<input type="hidden" value="<%=basePath %>"  id="basePath">
<input type="hidden" id="userName" value="${user.username}"> <!-- 当前用户 -->
	<div class="mainDiv" >
		<table style="width:100%;height: 100%;" border="0">
			
			<tr>
				<td width="20%;" style="background-color: white;" valign="top">
					<div style="heigth:100%">
						<table id="leftTable" style="width:100%;height: 10%; padding-top: 0px;" >
							<tr id="left_title">
								<td align="center" >
								 <a style="margin: 10px;" class='layui-btn layui-btn-small _aa' onclick="openSC()">添加素材</a>
								</td>
							</tr>					
											
						</table>
					</div>
				</td>
				<td width="60%;" align="center">
					<table style="width:100%;height: 100%;">
						
						<tr><td align="center" valign="top">
							<div id="mainArea" style="width: 90%;height: 800px;background-color: white;margin-top: 30px;">
							<input type="hidden" id="viewPath" value=""> 
								<table style="width:100%;height: 100%; padding-top: 0px;"  >
									<tr>
										<td id='div_con'  colspan="2" align="center">
											
										</td>
									</tr>					
									<!-- <tr height="5%">
										<td align="center" colspan="2">
										  消息
										</td>
									</tr> -->					
								</table>
							</div>
						</td></tr>
						
					</table>
				
					
				</td>
				<td width="20%;" style="background-color: white;" valign="top">
					<blockquote class="layui-elem-quote layui-text">
						播放设置
 					</blockquote>
 					<form class="layui-form" action="">
						  <div class="layui-form-item">
						    <label class="layui-form-label">节目名称</label>
						    <div class="layui-input-block">
						    <div class="layui-input-inline">
						      <input type="text" id="jmName"  autocomplete="off"  class="layui-input">
						    </div>
						    </div>
						  </div>
						 <!-- <div class="layui-form-item">
						    <label class="layui-form-label">轮播方式</label>
						    <div class="layui-input-block">
						      <input type="radio" name="lbType" value="default" title="左右切换" checked="checked">
						      <input type="radio" name="lbType" value="updown" title="上下切换">
						      <input type="radio" name="lbType" value="fade" title="渐隐渐显" >
						    </div>
						  </div> -->
						  <div class="layui-form-item">
						    <label class="layui-form-label">轮播间隔(秒)</label>
						    <div class="layui-input-block">
						    <div class="layui-input-inline">
						      <input type="text" id="jg" autocomplete="off" class="layui-input" value="10">
						    </div>
						    </div>
						  </div>
						<!--   <div class="layui-form-item" >
						    <label class="layui-form-label">内容添加</label>
						    <div class="layui-input-block">
						      <input type="checkbox" name="cb" title="时间">
						      <input type="checkbox" name="cb" title="天气" >
						    </div>
						  </div> -->
						  <div class="layui-form-item" >
						    <div class="layui-input-block">
						        <a class='layui-btn layui-btn-normal' onclick="saveJM('save')">保存</a>
								&nbsp;&nbsp;&nbsp;
								<!-- <a class='layui-btn layui-btn-danger' onclick="preview()">效果预览</a> -->
						    	<a class='layui-btn layui-btn-danger' onclick="nextStep()" id="cjjh">下一步>></a>
						    </div>
						  </div>
						  <div class="layui-form-item">
						  	<div class="layui-input-block">
						    </div>
						  </div>
					</form>
				</td>
			</tr>
			
		</table>
		<input type="hidden" id="jmId" >
		<input type="hidden" id="flg" value="${flg}">
		<input type="hidden" id="sucaiIds" value="${sucaiIds}">
	</div>
   <script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
  <script type="text/javascript">
  $(function(){
	  if($('#flg').val()==1){
		  var ids=$('#sucaiIds').val();
		  $.ajax({
				url : "${ctx}/sucai/getSucaiList.do",
				type : "post",
				dataType : "json",
				data : {
					'ids':ids
				},
				success : function(result) {
					console.log(result);
					var type = "";
					var o = result.data;
					for(var i=0;i<o.length;i++){
						var arr = [];
						var str = o[i].id+"|"+o[i].name+"|"+o[i].path+"|"+o[i].type+"|"+o[i].switchpath;
							arr.push(str);
						putCkeck(arr,o[i].type)
					}
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert("出现错误！");
				}
			});
	  }
  });
  layui.use(['form','jquery'], function(){
      var form = layui.form
          ,layer = layui.layer,
          eleTree = layui.eleTree,
          $ = layui.jquery;


      //自定义验证规则
      form.verify({
          categroy: function(value){
              if(value.length < 5){
                  return '标题至少得5个字符啊';
              }
          }
      });
    //其它示例
      $('.demoTest .layui-btn').on('click', function(){
        var othis = $(this), type = othis.data('type');
        active[type] ? active[type].call(this, othis) : '';
      });
  });

  
  
  function openSC(){
		  
        //  var classVideo = document.getElementById("videourl").value;
          var index = layer.open({
        	  id: 'insert-form',
              type: 2,
              content: '${ctx}/jiemu/scpage.do',
              area: ['90%', '90%'],
              offset:'t',
              title : '素材',
              btn: ['提交','取消'],
              maxmin: true,
              yes: function (index,layero) {
            	  var body = layer.getChildFrame('body', index);
                  var iframeWin = window[layero.find('iframe')[0]['name']];//得到iframe页的窗口对象，执行iframe页的方法：
                  var checkboxArr = iframeWin.submitCkeck();//调用子页面的方法，得到子页面返回的ids
                  var type=body.find('#uploadType').val();
                  putCkeck(checkboxArr,type);
                  layer.close(index);//需要手动关闭窗口
              } ,
              end: function () {
              }
          });
	} 
  function putCkeck(arr,type){
	  var html = "";
	  for(var i=0;i<arr.length;i++){
		  var o = arr[i].split('|');
		  
			html+='<tr><td align="center">';
			
			
		  	html+='  <div class="layui-card aaa" style="height: 11vw;">';
		  	html+='     <div style="height: 1vw;"  align="center" >';
  			html+='    </div>';
			html+='  	<div  style="height: 8vw;">';
			if(type=="视频"){
				html+='         <a href="javaScript:void(0);" onclick="putVideo(\''+o[2]+'\');" >';
				html+='         	<video  src="'+o[2]+'" style="width:70%;height:95%;object-fit:fill;"></video>';
			    html+='         </a>';
		    	html+='				<input type="hidden" value="'+o[2]+'" name="vvv">'
			}else if(type=="图片"){
				
				html+='         <a href="javaScript:void(0);" onclick="putImage(\''+o[2]+'\');" >';
				html+='         	<img  src="'+o[2]+'" style="width:70%;height:95%;object-fit:fill;"></img>';
			    html+='         </a>';
		    	html+='				<input type="hidden" value="'+o[2]+'" name="vvv">'
			}else if(type=="excel"){
      			html+='         <a href="javaScript:void(0);"   onclick="putFile(\''+o[4]+'\',\''+o[3]+'\');">';
      			html+='         	<img class="layui-upload-img" src="${ctx}/statics/images/jm/excel.png" style="width:50%;height:95%;">';
      		    html+='         </a>';
		    	html+='				<input type="hidden" value="'+o[4]+'" name="vvv">'
  			}else if(type=="word"){
      			html+='         <a href="javaScript:void(0);"   onclick="putFile(\''+o[4]+'\',\''+o[3]+'\');">';
      			html+='         	<img class="layui-upload-img" src="${ctx}/statics/images/jm/word.png"  style="width:50%;height:95%;">';
      		    html+='         </a>';
		    	html+='				<input type="hidden" value="'+o[4]+'" name="vvv">'
  			}else if(type=="pdf"){
      			html+='         <a href="javaScript:void(0);"    onclick="putFile(\''+o[4]+'\',\''+o[3]+'\');">';
      			html+='         	<img class="layui-upload-img" src="${ctx}/statics/images/jm/pdf.png"  style="width:50%;height:95%;">';
      		    html+='         </a>';
		    	html+='				<input type="hidden" value="'+o[2]+'" name="vvv">'
		    	html+='				<input type="hidden" value="'+o[4]+'" name="pdfpath">'
  			}else if(type=="ppt"){
      			html+='         <a href="javaScript:void(0);"   onclick="putFile(\''+o[4]+'\',\''+o[3]+'\');">';
      			html+='         	<img class="layui-upload-img" src="${ctx}/statics/images/jm/ppt.png"  style="width:50%;height:95%;">';
      		    html+='         </a>';
		    	html+='				<input type="hidden" value="'+o[2]+'" name="vvv">'
		    	html+='				<input type="hidden" value="'+o[4]+'" name="pptpath">'
  			}
		    
			html+='				<input type="hidden" value="'+o[0]+'" name="vid">'
			html+='				<input type="hidden" value="'+o[3]+'" name="sctype">'
		    html+='    </div>';
		    html+='     <div style="height: 1vw;"  align="center" >';
  		    html+='        		<p id="name" align="center">'+o[1]+'</p>'; 
  			html+='    </div>';
  			html+='    <div style="height: 1vw;">';
  			//if(i>0){
  				//layui-icon-upload-circle
	  			html+='            		 <a href="javaScript:void(0);" onclick="up(this);" >';
	  			html+='                		<font color="green" size="2">向上</font>';
	  			html+='             	 </a>';
  			//}
  			//layui-icon-delete
  			html+='            		 &nbsp;&nbsp;&nbsp;<a href="javaScript:void(0);" onclick="remove(this);" >';
  			html+='                		<font color="red" size="2">移除</font>';
  			html+='             	 </a>';
  			html+='    </div>';
			html+='   </div>';
		
			html+='</td></tr>';
	  }
	  $('#leftTable').append(html);
  }
  
  function putVideo(path){
	  $('#viewPath').val(path);
	  var base = $('#basePath').val();
	  var html = '';
	  html+='<video   preload="auto" controls   src="'+base+path+'" style="width:100%;height:100%;object-fit:fill;">';
	  html+='<source src="'+path+'" type="video/mp4"></video>';
	  $('#div_con').html(html);
  }
  function putImage(path){
	  $('#viewPath').val(path);
	  var base = $('#basePath').val();
	  var html = '';
	  html+='<img  src="'+base+path+'" style="width:100%;height:100%;object-fit:fill;"></img>';
	  $('#div_con').html(html);
  }
  //--------------------------------------单个文件预览-----------------
 //获取div的高度
var msg_height = 0;

var con_height = 0;

var sub_height = 0;

//当前顶部坐标
var cur_top = 0;
var msg = "";
var myInterval; //定义定时器对象
  function putFile(path,type){
	  $('#viewPath').val(path);
	  var base = $('#basePath').val();
	  var html='';
	if(type=="word"||type=="excel"){
		  var div_msg = '<div id="div_msg" style="margin-left: 10%;"></div>';
			$('#div_con').html(div_msg);
		  window.clearInterval(myInterval);
		  html+='<iframe scrolling="no" class="img item-preview" id="iframe" src="'+base+path+'"  style="width:950px;height:650px;"> ';
			html+='</iframe>';
			$('#div_msg').html(html);
			
			//----------------
			 document.getElementById('iframe').onload=function(){ 
				var win = document.getElementById('iframe').contentWindow;//窗口对象
				var iframe = win.document;//iframe的窗口document对象
				var body = "";
				if(type=="word"){
					 body = iframe.getElementsByTagName('html');
				}else if(type=="excel"){
					 body = iframe.getElementsByTagName('table');
				}
				//console.log(body);
				 msg = $(body).html();
				//获取div的高度
			     msg_height = $(body).height();
			    //加2次，这样完全移动完的时候不至于出现空白
			    $('#div_msg').html(msg+msg);
			     con_height = $('#div_con').height();
			     sub_height = con_height - msg_height;
			    //当前顶部坐标
			     cur_top = 0;
			     myInterval = setInterval("scrollme()", 100);
				
			}
			
			//------------------


	  }else if(type=="pdf"){
		var pathArr = path.split(",");
		 html = '<div id="videoArea" align="center">';
			html+='<div class="layui-carousel" id="test1" lay-filter="test1">';
			html+='	  <div carousel-item="">';
			for(i=0;i<pathArr.length;i++){
				html+='    <div class="tp"><img  src="'+base+pathArr[i]+'" style="width: auto; height: auto; max-width: 100%; max-height: 100%;"></img></div>';
			}
			html+='	  </div>';
			html+='	</div> <div>';
			$('#div_con').html(html);
			//初始化轮播
			  layui.use('carousel', function(){
				  var carousel = layui.carousel;
				  //设定各种参数
				  var ins3 = carousel.render({
				    elem: '#test1',
				    width:'680px',
				    height:'760px',
				  });
				});
	  }else if(type=="ppt"){
			var pathArr = path.split(",");
			 html = '<div id="videoArea" align="center">';
				html+='<div class="layui-carousel" id="test1" lay-filter="test1">';
				html+='	  <div carousel-item="">';
				for(i=0;i<pathArr.length;i++){
					html+='    <div class="tp"><img  src="'+base+pathArr[i]+'" style="width: auto; height: auto; max-width: 100%; max-height: 100%;"></img></div>';
				}
				html+='	  </div>';
				html+='	</div> <div>';
				$('#div_con').html(html);
				//初始化轮播
				  layui.use('carousel', function(){
					  var carousel = layui.carousel;
					  //设定各种参数
					  var ins3 = carousel.render({
					    elem: '#test1',
					    width:'780px',
					    height:'490px',
					  });
					});
		  }
  }

  //-------------------------滚动方法---------------------------------------
  function scrollme() {
        cur_top--;
 
        //如果整个消息都已经上移完了，则重新赋值消息，及移动距离
        if (0 == cur_top + msg_height) {
            cur_top = 0;
        }
 
        $('#div_msg').css('top', cur_top + 'px');
    }
  ///-------------------------------------------------
  
  function preview(){
	  var vvv = "";
	  var pdfpath = "";
	  var pptpath = "";
	  var sctypes = "";
	  $('input[name="vvv"]').each(function(){
		  vvv+=$(this).val()+",";
	  });
	  $('input[name="sctype"]').each(function(){
		  sctypes+=$(this).val()+",";
	  });
	  $('input[name="pdfpath"]').each(function(){
		  pdfpath+=$(this).val()+",";
	  });
	  $('input[name="pptpath"]').each(function(){
		  pptpath+=$(this).val()+",";
	  });
	  var lbType = $("input[type=radio]:checked").val();
	  //console.log("vvv::"+vvv);
	  //console.log("sctypes::"+sctypes);
	  //console.log("lbType::"+lbType);
	          var index = layer.open({
	              type: 2,
	              content: '${ctx}/jiemu/preview.do?path='+$('#viewPath').val()
	            		  								  +"&jg="+$('#jg').val()
	            		  								  +"&vvv="+vvv
	            		  								  +"&pdfpath="+pdfpath
	            		  								  +"&pptpath="+pptpath
	            		  								  +"&sctypes="+sctypes
	            		  								  +"&lbType="+lbType,
	              area: ['1100px', '720px'],
	              offset:'t',
	              maxmin: true,
	              end: function () {
	  
	              }
	          });

  }
  
 
  
  ///--------------------------
  function remove(obj){
	  var tr = $(obj).parent().parent().parent().parent();
	  tr.remove();
  }
  function up(obj){
	  var tr = $(obj).parent().parent().parent().parent();
	  /* console.log(tr.prev()[0].tagName);
	  if(tr.prev()[0].tagName=="TR"){
		  
	  } */
	  if(tr.prev().attr('id')=="left_title"){
		  alert("已经是第一行！");
		  return;
	  }
	  $(tr.prev()).before(tr);
	  
  }
  function saveJM(f){
	  if(!yz()){
		  return;
	  }
	  var vids = "";
	  $('input[name="vid"]').each(function(){
		  vids+=$(this).val()+",";
	  });
	  var paths = "";
	  $('input[name="vvv"]').each(function(){
		  paths+=$(this).val()+",";
	  });
	  $.ajax({
			url : "${ctx}/jiemu/saveJM.do",
			type : "post",
			dataType : "json",
			data : {
				'vIds':vids,
				'paths':paths,
				'jg':$('#jg').val(),
				'userName': $('#userName').val(),
				'jmName':$('#jmName').val()
			},
			 async:false, 
			success : function(result) {
				if(result.result=="ok"){
	                		 $('#jmId').val(result.data.id);
	                	 layer.msg('节目保存成功！', {icon: 1,time: 1000}, function () {
			                 if(f=='save'){
			               		 layer.closeAll();
					             window.parent.location.reload();
			                 }
							});
				}
			},
			error: function (XMLHttpRequest, textStatus, errorThrown) {
				alert("出现错误！");
			}
		});
  }
  
  function nextStep(){
	  if(!yz()){
		  return;
	  }
	  saveJM();
	  //alert($('#jmId').val());
		  //跳转设置节目计划
		   var vids = "";
			  $('input[name="vid"]').each(function(){
				  vids+=$(this).val()+",";
			  });
			  var paths = "";
			  $('input[name="vvv"]').each(function(){
				  paths+=$(this).val()+",";
			  });
	          var index = layer.open({
	        	  id: 'insert-form',
	              type: 2,
	              content: '${ctx}/jiemu/setJM.do',
	              area: ['100%', '100%'],
	              offset:'t',
	             // btn: ['保存','取消'],
	              title:'创建计划',
	              maxmin: true,
	              success: function (layero, index) {
	            	// 获取子页面的iframe
	                    var iframe = window['layui-layer-iframe' + index];
	                    // 向子页面的全局函数child传参
	                    var param = {
	                    		'vIds':vids,
								'paths':paths,
								'jg':$('#jg').val(),
								'jmName':$('#jmName').val(),
								'jmId':$('#jmId').val()
	                    		};
	                    iframe.child(param);
	            	
	              }
	              ,end:function(){
	            	  var index_now = parent.layer.getFrameIndex(window.name);  
	            	  parent.layer.close(index_now);//关闭当前页 
	              }
	          });
	          
  }
	function yz(){
		if($("input[name='vvv']").length==0){
			 layer.msg('至少添加一个素材!', {icon: 2,time: 1000}, function () {
    			 return false;
				});
		}else if($('#jmName').val()==""){
   		 layer.msg('节目名称不能为空!', {icon: 2,time: 1000}, function () {
			 return false;
			});
     	}else if($('#jg').val()==""){
		 layer.msg('轮播间隔不能为空!', {icon: 2,time: 1000}, function () {
			 return false;
			});
     	}else{
    	 return true;
     	}
	}
    </script>

</body>
</html>