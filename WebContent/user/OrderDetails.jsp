<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="/EBP_19/css/index_style.css" rel="stylesheet"
	type="text/css" media="all" />
<link href="/EBP_19css/slider.css" rel="stylesheet" type="text/css"
	media="all" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<table border="0" cellspacing="0" style="margin-left: 5%;width: 90%;background:#edeff0;font-family: 'ambleregular'">
		<tr align="center">
			<th>描 述</th>
			<th>单价(元)</th>
			<th>数 量</th>
			<th>金额(元)</th>
		</tr>

		<c:forEach items="${userorderdetails}" var="orderdetails">
			<tr align="center">
				<td>${orderdetails.descs}</td>
				<td>${orderdetails.price}</td>
				<td>${orderdetails.quantity}</td>
				<td>${orderdetails.amount}</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>