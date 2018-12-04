<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>充值成功</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/EBP_19/css/common.css" rel="stylesheet" type="text/css" media="all"/>
<link href="/EBP_19/css/tou.css" rel="stylesheet" type="text/css" media="all"/>
 <link rel="stylesheet" href="/EBP_19/css/chongzhisucceed.css">
<script type="text/javascript" src="/EBP_19/js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="/EBP_19/js/move-top.js"></script>
<script type="text/javascript" src="/EBP_19/js/easing.js"></script>
<script type="text/javascript" src="/EBP_19/js/jquery.nivo.slider.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
</head>
<body>
	<div class="header">
		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<li><a href="/EBP_19/index.jsp">首页</a></li>
						<li><a href="ticket/user_queryTickets">购票</a></li>
						<li><a href="">发现</a></li>
					</ul>
				</div>
					<div class="account_desc">
						<ul>
							<li><a href="/EBP_19/user/register.jsp">注册</a></li>
							<li><a href="#">${session_user.name }</a></li>
							<li><a href="#">购物车</a></li>
							<li><a href="/EBP_19/user/logout">登出</a></li>
							<li><a href="/EBP_19/user/MyAcount.jsp">我的账户</a></li>
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
                       </div>
<div><img src="/EBP_19/images/chong.png" width:100%;height='150px'/>&nbsp;</div>
   <!------------End Header ------------>
<!--<div>
        <a href="index.html">时光网</a><span>&nbsp;>&nbsp;</span><a href="chongzhi.html">账户充值<span>&nbsp;>&nbsp;</span></a>充值成功
    </div>-->

<div id="content">
    <div class="look_dd">
        <div>充值成功</div>
        <div id="tbss">
            <a href="/EBP_19/user/TopUpMoney.jsp" id="block" class="input1">返回</a>
        </div>
    </div>
    <div class="chongzhi">
        <h3>本次充值信息如下&nbsp;:&nbsp;</h3>
        <div class="msg">
            <img src="/EBP_19/images/chongzhi1.jpg" >
            <ul class="ul2">
                <li>用&nbsp;&nbsp;户&nbsp;&nbsp;名&nbsp;:&nbsp;<span>${session_user.username }</span></li>
                <li>充值方式&nbsp;:&nbsp;<span> ${requestScope.way}</span></li>
                <li>充值金额&nbsp;:&nbsp;<span> ${requestScope.money}</span></li>
                <li>账户余额&nbsp;:&nbsp;<span>${session_user.balance }</span></li>
                <li></span></li>
                <li></span></li>
            </ul>

        </div>

    </div>



   <div class="footer">
   	  <div class="wrap">	
	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
						<h4>Information</h4>
						<ul>
						<li><a href="#">关于我们</a></li>
						<li><a href="#">用户服务</a></li>
						<li><a href="#">增值服务</a></li>
						<li><a href="#">订单查询</a></li>
						<li><a href="#">联系我们</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Why buy from us</h4>
						<ul>
						<li><a href="#">关于我们</a></li>
						<li><a href="#">顾客服务</a></li>
						<li><a href="#">个人权利</a></li>
						<li><a href="#">地图</a></li>
						<li><a href="#">搜索团队</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>My account</h4>
						<ul>
							<li><a href="#">登录</a></li>
							<li><a href="index.html">查看购物车</a></li>
							<li><a href="#">心愿单</a></li>
							<li><a href="#">查看我的订单</a></li>
							<li><a href="#">帮助</a></li>
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
							      <li><a href="#" target="_blank"><img src="images/facebook.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/twitter.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/skype.png" alt="" /> </a></li>
							      <li><a href="#" target="_blank"> <img src="images/linkedin.png" alt="" /></a></li>
							      <div class="clear"></div>
						     </ul>
   	 					</div>
				</div>
			</div>
			 <div class="copy_right">
				<p>Copyright &copy; 2017.Company name All rights reserved.EBP-19组</p>
		   </div>			
        </div>
    </div>
    <script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>

</body>
</html>