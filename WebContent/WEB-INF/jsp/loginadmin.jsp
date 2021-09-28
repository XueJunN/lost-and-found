<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<style>
</style>
<!DOCTYPE html>
<html>
<head>
<title>Awesome Register Form a Flat Responsive Widget Template</title>
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
			<h1>登录</h1>
			<div class="main-agileinfo">
				<div class="agileits-top">
					<form action="torecordadminLogin.do" method="post" id="loginForm">
						<i class="fa fa-user-o" aria-hidden="true"></i> <input
							class="text w3lpass" type="text" name="name"
							placeholder="用户名" required=""> <input
							class="text w3lpass" type="password" name="password"
							id="password" placeholder="密码" onblur="checkpas1();"
							required="true">
						<div class="wthree-text">
							<p>
								<span style="color: blue">${msg==null?'':msg}</span>
							</p>
							<label class="anim"> <input type="checkbox"
								class="checkbox" name="rememberme" id="remember"> <label
								for="rememberme">记住密码</label>
							</label> <label class="anim"> <a href="forgetPwd.do">
									<p style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 100%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										忘记密码?</p>
							</a>
							</label>
							<div class="clear"></div>
							<input type="submit" id="btnSubmit" value="登录"
								onclick="tologin()">
							<div class="w3layouts_more-buttn">
								<h3>
									没有账号? <a href="toadminregisterLogin.do">
										<p style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 200%">注册</p>
									</a>
								</h3>
							</div>
							<div class="clear"></div>
					</form>

				</div>
			</div>
		</div>
	</div>
	<!-- //main -->
	<!-- js -->
	<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript"
		src="js/jquery.cookie.js"></script>
	<script type="text/javascript">
	window.onload = function(){
	    var oForm = document.getElementById('loginForm');
	    var oUser = document.getElementById('name');
	    var oPswd = document.getElementById('password');
	    var oRemember = document.getElementById('remember');
	    //页面初始化时，如果帐号密码cookie存在则填充
	    if(getCookie('name') && getCookie('password')){
	      oUser.value = getCookie('name');
	      oPswd.value = getCookie('password');
	      oRemember.checked = true;
	    }
	    //复选框勾选状态发生改变时，如果未勾选则清除cookie
	    oRemember.onchange = function(){
	      if(!this.checked){
	        delCookie('name');
	        delCookie('password');
	      }
	    };
	    //表单提交事件触发时，如果复选框是勾选状态则保存cookie
	    oForm.onsubmit = function(){
	      if(remember.checked){ 
	        setCookie('name',oUser.value,7); //保存帐号到cookie，有效期7天
	        setCookie('password',oPswd.value,7); //保存密码到cookie，有效期7天
	      }
	    };
	  };
	  //设置cookie
	  function setCookie(name,value,day){
	    var date = new Date();
	    date.setDate(date.getDate() + day);
	    document.cookie = name + '=' + value + ';expires='+ date;
	  };
	  //获取cookie
	  function getCookie(name){
	    var reg = RegExp(name+'=([^;]+)');
	    var arr = document.cookie.match(reg);
	    if(arr){
	      return arr[1];
	    }else{
	      return '';
	    }
	  };
	  //删除cookie
	  function delCookie(name){
	    setCookie(name,null,-1);
	  };
	</script>
	<script src="js/jquery.vide.min.js"></script>
	<!-- //js -->
</body>
</html>