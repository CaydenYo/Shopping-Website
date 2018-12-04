<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="myDiv">    
	<form action="user/updateUserById?uid=${session_user.uid}" method="post" onsubmit="return checkForm()">
		用&nbsp;&nbsp;户：<input type="text" name="username" id="username" value="${session_user.username }"/>
		*<font id="usernameF" color="red"></font>
		<br/><br/>
		
		密&nbsp;&nbsp;码：<input type="password" id="password" value="${session_user.password }"/>
		*<font color="red"></font>
		<br/><br/>
		
		确认密码：<input type="password" name="password" id="passwordC" value="${session_user.password }"/>
		*<font id="passwordF" color="red"></font>
		<br/><br/>
		
		真实姓名：<input type="text" name="name" id="name" value="${session_user.name }"/>
		*<font id="nameF" color="red"></font>
		<br/><br/>
		
		性&nbsp;&nbsp;别:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" name="gender" value="1" <c:if test="${session_user.gender==1 }">checked="checked" </c:if>/><img src="images/nan.gif">
		<input type="radio" name="gender" value="0" <c:if test="${session_user.gender==0 }">checked="checked" </c:if>/><img src="images/nv.gif">
		<br/><br/>
		
		身份证号：<input type="text" name="idCard" id="idCard" maxlength="18" value="${session_user.idCard }"/>
		*<font id="idCardF" color="red"></font>
		<br/><br/>
		
		年&nbsp;&nbsp;龄：<input type="number" name="age" id="age" value="${session_user.age }"/>
		*<font id="ageF" color="red"></font>
		<br/><br/>
		
		地&nbsp;&nbsp;址：<input type="text" name="address" id="address" value="${session_user.address }"/>
		*<font id="addressF" color="red"></font>
		<br/><br/>
		
		联系电话：<input type="text" name="telno" id="telno" value="${session_user.telno }"/>
		*<font id="telnoF" color="red"></font>
		<br/><br/>
		
		<input type="submit" value="注册" />
		<input type="reset" value="重置"/>
	</form>
</div>
