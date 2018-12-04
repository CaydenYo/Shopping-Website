<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:forEach items="${getTicketDetailList}" var="listticket" varStatus="loop">
				<div class="grid_1_of_5 images_1_of_5" style = "width:160px;">
					 <a href="/EBP_19/ticket/preview${listticket.tid}.jsp?tid=${listticket.tid}"><img src="/EBP_19/${listticket.images }" alt="" /></a>
					 <h2><a href="/EBP_19/ticket/preview${listticket.tid}.jsp?tid=${listticket.tid}">${listticket.descs }</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">${buytickesurface[loop.count-1].price}</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="/EBP_19/ticket/preview${listticket.tid}.jsp?tid=${listticket.tid}">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>			 
				</div>
				</c:forEach>
</body>
</html>