layui.config({
	base : "js/"
}).use(['form','element','layer','jquery'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		element = layui.element,
		$ = layui.jquery;

	$(".panel a").on("click",function(){
		window.parent.addTab($(this));
	})

	//动�?�获取文章�?�数和待审核文章数量,�?新文�?
	/*$.get("${ctx}/statics/json/newsList.json",
		function(data){
			var waitNews = [];
			$(".allNews span").text(data.length);  //文章总数
			for(var i=0;i<data.length;i++){
				var newsStr = data[i];
				if(newsStr["newsStatus"] == "待审�?"){
					waitNews.push(newsStr);
				}
			}
			$(".waitNews span").text(waitNews.length);  //待审核文�?
			//加载�?新文�?
			var hotNewsHtml = '';
			for(var i=0;i<5;i++){
				hotNewsHtml += '<tr>'
		    	+'<td align="left">'+data[i].newsName+'</td>'
		    	+'<td>'+data[i].newsTime+'</td>'
		    	+'</tr>';
			}
			$(".hot_news").html(hotNewsHtml);
		}
	)*/

	/*//图片总数
	$.get("../json/images.json",
		function(data){
			$(".imgAll span").text(data.length);
		}
	)

	//用户�?
	$.get("../json/usersList.json",
		function(data){
			$(".userAll span").text(data.length);
		}
	)

	//新消�?
	$.get("../json/message.json",
		function(data){
			$(".newMessage span").text(data.length);
		}
	)


	//数字格式�?
	$(".panel span").each(function(){
		$(this).html($(this).text()>9999 ? ($(this).text()/10000).toFixed(2) + "<em>�?</em>" : $(this).text());	
	})*/

	//系统基本参数
	/*if(window.sessionStorage.getItem("systemParameter")){
		var systemParameter = JSON.parse(window.sessionStorage.getItem("systemParameter"));
		fillParameter(systemParameter);
	}else{
		$.ajax({
			url : "../json/systemParameter.json",
			type : "get",
			dataType : "json",
			success : function(data){
				fillParameter(data);
			}
		})
	}*/

	//填充数据方法
 	function fillParameter(data){
 		//判断字段数据是否存在
 		function nullData(data){
 			if(data == '' || data == "undefined"){
 				return "未定�?";
 			}else{
 				return data;
 			}
 		}
 		$(".version").text(nullData(data.version));      //当前版本
		$(".author").text(nullData(data.author));        //�?发作�?
		$(".homePage").text(nullData(data.homePage));    //网站首页
		$(".server").text(nullData(data.server));        //服务器环�?
		$(".dataBase").text(nullData(data.dataBase));    //数据库版�?
		$(".maxUpload").text(nullData(data.maxUpload));    //�?大上传限�?
		$(".userRights").text(nullData(data.userRights));//当前用户权限
 	}

})
