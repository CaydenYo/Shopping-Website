<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>时光影院管理系统</title>
<link href="css/old_style.css" rel="stylesheet" type="text/css" />
        <link href="css/ui-lightness/jquery-ui-1.8.5.custom.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/jquery-1.6.2.min.js"></script>
		<script type="text/javascript" src="js/jquery-ui-1.8.5.custom.min.js"></script>
		<script type="text/javascript" src="js/jquery.ui.datepicker-zh-CN.js"></script>
<link type="text/css" rel="stylesheet" href="css/admin_index.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/menu.js"></script>
</head>
<body>
<div class="top"></div>
<div id="header">
	<div class="logo">时光影院管理系统</div>
	<div class="navigation">
		<ul>
		 	<li>欢迎您！</li>
			<li>${session_admin.userName}</li>
			<%--
			<li><a href="">修改密码</a></li>
			<li><a href="">设置</a></li>
			 --%>
			<li><a href="admin/logout">退出</a></li>
		</ul>
	</div>
</div>
<div id="content">
	<div class="left_menu">
	<ul id="nav_dot">
      <li>
          <h4 class="M1"><span></span>首页</h4>
        </li>
        <li>
          <h4 class="M2"><span></span>订单管理</h4>
          <div class="list-item none">
            <a href='order/queryAllOrders'>订单查询</a>   
           </div>
        </li>
        <li>
          <h4 class="M3"><span></span>用户管理</h4>
            <div class="list-item none">
            <a href="admin/queryUsers">查询用户</a>
          </div>
        </li>
				<li>
          <h4 class="M4"><span></span>票项管理</h4>
          <div class="list-item none">
            <a href=' ticket/queryTickets'>票项管理</a>
          </div>
        </li>
<%--
<li>
          <h4  class="M6"><span></span>数据统计</h4>
          <div class="list-item none">
            <a href=''>数据统计1</a>
            <a href=''>数据统计2</a>
            <a href=''>数据统计3</a>
          </div>
        </li>
				<li>
          <h4  class="M7"><span></span>奖励管理</h4>
          <div class="list-item none">
            <a href=''>奖励管理1</a>
            <a href=''>奖励管理2</a>
            <a href=''>奖励管理3</a>
          </div>
        </li>
				
				<li>
          <h4  class="M9"><span></span>内容管理</h4>
          <div class="list-item none">
            <a href=''>内容管理1</a>
            <a href=''>内容管理2</a>
            <a href=''>内容管理3</a>
          </div>
        </li>
		<li>
          <h4   class="M10"><span></span>系统管理</h4>
          <div class="list-item none">
            <a href=''>系统管理1</a>
            <a href=''>系统管理2</a>
            <a href=''>系统管理3</a>
          </div>
        </li>
 --%>	
		
  </ul>
		</div>
		<div class="m-right">
			<div class="main">
				<jsp:include page = "${param.mainbody}"/>
			</div>
		</div>
</div>
<div class="bottom"></div>
<div id="footer"><p>EBP-19组</p></div>
<script>navList(12);</script>
</body>
</html>