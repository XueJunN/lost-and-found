<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jQuery带步骤找回密码表单代码</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
</head>

<body>

	<div class="content">
		<div class="web-width">
			<div class="for-liucheng">
				<div class="liulist for-cur"></div>
				<div class="liulist"></div>
				<div class="liulist"></div>
				<div class="liutextbox">
					<div class="liutext for-cur">
						<em>1</em><br />
						<strong>填写账户名</strong>
					</div>
					<div class="liutext">
						<em>2</em><br />
						<strong>设置新密码</strong>
					</div>
					<div class="liutext">
						<em>3</em><br />
						<strong>完成</strong>
					</div>
				</div>
			</div>
			<!--for-liucheng/-->
			<form action="toforgetPwdLogin.do" method="get" class="forget-pwd">
				<dl>
					<dt>账户名：</dt>
					<dd>
						<input type="text" name="username" />
					</dd>
					<div class="clears"></div>
				</dl>
				<div class="subtijiao">
				<p>
					<span style="color: blue">${msg==null?'':msg}</span>
				</p>
					<input type="submit" value="提交" />
				</div>
			</form>
			<!--forget-pwd/-->
		</div>
		<!--web-width/-->
	</div>
	<!--content/-->
	</div>
</body>
</html>
