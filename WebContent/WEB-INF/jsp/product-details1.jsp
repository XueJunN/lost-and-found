<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="meta description">
<title>Home</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<!--=== Favicon ===-->
<link rel="shortcut icon" href="assets/img/favicon.ico"
	type="image/x-icon" />

<!-- Google fonts include -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,900%7CYesteryear"
	rel="stylesheet">

<!-- All Vendor & plugins CSS include -->
<link href="assets/css/vendor.css" rel="stylesheet">
<!-- Main Style CSS -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="css/style1.css" rel='stylesheet' type='text/css' media="all">

<!--[if lt IE 9]>
<script src="/oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="/oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	function del() {
		var msg = "您真的确定要删除吗？\n\n请确认！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
	function del1() {
		var msg = "您真的确定要注销该账号吗？\n\n请确认！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
<script type="text/javascript">
	$(".tip").hide();
	function checkpas1() {//当第一个密码框失去焦点时，触发checkpas1事件
		var pas1 = document.getElementById("password").value;
		var pas2 = document.getElementById("repassword").value;//获取两个密码框的值
		if (pas1 != pas2 && pas2 != "")//此事件当两个密码不相等且第二个密码是空的时候会显示错误信息
			$(".tip").show();
		else
			$(".tip").hide();//若两次输入的密码相等且都不为空时，不显示错误信息。
	}
	function checkpas() {//当第一个密码框失去焦点时，触发checkpas2件
		var pas1 = document.getElementById("password").value;
		var pas2 = document.getElementById("repassword").value;//获取两个密码框的值
		if (pas1 != pas2) {
			alert("两次输入的密码不一致！");//当两个密码不相等时则显示错误信息
		}
	}
	function checkpas2() {//点击提交按钮时，触发checkpas2事件，会进行弹框提醒以防无视错误信息提交
		var pas3 = document.getElementById("password").value;
		var pas4 = document.getElementById("repassword").value;
		if (pas3 != pas4) {
			alert("两次输入的密码不一致！");
			document.getElementById("sbm").disabled = true;
			return false;
		}
	}
</script>
<script language="javascript">
	function checkForm() {
		if (document.form1.password.value == "") {
			alert('密码不能为空!请重新填写!');
			return false;
		}
		if (document.form1.repassword.value == "") {
			alert('密码不能为空!请重新填写!');
			return false;
		}
	}
</script>

</head>
<style type="text/css">
.img {
	float: right;
}

form#inserttg {
	background: #9cbc2c;
	-webkit-border-radius: 5px;
	border-radius: 5px;
	padding: 20px;
	width: 400px;
	margin: auto;
}

form#inserttg label {
	float: left;
	font-size: 13px;
	width: 110px;
}

form#inserttg ol li {
	background: #b9cf6a;
	background: rgba(255, 255, 255, .3);
	border-color: #e3ebc3;
	border-color: rgba(255, 255, 255, .6);
	border-style: solid;
	border-width: 2px;
	-webkit-border-radius: 5px;
	line-height: 20px;
	list-style: none;
	padding: 5px 10px;
	margin-bottom: 2px;
}

form#inserttg input:not ([type=submit] ):focus {
	background: #eaeaea;
	border: #F00 solid 1px;
}
</style>

</head>

