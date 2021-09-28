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
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() { //jquery简写的初始化 --//：even代表是偶数行  :odd 代表的是基数行 
		$(".base:even").css("background-color", "#87CEEB");
		$(".base:odd").css("background-color", "#ADD8E6");

		//全选全不选
		$("#all").click(function() {
			if ($(this).is(":checked")) {
				$('[name="ids"]').prop("checked", true);
			} else {
				$('[name="ids"]').prop("checked", false);
			}
		});
		//批量删除
		$("#delMany").click(function() {
			var ch = $('[name="ids"]:checked'); //被选中的元素
			if (ch.length == 0) {//长度为0说明没有被选中元素 
				alert("请至少选中一个要删去的元素!");
				return;//代码不往下执行 
			}//有被选中的元素 
			var url = "delMany.do?ids=";//基础url
			for (var i = 0; i < ch.length; i++) {
				url += $(ch[i]).val() + ",";
			}
			window.location.href = url;//发送请求
		});
	});
</script>
<meta name="keywords"
	content="Gaze Sign up & login Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
<script>
	addEventListener("load", function() {
		setTimeout(hideURLbar, 0);
	}, false);
	function hideURLbar() {
		window.scrollTo(0, 1);
	}
</script>
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
<body>


	<!-- header middle area start -->
	<div class="header-main-area sticky">
		<div class="container">
			<div class="row align-items-center position-relative">

				<!-- start logo area -->
				<div class="col-lg-3"></div>
				<!-- start logo area -->

				<!-- main menu area start -->
				<div class="col-lg-6 position-static">
					<div class="main-menu-area">
						<div class="main-menu">
							<!-- main menu navbar start -->
							<nav class="desktop-menu">
								<a href="#content1"><p
										style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 230%; color: black">
										欢迎您!${sessionScope.admin.name}</p></a>
								<ul>
									<li><a href="#"><p
												style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 150%"></p></a></li>
									<li><a href="#"><p
												style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 150%"></p></a></li>
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
										<li><a href="tologinLogin.do">用户登录</a></li>
										<li><a href="toadminloginLogin.do">管理员登录</a></li>
										<li><a href="toadminoutLogin.do">退出</a></li>
										<li><a href="adminoutLogin.do?adid=${sessionScope.admin.adid}"
											onclick="javascript:return del1()">注销账号</a></li>
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
	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="sidebar-sticky pt-3">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link"
							href="toadminLogin.do"> <span data-feather="show"></span>用户管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="toadmintgLogin.do"> <span
								data-feather="home"></span> 失物管理<span class="sr-only"></span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="toadminfgLogin.do"> <span
								data-feather="show"></span>招领管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="docollectLogin.do"> <span
								data-feather="show"></span>评论管理
						</a></li>
						<li class="nav-item"><a class="nav-link" href="selectallcontanctadminLogin.do"> <span
								data-feather="show"></span>联系管理
						</a></li>
					</ul>
				</div>
			</nav>
			<!-- offcanvas mini cart end -->
			<div id="content1" class="popup-effect">
		<div class="popup">
			<!--login form-->
			<div class="letter-w3ls">
				<form name="uploadFileForm" id="inserttg" action="updateadminLogin.do"
					method="post">
					<input type="hidden" name="adid" value="${sessionScope.admin.adid}">
					<input type="hidden" name="email" value="${sessionScope.admin.email}">
					<input type="hidden" name="created" value="${sessionScope.admin.created}">
					<input type="hidden" name="status" value="${sessionScope.admin.status}">
					<input type="hidden" name="code" value="${sessionScope.admin.code}">
					<input type="hidden" name="clo1" value="${sessionScope.admin.clo1}">
					<input type="hidden" name="statuscode" value="${sessionScope.admin.statuscode}">
					<ol>
						<li><label for="name">用户名</label><input type="text"
							name="name" id="name" value="${sessionScope.admin.name}" /></li>
							<li><label for="password">密码</label>
							<input type="password" name="password" id="password"
							onblur="checkpas1();" value="${sessionScope.admin.password}" /></li>
							<li><label for="repassword">确认密码</label>
							<input type="password" name="repassword" id="repassword"
							onChange="checkpas();" value="${sessionScope.admin.repassword}" /></li>
						<li><input type="submit" id=sbm value="修改" onclick="checkpas2();"/></li>
					</ol>
				</form>
				<div class="clear"></div>
			</div>
			<!--//login form-->
			<a class="close" href="#">&times;</a>
		</div>
	</div>
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