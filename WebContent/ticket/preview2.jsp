<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Preview</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="../css/index_style.css" rel="stylesheet" type="text/css"
	media="all" />
<script type="text/javascript" src="../js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="../js/move-top.js"></script>
<script type="text/javascript" src="../js/easing.js"></script>
<script type="text/javascript">
	function buyticket(tid, bal1) {
		var buynum = document.getElementById("amount" + tid);

		if (buynum.value == null || buynum.value == "" || buynum.value == "0") {
			alert("请输入正确的票数");

		} else {
			if (buynum.value > bal1) {
				alert("剩余票数不足，请重新输入");
			} else {
				$.ajax({
					type : "post",
					url : "/EBP_19/shoppingcart/addShoppingCart",
					data : {
						quantity : buynum.value,
						tid : tid
					},
					dataType : "text",
					success : function(data) {
						if (data == "ok") {
							alert("购物车添加成功！");
						} else {
							alert("购物车添加失败！");
						}
					}
				});
			}
		}
	}

	function parseUrl() {
		var url = location.href;
		var i = url.indexOf('?');
		if (i == -1)
			return;
		var querystr = url.substr(i + 1);
		var arr1 = querystr.split('&');
		var arr2 = new Object();
		for (i in arr1) {
			var ta = arr1[i].split('=');
			arr2[ta[0]] = ta[1];
		}
		return arr2;
	}
	var v = parseUrl();//解析所有参数
	//alert(v['tid']);//就是你要的结果
</script>
</head>

