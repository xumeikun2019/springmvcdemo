<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.core.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.excheck.min.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.ztree.exedit.min.js"></script>
    <style type="text/css">
        .aaa{box-shadow:0 0 5px green;}
    </style>
    <script type="text/javascript">
        var setting = {
            edit: {
                enable: true
            },
            data: {
                simpleData: {
                    enable: true
                }
            },edit: {

            	enable: true,

            	showRenameBtn:showRenameBtn
            	},
            callback: {
                onClick: onClick
            }
        };
        var container;
        function  showRenameBtn(treeId, treeNode){
        	return false;
        }
        function showRemoveBtn(treeId, treeNode){
        	//获取节点�?配置的noRemoveBtn属�?��??
        		return true;
        	}
        function init() {
            var url = '${ctx}/sucai/menu.do?uploadUser=${user.username}';
            $.post(url,function (data) {
                var result = data.result;
                if (result == 'ok') {
                    var zNodes = data.data;
                    var treeObj = $.fn.zTree.init($("#treeDemo"), setting, zNodes);
                   // setEdit();
                    var nodes = treeObj.transformToArray(treeObj.getNodes());
                    // 展开除第�?级之外的其他节点
                    for (var i = 0, length_1 = nodes.length; i < length_1; i++) {
                        if(nodes[i].level == 0){
                            continue;
                        }
                        nodes[i].open = true;
                    }
                    //展开第一级节�?
                    treeObj.expandNode(nodes[0], true);
                }
            },'json');
        }
        $(document).ready(function(){

        	init();
            
        });


        function onClick(event, treeId, treeNode, clickFlag) {
            var id = treeNode.id;
            var name = treeNode.name;
            var pNode = treeNode.getParentNode();
            
            if(pNode != null){
            	var pname = pNode.name;
                $('.pMenu').val(pname);
                $('.pMenu2').val(pname);
            }
            $('#menu-hide-name').val(name);
            $('#menu-hide-pid').val(id);
            var path = treeNode.getPath().length; // 获取当前节点 的层级数
            $('#menuLevel').val(path+1);
            var index = treeNode.getIndex(); //  获取同级�? 第几�?
            //console.log(treeNode);
            $('#uploadType').val(treeNode.name);
            $('#rId').val(treeNode.id);
            $('#level').val(treeNode.level);
            
            
            initMainDiv();
        }
        function getLocalTime(nS) { 
        	//将时间戳（十三位时间搓，也就是带毫秒的时间搓）转换成时间格式
        	// d.cTime = 1539083829787
        	let date = new Date(nS);
        	let year = date.getFullYear();
        	let month = date.getMonth()+1;
        	let day = date.getDate();
        	month = month < 10 ? "0"+month:month;
        	day = day < 10 ? "0"+day:day;
        	date = year+'-'+month+'-'+day;
        	console.log(date); // 2018-10-09
        	return date;
        } 
	function initMainDiv(){
		var type=$('#uploadType').val();
		  var param = {
    			  'fId':$('#rId').val(),
    			  'uploadUser': $('#userName').val()
    		  };
    		  $.post('${ctx}/sucai/eshow.do',param,function (data) {
    			  var l = data.data
    			  console.log(l);
    			  var html ="";
    			  html+='<div style="width:100%;height: 20px;">';
    				  html+='<font  face="微软雅黑" size="1" color="green">';
    				  html+=$('#uploadType').val();
    				  html+='</font>';
    				 // html+='<a class="layui-btn layui-btn-danger" style="float:right;" onclick="submitCkeck()">提交选中</a>'
    					  html+='</div>';
      			/**/
      			for(var i=0;i<l.length;i++){
      				//文件大小计算
      				var size ="";
      				if(l[i].size/1024/1024/1024>1){
      					//GB
      					size = (l[i].size/1024/1024/1024).toFixed(2)+"GB";
      				}else if(l[i].size/1024/1024>1&&l[i].size/1024/1024<1024){
      					//MB
      					size = (l[i].size/1024/1024).toFixed(2)+"MB";
      				}else if(l[i].size/1024>1&&l[i].size/1024<1024){
      					//KB
      					size = (l[i].size/1024).toFixed(2)+"KB";
      				}else{
      					size = (l[i].size).toFixed(2)+"B";
      				}
      				//图片预览title
      				var title = '';
      				if(l[i].is_share==0){
							title+='上传名称�?'+l[i].name+' &#10;'+
	          				'上传时间�?'+getLocalTime(l[i].uploadTime)+' &#10;';
							
						}else{
							title+='分享�?  �?'+l[i].upload_user+' &#10;'+
	          				'分享时间�?'+getLocalTime(l[i].shareTime)+' &#10;';                              
						}
      						title+='文件大小�?'+size;
      				
      				//<iframe src="http://localhost:8080/finance/videomedia/20191024/20191024105518_158.mp4"></iframe>
          			html+='<div class="layui-col-md3 " >';
          			html+='  <div class="layui-card aaa" style="height: 13vw;">';
          			html+='  	<div  style="height: 10vw;" style="text-align:center;">';
          			html+='  	 <input id="videourl"  type="hidden" value="'+l[i].path+'">';
          			
          			if(type=="视频"){
	          			html+='         <a href="javaScript:void(0);" onclick="openVideo(\''+l[i].path+'\',\''+type+'\');" title="'+title+'">';
	          			html+='         	<video  src="'+l[i].path+'" style="width:100%;height:100%;object-fit:fill;"/>';
	          		    html+='         </a>';
          			}else if(type=="图片"){
	          			html+='         <a href="javaScript:void(0);" onclick="openVideo(\''+l[i].path+'\',\''+type+'\');" title="'+title+'" >';
	          			html+='         	<img class="layui-upload-img" src="'+l[i].path+'" style="width:100%;height:100%;object-fit:fill;">';
	          		    html+='         </a>';
          			}else if(type=="excel"){
	          			html+='         <a href="javaScript:void(0);"   title="'+title+'" onclick="openVideo(\''+l[i].switchpath+'\',\''+type+'\');">';
	          			html+='         	<img class="layui-upload-img" src="${ctx}/statics/images/jm/excel.png" style="width:60%;height:90%;margin-left:20%;">';
	          		    html+='         </a>';
          			}else if(type=="word"){
	          			html+='         <a href="javaScript:void(0);"  title="'+title+'" onclick="openVideo(\''+l[i].switchpath+'\',\''+type+'\');">';
	          			html+='         	<img class="layui-upload-img" src="${ctx}/statics/images/jm/word.png" style="width:60%;height:90%;margin-left:20%;">';
	          		    html+='         </a>';
          			}else if(type=="pdf"){
	          			html+='         <a href="javaScript:void(0);"   title="'+title+'" onclick="openVideo(\''+l[i].switchpath+'\',\''+type+'\');">';
	          			html+='         	<img class="layui-upload-img" src="${ctx}/statics/images/jm/pdf.png" style="width:60%;height:90%;margin-left:20%;">';
	          		    html+='         </a>';
          			}else if(type=="ppt"){
	          			html+='         <a href="javaScript:void(0);"  title="'+title+'" onclick="openVideo(\''+l[i].switchpath+'\',\''+type+'\');">';
	          			html+='         	<img class="layui-upload-img" src="${ctx}/statics/images/jm/ppt.png" style="width:60%;height:90%;margin-left:20%;">';
	          		    html+='         </a>';
          			}
          		    
          		    html+='    </div>';
          		    html+='     <div style="height: 1.2vw;"  align="center" >';
          		    html+='        		<p id="name" align="center">'+l[i].name+'</p>'; 
          		    
          			html+='    </div>';
          			
          			html+='    <div style="height: 1.8vw;">';
          			html+='        		<p id="name" align="center">';
          			html+='        		<input type="checkbox" name="checkVideo" value="'+l[i].id+'|'+l[i].name+'|'+l[i].path+'|'+l[i].type+'|'+l[i].switchpath+'">';
          			html+='        		</p>';
          			html+='    </div>';
          			
          			
          			html+='   </div>';
          			html+='</div>';
      			}
    			$('#mainDiv').html(html);	
    				
    	      },'json');
	}

	function submitCkeck(){
		    obj = document.getElementsByName("checkVideo");
		    check_val = [];
		    for(k in obj){
		        if(obj[k].checked)
		            check_val.push(obj[k].value);
		    }
          return check_val;
	}
	
	 function openVideo(classVideo,type){
		  
	        //  var classVideo = document.getElementById("videourl").value;
	          var index = layer.open({
	              type: 2,
	              content: '${ctx}/sucai/goLook.do?classVideo='+classVideo+'&type='+type,
	              area: ['1000px', '750px'],
	              offset:'t',
	              maxmin: true,
	              end: function () {
	  
	              }
	          });
}
    </script>
