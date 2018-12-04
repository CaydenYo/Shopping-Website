<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE HTML>
<head>
<style>
.checkout-title {
	position: relative;
	margin-bottom: 41px;
	text-align: center;
}

.checkout-title span {
	position: relative;
	padding: 0 1em;
	background-color: #fff;
	font-family: "moderat", sans-serif;
	font-weight: bold;
	font-size: 20px;
	color: #605F5F;
	z-index: 1;
}

.checkout-title:before {
	position: absolute;
	top: 50%;
	left: 0;
	content: "";
	width: 100%;
	height: 1px;
	background: #ccc;
	z-index: 0;
}
</style>

<title>购物车</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/EBP_19/css/tou.css" rel="stylesheet" type="text/css"
	media="all" />
<link rel="stylesheet" href="/EBP_19/css/common.css" type="text/css"
	media="all" />
<link rel="stylesheet" href="/EBP_19/css/gouwuche.css" type="text/css"
	media="all" />
<script type="text/javascript" src="/EBP_19/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="/EBP_19/js/move-top.js"></script>
<script type="text/javascript" src="/EBP_19/js/easing.js"></script>
<script type="text/javascript" src="/EBP_19/js/jquery.nivo.slider.js"></script>
<script type="text/javascript">
	$(window).load(function() {
		$('#slider').nivoSlider();
	});
	
	function contuen(){
		window.location="/EBP_19/ticket/user_queryTickets";
	}
	function delectbuychar(scid){
		window.location="/EBP_19/shoppingcart/deleteCart?scid="+scid;
	}
	function Checkout(sumMoney){
 		window.location="/EBP_19/user/summaryMoney?sumMoney="+sumMoney;
	}

</script>
</head>
<body>
	<div class="header">
		<div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<c:if test="${not empty session_user}">
								<li></li>
						</c:if>
						<c:if test="${empty session_user}">
								<li><a href = "/EBP_19/admin/login.jsp">管理员登录</a>
						</c:if>
						<li><a href="/EBP_19/index.jsp">首页</a></li>
						<c:if test="${not empty session_user}">
								<li><a href="/EBP_19/ticket/user_queryTickets">购票</a></li>
						</c:if>
						<c:if test="${empty session_user}">
								<li><a href = "#">购票</a>
						</c:if>
						<li><a href="">发现</a></li>
					</ul>
				</div>
					<div class="account_desc">
						<ul>
							<li><a href="user/register.jsp">注册</a></li>
							<c:if test="${not empty session_user}">
								<li><a href="#">${session_user.name }</a></li>
							</c:if>
							<c:if test="${empty session_user}">
								<li><a href="/EBP_19/user/login.jsp">登录</a></li>
							</c:if>
							<li><a href="/EBP_19/shoppingcart/showCart">购物车</a></li>
							<li><a href="/EBP_19/user/logout">登出</a></li>
							<li><a href="/EBP_19/user/MyAcount.jsp">我的账户</a></li>
						</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div>
		<img src="/EBP_19/images/chong.png" width:100%;height='150px' />&nbsp;
	</div>
	<!------------End Header ------------>
	<div>
		<center>
			<div style="width: 1200px; text-align: center;">
				<div class="checkout-title">
					<span>购物车</span>
				</div>
				<table border="0" cellpadding="0" cellspacing="0" id="t">
					<tr bgcolor="#9fa8a3" class="trs" height="50px;">
						<th width="170">商品编号</th>
						<th width="170">购物编号</th>
						<th width="440">描述</th>
						<th width="170">单价(元)</th>
						<th width="170">购票数(张)</th>
						<th width="170">总金额(元)</th>
						<th></th>
					</tr>
					<c:set var="sumMoney" scope="session" value="${0}"></c:set>
					<c:set var="sumTicket" scope="session" value="${0}"></c:set>
					<c:forEach items="${shoppingcartlist}" var="list1">
						<tr id="tr1" class="tfont" align="center" height="50px;">
							<td width="170">${list1.tid  }</td>
							<td width="170">${list1.scid  }</td>
							<td width="30%;">${list1.descs }</td>
							<td width="170">${list1.price }</td>
							<td width="170">${list1.quantity }</td>
							<td width="170">${list1.quantity * list1.price }</td>
							<c:set var="sumTicket" scope="session"
								value="${sumTicket+list1.quantity}"></c:set>
							<c:set var="sumMoney" scope="session"
								value="${sumMoney+list1.price*list1.quantity}"></c:set>
							<td width="10%;"><input type="button" value="删除"
								onclick="delectbuychar(${list1.scid })" /></td>
						</tr>
					</c:forEach>
					<tr>
						<td><b>总计</b></td>
						<td></td>
						<td><font color="red"><b>${errop }</b></font></td>
						<td></td>
						<td><b>${sumTicket}</b></td>
						<td><b>${sumMoney}</b></td>
						<td></td>
					</tr>
				</table>
				<table border="0" cellspacing="0"
					style="margin-left: 5%; width: 100%; margin-top: 2%;">
					<tr>
						<td width="80%" style="text-align: right;"><input
							type="button" style="width: 80px;" value="继续订票"
							onclick="contuen()" /></td>
						<td width="20%"><input type="button" style="width: 80px;"
							value="结 账 " onclick="Checkout(${sumMoney})" /></td>
					</tr>
				</table>
			</div>
		</center>

	</div>
	<div style="height: 654px;"></div>
	<div class="footer">
		<div class="wrap">
			<div class="section group">
				<div class="col_1_of_4 span_1_of_4">
					<h4>Information</h4>
					<ul>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Customer Service</a></li>
						<li><a href="#">Advanced Search</a></li>
						<li><a href="#">Orders and Returns</a></li>
						<li><a href="contact.html">Contact Us</a></li>
					</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Why buy from us</h4>
					<ul>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Customer Service</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="contact.html">Site Map</a></li>
						<li><a href="#">Search Terms</a></li>
					</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>My account</h4>
					<ul>
						<li><a href="contact.html">Sign In</a></li>
						<li><a href="index.html">View Cart</a></li>
						<li><a href="#">My Wishlist</a></li>
						<li><a href="#">Track My Order</a></li>
						<li><a href="contact.html">Help</a></li>
					</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Contact</h4>
					<ul>
						<li><span>+91-123-456789</span></li>
						<li><span>+00-123-000000</span></li>
					</ul>
					<div class="social-icons">
						<h4>Follow Us</h4>
						<ul>
							<li><a href="#" target="_blank"><img
									src="images/facebook.png" alt="" /></a></li>
							<li><a href="#" target="_blank"><img
									src="images/twitter.png" alt="" /></a></li>
							<li><a href="#" target="_blank"><img
									src="images/skype.png" alt="" /> </a></li>
							<li><a href="#" target="_blank"> <img
									src="images/linkedin.png" alt="" /></a></li>
							<div class="clear"></div>
						</ul>
					</div>
				</div>
			</div>
			<div class="copy_right">
				<p>Copyright &copy EBP-19组</p>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<a href="#" id="toTop"><span id="toTopHover"> </span></a>

</body>
</html>

