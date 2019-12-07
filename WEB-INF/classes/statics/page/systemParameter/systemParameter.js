layui.config({
	base : "js/"
}).use(['form','layer','jquery'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		$ = layui.jquery;

 	var systemParameter;
 	form.on("submit(systemParameter)",function(data){
 		systemParameter = '{"cmsName":"'+$(".cmsName").val()+'",';  //模版名称
 		systemParameter += '"version":"'+$(".version").val()+'",';	 //当前版本
 		systemParameter += '"author":"'+$(".author").val()+'",'; //�?发作�?
 		systemParameter += '"homePage":"'+$(".homePage").val()+'",'; //网站首页
 		systemParameter += '"server":"'+$(".server").val()+'",'; //服务器环�?
 		systemParameter += '"dataBase":"'+$(".dataBase").val()+'",'; //数据库版�?
 		systemParameter += '"maxUpload":"'+$(".maxUpload").val()+'",'; //�?大上传限�?
 		systemParameter += '"userRights":"'+$(".userRights").val()+'",'; //用户权限
 		systemParameter += '"description":"'+$(".description").val()+'",'; //站点描述
 		systemParameter += '"powerby":"'+$(".powerby").val()+'",'; //版权信息
 		systemParameter += '"record":"'+$(".record").val()+'",'; //网站备案�?
 		systemParameter += '"keywords":"'+$(".keywords").val()+'"}'; //默认关键�?
 		window.sessionStorage.setItem("systemParameter",systemParameter);
 		//弹出loading
 		var index = top.layer.msg('数据提交中，请稍�?',{icon: 16,time:false,shade:0.8});
        setTimeout(function(){
            layer.close(index);
			layer.msg("系统基本参数修改成功�?");
        },2000);
 		return false;
 	})


 	//加载默认数据
 	if(window.sessionStorage.getItem("systemParameter")){
 		var data = JSON.parse(window.sessionStorage.getItem("systemParameter"));
 		fillData(data);
 	}else{
 		$.ajax({
			url : "../../json/systemParameter.json",
			type : "get",
			dataType : "json",
			success : function(data){
				fillData(data);
			}
		})
 	}

 	//填充数据方法
 	function fillData(data){
 		$(".version").val(data.version);      //当前版本
		$(".author").val(data.author);        //�?发作�?
		$(".homePage").val(data.homePage);    //网站首页
		$(".server").val(data.server);        //服务器环�?
		$(".dataBase").val(data.dataBase);    //数据库版�?
		$(".maxUpload").val(data.maxUpload);  //�?大上传限�?
		$(".userRights").val(data.userRights);//当前用户权限
		$(".cmsName").val(data.cmsName);      //模版名称
		$(".description").val(data.description);//站点描述
		$(".powerby").val(data.powerby);      //版权信息
		$(".record").val(data.record);      //网站备案�?
		$(".keywords").val(data.keywords);    //默认关键�?
 	}
 	
})
