<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人订单</title>
</head>
<body>
<table border="1" cellspacing="0" style="margin-left: 5%;width: 90%;">
	<tr align="center">
		<th>序  号</th>
		<th>描  述</th>
		<th>单价</th>
		<th>购票张数</th>
		<th>金额</th>
	</tr>

<c:if test="${not empty sessionScope.listallorders}">
	<c:forEach items="${listallorders}" var="list1">
	<tr align="center">
		<td  style="text-align: center;">${list1.lid }</td>
		<td  style="text-align: center;">${list1.descs }</td>
		<td  style="text-align: center;">${list1.price }</td>
		<td  style="text-align: center;">${list1.quantity }</td>
		<td  style="text-align: center;">${list1.amount }</td>
	</tr>
	</c:forEach>
</c:if>
</table>

</body>
</html>