<body>


	<!-- header middle area start -->
	<div class="header-main-area sticky">
		<div class="container">
			<div class="row align-items-center position-relative">

				<!-- start logo area -->
				<div class="col-lg-3">
					<div class="logo">
						<a href="#content1"><p
								style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 150%; color: black">
								欢迎您!${sessionScope.user.username}</p></a>
					</div>
				</div>
				<!-- start logo area -->

				<!-- main menu area start -->
				<div class="col-lg-6 position-static">
					<div class="main-menu-area">
						<div class="main-menu">
							<!-- main menu navbar start -->
							<nav class="desktop-menu">
								<ul>
									<li><a href="toLogin.do"><p
												style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 150%">失物</p></a></li>
									<li><a href="toGoodsLogin.do"><p
												style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 150%">招领</p></a></li>
								</ul>
							</nav>
							<!-- main menu navbar end -->
						</div>
					</div>
				</div>
				<!-- main menu area end -->

				<!-- mini cart area start -->
				<div class="col-lg-3">
					<div class="header-configure-wrapper">
						<div class="header-configure-area">
							<ul class="nav justify-content-end">
								<li><a href="#" class="offcanvas-btn"> <i
										class="lnr lnr-magnifier"></i>
								</a></li>
								<li class="user-hover"><a href="#"> <i
										class="lnr lnr-user"></i>
								</a>
									<ul class="dropdown-list">
										<li><a href="tologinLogin.do">登录</a></li>
										<li><a href="toRegisterLogin.do">注册</a></li>
										<li><a href="toout.do">退出</a></li>
										<li><a href="tomycountLogin.do">用户中心</a></li>
										<li><a
											href="tologoutLogin.do?uid=${sessionScope.user.uid}"
											onclick="javascript:return del1()">注销账号</a></li>
										<li><a href="toadminloginLogin.do">管理员？</a></li>
									</ul></li>
								<li><a href="#" class="minicart-btn"> <i
										class="lnr lnr-heart"></i> <!-- <div class="notification"></div> -->
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- mini cart area end -->

			</div>
		</div>
	</div>
	<!-- header middle area end -->
	</div>
	<!-- main header start -->

	<!-- mobile header start -->
	<div class="mobile-header d-lg-none d-md-block sticky">
		<!--mobile header top start -->
		<div class="container">
			<div class="row align-items-center">
				<div class="col-12">
					<div class="mobile-main-header">
						<div class="mobile-logo">
							<a href="index.html"> <img src="assets/img/logo/logo.png"
								alt="Brand Logo">
							</a>
						</div>
						<div class="mobile-menu-toggler">
							<div class="mini-cart-wrap">
								<a href="#"> <i class="lnr lnr-cart"></i>
								</a>
							</div>
							<div class="mobile-menu-btn">
								<div class="off-canvas-btn">
									<i class="lnr lnr-menu"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- mobile header top start -->
	</div>
	<!-- mobile header end -->
	</header>
	<!-- end Header Area -->

	<!-- off-canvas menu start -->
	<aside class="off-canvas-wrapper">
		<div class="off-canvas-overlay"></div>
		<div class="off-canvas-inner-content">
			<div class="btn-close-off-canvas">
				<i class="lnr lnr-cross"></i>
			</div>

			<div class="off-canvas-inner">
				<!-- search box start -->
				<div class="search-box-offcanvas">
					<form>
						<input type="text" placeholder="Search Here...">
						<button class="search-btn">
							<i class="lnr lnr-magnifier"></i>
						</button>
					</form>
				</div>
				<!-- search box end -->

				<!-- mobile menu start -->
				<div class="mobile-navigation">

					<!-- mobile menu navigation start -->
					<nav>
						<ul class="mobile-menu">
							<li><a href="index.html">首页</a></li>
							<li><a href="shop.html">更多物品</a></li>
							<li><a href="product-details.html">物品详情</a></li>
						</ul>
					</nav>
					<!-- mobile menu navigation end -->
				</div>
				<!-- mobile menu end -->

				<div class="mobile-settings">
					<ul class="nav">
						<li>
							<div class="dropdown mobile-top-dropdown">
								<a href="#" class="dropdown-toggle" id="currency"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> Currency <i class="fa fa-angle-down"></i>
								</a>
							</div>
						</li>
						<li>
							<div class="dropdown mobile-top-dropdown">
								<a href="#" class="dropdown-toggle" id="myaccount"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> My Account <i
									class="fa fa-angle-down"></i>
								</a>
								<div class="dropdown-menu" aria-labelledby="myaccount">
									<a class="dropdown-item" href="#">my account</a> <a
										class="dropdown-item" href="#"> login</a> <a
										class="dropdown-item" href="#">register</a>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<!-- offcanvas widget area start -->
				<div class="offcanvas-widget-area">
					<div class="off-canvas-contact-widget">
						<ul>
							<li><i class="fa fa-mobile"></i> <a href="#">0123456789</a>
							</li>
							<li><i class="fa fa-envelope-o"></i> <a href="#">info@yourdomain.com</a>
							</li>
						</ul>
					</div>
					<div class="off-canvas-social-widget">
						<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
							class="fa fa-twitter"></i></a> <a href="#"><i
							class="fa fa-pinterest-p"></i></a> <a href="#"><i
							class="fa fa-linkedin"></i></a> <a href="#"><i
							class="fa fa-youtube-play"></i></a>
					</div>
				</div>
				<!-- offcanvas widget area end -->
			</div>
		</div>
	</aside>
	<!-- off-canvas menu end -->



	<!-- main wrapper start -->
	<main> <!-- breadcrumb area start -->
	<div class="breadcrumb-area common-bg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb-wrap">
						<nav aria-label="breadcrumb">
							<h1>物品详情</h1>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="toLogin.do"><i
										class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active" aria-current="page">物品详情</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- breadcrumb area end --> <!-- page main wrapper start -->
	<div class="shop-main-wrapper section-space">
		<div class="container">
			<div class="row">
				<!-- product details wrapper start -->
				<div class="col-lg-12 order-1 order-lg-2">
					<!-- product details inner end -->
					<div class="product-details-inner">
						<div class="row">
							<div class="col-lg-5">
								<div class="product-large-slider">
									<div class="pro-large-img img-zoom">
										<img src="assets/img/product/${fg.picture}"
											alt="product-details" width="400px" height="400px" />
									</div>
								</div>
								<div class="pro-nav slick-row-10 slick-arrow-style"></div>
							</div>
							<div class="col-lg-7">
								<div class="product-details-des">
									<h3 class="product-name">${fg.goodname}</h3>
									<div class="ratings d-flex"></div>
									<p class="pro-desc">类型：${fg.classify}</p>
									<p class="pro-desc">捡到地点：${fg.place}</p>
									<p class="pro-desc">
										时间：
										<fmt:formatDate value="${fg.publishdate}" pattern="yyyy-MM-dd" />
									</p>
									<p class="pro-desc">描述：${fg.content}</p>
									<div class="useful-links">
										<a href="#" data-toggle="tooltip" title="刷新"><i
											class="lnr lnr-sync"></i>刷新</a> <a href="#" data-toggle="tooltip"
											title="收藏"><form action="doinsertcollect1.do">
												<input type="hidden" name="goodname" value="${fg.goodname}">
												<input type="hidden" name="content" value="${fg.content}">
												<input type="hidden" name="picture" value="${fg.picture}">
												<input type="hidden" name="uid"
													value="${sessionScope.user.uid}"> <input
													type="hidden" name="fgid"
													value="${sessionScope.findGoods.fgid}"> <i
													class="lnr lnr-heart"></i> <input
													style="background-color: transparent; border: 0px"
													type="submit" value="收藏"><a href="#content"
													data-toggle="tooltip" title="联系发布者"></i>联系发布者</a>
												<p>
													<span style="color: blue">${msg==null?'':msg}</span>
												</p>
											</form></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- product details inner end -->

					<!-- product details reviews start -->
					<div class="product-details-reviews section-space pb-0">
						<div class="row">
							<div class="col-lg-12">
								<div class="product-review-info">
									<ul class="nav review-tab">
										<li><a class="active" data-toggle="tab" href="#tab_one">已提供信息</a>
										</li>
										<li><a data-toggle="tab" href="#tab_three">提供信息</a></li>
									</ul>
									<div class="tab-content reviews-tab">
										<div class="tab-pane fade show active" id="tab_one">
											<c:forEach items="${list}" var="list">
												<c:if test="${list.clo1=='Y'}">
													<div class="total-reviews">
														<div class="rev-avatar">
															<img src="assets/img/about/avatar.jpg" alt="">
														</div>
														<div class="review-box">
															<div class="ratings"></div>
															<div class="post-author">
																<p>
																	<span><a href="">${list.username}</a></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
																	<fmt:formatDate value="${list.created}"
																		pattern="yyyy-MM-dd HH:mm:ss" />
																</p>
															</div>
															<p>${list.information}</p>
															<c:if test="${sessionScope.user.uid==list.uid}">
																<a href="deleteinfotg.do?infoid=${list.infoid}"
																	onclick="javascript:return del()">删除</a>&nbsp;&nbsp;&nbsp;
													<a href="updateinfofg.do?infoid=${list.infoid}">修改</a>
																<c:if test="${list.clo1=='Y'}">
																	<p style="color: green">审核通过</p>
																</c:if>
															</c:if>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
										<div class="tab-pane fade" id="tab_three">
											<form action="insertInfo1.do" class="review-form">
												<div class="total-reviews"></div>
												<div class="form-group row">
													<div class="col">
														<label class="col-form-label"><span
															class="text-danger">*</span> 用户名</label> <input type="text"
															name="username" value="${sessionScope.user.username}"
															class="form-control" required readonly>
													</div>
												</div>
												<div class="form-group row">
													<div class="col">
														<label class="col-form-label"><span
															class="text-danger">*</span> 提供信息</label>
														<textarea name="information" class="form-control" required></textarea>
													</div>
												</div>
												<input type="hidden" name="uid"
													value="${sessionScope.user.uid}"> <input
													type="hidden" name="fgid"
													value="${sessionScope.findGoods.fgid}">
												<center>
													<input type="submit" value="发布" />
												</center>
											</form>
											<!-- end of review-form -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- product details reviews end -->
				</div>
				<!-- product details wrapper end -->
			</div>
		</div>
	</div>
	</main>
	<!-- page main wrapper end -->
	<!-- Start Footer Area Wrapper -->
	<footer class="footer-wrapper">



		<!-- footer bottom area start -->
		<div class="footer-bottom-area">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-md-6 order-2 order-md-1"></div>
					<div class="col-md-6 order-1 order-md-2">
						<div class="footer-social-link">
							<a href="#"></i></a> <a href="#"></i></a> <a href="#"></i></a> <a href="#"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer bottom area end -->

	</footer>
	<!-- End Footer Area Wrapper -->
	<!-- Quick view modal start -->
	<div class="modal" id="quick_view">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<!-- product details inner end -->
					<div class="product-details-inner">
						<div class="row">
							<div class="col-lg-5 col-md-5">
								<div class="product-large-slider">
									<div class="pro-large-img">
										<img src="assets/img/product/product-details-img1.jpg"
											alt="product-details" />
									</div>
									<div class="pro-large-img">
										<img src="assets/img/product/product-details-img2.jpg"
											alt="product-details" />
									</div>
									<div class="pro-large-img">
										<img src="assets/img/product/product-details-img3.jpg"
											alt="product-details" />
									</div>
									<div class="pro-large-img">
										<img src="assets/img/product/product-details-img4.jpg"
											alt="product-details" />
									</div>
								</div>
								<div class="pro-nav slick-row-10 slick-arrow-style">
									<div class="pro-nav-thumb">
										<img src="assets/img/product/product-details-img1.jpg"
											alt="product-details" />
									</div>
									<div class="pro-nav-thumb">
										<img src="assets/img/product/product-details-img2.jpg"
											alt="product-details" />
									</div>
									<div class="pro-nav-thumb">
										<img src="assets/img/product/product-details-img3.jpg"
											alt="product-details" />
									</div>
									<div class="pro-nav-thumb">
										<img src="assets/img/product/product-details-img4.jpg"
											alt="product-details" />
									</div>
								</div>
							</div>
							<div class="col-lg-7 col-md-7">
								<div class="product-details-des quick-details">
									<h3 class="product-name">Orchid flower white stick</h3>
									<div class="ratings d-flex"></div>
									<p class="pro-desc">Lorem ipsum dolor sit amet, consetetur
										sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut
										labore et dolore magna aliquyam erat.</p>
									<div class="useful-links">
										<a href="#" data-toggle="tooltip" title="刷新"><i
											class="lnr lnr-sync"></i>刷新</a> <a href="#" data-toggle="tooltip"
											title="收藏"><i class="lnr lnr-heart"></i>收藏</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- product details inner end -->
				</div>
			</div>
		</div>
	</div>
	<!-- Quick view modal end -->
	<!-- offcanvas search form start -->
	<div class="offcanvas-search-wrapper">
		<div class="offcanvas-search-inner">
			<div class="offcanvas-close">
				<i class="lnr lnr-cross"></i>
			</div>
			<div class="container">
				<div class="offcanvas-search-box">
					<form action="toGoodsLogin.do" class="d-flex bdr-bottom w-100"
						method="post">
						<input type="text" name="goodname"
							value="${goodname==null?'':goodname}"
							placeholder="Search entire storage here...">
						<button class="search-btn">
							<i class="lnr lnr-magnifier"></i><input type="submit"
								style="background-color: transparent; border: 0px" value="搜索" />
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- offcanvas search form end -->

	<!-- offcanvas mini cart start -->
	<div class="offcanvas-minicart-wrapper">
		<div class="minicart-inner">
			<div class="offcanvas-overlay"></div>
			<div class="minicart-inner-content">
				<div class="minicart-close">
					<i class="lnr lnr-cross"></i>
				</div>
				<div class="minicart-content-box">
					<c:forEach items="${list2}" var="cl">
						<c:if test="${sessionScope.user.uid==cl.uid}">
							<c:if test="${cl.clo1=='Y'}">
								<c:if test="${cl.tgid!=null}">
									<div class="minicart-item-wrapper">
										<ul>
											<li class="minicart-item">
												<div class="minicart-thumb">
													<a href="toGoodsDetailLogin.do?tgid=${cl.tgid}"> <img
														src="assets/img/product/${cl.picture}" alt="product">
													</a>
												</div>
												<div class="minicart-content">
													<h3 class="product-name">
														<a href="toGoodsDetailLogin.do?tgid=${cl.tgid}">${cl.goodname}</a>
														<p>
															<img alt="" src="images/zhaoling.jpg" height="30"
																width="50">
														</p>
													</h3>
													<p>
														<span class="cart-quantity">${cl.content}</span>
													</p>
												</div>
												<button class="minicart-remove">
													<a href="delectCollect.do?cid=${cl.cid}"
														onclick="javascript:return del()"><i
														class="lnr lnr-cross"></i></a>
												</button>
											</li>
										</ul>
									</div>
								</c:if>
								<c:if test="${cl.tgid==null}">
									<div class="minicart-item-wrapper">
										<ul>
											<li class="minicart-item">
												<div class="minicart-thumb">
													<a href="toGoodsDetail1Login.do?fgid=${cl.fgid}"> <img
														src="assets/img/product/${cl.picture}" alt="product">
													</a>
												</div>
												<div class="minicart-content">
													<h3 class="product-name">
														<a href="toGoodsDetail1Login.do?fgid=${cl.fgid}">${cl.goodname}</a>
														<p>
															<img alt="" src="images/shiwu.jpg" height="30" width="50">
														</p>
													</h3>
													<p>
														<span class="cart-quantity">${cl.content}</span>
													</p>
												</div>
												<button class="minicart-remove">
													<a href="delectCollect.do?cid=${cl.cid}"
														onclick="javascript:return del()"><i
														class="lnr lnr-cross"></i></a>
												</button>
											</li>
										</ul>
									</div>
								</c:if>
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- offcanvas mini cart end -->

	<div id="content1" class="popup-effect">
		<div class="popup">
			<!--login form-->
			<div class="letter-w3ls">
				<form name="uploadFileForm" id="inserttg" action="toupdateuser.do"
					method="post">
					<input type="hidden" name="uid" value="${sessionScope.user.uid}">
					<input type="hidden" name="email"
						value="${sessionScope.user.email}"> <input type="hidden"
						name="created" value="${sessionScope.user.created}"> <input
						type="hidden" name="status" value="${sessionScope.user.status}">
					<input type="hidden" name="code" value="${sessionScope.user.code}">
					<input type="hidden" name="role" value="${sessionScope.user.role}">
					<ol>
						<li><label for="name">用户名</label><input type="text"
							name="username" id="username"
							value="${sessionScope.user.username}" /></li>
						<li><label for="password">密码</label> <input type="password"
							name="password" id="password" onblur="checkpas1();"
							value="${sessionScope.user.password}" /></li>
						<li><label for="repassword">确认密码</label> <input
							type="password" name="repassword" id="repassword"
							onChange="checkpas();" value="${sessionScope.user.repassword}" /></li>
						<li><input type="submit" id=sbm value="修改"
							onclick="checkpas2();" /></li>
					</ol>
				</form>
				<div class="clear"></div>
			</div>
			<!--//login form-->
			<a class="close" href="#">&times;</a>
		</div>
	</div>

	<!-- popup-->
	<div id="content" class="popup-effect">
		<div class="popup">
			<!--login form-->
			<div class="letter-w3ls">
				<form name="uploadFileForm" id="inserttg" action="insertcontanctfg.do"
					method="post">
					<ol>
						<li><label for="phone">电话号码</label><input type="text"
							name="phone" value="" /></li>
						<input type="hidden" name="uid" value="${sessionScope.user.uid}">
						<input type="hidden" name="fgid"
							value="${sessionScope.findGoods.fgid}">
							<input type="hidden" name="clo2"
							value="${sessionScope.findGoods.phone}">
						<li><input type="submit" value="添加" /></li>
					</ol>
				</form>
				<div class="clear"></div>
			</div>
			<!--//login form-->
			<a class="close" href="#">&times;</a>
		</div>
	</div>
	<!-- //popup -->

	<!-- Scroll to top start -->
	<div class="scroll-top not-visible">
		<i class="fa fa-angle-up"></i>
	</div>
	<!-- Scroll to Top End -->
	<!-- All vendor & plugins & active js include here -->
	<!--All Vendor Js -->
	<script src="assets/js/vendor.js"></script>
	<!-- Active Js -->
	<script src="assets/js/active.js"></script>
</body>

</html>
