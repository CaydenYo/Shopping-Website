<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
    </script>
   <style>
    /*-------------------------------------*/
    
    .cf:before, .cf:after{
      content:"";
      display:table;
    }
    
    .cf:after{
      clear:both;
    }

    .cf{
      zoom:1;
    }

    /*-------------------------------------*/	
    
    .form-wrapper {
        width: 450px;
        padding: 15px;
        margin: 40px auto 50px auto;
        background: #444;
        background: rgba(0,0,0,.2);
        -moz-border-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;
        -moz-box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
        -webkit-box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
        box-shadow: 0 1px 1px rgba(0,0,0,.4) inset, 0 1px 0 rgba(255,255,255,.2);
    }
    
    .form-wrapper input {
        width: 330px;
        height: 20px;
        padding: 10px 5px;
        float: left;    
        font: bold 15px 'lucida sans', 'trebuchet MS', 'Tahoma';
        border: 0;
        background: #eee;
        -moz-border-radius: 3px 0 0 3px;
        -webkit-border-radius: 3px 0 0 3px;
        border-radius: 3px 0 0 3px;      
    }
    
    .form-wrapper input:focus {
        outline: 0;
        background: #fff;
        -moz-box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
        -webkit-box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
        box-shadow: 0 0 2px rgba(0,0,0,.8) inset;
    }
    
    .form-wrapper input::-webkit-input-placeholder {
       color: #999;
       font-weight: normal;
       font-style: italic;
    }
    
    .form-wrapper input:-moz-placeholder {
        color: #999;
        font-weight: normal;
        font-style: italic;
    }
    
    .form-wrapper input:-ms-input-placeholder {
        color: #999;
        font-weight: normal;
        font-style: italic;
    }    
    
    .form-wrapper button {
		overflow: visible;
        position: relative;
        float: right;
        border: 0;
        padding: 0;
        cursor: pointer;
        height: 40px;
        width: 110px;
        font: bold 15px/40px 'lucida sans', 'trebuchet MS', 'Tahoma';
        color: #fff;
        text-transform: uppercase;
        background: #d83c3c;
        -moz-border-radius: 0 3px 3px 0;
        -webkit-border-radius: 0 3px 3px 0;
        border-radius: 0 3px 3px 0;      
        text-shadow: 0 -1px 0 rgba(0, 0 ,0, .3);
    }   
      
    .form-wrapper button:hover{		
        background: #e54040;
    }	
      
    .form-wrapper button:active,
    .form-wrapper button:focus{   
        background: #c42f2f;    
    }
    
    .form-wrapper button:before {
        content: '';
        position: absolute;
        border-width: 8px 8px 8px 0;
        border-style: solid solid solid none;
        border-color: transparent #d83c3c transparent;
        top: 12px;
        left: -6px;
    }
    
    .form-wrapper button:hover:before{
        border-right-color: #e54040;
    }
    
    .form-wrapper button:focus:before{
        border-right-color: #c42f2f;
    }    
    
    .form-wrapper button::-moz-focus-inner {
        border: 0;
        padding: 0;
    }
    </style>
</head>
<body>
	<div class="header">
		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<c:if test="${not empty session_user }">
							<li></li>
						</c:if>
						<c:if test="${empty session_user }">
							<li><a href="/EBP_19/admin/login">管理员登录</a></li>
						</c:if>
						<li><a href="/EBP_19/index.jsp">首页</a></li>
						<c:if test="${not empty session_user }">
							<li><a href="ticket/user_queryTickets">购票</a></li>
						</c:if>
						<c:if test="${empty session_user }">
							<li><a href="#">购票</a></li>
						</c:if>
						<li><a href="">发现</a></li>
					</ul>
				</div>
					<div class="account_desc">
						<ul>
							<li><a href="/EBP_19/user/register">注册</a></li>
							<c:if test="${not empty session_user}">
								<li><a href ="#">${session_user.name }</a></li>
							</c:if>
							<c:if test="${empty session_user}">
								<li><a href="../user/login">登录</a></li>
							</c:if>
							<c:if test="${not empty session_user}">
								<li><a href="/EBP_19/shoppingcart/showCart">购物车</a></li>
							</c:if>
							<c:if test="${empty session_user}">
								<li><a href="user/login.jsp">购物车</a></li>
							</c:if>	
							<c:if test="${not empty session_user}">
								<li><a href="/EBP_19/user/logout">登出</a></li>
							</c:if>
							<c:if test="${empty session_user}">
								<li><a href="#">登出</a></li>
							</c:if>
							<li><a href="/EBP_19/user/MyAcount.jsp">我的账户</a></li>
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
                       </div>
<div style="height: 265px;&#10;    background-color: #c0dfd9;&#10;    background-position: center top;&#10;    background-repeat: no-repeat;">&nbsp;
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
							<a href="/EBP_19/index.jsp"><img src="/EBP_19/images/logo.png" alt="" /></a>
					</div>		  
					<div>
					<form class="form-wrapper cf" action = "/EBP_19/images/queryAllImagesByCondition" method = "post">
						<input type="text" placeholder="Search here..." required name = "search">
						<button type="submit">Search</button>
					</form>
					</div>
					<div class="clear"></div>
					<div class="clear"></div>
  				</div>     		
			     <div class="clear"></div>
   		</div>
   </div>
   <!------------End Header ------------>
  <div class="main">
  	<div class="wrap">
      <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>查询结果</h3>
    		</div>
    	</div>
     </div>
	      <div class="section group" id = "foreach">
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
	       <%-- 
				<div class="grid_1_of_5 images_1_of_5">
					 <a href="preview.html"><img src="images/21.jpg" alt="" /></a>
					 <h2><a href="preview.html">小黄人</a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees">¥42</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><a href="preview.html">加入购物车</a></h4>
							     </div>
							 <div class="clear"></div>
					</div>					 
				</div>
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
					</div>
					--%>				     
				</div>
			</div>
			<%-- 
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
--%>
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