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
  <link rel="stylesheet" href="${ctx}/statics/plugins/amazeui/page/css/amazeui.page.css">
  <link rel="stylesheet" href="${ctx}/statics/plugins/amazeui/css/app.css">
  <link rel="stylesheet" href="${ctx}/statics/css/index.css">
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
  <li><a href="#">首页</a></li>
  <li class="am-active">平台通知</li>
</ol>
          <div class="am-padding-0 am-list-news-bd news">
		     <ul id="list" class="am-list">
		     	<c:if test="${not empty dz}">
		     	<c:forEach items="${dz}" var="dzList" varStatus="status" end="9">		     		
					<li class="am-list-item-dated am-padding-horizontal-xs">
                   		<a href="${ctx}/user/detail.shtml?id=${dzList.id}" class="am-list-item-hd" target="_blank">${dzList.cname}</a>
			       		<span class="am-list-date">${dzList.last_time}</span>
                 	</li>		       									
				</c:forEach>
				</c:if>
				<c:if test="${not empty pt}">
		     	<c:forEach items="${pt}" var="ptList" varStatus="status" end="9">		     		
					<li class="am-list-item-dated am-padding-horizontal-xs">
                   		<a href="${ctx}/user/detail.shtml?id=${ptList.id}" class="am-list-item-hd" target="_blank">${ptList.cname}</a>
			       		<span class="am-list-date">${ptList.last_time}</span>
                 	</li>		       									
				</c:forEach>
				</c:if>
				<c:if test="${not empty gx}">
		     	<c:forEach items="${gx}" var="gxList" varStatus="status" end="9">		     		
					<li class="am-list-item-dated am-padding-horizontal-xs">
                   		<a href="${ctx}/user/detail.shtml?id=${gxList.id}" class="am-list-item-hd" target="_blank">${gxList.cname}</a>
			       		<span class="am-list-date">${gxList.last_time}</span>
                 	</li>		       									
				</c:forEach>
				</c:if>
				<c:if test="${not empty rep}">
		     	<c:forEach items="${rep}" var="rep" varStatus="status" end="9">		     		
					<li class="am-list-item-dated am-padding-horizontal-xs">
                   		<a href="${ctx}/user/detail.shtml?id=${rep.id}" class="am-list-item-hd" target="_blank">${rep.cname}</a>
			       		<span class="am-list-date">${rep.last_time}</span>
                 	</li>		       									
				</c:forEach>
				</c:if>
             </ul>
             
		</div>
		
		<div id="page" class="page">
		   
		</div>
		
		
     </div>
  </div>
  
  <div class="am-g footer">
     <div class="am-u-sm-12">
           <div class="footer-info" style="color:#004eac">
             <h5>�?术支持：中铝山东工程 · 信息�?术中�?</h5>
          </div>
     </div>
  </div>
  
