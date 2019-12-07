<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!doctype html>
<html class="no-js">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1">
  <title>中铝驻桂企业安全培训中心</title>

  <!-- Set render engine for 360 browser -->
  <meta name="renderer" content="webkit">

  <!-- No Baidu Siteapp-->
  <meta http-equiv="Cache-Control" content="no-siteapp"/>

  <link rel="icon" type="image/png" href="assets/i/favicon.png">

  <!-- Add to homescreen for Chrome on Android -->
  <meta name="mobile-web-app-capable" content="yes">
  <link rel="icon" sizes="192x192" href="assets/i/app-icon72x72@2x.png">

  <!-- Add to homescreen for Safari on iOS -->
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link rel="apple-touch-icon-precomposed" href="assets/i/app-icon72x72@2x.png">

  <!-- Tile icon for Win8 (144x144 + tile color) -->
  <meta name="msapplication-TileImage" content="assets/i/app-icon72x72@2x.png">
  <meta name="msapplication-TileColor" content="#0e90d2">

  <link rel="stylesheet" href="${ctx}/statics/plugins/amazeui/css/amazeui.min.css">
  <link rel="stylesheet" href="${ctx}/statics/plugins/amazeui/css/app.css">
  <link rel="stylesheet" href="${ctx}/statics/css/index.css">
    <link rel="stylesheet"  href="${ctx}/statics/css/common.css" />
</head>
<body>
  <div class="am-g header">
     <div class="am-u-sm-12">
        <div class="header-info am-g-fixed">
           <div class="am-u-sm-12 am-u-md-6 am-u-lg-6 header-info-left am-vertical-align">
              <div class="am-vertical-align-bottom">
	              <label>中铝驻桂企业安全培训中心</label>
              </div>
           </div>
           <div class="am-u-sm-12 am-u-md-6 am-u-lg-6 header-info-right am-vertical-align">
              <div class="am-vertical-align-bottom">
	              <label>建立科学化常态化安全教育</label>
              </div>
           </div>
        </div>
     </div>
  </div>
  
  <div class="am-g am-g-fixed">
     <div class="am-u-sm-12">
         <ol class="am-breadcrumb">
         <li><a href="${ctx}/user/login.shtml">首页</a></li>
         <li class="am-active">内容</li>
      </ol>
         
         	<c:if test="${not empty dz}">
         	<h4 style="text-align:center">${dz[0].cname}</h4>
         	<div style="text-align:right;">${dz[0].last_time}</div>
  			<!-- <div id='video' style="text-align:center;margin:0 auto"></div> -->
  			<c:if test="${not empty dz[0].school_id}">
				<div id="video" style="width:100%;height:550px"></div>
  			</c:if>
    		</div>
    		<div>
    			${dz[0].content}
    		</div>
    		
    		</c:if>  
    		<c:if test="${not empty pt}">
         	<h4 style="text-align:center">${pt[0].cname}</h4>
         	<div style="text-align:right;">${pt[0].last_time}</div>
				<c:if test="${not empty pt[0].school_id}">
					<div id="video1" style="width:100%;height:550px"></div>
				</c:if>
    		</div>
    		<div>
    			${pt[0].content}
    		</div>
    		
    		</c:if>      
    		<c:if test="${not empty gdl}">
  			<div id="video1" style="width:100%;height:550px"></div>
				
    		<article class="am-article">
    			<div class="am-article-bd">
    				${gdl[0].content}
    			</div>
    		</article>
    		<%-- <div style="text-align:right;">${gdl[0].last_time}</div> --%>
    		</c:if>          
    		<c:if test="${not empty gxzy}">
    		<div class="gameplay-body">
         		<div class="gametitle"><h4 style="text-align:center">${gxzy[0].cname}</h4></div>
         		<div style="text-align:right;">${gxzy[0].last_time}</div>
         		<c:if test="${not empty gxzy[0].path}">
  					<div id="video1" style="width:100%;height:550px"></div>
  				</c:if>
			</div>	
    		
    		</c:if>           
    		<c:if test="${not empty rep}">
    		<div class="gameplay-body">
         		<div class="gametitle"><h4 style="text-align:center">${rep[0].cname}</h4></div>
         		<div style="text-align:right;">${rep[0].last_time}</div>
         		<c:if test="${not empty rep[0].school_id}">
  					<div id="video1" style="width:100%;height:550px"></div>
  				</c:if>
			</div>	
    			<div>
    			${rep[0].content}
    		</div>
    		</c:if>           	
     </div>
  </div>
  
  <div class="am-g footer">
     <div class="am-u-sm-12">
          <div class="footer-info" style="color:#004eac">
             <h5>�?术支持：中铝山东工程 · 信息�?术中�?</h5>
          </div>
     </div>
  </div>
