<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改票项信息</title>
</head>
<body>
<table border="1" cellspacing="0"
		style="margin-left: 5%; width: 90%; border-left: 0; border-top: 0; border-right: 0;">
		<br>
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
		<c:forEach items="${listalltickets}" var="listticket">
			<tr style = "text-align:center;">
				<td width="5%;">${listticket.tid }</td>
				<td width="25%;">${listticket.descs }</td>
				<td width="12%;">${listticket.startTime }</td>
				<td width="8%;">${listticket.amount }</td>
				<td width="8%;">${listticket.balance }</td>
				<td width="8%;">${listticket.price }</td>
				<c:if test="${listticket.status==0 }">
					<td width="10%;" id="buyend${listticket.tid}" style = "text-align:center;">
					<font color="red">已停售</font></td>					
					<td width="10%;">
						<input type="button" value="售票" id="buying${listticket.tid }" onclick="buying(${listticket.tid })" />			
						 <input	type="button" value="修改" onclick="updatebuy(${listticket.tid })" />
					</td>
				</c:if>
				<c:if test="${listticket.status==1 }">
					<td width="10%;" id="buyend${listticket.tid }" style = "text-align:center;">售票中</td>
					<td width="10%;">
						<input type="button" value="停售" id="buyend1${listticket.tid }"onclick="buying(${listticket.tid })" /> 
						<input type="button" value="修改" onclick="updatebuy(${listticket.tid })" />
					</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
	<br>
<jsp:useBean id="updateTicketBean" scope="request" class="com.oracle.ebp.domain.UpdateTicketBean"></jsp:useBean>
<c:url var="url" scope="request" value="/ticket/UpdateTicketAction" />
<center>				    	
	<form:form modelAttribute="updateTicketBean" action="${url}">
		<form:hidden path = "tid" value="${listalltickets.get(0).tid}"/>
		描&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;述：<form:input type="text" path="descs" value="${listalltickets.get(0).descs}"/><br/><br/>
		总&nbsp;票&nbsp;数：<form:input type="text" path="amount" value="${listalltickets.get(0).amount }"/><br/><br/>
		剩余票数：<form:input type="text" path="balance" value="${listalltickets.get(0).balance }"/><br/><br/>
		单价(元)：<form:input type="text" path="price" value="${listalltickets.get(0).price }"/><br/><br/>
		<input type="submit" value="修改"/>
		<input type="reset"  value = "重置"/>
	</form:form>
</center>
</body>
<%--
<script type="text/javascript">
	function register(){
		var form1=	document.getElementById("form1");
		form1.submit();
	}
</script>
 --%>

</html>