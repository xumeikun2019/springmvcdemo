layui.config({
	base : "js/"
}).use(['form','layer','jquery','layedit','laydate'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage,
		layedit = layui.layedit,
		laydate = layui.laydate,
		$ = layui.jquery;

	//创建�?个编辑器
 	var editIndex = layedit.build('links_content');
 	var addLinksArray = [],addLinks;
 	form.on("submit(addLinks)",function(data){
 		//是否添加过信�?
	 	if(window.sessionStorage.getItem("addLinks")){
	 		addLinksArray = JSON.parse(window.sessionStorage.getItem("addLinks"));
	 	}
	 	//显示、审核状�?
 		var homePage = data.field.homePage=="on" ? "首页" : "",
 			subPage = data.field.subPage=="on" ? "子页" : "";
 			showAddress = '';
 		if(subPage == '' && homePage == ''){
 			showAddress = "暂不展示";
 		}else if(homePage == ''){
 			showAddress = subPage;
 		}else if(subPage == ''){
 			showAddress = homePage;
 		}else{
 			showAddress = homePage + '�?' + subPage;
 		}

 		addLinks = '{"linksName":"'+ $(".linksName").val() +'",';  //网站名称
 		addLinks += '"linksUrl":"'+ $(".linksUrl").val() +'",';	 //网站地址
 		addLinks += '"linksDesc":"'+ $(".linksDesc").text() +'",'; //站点描述
 		addLinks += '"linksTime":"'+ $(".linksTime").val() +'",'; //发布时间
 		addLinks += '"masterEmail":"'+ $(".masterEmail").val() +'",'; //站长邮箱
 		addLinks += '"showAddress":"'+ showAddress +'"}';  //展示位置
 		addLinksArray.unshift(JSON.parse(addLinks));
 		window.sessionStorage.setItem("addLinks",JSON.stringify(addLinksArray));
 		//弹出loading
 		var index = top.layer.msg('数据提交中，请稍�?',{icon: 16,time:false,shade:0.8});
        setTimeout(function(){
            top.layer.close(index);
			top.layer.msg("文章添加成功�?");
 			layer.closeAll("iframe");
	 		//刷新父页�?
	 		parent.location.reload();
        },2000);
 		return false;
 	})
	
})