<script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>  
<script src="${ctx}/statics/plugins/amazeui/js/amazeui.min.js"></script>
<script type="text/javascript" src="${ctx}/statics/js/ckplayer.min.js"></script>

<script>

layui.use(['form','laydate','upload'], function(){
    var form = layui.form,
        layer = layui.layer,
        laydate = layui.laydate,
        upload = layui.upload;

    if("${not empty dz}"=="true"){
    	/* var flashvars={
        		p:1,
        		e:1
        		};
        	
        var video=["${dz[0].school_id}"+"->video/mp4"];
        console.log(video)
        var support=['all'];
        CKobject.embedHTML5('video','ckplayer_video1',600,400,video,flashvars,support);    */
        
        var videoObject = {
    			container: '#video',//�?#”代表容器的ID，�??.”或“�?�代表容器的class
    			variable: 'player',//该属性必�?设置，�?�等于下面的new chplayer()的对�?
    			flashplayer:false,//如果强制使用flashplayer则设置成true
    			video:'${dz[0].school_id}'//视频地址
    		};
    	var player=new ckplayer(videoObject);
    }else if("${not empty pt}"=="true"){
    /* 	var flashvars={
        		p:1,
        		e:1
        		};
        	
        var video=["${pt[0].school_id}"+"->video/mp4"];
        console.log(video)
        var support=['all'];
        CKobject.embedHTML5('video1','ckplayer_video1',600,400,video,flashvars,support);    */
        
        var videoObject = {
    			container: '#video1',//�?#”代表容器的ID，�??.”或“�?�代表容器的class
    			variable: 'player',//该属性必�?设置，�?�等于下面的new chplayer()的对�?
    			flashplayer:false,//如果强制使用flashplayer则设置成true
    			video:'${pt[0].school_id}'//视频地址
    		};
    	var player=new ckplayer(videoObject);
    }else if("${not empty gdl}"=="true"){
        var videoObject = {
    			container: '#video1',//�?#”代表容器的ID，�??.”或“�?�代表容器的class
    			variable: 'player',//该属性必�?设置，�?�等于下面的new chplayer()的对�?
    			flashplayer:false,//如果强制使用flashplayer则设置成true
    			video:'${gdl[0].school_id}'//视频地址
    		};
    	var player=new ckplayer(videoObject);
        
    }else if("${not empty gxzy}"=="true"){
        var videoObject = {
    			container: '#video1',//�?#”代表容器的ID，�??.”或“�?�代表容器的class
    			variable: 'player',//该属性必�?设置，�?�等于下面的new chplayer()的对�?
    			flashplayer:false,//如果强制使用flashplayer则设置成true
    			video:'${gxzy[0].path}'//视频地址
    		};
    	var player=new ckplayer(videoObject);
    }else if("${not empty rep}"=="true"){
        var videoObject = {
    			container: '#video1',//�?#”代表容器的ID，�??.”或“�?�代表容器的class
    			variable: 'player',//该属性必�?设置，�?�等于下面的new chplayer()的对�?
    			flashplayer:false,//如果强制使用flashplayer则设置成true
    			video:'${rep[0].school_id}'//视频地址
    		};
    	var player=new ckplayer(videoObject);
    }
    
    
    
});
</script>
</body>
</html>