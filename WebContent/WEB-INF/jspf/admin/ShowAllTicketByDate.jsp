<%@ page contentType="text/html" pageEncoding="UTF-8" session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css/ticket.css" rel="stylesheet" type="text/css"></link>
</head>
<script type="text/javascript" src="../js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript">
$(function(){
	$("#stardate").datepicker();
	$("#enddate").datepicker();
});
	function buying(tid) {
		var statu = 1;
		if($("#buyend" + tid).html()=="售票中"){
			statu = 0;
	}
		alert(statu);
				$.ajax({  
					  url: "ticket/updateTicketById",  
					  type:'post',
					  dataType:'text',  
					  data:{  
					  	tid:tid,
					  	statu:statu
						},  
					success:function(data){  
						alert("已跳转更新数据库");
						var d = data;
						if(d=="1"){
							$("#buyend"+tid).html("售票中");
							$("#buying"+tid).val("停售");
							$("#buyend1"+tid).val("停售");
						}else if(d=="0"){
							$("#buyend"+tid).html("<font color='red'>已停售</font>");
							$("#buying"+tid).val("出售");
							$("#buyend1"+tid).val("出售");
						}
					}
				}); 
	}
	function GetTicketBySday_Eday() {
	window.location="GetTicketBySday_Eday?stardate="+$("#stardate").val()+"&enddate="+$("#enddate").val();
	}
</script>
<body>


	<table border="1" cellspacing="0"
		style="margin-left: 5%; width: 90%; border-left: 0; border-top: 0; border-right: 0;">
		<tr> 
			<td colspan="6"
				style="border-left: 0; border-top: 0; border-right: 0; padding-bottom: 2%;">起始日期：<input
				type="date" id="stardate"  name="stardate"/> 终止日期：<input type="date"
				id="enddate"  name="enddate"/><input type="submit" value="查询"
				onclick="GetTicketBySday_Eday()" />
			</td>
			<td colspan="2"
				style="border-left: 0; border-top: 0; border-right: 0; padding-bottom: 2%;"><input
				type="button" value="添加票项" onclick="AddTicket()" /></td>
		</tr>
	</table>
	<c:set var="listalltickets" value="${listalltickets}" scope="page" />
	<c:if test="${not empty pageScope.listalltickets}">
		<table border="1" cellspacing="0"
			style="margin-left: 5%; width: 90%; border-left: 0; border-top: 0; border-right: 0;">
			<tr>
				<th>序号</th>
				<th>描述</th>
				<th>时间</th>
				<th>总票数</th>
				<th>剩余票数</th>
				<th>单价(元)</th>
				<th>状态</th>
				<th></th>
			</tr>
			<c:forEach items="${listalltickets.recordList}" var="listtickets">
				<tr style="text-align: center;">
					<td width="5%;">${listtickets.tid }</td>
					<td width="25%;">${listtickets.descs }</td>
					<td width="12%;">${listtickets.startTime }</td>
					<td width="8%;">${listtickets.amount }</td>
					<td width="8%;">${listtickets.balance }</td>
					<td width="8%;">${listtickets.price }</td>
					<c:if test="${listtickets.status==0 }">
						<td width="10%;" id="buyend${listtickets.tid}"
							style="text-align: center;"><font color="red">已停售</font></td>
						<td width="10%;"><input type="button" value="售票"
							id="buying${listtickets.tid }"
							onclick="buying(${listtickets.tid })" /> <input type="button"
							value="修改" onclick="updatebuy(${listtickets.tid })" /></td>
					</c:if>
					<c:if test="${listtickets.status==1 }">
						<td width="10%;" id="buyend${listtickets.tid }"
							style="text-align: center;">售票中</td>
						<td width="10%;"><input type="button" value="停售"
							id="buyend1${listtickets.tid }"
							onclick="buying(${listtickets.tid })" /> <input type="button"
							value="修改" onclick="updatebuy(${listtickets.tid })" /></td>
					</c:if>
				</tr>
			</c:forEach>
		</table>
		<center>
			<font size="3"><a
				href="ticket/AdminqueryTicketsByDate?currentPage=${listalltickets.currentPage-1}&pageSize=${listalltickets.pageSize}&recordCount=${listalltickets.recordCount}">上一页</a></font>&nbsp;
			<font size="3"><a
				href="ticket/AdminqueryTicketsByDate?currentPage=1&pageSize=${listalltickets.pageSize}&recordCount=${listalltickets.recordCount}">首
					页</a></font>&nbsp; <font size="3"><a
				href="ticket/AdminqueryTicketsByDate?currentPage=${listalltickets.beginPageIndex}&pageSize=${listalltickets.pageSize}&recordCount=${listalltickets.recordCount}">${listalltickets.beginPageIndex}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/AdminqueryTicketsByDate?currentPage=${listalltickets.beginPageIndex+1}&pageSize=${listalltickets.pageSize}&recordCount=${listalltickets.recordCount}">${listalltickets.beginPageIndex+1}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/AdminqueryTicketsByDate?currentPage=${listalltickets.beginPageIndex+2}&pageSize=${listalltickets.pageSize}&recordCount=${listalltickets.recordCount}">${listalltickets.beginPageIndex+2}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/AdminqueryTicketsByDate?currentPage=${listalltickets.beginPageIndex+3}&pageSize=${listalltickets.pageSize}&recordCount=${listalltickets.recordCount}">${listalltickets.beginPageIndex+3}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/AdminqueryTicketsByDate?currentPage=${listalltickets.beginPageIndex+4}&pageSize=${listalltickets.pageSize}&recordCount=${listalltickets.recordCount}">${listalltickets.beginPageIndex+4}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/AdminqueryTicketsByDate?currentPage=${listalltickets.beginPageIndex+5}&pageSize=${listalltickets.pageSize}&recordCount=${listalltickets.recordCount}">${listalltickets.beginPageIndex+5}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/AdminqueryTicketsByDate?currentPage=${listalltickets.pageCount}&pageSize=${listalltickets.pageSize}&recordCount=${listalltickets.recordCount}">总计：
					${listalltickets.pageCount} 页</a></font>&nbsp;&nbsp;&nbsp; <font size="3"><a
				href="ticket/AdminqueryTicketsByDate?currentPage=${listalltickets.currentPage+1}&pageSize=${listalltickets.pageSize}&recordCount=${listalltickets.recordCount}">下一页</a></font>
		</center>
	</c:if>
</body>
<script type="text/javascript">
	function updatebuy(tid){
		window.location="ticket/AdminGetTicketById?tid="+tid;
		//window.location="AddTicket.jsp";
	}
	function AddTicket(){
		window.location="ticket/AddTicket";
	}
</script>
</html>