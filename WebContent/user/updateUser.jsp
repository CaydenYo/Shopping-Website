<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户修改个人信息</title>
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
<jsp:useBean id="updateUserBean" scope="request" class="com.oracle.ebp.domain.UpdateUserBean"></jsp:useBean>
<c:url var="url" scope="request" value="/user/updateUser" />
<div class="container">
	<div class="container_wrap">
	<div class="header_top">
		    <div class="col-sm-3 logo"><a href="../index.jsp"><img src="../images/logo.png" alt=""/></a></div>
			<div class="col-sm-3 header_right">
			   <ul class="header_right_box">
				 <li></li>
				 <li><p><a href="login.html"></a></p></li>
				 <li class="last"><i class="edit"> </i></li>
				 <div class="clearfix"> </div>
			   </ul>
			</div>
			<div class="clearfix"> </div>
	      </div>
	      <div class="content">
      	     <div class="register">
		  	  <form:form modelAttribute="updateUserBean" action="${url}" method="post"> 
				 <div class="register-top-grid">
					<h3>修改个人信息</h3>
					 <div>
						<span>用户名</span>
						<div><p>${session_user.username}</p></div>
					 </div>
					 <div>
						<span>姓名<label>*</label><label><form:errors path="name" /></label></span>
						<form:input path="name" value = "${session_user.name}"/>
					 </div>
					 <div>
						 <span>家庭住址<label>*</label><label><form:errors path="address" /></label></span>
						 <form:input path="address" value = "${session_user.address}"/> 
					 </div>
					 <div>
						<span>联系方式<label>*</label><label><form:errors path="telno" /></label></span>
						<form:input path="telno"  value = "${session_user.telno}"/>
					 </div>
					<div>
					<span>年龄<label>*</label><label><form:errors path="age" /></label></span>
						<form:input path="age" value = "${session_user.age}"/>
					</div>
					<div>
					<span>身份证号码</span>
						<div><p>${session_user.idCard}</p></div>
					</div>
					<div>
					<span>性别<label>*</label><label><form:errors path="gender" /></label></span>
						<form:radiobutton path="gender" value="1"/>男&nbsp;&nbsp;
						<form:radiobutton path="gender" value="0"/>女
					</div>
					<div class="clearfix"> </div>
					   <a class="news-letter" href="#">
					   </a>
					 </div>
				     <div class="register-bottom-grid">
						 <h3>登录密码</h3>
						 	<div>
								<span>密码<label>*</label><label><form:errors path="password" /></label></span>
								<form:password path="password" style="border:0px;width:96%;height:36px" />
						 	</div>
						 	<div>
								<span>确认密码<label>*</label><label><form:errors path="conPassword" /></label></span>
								<form:password path="conPassword" style="border:0px;width:96%;height:36px"/>
							</div>
							 <div class="clearfix"> </div>
					 </div>
				<div class="clearfix"> </div>
				<div class="register-but"></div>
					   <input type="submit" value="修改">
					   <div class="clearfix"> </div>
				  </form:form>
				</div>
		   </div>
           </div>
    </div>	
</body>
</html>