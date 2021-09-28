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
		<form action="updatetgs.do" id="inserttg" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="tgid" value="${tg.tgid}" />
			<input type="hidden" name="uid" value="${sessionScope.user.uid}">
			<input type="hidden" name="picture" value="${tg.picture}">
			<input type="hidden" name="clo1" value="${tg.clo1}">
			<input type="hidden" name="created" value="${tg.created}">
			<ol>
				<li>失物名：<input type="text" name="goodname"
					value="${tg.goodname}"><br>
				</li>
				<li>价格：<input type="text" name="price" value="${tg.price}"><br>
				</li>
				<li>内容：<input type="text" name="content" value="${tg.content}"><br>
				</li>
				<li>类型：<select id="classifyList" name="classifyList">
						<option value="生活用品">生活用品</option>
						<option value="电子产品">电子产品</option>
						<option value="证件类">证件类</option>
						<option value="饰品类">饰品类</option>
						<option value="文件类">文件类</option>
						<option value="食物">食物</option>
						<option value="其他">其他</option>
				</select>
				</li>
				<li><br> 丢失地点：<input type="text" name="place"
					value="${tg.place}"><br></li>
				<li>联系电话：<input type="text" name="phone" value="${tg.phone}"><br>
				</li>
				<li><input type="submit" value="提交"></li>
			</ol>
		</form>
	</center>

</body>
</html>