</head>
<body style="background: #eee;">
   <div class="admin-main">
       <%--菜单树形结构--%>
       <div style="width: 17%;float: left;">
           <div class="layui-card">
               <div class="layui-card-header">系统菜单</div>
               <div class="layui-card-body">
                   <ul id="treeDemo" class="ztree"></ul>
               </div>
           </div>
       </div>
	<input type="hidden" id="uploadType" > <!-- 显示类型 -->
	<input type="hidden" id="type" > <!-- 上传类型 -->
	<input type="hidden" id="rId" value="1"> <!-- 当前id -->
	<input type="hidden" id="level" value="1"> <!-- 当前等级 -->
	<input type="hidden" id="userName" value="${user.username}"> <!-- 当前用户 -->
   <div class="admin-main" style="float: right;width: 75%;">
       <!-- 按钮操作 -->
        <div class="table_control">
            <!-- 搜索区域操作 -->
            <!-- <div class="table_search" style="width: 480px;float: right;">
                 <input type="text" id="search" class="keyword" placeholder="请在这里输入关键�?" style="height:25px;"> 
				 <button type="button" class="layui-btn layui-btn-primary layui-btn-small" id="explain"  style="width:70px;height:30px;margin-top: 10px;" onclick="search()">搜索</button>
	             <input id="classId" type="hidden">
            </div> -->

    </div>
<div style="padding: 20px; ">
	

  <div class="layui-row layui-col-space15" id="mainDiv">
   	<div style="width:100%;height: 20px;">
   		
   	</div>
  </div>
  
</div>     	
</div>  

	</div>

   <script type="text/javascript" src="${ctx}/statics/plugins/layui/layui.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
   <script type="text/javascript" src="${ctx}/statics/js/createtab.js" path="${ctx}" id="createTab"></script>
   <script>
   
   </script>

</body>
</html>