<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$("#stardate").datepicker();
	});
	
	function buyticket(tid,bal1){
		var buynum= document.getElementById("buynum"+tid);
		var errotd= document.getElementById("errotd");
		
		if (buynum.value==null||buynum.value==""||buynum.value=="0") {
			errotd.innerHTML="<font color='red'>请输入正确的票数</font>";
			
		}else{
			if (buynum.value>bal1) {
				errotd.innerHTML="<font color='red'>剩余票数不足，请重新输入</font>";
			}else {
				$.ajax({
					type:"post",
					url:"shoppingcart/addShoppingCart",
					data:{
						quantity:buynum.value,
						tid:tid
					},
					dataType:"text",
					success:function(data){
						if(data=="ok"){
							alert("购物车添加成功！");
						}else{
							alert("购物车添加失败！");
						}
					}
				});
			}
		}
	}
	function location1(){
		window.location="shoppingcart/showCart";
	}
	function queryday(){
	var stardate= document.getElementById("startdate");
	
	if(stardate.value==''){
		window.location="ticket/user_queryTickets";
	}else{
		var starttime = $("#startdate").val();
		window.location="ticket/queryTicketsByDate?date="+starttime;
	}
	
	}

</script>
<body>
	<!-- <div style="margin-left: 5%;padding:0px;background:#edeff0;width:460px;">
请选择起始日期（查询7天以内票项）：<input type="date" id="startdate" name = "begin" value="${param.begin }"/><input type="button" value="查询"  onclick="queryday()"/></div>
 -->
	<br>
	<c:set var="userlistalltickets" value="${userlistalltickets}"
		scope="page" />
	<c:if test="${not empty pageScope.userlistalltickets}">
		<table id="table-2">
			<tr>
				<th>序号</th>
				<th>描述</th>
				<th>时间</th>
				<th>总票数</th>
				<th>剩余票数</th>
				<th>单价(元)</th>
				<th>状态</th>
				<th>购票数</th>
				<th></th>
			</tr>
			<c:forEach items="${userlistalltickets.recordList}"
				var="userlistalltickets">
				<tr align="center">
					<td width="5%;">${userlistalltickets.tid }</td>
					<td width="25%;">${userlistalltickets.descs }</td>
					<td width="12%;">${userlistalltickets.startTime }</td>
					<td width="8%;">${userlistalltickets.amount }</td>
					<td width="8%;">${userlistalltickets.balance }</td>
					<td width="8%;">${userlistalltickets.price }</td>
					<c:if test="${userlistalltickets.status==0 }">
						<td width="10%;" style="color: red; border-color: blue;">已停售</td>
					</c:if>
					<c:if test="${userlistalltickets.status==1 }">
						<td width="10%;">售票中</td>
					</c:if>
					<c:if test="${userlistalltickets.status==0 }">
						<td width="8%;"></td>
					</c:if>
					<c:if test="${userlistalltickets.status==1 }">
						<td width="8%;"><input type="text"
							id="buynum${userlistalltickets.tid }" style="width: 50px;" /></td>
					</c:if>
					<c:if test="${userlistalltickets.status==0 }">
						<td></td>
					</c:if>
					<c:if test="${userlistalltickets.status==1 }">
						<td><input type="button" value="加入购物车"
							onclick="buyticket(${userlistalltickets.tid },${userlistalltickets.balance })" /></td>
					</c:if>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" style="text-align: left; border-right: 0;"
					id="errotd"></td>
				<td colspan="5" style="text-align: right; border-left: 0;"><input
					type="button" onclick="location1()" value="查看购物车/结账" /></td>
			</tr>
		</table>
		<center>
			<font size="3"><a
				href="ticket/user_queryTickets?currentPage=${userlistalltickets.currentPage-1}&pageSize=${userlistalltickets.pageSize}&recordCount=${userlistalltickets.recordCount}">上一页</a></font>&nbsp;
			<font size="3"><a
				href="ticket/user_queryTickets?currentPage=1&pageSize=${userlistalltickets.pageSize}&recordCount=${userlistalltickets.recordCount}">首
					页</a></font>&nbsp; <font size="3"><a
				href="ticket/user_queryTickets?currentPage=${userlistalltickets.beginPageIndex}&pageSize=${userlistalltickets.pageSize}&recordCount=${userlistalltickets.recordCount}">${userlistalltickets.beginPageIndex}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/user_queryTickets?currentPage=${userlistalltickets.beginPageIndex+1}&pageSize=${userlistalltickets.pageSize}&recordCount=${userlistalltickets.recordCount}">${userlistalltickets.beginPageIndex+1}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/user_queryTickets?currentPage=${userlistalltickets.beginPageIndex+2}&pageSize=${userlistalltickets.pageSize}&recordCount=${userlistalltickets.recordCount}">${userlistalltickets.beginPageIndex+2}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/user_queryTickets?currentPage=${userlistalltickets.beginPageIndex+3}&pageSize=${userlistalltickets.pageSize}&recordCount=${userlistalltickets.recordCount}">${userlistalltickets.beginPageIndex+3}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/user_queryTickets?currentPage=${userlistalltickets.beginPageIndex+4}&pageSize=${userlistalltickets.pageSize}&recordCount=${userlistalltickets.recordCount}">${userlistalltickets.beginPageIndex+4}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/user_queryTickets?currentPage=${userlistalltickets.beginPageIndex+5}&pageSize=${userlistalltickets.pageSize}&recordCount=${userlistalltickets.recordCount}">${userlistalltickets.beginPageIndex+5}</a></font>&nbsp;
			<font size="3"><a
				href="ticket/user_queryTickets?currentPage=${userlistalltickets.pageCount}&pageSize=${userlistalltickets.pageSize}&recordCount=${userlistalltickets.recordCount}">总计：
					${userlistalltickets.pageCount} 页</a></font>&nbsp;&nbsp;&nbsp; <font size="3"><a
				href="ticket/user_queryTickets?currentPage=${userlistalltickets.currentPage+1}&pageSize=${userlistalltickets.pageSize}&recordCount=${userlistalltickets.recordCount}">下一页</a></font>
		</center>
	</c:if>
</body>
</html>