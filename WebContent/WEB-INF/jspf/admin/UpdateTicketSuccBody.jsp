<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>操作成功</title>
</head>
<body>
	<c:url var="url" scope="request" value="/ticket/queryTickets" />
	<center>
	<form:form action="${url}" method="post">
	<h1>操作成功！</h1>
	<input type = "submit" value = "确认"/>
	</form:form>
	</center>
</body>
</html>