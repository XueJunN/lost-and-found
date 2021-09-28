<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE html>
<html>
<head>
<title>注册</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Awesome Register Form template Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login sign up Responsive web template, SmartPhone Compatible web template, free web designs for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 


</script>
<!-- Meta tags -->
<!--stylesheets-->
<link href="css/style1.css" rel='stylesheet' type='text/css' media="all">
<!--//style sheet end here-->
<link
	href="//fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700"
	rel="stylesheet">
<!-- Custom Theme files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->
<!-- web font -->
<link
	href="//fonts.googleapis.com/css?family=Poiret+One&amp;subset=cyrillic,latin-ext"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i&amp;subset=latin-ext"
	rel="stylesheet">
<!-- //web font -->
</head>
<body>
	<!-- main -->
	<div data-vide-bg="video/awesome">
		<div class="main-w3layouts center-container">
			<h1>注册</h1>
			<div class="main-agileinfo">
				<div class="agileits-top">
					<form action="toRegister1Login.do" method="post">
						<i class="fa fa-user-o" aria-hidden="true"></i> <input
							class="text" type="text" name="username" placeholder="用户名"
							required=""> <input class="text email" type="email"
							name="email" placeholder="邮箱" required=""> <input
							class="text" type="password" name="password" id="password"
							placeholder="密码" onblur="checkpas1();" required="true"> <input
							class="text w3lpass" type="password" name="repassword"
							id="repassword" onChange="checkpas();" placeholder="确认密码"
							required="true">
						<div class="wthree-text">
							<p>
								<span style="color: blue">${msg==null?'':msg}</span>
							</p>
							<label class="anim"> <input type="checkbox"
								class="checkbox" name="agreement" id="ag" required=""> <span>我已阅读并同意</span><a
								href="#">用户注册协议</a>
							</label>
							<div class="clear"></div>
							<input type="submit" id=sbm value="注册" onclick="checkpas2();">
							<div class="w3layouts_more-buttn">
								<h3>
									已有账号? <a href="tologinLogin.do"><p style="font-family:\5FAE\8F6F\96C5\9ED1;font-size:180%">登录</p> </a>
									</h3>
							</div>
					</form>
				</div>
			</div>
			<!-- popup-->
			<!-- <div id="content1" class="popup-effect">
				<div class="popup"> -->
					<!--login form-->
					<!-- <div class="letter-w3ls">
						<form action="torecord.do" method="post">
							<div class="form-left-to-w3l">
								<input type="text" name="username" placeholder="用户名" required="">
							</div>
							<div class="form-left-to-w3l">
								<input type="password" name="password" placeholder="密码"
									required="">
							</div>
							<p>
								<span style="color: blue">${msg}</span>
							</p>
							<div class="btnn">
								<button type="submit">登录</button>
								<br>
							</div>
						</form>
						<div class="clear"></div>
					</div> -->
					<!--//login form-->
					<!-- <a class="close" href="#">&times;</a>
				</div>
			</div> -->
			<!-- //copyright -->
		 </div>
	</div>
	<!-- //main -->
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#ag").click(function() {//复选框被选中
				if ($("#ag").is(':checked')) {
					$("#sbm").removeAttr("disabled");
				} else {//复选框未被选中
					$("#sbm").attr("disabled", "disabled");
				}
			});
		});
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
	<script src="js/jquery.vide.min.js"></script>
	<!-- //js -->

</body>
</html>