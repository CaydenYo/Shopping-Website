<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Movie_store Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="../css/bootstrap.css" rel='stylesheet' type='text/css' />
<link href="../css/user.css" rel="stylesheet" type="text/css" media="all" />
<!-- start plugins -->
<script type="text/javascript" src="../js/jquery-1.11.1.min.js"></script>
<link href='' rel='stylesheet' type='text/css'>
</head>
<body>
<jsp:useBean id="loginBean" scope="request" class="com.oracle.ebp.domain.LoginBean"></jsp:useBean>
<c:url var="url" scope="request" value="/user/login" />
<div class="container">
	<div class="container_wrap">
	<div class="header_top">
		    <div class="col-sm-3 logo"><a href="../index.jsp"><img src="../images/logo.png" alt="" /></a></div>
			<div class="col-sm-3 header_right">
			   <ul class="header_right_box">
				 <li class="last"><i class="edit"> </i></li>
				 <div class="clearfix"> </div>
			   </ul>
			</div>
			<div class="clearfix"> </div>
	      </div>
	      <div class="content">
      	     <div class="register">
			   <div class="col-md-6 login-left">
			  	 <h3>新用户</h3>
				 <p>通过在我们的商店创建一个帐户，您将能够更快地浏览结帐过程，存储多个送货地址，查看和跟踪您的订单在您的帐户和更多。</p>
				 <a class="acount-btn" href="register.jsp">创建一个用户</a>
			   </div>
			   <div class="col-md-6 login-right">
			  	<h3>已注册用户</h3>
				<p>如果您已经拥有账号，请登录</p>
				<form:form modelAttribute="loginBean" action="${url}" method="post">
				  <p><font color="red" size="2"><form:errors /></font></p>
				  <div>
					<span>用户名<label>*</label><label><form:errors path="username" /></label></span>
					<form:input path="username"/>
				  </div>
				  <div>
					<span>密码<label>*</label><label><form:errors path="username" /></label></span>
					<form:password style = "border:0px;width:96%;height:39px;" path="password"/>
				  </div>
				  <input type="submit" value="登录">
			    </form:form>
			   </div>	
			   <div class="clearfix"> </div>
		     </div>
           </div>
    </div>
</div>
	
</body>
</html>