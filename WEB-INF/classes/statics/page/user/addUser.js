var $;
layui.config({
	base : "js/"
}).use(['form','layer','jquery'],function(){
	var form = layui.form(),
		layer = parent.layer === undefined ? layui.layer : parent.layer,
		laypage = layui.laypage;
		$ = layui.jquery;

 	var addUserArray = [],addUser;
 	form.on("submit(addUser)",function(data){
 		//是否添加过信�?
	 	if(window.sessionStorage.getItem("addUser")){
	 		addUserArray = JSON.parse(window.sessionStorage.getItem("addUser"));
	 	}

	 	var userStatus,userGrade,userEndTime;
	 	//会员等级
	 	if(data.field.userGrade == '0'){
 			userGrade = "注册会员";
 		}else if(data.field.userGrade == '1'){
 			userGrade = "中级会员";
 		}else if(data.field.userGrade == '2'){
 			userGrade = "高级会员";
 		}else if(data.field.userGrade == '3'){
 			userGrade = "超级会员";
 		}
 		//会员状�??
 		if(data.field.userStatus == '0'){
 			userStatus = "正常使用";
 		}else if(data.field.userStatus == '1'){
 			userStatus = "限制用户";
 		}

 		addUser = '{"usersId":"'+ new Date().getTime() +'",';//id
 		addUser += '"userName":"'+ $(".userName").val() +'",';  //登录�?
 		addUser += '"userEmail":"'+ $(".userEmail").val() +'",';	 //邮箱
 		addUser += '"userSex":"'+ data.field.sex +'",'; //性别
 		addUser += '"userStatus":"'+ userStatus +'",'; //会员等级
 		addUser += '"userGrade":"'+ userGrade +'",'; //会员状�??
 		addUser += '"userEndTime":"'+ formatTime(new Date()) +'"}';  //登录时间
 		console.log(addUser);
 		addUserArray.unshift(JSON.parse(addUser));
 		window.sessionStorage.setItem("addUser",JSON.stringify(addUserArray));
 		//弹出loading
 		var index = top.layer.msg('数据提交中，请稍�?',{icon: 16,time:false,shade:0.8});
        setTimeout(function(){
            top.layer.close(index);
			top.layer.msg("用户添加成功�?");
 			layer.closeAll("iframe");
	 		//刷新父页�?
	 		parent.location.reload();
        },2000);
 		return false;
 	})
	
})

//格式化时�?
function formatTime(_time){
    var year = _time.getFullYear();
    var month = _time.getMonth()+1<10 ? "0"+(_time.getMonth()+1) : _time.getMonth()+1;
    var day = _time.getDate()<10 ? "0"+_time.getDate() : _time.getDate();
    var hour = _time.getHours()<10 ? "0"+_time.getHours() : _time.getHours();
    var minute = _time.getMinutes()<10 ? "0"+_time.getMinutes() : _time.getMinutes();
    return year+"-"+month+"-"+day+" "+hour+":"+minute;
}
