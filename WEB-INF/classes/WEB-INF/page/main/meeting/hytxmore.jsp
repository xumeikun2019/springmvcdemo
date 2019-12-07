<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>会议提醒更多</title>
	<%@ include file="/common/taglibs.jsp"%>
    <%@ include file="/common/table.jsp"%>
	<meta name="renderer" content="webkit">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="format-detection" content="telephone=no">
	<link rel="stylesheet"  href="${ctx}/statics/css/eleTree.css" />
    <script type="text/javascript" src="${ctx}/statics/js/jquery.table.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/common.js"></script>
    <script type="text/javascript" src="${ctx}/statics/js/jquery.form.min.js"></script>
    <style type="text/css">
       .eleTree{
       	  text-align: left;
       } 
    </style>
</head>

<body>
   <div class="admin-main">


   
   <!--表格区域  -->
   <form id="gridform">
    <table id="goodsdata" class="layui-table site-table table-hover" width="100%" lay-skin="line" >
        <thead>
        <tr>
             <!-- <th width="10px"><input type='checkbox'  class='btn-checkall fly-checkbox' id='selected-all'></th> -->
            <th>会议名称</th>
            <th>会议地点</th>
            <th>会议时间�?</th>
            <th>会议时间�?</th>
        </tr>
        </thead>
    </table>
   </form>
</div>


<script type="text/javascript">

var table;
$(function(){

	var url = '${ctx}/main/meetingOrder/morelist.do';
    var columns = [ //定义�?
        /*{"data": function (obj) {
            return '<input type="checkbox" name="id" class="fly-checkbox" value=' + obj.id + '>';
        }},*/
        {data: "meeting_name"},
        {data: "name"},
        {data: "time_start"},
        {data: "time_end"}
    ];
	$('#goodsdata').table({
        'url':url,
        'columns':columns
    },function (data) {
    	console.log(data);
        table = data;
    });
  
});


</script>
</body>
</html>