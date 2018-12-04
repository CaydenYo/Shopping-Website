<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    <title>个人账户界面</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/index_style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
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
							<li><a>${session_user.name }</a></li>
							<c:if test="${not empty session_user}">
								<li><a href="/EBP_19/shoppingcart/showCart">购物车</a></li>
							</c:if>
							<c:if test="${empty session_user}">
								<li><a href="user/login.jsp">购物车</a></li>
							</c:if>	
							<li><a href="/EBP_19/user/logout">登出</a></li>
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
                       </div>
<div style="height: 550px;&#10;    background-color: #c0dfd9;&#10;    background-position: center top;&#10;    background-repeat: no-repeat;">&nbsp;
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
						<a href="/EBP_19/index.jsp"><img src="images/logo.png" alt="" /></a>
					</div>
						  <script type="text/javascript">
								function DropDown(el) {
									this.dd = el;
									this.initEvents();
								}
								DropDown.prototype = {
									initEvents : function() {
										var obj = this;
					
										obj.dd.on('click', function(event){
											$(this).toggleClass('active');
											event.stopPropagation();
										});	
									}
								}
					
								$(function() {
					
									var dd = new DropDown( $('#dd') );
					
									$(document).click(function() {
										// all dropdowns
										$('.wrapper-dropdown-2').removeClass('active');
									});
					
								});
					    </script>
			 <div class="clear"></div>
  		</div>     
				<div class="header_bottom">
					<div class="header_bottom_left" style="width:20%">				
						<div class="categories" style = "width:185px;">
						   <ul>
						  	   <center><h3>Categories</h3></center>
							      <li><a href="/EBP_19/index.jsp">首&nbsp;&nbsp;&nbsp;页</a><li>
                            	  <li><a href="/EBP_19/ticket/user_queryTickets">在线订票</a><li>
                           		  <li><a href="/EBP_19/order/queryUserOrders">我的订单</a><li>
                            	  <li><a href="/EBP_19/user/updateUser.jsp">个人信息</a><li>
                            	  <li><a href="/EBP_19/user/TopUpMoney.jsp">账户充值</a><li>
						  	 </ul>
						</div>					
		  	         </div>
						    <div class="header_bottom_right">					 
						 	    <!------ main------------>
								
              <div>
					<jsp:include page="${param.mainbody}"/> 
              </div>
						<!------End main ------------>
			         </div>
			         
			     <div class="clear"></div>
			</div>
   		</div>
   </div>
   <!------------End Header ------------>
  <div>

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
							      <li><a href="#" target="_blank"><img src="../images/facebook.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="../images/twitter.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="../images/skype.png" alt="" /> </a></li>
							      <li><a href="#" target="_blank"> <img src="../images/linkedin.png" alt="" /></a></li>
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

         