<script src="${ctx}/statics/plugins/amazeui/js/amazeui.min.js"></script>
<script src="${ctx}/statics/plugins/amazeui/page/js/amazeui.page.js"></script>
<script type="text/javascript">
   $(function(){
	   //返回的是�?个page示例，拥有实例方�?
       var $page = $("#page").page({
           pages: "${pages}", //总页�?
           curr: 1, //当前�? 
           type: 'default', //主题
           groups: 3, //连续显示分页�?
           prev: '<', //若不显示，设置false即可
           next: '>', //若不显示，设置false即可        
           first: "首页",
           last: "尾页", //false则不显示
           before: function(context, next) { //加载前触发，如果没有执行next()则中断加�?
               next();
           },
           render: function(context, $el, index) { //渲染[context：对this的引用，$el：当前元素，index：当前索引]
               //逻辑处理
               if (index == 'last') { //虽然上面设置了last的文字为尾页，但是经过render处理，结果变为最后一�?
                   $el.find('a').html('尾页');
                   return $el; //如果有返回�?�则使用返回值渲�?
               }
               return false; //没有返回值则按默认处�?
           },
           after: function(context, next) { //加载完成后触�?
               next();
           },
           /*
            * 触发分页后的回调，如果首次加载时后端已处理好分页数据则需要在after中判断终止或在jump中判断first是否为假
            */
           jump: function(context, first) {
               var currPage = context.option.curr;
               $.get("${ctx}/user/mores.do?currPage="+currPage+"&id=${type}",function(data){
            	   console.log(data);
            	   var html="";
            	   if("${pages}">currPage){
            		   for(var i=(currPage-1)*10;i<currPage*10;i++){
                		   html+="<li>"+
    								"<a href='${ctx}/user/detail.shtml?id="+data.data[i].id+"' class='am-list-item-hd' target='_blank'>"+data.data[i].cname+"</a>"+
    								"<span class='am-list-date'>"+data.data[i].last_time+"</span>			   "+    		
    							"</li>	"
                	   }
            	   }else if("${pages}"==currPage){
            		   for(var i=(currPage-1)*10;i<data.data.length;i++){
                		   html+="<li>"+
    								"<a href='${ctx}/user/detail.shtml?id="+data.data[i].id+"' class='am-list-item-hd' target='_blank'>"+data.data[i].cname+"</a>"+
    								"<span class='am-list-date'>"+data.data[i].last_time+"</span>			   "+    		
    							"</li>	"
                	   }
            	   }
            	   
            	   $("#list").html(html);
               })
//                $("#list").html("${html}");
				/**
               if(currPage==1){
            	   $("#list").html("<c:if test='${not empty dz}'>"+
   		     							"<c:forEach items='${dz}' var='dzList' varStatus='status'  end='9'>	"+	     		
	     									"<li id='${dzList}'>"+
				    							"<a href='${ctx}/user/detail.shtml?id=${dzList.id}' class='am-list-item-hd' target='_blank'>${dzList.cname}</a>"+
		       									"<span class='am-list-date'>${dzList.last_time}</span>			   "+    		
											"</li>	"+
										"</c:forEach>"+
									"</c:if>"+
									"<c:if test='${not empty pt}'>"+
	     								"<c:forEach items='${pt}' var='ptList' varStatus='status' end='9'>		     	"+	
	     									"<li id='${ptList}'>"+
				    							"<a href='${ctx}/user/detail.shtml?id=${ptList.id}' class='am-list-item-hd' target='_blank'>${ptList.cname}</a>"+
		       									"<span class='am-list-date'>${ptList.last_time}</span>		"+	       		
											"</li>	"+
										"</c:forEach>"+
									"</c:if>");
 //                  alert('当前�?' + currPage + '�?');
               }else{
            	   currPage1=parseInt((currPage-1)+"1");
//                   alert(currPage1);
            	   $("#list").html("<c:if test='${not empty dz}'>"+
   							"<c:forEach items='${dz}' var='dzList' varStatus='status' begin='10' end='19'>	"+	     		
								"<li id='${dzList}'>"+
	    							"<a href='${ctx}/user/detail.shtml?id=${dzList.id}' class='am-list-item-hd' target='_blank'>${dzList.cname}</a>"+
  									"<span class='am-list-date'>${dzList.last_time}</span>			   "+    		
								"</li>	"+
							"</c:forEach>"+
						"</c:if>"+
						"<c:if test='${not empty pt}'>"+
							"<c:forEach items='${pt}' var='ptList' varStatus='status' begin='10' end='19'>		     	"+	
								"<li id='${ptList}'>"+
	    							"<a href='${ctx}/user/detail.shtml?id=${ptList.id}' class='am-list-item-hd' target='_blank'>${ptList.cname}</a>"+
  									"<span class='am-list-date'>${ptList.last_time}</span>		"+	       		
								"</li>	"+
							"</c:forEach>"+
						"</c:if>");
               } */
           }
       });
   });
</script>
</body>
</html>