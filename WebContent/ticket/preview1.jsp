<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
function buyticket(tid,bal1){
		var buynum= document.getElementById("amount"+tid);
		
		if (buynum.value==null||buynum.value==""||buynum.value=="0") {
			alert("请输入正确的票数");
			
		}else{
			if (buynum.value>bal1) {
				alert("剩余票数不足，请重新输入");
			}else {
				$.ajax({
					type:"post",
					url:"/EBP_19/shoppingcart/addShoppingCart",
					data:{
						quantity:buynum.value,
						tid:tid
					},
					dataType:"text",
					success:function(data){
						if(data=="ok"){
							alert("购物车添加成功！");
						}else{
							alert("购物车添加失败！");
						}
					}
				});
			}
		}
	}
	
function parseUrl(){
    var url=location.href;
    var i=url.indexOf('?');
    if(i==-1)return;
    var querystr=url.substr(i+1);
    var arr1=querystr.split('&');
    var arr2=new Object();
    for  (i in arr1){
        var ta=arr1[i].split('=');
        arr2[ta[0]]=ta[1];
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
							<img src="/EBP_19//images/21.jpg" alt="" />
						</div>
						<div class="desc span_3_of_2">
							<h2>神偷奶爸（3）</h2>
							<p>奶爸格鲁与特工露西婚后继续打击犯罪。第三部中的新反派巴萨扎·布莱德是名一度辉煌过的过气童星，因为青春期时他的电视节目被拿掉，导致他怒火中烧走上坏蛋道路并自此活在回忆里。</p>
							<div class="price">
								<p>
									单价: <span>${buytickesurface.get(tid).price}</span>
								</p>
							</div>
							<div class="available">
								<ul>
									<li><span>剩余票数:</span>&nbsp;
										${buytickesurface.get(tid).balance}</li>
								</ul>
							</div>
							<div class="share-desc">
								<div class="share">
									<p>购买票数:</p>
									<input class="text_box" type="text"
										id="amount${buytickesurface.get(tid).tid}">
								</div>
								<c:if test="${not empty session_user}">
									<div class="button">
										<span><input type="button" value="加入购物车"
											onclick="buyticket(${buytickesurface.get(tid).tid},${buytickesurface.get(tid).balance})" /></span>
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
						<p>格鲁和新妻子露西未能打败威胁了人类的新坏蛋，一个执迷于80年代的前童星，巴萨扎·布莱德，他当年突然被剧组解雇，现在一心要向好莱坞复仇。这事使得两人颜面丢尽，还被AVL的新老板开除了。
							小黄人们希望格鲁借此机会回归犯罪生活，但当格鲁明确表示他已不再作恶后，小黄人们辞职离去了。带领了反格鲁罢工的小黄人梅尔，成为了他们的新头领……算是吧。同时，杰瑞和戴夫，恰巧在罢工期间不在的两个小黄人，则在全片中一直留在格鲁和他家人身边。
							被开除后，格鲁感到非常失败，努力地去想接下来该怎么办。就当他似乎跌落谷底时，一个陌生人出现了，通知格鲁他长期疏远的父亲过世了，而且他还有个失散多年的双胞胎弟弟德鲁十分想与他见面。</p>
						<p>得知此事的格鲁十分震惊，去质问了他母亲，而她承认她的确生的是双胞胎。两个孩子出生后不久，她便跟格鲁的父亲离婚，他们说好再不联络，两人各自带走了一个孩子。而她当然还津津乐道地说，格鲁是挑剩的那个。
							格鲁起初对有个弟弟的事十分激动，便带着露西和女儿们去了父亲的家乡，自由乡见他的双胞胎，结果却发现，德鲁似乎事事都胜他一筹。格鲁秃顶、不愿与人来往还刚刚失业，而德鲁则有一头浓密美丽的头发、有天然的魅力而且继承了父亲的大笔财产和养猪场。
							格鲁很快便深深感到自己相形见绌，但没过多久，德鲁就透露了他自己的秘密渴望：追随他们父亲的脚步，成为世界级恶棍。德鲁坦言说由于他们的父亲一直不相信他，他没有接受过任何基本的恶人训练，因而需要格鲁的帮助和知识，好实现他毕生的梦想，并继承家族遗志。
							当格鲁意识到他可以跟弟弟联手，使用他们爸爸的十分精巧的坏蛋工具来终于抓到神出鬼没的巴萨扎•布莱德，他就同意与双胞胎弟弟联盟。但当这份联盟受到了迟来的兄弟竞争的严峻考验，兄弟两人很快发现了他们的不自量力，而布莱特则当真是格鲁目前为止最难对付的死敌。</p>
					</div>
				</div>
				<div class="rightsidebar span_3_of_1 sidebar">
					<h2>热门推荐</h2>
					<div class="special_movies">
						<div class="movie_poster">
							<a href="/EBP_19/ticket/preview1.jsp"><img
								src="../images/end-game.jpg" alt="" /></a>
						</div>
						<div class="movie_desc">
							<h3>
								<a href="preview.html">End Game</a>
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
							<a href="preview.html"><img src="../images/Sorority_Wars.jpg"
								alt="" /></a>
						</div>
						<div class="movie_desc">
							<h3>
								<a href="preview.html">Coraline</a>
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
							<a href="preview.html"><img src="../images/21.jpg" alt="" /></a>
						</div>
						<div class="movie_desc">
							<h3>
								<a href="preview.html">Eclipse</a>
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
							<a href="preview.html"><img src="../images/Priest.jpg" alt="" /></a>
						</div>
						<div class="movie_desc">
							<h3>
								<a href="preview.html">Priest 3D</a>
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
							<a href="preview.html"><img src="../images/Sorority_Wars.jpg"
								alt="" /></a>
						</div>
						<div class="movie_desc">
							<h3>
								<a href="preview.html">Sorority Wars</a>
							</h3>
							<p>
								<span>$620.87</span> &nbsp; $500.35
							</p>
							<span><a href="#">Add to Cart</a></span>
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
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
		
		function backToLogin(){
			window.location = "/EBP_19/user/login";
		}
	</script>
	<a href="#" id="toTop"><span id="toTopHover"> </span></a>

</body>
</html>