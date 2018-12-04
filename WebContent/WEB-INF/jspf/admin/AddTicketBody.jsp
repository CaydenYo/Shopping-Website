<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>票项添加</title>
</head>
<script type="text/javascript" src="../js/jquery-1.4.2.js"></script>
<script type="text/javascript" src="../js/jquery-ui-1.8.5.custom.min.js"></script>
<script type="text/javascript" src="../js/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript">
	$(function(){
		$("#date").datepicker();
	});
</script>
<body>
<jsp:useBean id="addTicketBean" scope="request" class="com.oracle.ebp.domain.AddTicketBean"></jsp:useBean>
<c:url var="url" scope="request" value="/ticket/AddTicket" />
<br><br><br><br>
<center>
	<form:form modelAttribute="addTicketBean" action="${url}">
		描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：<form:input type="text" path="descs"/><br/><br/>
		开始时间：<form:input type="date" path="startTime" id="date" style="width:170px;"/><br/><br/>
		总&nbsp;&nbsp;票&nbsp;&nbsp;数：<form:input type="text" path="amount" placeholder="请输入非零整数" pattern="[0-9]*[1-9][0-9]*"/><br/><br/>
		剩余票数：<form:input type="text" path="balance" placeholder="请输入非零整数" pattern="[0-9]*[1-9][0-9]*"/><br/><br/>
		单&nbsp;&nbsp;价(元)：<form:input type="text" path="price" placeholder="请输入数字" pattern="^[0-9]+(.[0-9]{2})?$"/><br/><br/>
		状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：<form:radiobutton path="status" value="1" checked="checked" label="售票中"/>
			  									  <form:radiobutton path="status"  value="0" label="已停售"/><br/><br/>
		<input type="submit" value="提交"/>
		<input type="reset" value="重置"/>
	</form:form>
</center>
</body>
</html>