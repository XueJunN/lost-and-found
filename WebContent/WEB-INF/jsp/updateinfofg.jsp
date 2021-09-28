<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改招领评论</title>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
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
	<center>
		<form action="toupdateinfofg.do" id="inserttg" method="post">
			<input type="hidden" name="infoid" value="${info.infoid}" />
			<input type="hidden" name="uid" value="${sessionScope.user.uid}">
			<input type="hidden" name="clo1" value="${info.clo1}">
			<input type="hidden" name="created" value="${info.created}">
			<input type="hidden" name="username" value="${info.username}">
			<input type="hidden" name="fgid" value="${info.fgid}">
			<ol>
				<li>评论内容：<input type="text" name="information"
					value="${info.information}"><br>
				</li>
				<li><input type="submit" value="提交"></li>
			</ol>
		</form>
	</center>
</body>
</html>