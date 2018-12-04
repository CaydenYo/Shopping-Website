<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>
<title>时光影院首页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="/EBP_19/css/index_style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="/EBP_19/css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="/EBP_19/js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="/EBP_19/js/move-top.js"></script>
<script type="text/javascript" src="/EBP_19/js/easing.js"></script>
<script type="text/javascript" src="/EBP_19/js/jquery.nivo.slider.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    
	$(document).ready(function showTicket(){
		$.ajax({
			type: "post",
			url: "images/queryAllImages",
			async: true,
			dataType:"text",
			cache:false,
			success: function(data) {
				$("#foreach").html(data);
			},
			error: function(e) {
			alert(e);
			//请求失败时调用此函数
			}
			}); 
	})
		
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
								<li><a href = "admin/login.jsp">管理员登录</a>
						</c:if>
						<li><a href="index.jsp">首页</a></li>
						<c:if test="${not empty session_user}">
								<li><a href="ticket/user_queryTickets">购票</a></li>
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
								<li><a href="user/login.jsp">登录</a></li>
							</c:if>
							<c:if test="${not empty session_user}">
								<li><a href="/EBP_19/shoppingcart/showCart">购物车</a></li>
							</c:if>
							<c:if test="${empty session_user}">
								<li><a href="user/login.jsp">购物车</a></li>
							</c:if>	
							<li><a href="user/logout">登出</a></li>
							<li><a href="user/MyAcount.jsp">我的账户</a></li>
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
                       </div>
<div style="height: 465px;&#10;    background-color: #c0dfd9;&#10;    background-position: center top;&#10;    background-repeat: no-repeat;">&nbsp;
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
						<a href="index.jsp"><img src="images/logo.png" alt="" /></a>
					</div>
						<div class="header_top_right">
							  <div class="search_box">
					     		<form action = "images/queryAllImagesByCondition" method = "post">
					     			<input type="text" placeholder="Search" name = "search"/><input type="submit" value="">
					     		</form>
					     	</div>
						 <div class="clear"></div>
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
					<div class="header_bottom_left">				
						<div class="categories">
						   <ul>
						  	   <h3>Categories</h3>
							      <li><a href="#">演唱会</a></li>
							      <li><a href="#">音乐会</a></li>
							      <li><a href="#">话剧歌剧</a></li>
							      <li><a href="#">舞蹈芭蕾</a></li>
							      <li><a href="#">曲苑杂坛</a></li>
							       <li><a href="#">体育比赛</a></li>
							       <li><a href="#">独家放映</a></li>
							       <li><a href="#">儿童亲子</a></li>
							       <li><a href="#">展会展览</a></li>
							       <li><a href="#">华语</a></li>
							       <li><a href="#">喜剧</a></li>
							       <li><a href="#">惊悚</a></li>
						  	 </ul>
						</div>					
		  	         </div>
						    <div class="header_bottom_right">					 
						 	    <!------ Slider ------------>
								  <div class="slider">
							      	<div class="slider-wrapper theme-default">
							            <div id="slider" class="nivoSlider">
							                <img src="images/1.jpg" data-thumb="images/1.jpg" alt="" />
							                <img src="images/2.jpg" data-thumb="images/2.jpg" alt="" />
							                <img src="images/3.jpg" data-thumb="images/3.jpg" alt="" />
							                <img src="images/4.jpg" data-thumb="images/4.jpg" alt="" />
							                 <img src="images/5.jpg" data-thumb="images/5.jpg" alt="" />
							            </div>
							        </div>
						   		</div>
						<!------End Slider ------------>
			         </div>
			     <div class="clear"></div>
			</div>
   		</div>
   </div>
   <!------------End Header ------------>
  <div class="main">
  	<div class="wrap">
      <div class="content">
     </div>
	      <div id = "foreach" class="section group">
				<%--
				<div class="grid_1_of_5 images_1_of_5">
					 <a href="preview.html"><img src="images/22.jpg" alt="" /></a>
					 <h2><a href="preview.html">新木乃伊</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">¥62</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
					 
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					<a href="preview.html"><img src="images/23.jpg" alt="" /></a>
					 <h2><a href="preview.html">冯老</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">¥62</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				    
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					<a href="preview.html"><img src="images/24.jpg" alt="" /></a>
					 <h2><a href="preview.html">大主裁</a></h2>
					 <div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">¥62</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					<a href="preview.html"><img src="images/25.jpg" alt="" /></a>
					 <h2><a href="preview.html">金马县</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">¥62</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>--%>			     
				</div>
			</div>
			<div class="content_bottom">
    		<div class="heading">
    		<h3>正在热映</h3>
    		</div>
    	  </div>
			<div class="section group">
				<div class="grid_1_of_5 images_1_of_5">
					 <a href="preview.html"><img src="images/26.jpg" alt="" /></a>
					 <h2><a href="preview.html">木乃伊</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">¥62</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
					 
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					 <a href="preview.html"><img src="images/27.jpg" alt="" /></a>
					 <h2><a href="preview.html">木乃伊</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">¥62</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
					 
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					<a href="preview.html"><img src="images/28.jpg" alt="" /></a>
					 <h2><a href="preview.html">冈仁波齐 (2015)</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$899.75</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				    
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					<a href="preview.html"><img src="images/29.jpg" alt="" /></a>
					 <h2><a href="preview.html">京城81号</a></h2>
					 <div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">$599.00</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					<a href="preview.html"><img src="images/30.jpg" alt="" /></a>
					 <h2><a href="preview.html">愤怒的小鸟</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">¥39</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					 </div>				     
				</div>
			</div>
       </div>
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