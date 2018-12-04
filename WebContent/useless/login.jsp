<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8"/>
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="../css/admin.css" tppabs="css/admin.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="../js/jquery.js"></script>
<script src="../js/verificationNumbers.js" tppabs="/js/verificationNumbers.js"></script>
<script src="../js/Particleground.js" tppabs="/js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
  //测试提交，对接程序删除即可
  $(".submit_btn").click(function(){
	  location.href="javascrpt:;"/*tpa=http://***index.html*/;
	  });
});
</script>
</head>
<body>
<jsp:useBean id="loginBean" scope="request" class="com.oracle.ebp.domain.LoginBean"></jsp:useBean>
<c:url var="url" scope="request" value="/admin/login" />
<form:form modelAttribute="loginBean" action="${url}" method="post">
<dl class="admin_login">
 <dt>
  <strong>站点后台管理系统</strong>
  <em>Management System</em>
 </dt>
 <dd class="user_icon">
  <form:input path = "username" placeholder="账号" class="login_txtbx"/>
 </dd>
 <dd><font color="red" size="2"><form:errors path="username" /></font><font color="red" size="2"><form:errors /></font><br></dd>
 <dd class="pwd_icon">
  <form:password path="password" placeholder="密码" class="login_txtbx"/>
 </dd>
 <dd><font color="red" size="2"><form:errors path="password" /></font><br></dd>
 <dd class="val_icon">
  <div class="checkcode">
    <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
    <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
  </div>
  <input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
 </dd>
 <dd>
  <input type="submit" value="立即登陆" class="submit_btn"/>
 </dd>
 <dd>
  <p>©2016-2017 版权所有</p>
  <p>EBP-19组</p>
 </dd>
</dl>
</form:form>
</body>
</html>