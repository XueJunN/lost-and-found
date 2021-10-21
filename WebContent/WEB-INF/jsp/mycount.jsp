<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="meta description">
<title>用户中心</title>
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
<link href="css/dashboard.css" rel="stylesheet">

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
<script type="text/javascript">
	$(function() {
		//第1种写法 
		/* 	$(".nav-link").hover(function(){
				//$(this).toggleClass("active");
			}); */

		//第2种玩法 
		$(".nav-link").hover(function() {
			$(this).addClass("active");
		}, function() {
			$(this).removeClass("active");
		});
	});
</script>
<style type="text/css">
</style>
</head>

<body>


	<!-- header middle area start -->
	<div class="header-main-area sticky">
		<div class="container">
			<div class="row align-items-center position-relative">

				<!-- start logo area -->
				<div class="col-lg-3">
					
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
							</ul>
						</div>
					</div>
				</div>
				<!-- mini cart area end -->

			</div>
		</div>
	</div>
	<!-- header middle area end -->


	<div class="breadcrumb-area common-bg">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="breadcrumb-wrap">
						<nav aria-label="breadcrumb">
							<h1>用户中心</h1>
							<ul class="breadcrumb">
								<li class="breadcrumb-item"><a href="toLogin.do"><i
										class="fa fa-home"></i></a></li>
								<li class="breadcrumb-item active" aria-current="page">用户中心</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="sidebar-sticky pt-3">
					<ul class="nav flex-column">
							<li class="nav-item"><a class="nav-link" href="tomycountLogin.do"> <span
									data-feather="home"></span> 发布失物管理<span class="sr-only"></span>
							</a></li>
							<li class="nav-item"><a class="nav-link" href="tomycountfgLogin.do"> <span
									data-feather="show"></span>发布招领管理
							</a></li>
					</ul>
				</div>
			</nav>
			
	
	<!-- offcanvas search form start -->
	<div class="offcanvas-search-wrapper">
		<div class="offcanvas-search-inner">
			<div class="offcanvas-close">
				<i class="lnr lnr-cross"></i>
			</div>
			<div class="container">
				<div class="offcanvas-search-box">
					<center><form action="tomycountLogin.do" class="d-flex bdr-bottom w-100" method="post">
						<input type="text" name="goodname"
							value="${goodname==null?'':goodname}" style="width:80%"
							placeholder="Search here..."><button class="search-btn"><i
							class="lnr lnr-magnifier"></i><input type="submit"
							style="background-color: transparent; border: 0px" value="搜索" /></button>
					</form></center>
				</div>
			</div>
		</div>
	</div>
	<!-- offcanvas search form end -->
	<!-- offcanvas mini cart end -->
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
