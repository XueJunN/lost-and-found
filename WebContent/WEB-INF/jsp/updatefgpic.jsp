<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改失物启示</title>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		var file;
		$('#file').change(function() {
			file = $(this).val();
		});
		var arr = file.split('\\');//注split可以用字符或字符串分割 
		var fileName = arr[arr.length - 1];//这就是要取得的图片名称 
		alert(fileName);
	});
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
</head>
<body>
	<center>
		<form action="doupdatefg.do" id="inserttg" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="fgid" value="${fg.fgid}" />
			<input type="hidden" name="clo1" value="${fg.clo1}">
			<input type="hidden" name="created" value="${fg.created}">
				<input type="hidden" name="goodname"
					value="${fg.goodname}">
				<input type="hidden" name="content" value="${fg.content}">
				<input type="hidden" name="classify" value="${fg.classify}">
				<input type="hidden" name="place"
					value="${fg.place}">
				<input type="hidden" name="phone" value="${fg.phone}">
				<input type="hidden" name="uid" value="${sessionScope.user.uid}">
				<ol>
				<li>
						<label for="picture">图片</label><input type="file" name="file" /><br />
					</li>
				<li><input type="submit" value="提交"></li>
			</ol>
		</form>
	</center>

</body>
</html>