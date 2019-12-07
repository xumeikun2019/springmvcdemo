/**
 * 
 * @authors Your Name (you@example.org)
 * @date    2016-10-12 09:26:19
 * @version $Id$
 */
var calUtil = {
		//当前人员ID
		  Id:"",
		//当前年份
		  Year:2019,
		  //当前月份
		  Month:1,	
		//当前�?
		  Day:1,	
  //当前日历显示的年�?
  showYear:2019,
  //当前日历显示的月�?
  showMonth:1,
  //当前日历显示的天�?
  showDays:1,
  eventName:"load",
  //初始化日�?
  init:function(id){
    calUtil.setMonthAndDay();
    calUtil.setMonthAndDays();
    if(id!=null){
    	calUtil.Id=id;
    }    
    var datas=calUtil.Year+"/"+calUtil.Month;
	var data=calUtil.showYear+"/"+calUtil.showMonth;
//	console.log(datas +"=="+ data);
//    console.log(new Date(datas) +"=="+ new Date(data));
	var signList=new Array();//正常打卡的天�?(显示蓝色)
	var signLists=new Array();//不正常打卡的天数(显示红色)	
    if(datas==data || new Date(datas) == new Date(data)){//本月日历�?
//    	console.log("本月");
    	var mon=calUtil.showMonth <10? "0"+calUtil.showMonth:calUtil.showMonth;
    	var sj=calUtil.showYear+"-"+mon;
    	
    	$.post('attendanceRecord/findkqxx.do',{'id':calUtil.Id,'sj':sj},function (json) {  
    		for(var i=0;i<json.data.length;i++){   			
    			var sign_time=json.data[i].sign_time;//上班打卡时间
    			var sign_time_day=sign_time.substring(8,10);//上班打卡时间-�?
    			var sign_time_hms=sign_time.substring(11,20);//上班打卡时间-时分�?
    			var type=json.data[i].type;//状�??
    			if(type=="正常"){   				
    				signList.push({"signDay":sign_time_day,"sj":sign_time_hms});
    			}else if(type=="迟到"){
    				signLists.push({"signDay":sign_time_day,"sj":sign_time_hms});
    			}
    			
    		}
    		calUtil.draw(signList,signLists);
            calUtil.bindEnvent();
    	})
    	
    }else if(new Date(datas) < new Date(data)){//本月之后的日历表(不显示打卡信�?)
//    	console.log("本月之后");
    	calUtil.draw(signList,signLists);
        calUtil.bindEnvent();
    }else{//本月之前的日历表(显示打卡信息)
//    	console.log("本月之前");
    	//查询这个月的打卡信息
    	var mon=calUtil.showMonth <10? "0"+calUtil.showMonth:calUtil.showMonth;
    	var sj=calUtil.showYear+"-"+mon;
    	$.post('attendanceRecord/findkqxx.do',{'id':calUtil.Id,'sj':sj},function (json) {  
//    		console.log(json);
    		for(var i=0;i<json.data.length;i++){   			
    			var sign_time=json.data[i].sign_time;//上班打卡时间
    			var sign_time_day=sign_time.substring(8,10);//上班打卡时间-�?
    			var sign_time_hms=sign_time.substring(11,20);//上班打卡时间-时分�?
    			var type=json.data[i].type;//状�??
    			if(type=="正常"){   				
    				signList.push({"signDay":sign_time_day,"sj":sign_time_hms});
    			}else if(type=="迟到"){
    				signLists.push({"signDay":sign_time_day,"sj":sign_time_hms});
    			}
    			
    		}
    		calUtil.draw(signList,signLists);
            calUtil.bindEnvent();
    	})
    	
    }
    
//    signList=[{"signDay":"25","sj":"07:59:22"}];
//    signLists=[{"signDay":"24","sj":"08:59:22"}];
//    console.log(signList);
    
  },
  getNowFormatDate:function() {//获取当前时间(�?)	
		var date = new Date();	
		var seperator1 = "-";	
		var seperator2 = ":";	
		var month = date.getMonth() + 1<10? "0"+(date.getMonth() + 1):date.getMonth() + 1;	
		var strDate = date.getDate()<10? "0" + date.getDate():date.getDate();	
		var currentdate = strDate;	
		return currentdate;
	},
  draw:function(signList,signLists){
    //绑定日历
    var str = calUtil.drawCal(calUtil.showYear,calUtil.showMonth,signList,signLists);
    $("#calendar").html(str);
    //绑定日历表头
    var calendarName=calUtil.showYear+"�?"+calUtil.showMonth+"�?";
    $(".calendar_month_span").html(calendarName);  
  },
  //绑定事件
  bindEnvent:function(){
    //绑定上个月事�?
    $(".calendar_month_prev").click(function(){
      //ajax获取日历json数据 
      var signList=[{"signDay":"10"},{"signDay":"11"},{"signDay":"12"},{"signDay":"13"}];
      calUtil.eventName="prev";
      calUtil.init();
    });
    //绑定下个月事�?
    $(".calendar_month_next").click(function(){
      //ajax获取日历json数据    
      calUtil.eventName="next";
      calUtil.init();
    });
  },
  //获取当前年月
  setMonthAndDays:function(){
        var current = new Date();
        calUtil.Year=current.getFullYear();
        calUtil.Month=current.getMonth() + 1;   
        calUtil.Day=current.getDate()<10? "0" + current.getDate():current.getDate();	  
  },
  //获取当前选择的年�?
  setMonthAndDay:function(){
    switch(calUtil.eventName)
    {
      case "load":
        var current = new Date();
        calUtil.showYear=current.getFullYear();
        calUtil.showMonth=current.getMonth() + 1;
        break;
      case "prev":
        var nowMonth=$(".calendar_month_span").html().split("�?")[1].split("�?")[0];
        calUtil.showMonth=parseInt(nowMonth)-1;
        if(calUtil.showMonth==0)
        {
            calUtil.showMonth=12;
            calUtil.showYear-=1;
        }
        break;
      case "next":
        var nowMonth=$(".calendar_month_span").html().split("�?")[1].split("�?")[0];
        calUtil.showMonth=parseInt(nowMonth)+1;
        if(calUtil.showMonth==13)
        {
            calUtil.showMonth=1;
            calUtil.showYear+=1;
        }
        break;
    }
  },
  getDaysInmonth : function(iMonth, iYear){
   var dPrevDate = new Date(iYear, iMonth, 0);
   return dPrevDate.getDate();
  },
  bulidCal : function(iYear, iMonth) {
   var aMonth = new Array();
   aMonth[0] = new Array(7);
   aMonth[1] = new Array(7);
   aMonth[2] = new Array(7);
   aMonth[3] = new Array(7);
   aMonth[4] = new Array(7);
   aMonth[5] = new Array(7);
   aMonth[6] = new Array(7);
   var dCalDate = new Date(iYear, iMonth - 1, 1);
   var iDayOfFirst = dCalDate.getDay();
   var iDaysInMonth = calUtil.getDaysInmonth(iMonth, iYear);
   var iVarDate = 1;
   var d, w;
   aMonth[0][0] = "�?";
   aMonth[0][1] = "�?";
   aMonth[0][2] = "�?";
   aMonth[0][3] = "�?";
   aMonth[0][4] = "�?";
   aMonth[0][5] = "�?";
   aMonth[0][6] = "�?";
   for (d = iDayOfFirst; d < 7; d++) {
    aMonth[1][d] = iVarDate;
    iVarDate++;
   }
   for (w = 2; w < 7; w++) {
    for (d = 0; d < 7; d++) {
     if (iVarDate <= iDaysInMonth) {
      aMonth[w][d] = iVarDate;
      iVarDate++;
     }
    }
   }
   return aMonth;
  },
  ifHasSigned : function(signList,day){
   var signed = false;
   $.each(signList,function(index,item){	
    if(item.signDay == day) {
     signed = true;
     return false;
    }
   });
   return signed ;
  },
  ifHasSigneds : function(signList,day){
   var signeds = false;
   $.each(signList,function(index,item){	   
    if(item.signDay == day) {
     signeds = true;
     return false;
    }
   });
   return signeds ;
  },
  sj : function(signList,day){//获取正常打卡时间
   var sj = "";
   $.each(signList,function(index,item){	   
    if(item.signDay == day) {
     sj = item.sj;
     return false;
    }
   });
   return sj ;
  },
  sjs : function(signList,day){//获取迟到打卡时间
   var sj = "";
   $.each(signList,function(index,item){	   
    if(item.signDay == day) {
     sj = item.sj;
     return false;
    }
   });
   return sj ;
  },
  drawCal : function(iYear, iMonth ,signList,signLists) {
   var myMonth = calUtil.bulidCal(iYear, iMonth);
   var htmls = new Array();
   htmls.push("<div class='sign_main' id='sign_layer'>");
   htmls.push("<div class='sign_succ_calendar_title'>");
   htmls.push("<div class='calendar_month_next'>下月</div>");
   htmls.push("<div class='calendar_month_prev'>上月</div>");
   htmls.push("<div class='calendar_month_span'></div>");
   htmls.push("</div>");
   htmls.push("<div>");
   htmls.push("<div style='display:flex;justify-content:space-around;margin-bottom:5px';><div style='font-size: 0.3vw;'>星期�?</div><div style='font-size: 0.3vw;'>星期�?</div><div style='font-size: 0.3vw;'>星期�?</div><div style='font-size: 0.3vw;'>星期�?</div><div style='font-size: 0.3vw;'>星期�?</div><div style='font-size: 0.3vw;'>星期�?</div><div style='font-size: 0.3vw;'>星期�?</div></div>");
   htmls.push("</div>");
   htmls.push("<div class='sign' id='sign_cal'>");
   htmls.push("<table style=''>");
   var d, w, wMax;
   if (typeof(myMonth[6][0]) == 'undefined') {
	   wMax = 6;
   } else {
	   wMax = 7;
   }
   for (w = 1; w < wMax; w++) {
    htmls.push("<tr>");
    for (d = 0; d < 7; d++) {
     var ifHasSigned = calUtil.ifHasSigned(signList,myMonth[w][d]);
     var sj = calUtil.sj(signList,myMonth[w][d]);
     var ifHasSigneds = calUtil.ifHasSigneds(signLists,myMonth[w][d]);
     var sjs = calUtil.sj(signLists,myMonth[w][d]);
     if(ifHasSigned){  
//    	 htmls.push("<td class='on' style='width:14%'>" + (!isNaN(myMonth[w][d]) ? myMonth[w][d] : " ") + "</td>");
    	// htmls.push("<td class='on' style='width:14%;'><p style='height:2px'>" + (!isNaN(myMonth[w][d]) ? myMonth[w][d] : " ") +"</p><p style='height:2px'>"+sj+ "</p></td>");
    	 htmls.push("<td class='on' style='width:14%;'><p style='height:15px'>" + (!isNaN(myMonth[w][d]) ? myMonth[w][d] : " ") + "/" + sj + "</p></td>");
     } else {
    	 if(ifHasSigneds){
//    		 htmls.push("<td class='off' style='width:14%'>" + (!isNaN(myMonth[w][d]) ? myMonth[w][d] : " ") + "</td>");
    		// htmls.push("<td class='off' style='width:14%;'><p style='height:15px'>" + (!isNaN(myMonth[w][d]) ? myMonth[w][d] : " ") +"</p><p style='height:2px'>"+sjs+ "</p></td>");
    		 htmls.push("<td class='off' style='width:14%;'><p style='height:15px'>" + (!isNaN(myMonth[w][d]) ? myMonth[w][d] : " ") + "/" + sjs+ "</p></td>");
    	 }else{
    		 htmls.push("<td style='width:14%;'>" + (!isNaN(myMonth[w][d]) ? myMonth[w][d] : " ") + "</td>");
    	 }
     
     }
    }
    htmls.push("</tr>");
   }
   htmls.push("</table>");
   htmls.push("</div>");
   htmls.push("</div>");
   return htmls.join('');
  }
};
