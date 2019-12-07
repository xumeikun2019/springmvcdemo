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
    <script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
   <script type="text/javascript" src="https://apip.weatherdt.com/float/static/js/r.js?v=1111"></script>
      <style type="text/css">
	#test {
            margin: auto;  
            position: absolute;  
            top: 0; left: 0; bottom: 0; right: 0; 
}
	.roll1 {
            position: relative;
            width: 1000px;
            height: 750px;
            margin: 0px;
            overflow: hidden;
        }
        .roll2 {
            position: absolute;
 
            width: 1000px;
            height: auto;
            margin: 0;
            padding: 10px;
 
            border: 0px solid red;
        }
	
/* .wenzi{
    position: relative;
    float: left;
    top: 30px;
    left:120px;
    color: white;
    width: 100%;
    height: 30px;
    text-align: center;
    z-index:1;
} */
    </style> 
</head>
<body >
	<div class="layui-carousel" id="test" lay-filter="test2"  >
	  <div carousel-item="" id="lbsc">
	  </div>
	</div> 
		 <input type="hidden" value="<%=basePath %>" id="basePath"/> 
         <input type="hidden" value="${jg}" id="jg" />  
         <input type="hidden" value="${vvv}" id="vvv" /> 
         <input type="hidden" value="${pdfpath}" id="pdfpath" /> 
         <input type="hidden" value="${pptpath}" id="pptpath" /> 
         <input type="hidden" value="${sctypes}" id="sctypes" /> 
         <input type="hidden" value="${lbType}" id="lbType" /> 
 
<script>

var lbType = $('#lbType').val();
var jg = $('#jg').val()*1000;
//获取div的高�?
var msg_height = 0;

var con_height = 0;

var sub_height = 0;

//当前顶部坐标
var cur_top = 0;
var msg = "";

var elem = "";
var myInterval;
var option = {};
$(function(){
	putCS();
	
	layui.use('carousel', function(){
		  var carousel = layui.carousel;
		 
		  //设定各种参数
		  var ins = carousel.render({
		    elem: '#test',
		    width:'1000px',
		    height:'563px',
		    anim : lbType,//轮播方式
		    interval : jg,//轮播间隔
		    arrow : 'none',
		    indicator : 'none'
		    
		  });
		   /*  var ins2 = carousel.render({
			    elem: '#test123',
			    width:'1000px',
			    height:'563px',
			    anim : lbType,//轮播方式
			    interval : jg,//轮播间隔
			    arrow : 'none',
			    indicator : 'none'
			    
			  });  */
		//监听轮播切换事件
		carousel.on('change(test2)', function(obj){ //来源于对应HTML容器�? lay-filter="" 属�?��??
			console.log(obj.prevIndex+1)// 当前索引索引
			 msg_height = 0;
			 con_height = 0;
			 sub_height = 0;
			//当前顶部坐标
			 cur_top = 0;
		 var r = $(obj.item);
		 var sp_class = r.hasClass('sp');
		 var word_class = r.hasClass('roll1');
		 var excel_class = r.hasClass('roll2');
		 var pdf_class = r.hasClass('pdf');
		
		//ins2.reload("");
		//ins2=null;
		  if(sp_class==true){
		 	var html="";
			  var path = r.children(":first").children(":first").attr('src');
			  html+='<video  preload="auto" autoplay="autoplay" style="width:100%;height:100%;object-fit:fill;">';
		      html+='		<source  src="'+path+'" type="video/mp4">';
		      html+='</video> ';
		      //console.log(html);
			  r.html(html);
		  }else if(word_class==true){
			  //r.children(":first").children(":first").contentWindow.location.reload(true);
			  scrollme(obj.prevIndex+1)
		  }else if(excel_class==true){
			 // r.children(":first").children(":first").contentWindow.location.reload(true);
			  scrollme(obj.prevIndex+1)
		  }else if(pdf_class==true){
		  }
		  
		});    
		  
		
		  
		  
		});
});
function putCS(){
	//切换视频
	var vvv = $('#vvv').val();
	var pdfpath = $('#pdfpath').val();
	var pptpath = $('#pptpath').val();
	var sctypes = $('#sctypes').val();
	var va = vvv.split(',');
	var ta = sctypes.split(',');
	var html = "";
	for(var i=0;i<va.length-1;i++){
		console.log(ta[i]);
		    var path = $('#basePath').val()+va[i];
			//document.getElementById("video").src = path;
			if(ta[i]=="图片"){
				html='<div class="tp"><img  src="'+path+'" style="width:100%;height:100%;object-fit:fill;"></img></div>';
				$('#lbsc').append(html);
			}else if(ta[i]=="视频"){
				html='<div class="sp"><video id="video"  preload="auto" autoplay="autoplay" style="width:100%;height:100%;object-fit:fill;">';
		        html+='		<source id="vs" src="'+path+'" type="video/mp4">';
		        html+='</video> </div>';
		        $('#lbsc').append(html);
			}else if(ta[i]=='word'||ta[i]=='excel'){
				html='<div class="roll1 '+ta[i]+'" id="div_con'+i+'"><div class="roll2" id="div_msg'+i+'" >';
				html +='<iframe scrolling="no" class="img item-preview"  onload="load(this,\''+ta[i]+'\','+i+')" src="'+path+'"  style="width:950px;height:650px;"> </iframe>';
				html +='</div><input type="hidden" value="'+path+'"/></div>';
				$('#lbsc').append(html);
				 // window.clearInterval(myInterval2);
						 
			}else if(ta[i]=="pdf"){
				 var pathArr = pdfpath.split(",");
				html='<div class="pdf">';
				html+='<div class="layui-carousel2" id="pdf_'+i+'" lay-filter="pdf_'+i+'"   style="left:30%;margin:0;">';
				html+='	  <div carousel-item="" >';
				for(var j=0;j<pathArr.length;j++){
					html+='    <div><img  src="'+ $('#basePath').val()+pathArr[j]+'" style="width: auto; height: auto; max-width: 100%; max-height: 100%;"></img></div>';
				}
				
				html+='	  </div>';
				html+='	</div></div> ';
				$('#lbsc').append(html); 
				
				 /* layui.use('carousel2', function(){
					  var carousel2 = layui.carousel2;
					  var ins2 = carousel2.render({
						    elem: '#pdf_'+i+'',
						    width:'1000px',
						    height:'563px',
						    interval : 3000,//轮播间隔
						    arrow : 'none',
						    indicator : 'none'
						  }); 
					  //ins2.reload({interval : 3000});
				});  */
					  
			}
			
			
			
			
			
			
			
			
			
	}
}

function load(obj,type,i){
		var win = obj.contentWindow;//窗口对象
		var iframe = win.document;//iframe的窗口document对象
		 var body ;
		//---------------
		if(type=="word"){
			body = iframe.getElementsByTagName('html');
		}else if(type=="excel"){
			body = iframe.getElementsByTagName('table');
		}
		 msg = $(body).html();
	     msg_height = $(body).height();
	    $('#div_msg'+i).html(msg+msg);
	     con_height = $('#div_con'+i).height();
	     sub_height = con_height - msg_height;
	     cur_top = 0;
	     myInterval = setInterval("scrollme("+i+")", 100);
}

//-------------------------滚动方法---------------------------------------
function scrollme(i) {
      cur_top--;

      //如果整个消息都已经上移完了，则重新赋值消息，及移动距�?
      if (0 == cur_top + msg_height) {
          cur_top = 0;
      }

      $('#div_msg'+i).css('top', cur_top + 'px');
  }


</script>

</body>

</html>