<body>
	<div class="header">
		<div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<li><a href="/EBP_19/index.jsp">首页</a></li>
						<li><a href="">购票</a></li>
						<li><a href="">发现</a></li>
					</ul>
				</div>
				<div class="account_desc">
					<ul>
						<li><a href="/EBP_19/user/register">注册</a></li>
						<c:if test="${not empty session_user}">
							<li><a href="#">${session_user.name }</a></li>
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
						<c:if test="${not empty session_user}">
							<li><a href="/EBP_19/user/MyAcount.jsp">我的账户</a></li>
						</c:if>
						<c:if test="${empty session_user}">
							<li><a href="/EBP_19/user/MyAcount.jsp">我的账户</a></li>
						</c:if>
					</ul>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="wrap">
			<div class="header_top">
				<div class="logo">
					<a href="/EBP_19/index.jsp"><img src="/EBP_19/images/logo.png"
						alt="" /></a>
				</div>
				<div class="header_top_right">
					<div class="search_box">
						<form>
							<input type="text" value="Search" onfocus="this.value = '';"
								onblur="if (this.value == '') {this.value = 'Search';}"><input
								type="submit" value="">
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

							obj.dd.on('click', function(event) {
								$(this).toggleClass('active');
								event.stopPropagation();
							});
						}
					}

					$(function() {

						var dd = new DropDown($('#dd'));

						$(document).click(function() {
							// all dropdowns
							$('.wrapper-dropdown-2').removeClass('active');
						});

					});
				</script>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<div class="main">
		<div class="wrap">
			<div class="content_top">
				<div class="back-links">
					<p>
						<a href="/EBP_19/index.jsp">Home</a> &gt;&gt;&gt;&gt; <a href="#"
							class="active">English</a>
					</p>
				</div>
				<div class="clear"></div>
			</div>
			<div class="section group">
				<div class="cont-desc span_1_of_2">
					<div class="product-details">
						<div class="grid images_3_of_2">
							<img src="/EBP_19/images/22.jpg" alt="" />
						</div>
						<div class="desc span_3_of_2">
							<h2>分歧者</h2>
							<p>未来社会的人类被分为五个派系，人们必须加入符合自己特征的派系，而翠丝却惊讶地发现她是“分歧者”，不属于任何派系。而分歧者这样的异类也将遭到杀害，翠丝必须争分夺秒躲避危难并扳倒邪恶势力。</p>
							<div class="price">
								<p>
									单价: <span>${buytickesurface.get(1).price}</span>
								</p>
							</div>
							<div class="available">
								<ul>
									<li><span>剩余票数:</span>&nbsp;
										${buytickesurface.get(1).balance}</li>
								</ul>
							</div>
							<div class="share-desc">
								<div class="share">
									<p>购买票数:</p>
									<input class="text_box" type="text"
										id="amount${buytickesurface.get(1).tid}">
								</div>
								<c:if test="${not empty session_user}">
									<div class="button">
										<span><input type="button" value="加入购物车"
											onclick="buyticket(${buytickesurface.get(1).tid},${buytickesurface.get(1).balance})" /></span>
									</div>
								</c:if>
								<c:if test="${empty session_user}">
									<div class="button">
										<span><input type="button" value="加入购物车"
											onclick="backToLogin()" /></span>
									</div>
								</c:if>
								<div class="clear"></div>
							</div>
							<div class="wish-list">
								<ul>
								</ul>
							</div>
						</div>
						<div class="clear"></div>
					</div>
					<div class="product_desc">
						<h2>剧情 :</h2>
						<p>故事的女主角名叫碧翠丝，生活在反乌托邦背景下的芝加哥，那时的社会已经被分成了五个派系，每个派系都是纯粹的美德，每个人都将进入一个派系被培养，这五个派系是：诚实、无私、勇敢、平和、聪明。每年都有一个固定的日期，所有16岁的人必须在这一天选择他们余生将要奉献给的派别。对于碧翠丝，她更想跟家人在一起，于是她做出了一个令所有人（包括她自己在内）惊讶的选择……</p>
					</div>
				</div>
				<div class="rightsidebar span_3_of_1 sidebar">
					<h2>热门推荐</h2>
					<div class="special_movies">
						<div class="movie_poster">
							<a href="preview.html"><img src="../images/end-game.jpg"
								alt="" /></a>
						</div>
						<div class="movie_desc">
							<h3>
								<a href="/EBP_19/ticket/preview2.jsp">End Game</a>
							</h3>
							<p>
								<span>$620.87</span> &nbsp; $500.35
							</p>
							<span><a href="#">Add to Cart</a></span>
						</div>
						<div class="clear"></div>
					</div>
					<div class="special_movies">
						<div class="movie_poster">
							<a href="#"><img src="../images/22.jpg" alt="" /></a>
						</div>
						<div class="movie_desc">
							<h3>
								<a href="#">Coraline</a>
							</h3>
							<p>
								<span>$620.87</span> &nbsp; $500.35
							</p>
							<span><a href="#">加入购物车</a></span>
						</div>
						<div class="clear"></div>
					</div>
					<div class="special_movies">
						<div class="movie_poster">
							<a href="#"><img src="../images/21.jpg" alt="" /></a>
						</div>
						<div class="movie_desc">
							<h3>
								<a href="#">Eclipse</a>
							</h3>
							<p>
								<span>$620.87</span> &nbsp; $500.35
							</p>
							<span><a href="#">加入购物车</a></span>
						</div>
						<div class="clear"></div>
					</div>
					<div class="special_movies">
						<div class="movie_poster">
							<a href="#"><img src="../images/22.jpg" alt="" /></a>
						</div>
						<div class="movie_desc">
							<h3>
								<a href="#">Priest 3D</a>
							</h3>
							<p>
								<span>$620.87</span> &nbsp; $500.35
							</p>
							<span><a href="#">加入购物车</a></span>
						</div>
						<div class="clear"></div>
					</div>
					<div class="special_movies">
						<div class="movie_poster">
							<a href="#"><img src="../images/23.jpg" alt="" /></a>
						</div>
						<div class="movie_desc">
							<h3>
								<a href="preview.html">Sorority Wars</a>
							</h3>
							<p>
								<span>$620.87</span> &nbsp; $500.35
							</p>
							<span><a href="#">加入购物车</a></span>
						</div>
						<div class="clear"></div>
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
				<p>Copyright &copy; 2017.Company name All rights
					reserved.EBP-19组</p>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
		
		function backToLogin(){
			window.location = "/EBP_19/user/login";
		}
	</script>
	<a href="#" id="toTop"><span id="toTopHover"> </span></a>

</body>
</body>
</html>