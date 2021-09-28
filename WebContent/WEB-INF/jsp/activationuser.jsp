<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" href="css/css.css" rel="stylesheet" />
</head>
<body>
<div class="content">
		<div class="web-width">
			<div class="for-liucheng">
			<form action="activationLogin.do" method="post" class="forget-pwd">
				<dl>
					<dt>邮箱：</dt>
					<dd>
						<input type="email" name="email" />
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
		</div>
	</div>
	</div>
</body>
</html>