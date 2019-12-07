
<%@ page language="java" contentType="text/html; charset=gb2312"
    pageEncoding="utf-8"%>

    <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="gb2312">
	<title>show</title>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<script type="text/javascript" src="<%=basePath %>/finance/statics/js/jquery-1.11.2.min.js"></script>
    <style type="text/css">
    body,html {margin:0; height:100%;font-size:13px;}
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
<input type="hidden" value="${url}"  id="url">
<input type="hidden" value="${type}"  id="type">
<input type="hidden" value="<%=basePath %>"  id="basePath">
<input type="hidden" id="userName" value="${user.username}"> <!-- 褰����ㄦ�� -->
	<div class="mainDiv" >
		<table style="width:100%;height: 100%;" border="0">
			
			<tr>
				<td width="60%;" align="center">
					<table style="width:100%;height: 100%;">
						
						<tr><td align="center" valign="top">
							<div id="mainArea" style="width: 100%;height: 100%;background-color: white;margin-top: 30px;">
							<input type="hidden" id="viewPath" value=""> 
								<table style="width:100%;height: 100%; padding-top: 0px;"  >
									<tr>
										<td id='div_con'  colspan="2">
											<div id="videoArea" style="margin-left: 30%;">
											  
											</div>
										</td>
									</tr>					
														
								</table>
							</div>
						</td></tr>
						
					</table>
				
					
				</td>
			
			</tr>
			
		</table>
	</div>
  <script type="text/javascript">
  //--------------------------------------��涓���浠堕�瑙�-----------------
 //�峰��div��楂�搴�
var msg_height = 0;

var con_height = 0;

var sub_height = 0;

//褰���椤堕�ㄥ����
var cur_top = 0;
var msg = "";
var myInterval; //瀹�涔�瀹��跺�ㄥ�硅薄
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
				var win = document.getElementById('iframe').contentWindow;//绐��ｅ�硅薄
				var iframe = win.document;//iframe��绐���document瀵硅薄
				/* var img = iframe.getElementsByTagName('img');
				for(i=0;i<img.length;i++){
					var src = $(img[i]).attr('src');
					src = src.split('finance')[1];
					src = "\\finance"+src;
					$(img[i]).attr('src',src);
				} */
				var body = "";
				if(type=="word"){
					 body = iframe.getElementsByTagName('html');
				}else if(type=="excel"){
					 body = iframe.getElementsByTagName('table');
				}
				
				//console.log(body);
				 msg = $(body).html();
				//�峰��div��楂�搴�
			     msg_height = $(body).height();
			    //��2娆★�杩��峰���ㄧЩ�ㄥ�����跺��涓��充��虹�扮┖��
			    $('#div_msg').html(msg+msg);
			     con_height = $('#div_con').height();
			     sub_height = con_height - msg_height;
			    //褰���椤堕�ㄥ����
			     cur_top = 0;
			     myInterval = setInterval("scrollme()", 100);
				
			}
			
			//------------------
	}

	  
  }

  //-------------------------婊��ㄦ�规�---------------------------------------
  function scrollme() {
        cur_top--;
 
        //濡����翠釜娑����藉凡缁�涓�绉诲��浜�锛������拌��兼���锛���绉诲�ㄨ�绂�
        if (0 == cur_top + msg_height) {
            cur_top = 0;
        }
 
        $('#div_msg').css('top', cur_top + 'px');
    }
  ///-------------------------------------------------
  
 $(function(){
	 putFile($('#url').val(),$('#type').val());
	 
 });
  
 
  
 
	
    </script>

</body>
</html>