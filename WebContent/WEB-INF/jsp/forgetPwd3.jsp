<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author" contect="http://www.webqin.net">
	<title>忘记密码</title> <script type="text/javascript"
		src="js/jquery-2.1.4.min.js"></script>
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
	<link rel="shortcut icon" href="images/favicon.ico" />
	<link type="text/css" href="css/css.css" rel="stylesheet" />
</head>

<body>

	<div class="content">
		<div class="web-width">
			<div class="for-liucheng">
				<div class="liulist for-cur"></div>
				<div class="liulist for-cur"></div>
				<div class="liulist"></div>
				<div class="liutextbox">
					<div class="liutext for-cur">
						<em>1</em><br /> <strong>填写账户名</strong>
					</div>
					<div class="liutext for-cur">
						<em>2</em><br /> <strong>设置新密码</strong>
					</div>
					<div class="liutext">
						<em>3</em><br /> <strong>完成</strong>
					</div>
				</div>
			</div>
			<!--for-liucheng/-->
			<form action="toforgetPwd3Login.do" method="post" class="forget-pwd"
				name="form1" id="form1" onsubmit="return checkForm()">
				<dl>
					<dd>
						<input type="hidden" name="uid" value="${sessionScope.user.uid}">
					</dd>
					<div class="clears"></div>
				</dl>
				<dl>
					<dt>邮箱：</dt>
					<dd>
						<input type="password" name="email"
							value="${sessionScope.user.email}" readonly="readonly" />
					</dd>
					<div class="clears"></div>
				</dl>
				<dl>
					<dt>新密码：</dt>
					<dd>
						<input type="password" name="password" id="password"
							onblur="checkpas1();" />
					</dd>
					<div class="clears"></div>
				</dl>
				<dl>
					<dt>确认密码：</dt>
					<dd>
						<input type="password" name="repassword" id="repassword"
							onChange="checkpas();" />
					</dd>
					<div class="clears"></div>
				</dl>
				<p>
					<span style="color: blue">${msg==null?'':msg}</span>
				</p>
				<div class="subtijiao">
					<input type="submit" id=sbm value="提交" onclick="checkpas2();" />
				</div>
			</form>
			<!--forget-pwd/-->
		</div>
		<!--web-width/-->
	</div>
	<!--content/-->
</body>
</html>
