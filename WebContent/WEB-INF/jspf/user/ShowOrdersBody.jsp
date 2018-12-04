<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/ticket.css" rel="stylesheet" type="text/css"></link>
</head>
<script type="text/javascript"
	src="/EBP_19/js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript"
	src="/EBP_19/js/jquery-ui-1.8.5.custom.min.js"></script>
<link href="/EBP_19/css/table.css" rel="stylesheet" type="text/css"
	media="all" />
<link type="text/css"
	href="/EBP_19/css/ui-lightness/jquery-ui-1.8.5.custom.css"
	rel="stylesheet" />
<script type="text/javascript">
	$(function(){
		$("#div1").hide();
		
	})
	function showtd(oid){
		/* alert(oid); */
			$.ajax({  
			  url: "orderlist/queryAllOrderList?oid="+oid,  
			  type:'post',
			  dataType:"text",  
			  success:function(data){  
				$("#div1").html(data);
			}
	}); 
		$("#div1").hide();
		$("#div1").show();
	}
	function hidediv() {
		$("#div1").hide();
	}
</script>
<body>
<table id = "table-2" border="0" cellspacing="0" style="margin-left: 5%;width: 90%;background:#edeff0;font-family: 'ambleregular'">
	<tr align="center">
		<th>序  号</th>
		<th>定单号</th>
		<th>生成时间</th>
		<th>金额(元)</th>
	</tr>

	<c:forEach items="${listallorders}" var="list1">
	<tr align="center">
	<td onclick="showtd(${list1.oid })" style="text-align: center;" id = "statu${list1.oid }">+</td>
		<td  style="text-align: center;">${list1.oid }</td>
		<td  style="text-align: center;">${list1.commitTime }</td>
		<td  style="text-align: center;">${list1.amount }</td>
	</tr>
	</c:forEach>
</table>
 <div id="div1" style="margin-left: 5%;width: 90%;height: 100px;"  onclick="hidediv()"></div>
</body>
