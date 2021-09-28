<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Meta tags -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<!-- Meta tags -->
<!--stylesheets-->
<link href="css/style1.css" rel='stylesheet' type='text/css' media="all">
<!--//style sheet end here-->
<link
	href="//fonts.googleapis.com/css?family=Source+Sans+Pro:400,600,700"
	rel="stylesheet">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
</script>
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
<jsp:include page="mycount.jsp" />
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
<!--<center>
	<a href="inserttg.do"><p
			style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 300%;line-height: 100px">发布失物启示</p></a>
</center>-->
<center>
	<a href="#content1"><p
			style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 300%; line-height: 100px">发布招领启示</p></a>
</center>
<!-- product details inner end -->
<div class="row">
	<c:forEach items="${list}" var="l">
		<c:if test="${l.clo1!='N'}">
			<c:if test="${sessionScope.user.uid==l.uid}">
				<div class="col-lg-5">
					<div class="product-large-slider">
						<div class="pro-large-img img-zoom">
							<a href="updatefgpic.do?fgid=${l.fgid}"><img
								src="assets/img/product/${l.picture}" alt="product-details"
								width="400px" height="400px" /></a>
						</div>
					</div>
					<div class="pro-nav slick-row-10 slick-arrow-style"></div>
				</div>
				<div class="col-lg-7">
					<div class="product-details-des">
						<a href="toGoodsDetail1Login.do?fgid=${l.fgid}"><h3 class="product-name">${l.goodname}</h3></a>
						<div class="ratings d-flex"></div>
						<p class="pro-desc">类型：${l.classify}</p>
						<p class="pro-desc">捡到地点：${l.place}</p>
						<p class="pro-desc">
							时间：
							<fmt:formatDate value="${l.created}"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</p>
						<p class="pro-desc">描述：${l.content}</p>
					</div>
					<a href="deleteFg.do?fgid=${l.fgid}"
						onclick="javascript:return del()">删除</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="updatefg.do?fgid=${l.fgid}">修改内容</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="adminreapprovedfgLogin.do?fgid=${l.fgid}">重新提交审核</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="selectallcontanctfg.do?fgid=${l.fgid}">联系失主</a>
					<c:if test="${l.clo2=='Y'}">(有人联系)</c:if>
					<h3 class="product-name" style="color: red">
						状态：
						<c:if test="${l.clo1=='M'}">
							<p style="color: red">审核中</p>
						</c:if>
						<c:if test="${l.clo1=='Y'}">
							<p style="color: green">审核通过</p>
						</c:if>
						<c:if test="${l.clo1=='P'}">
							<p style="color: blue">审核不通过</p>
						</c:if>
					</h3>
				</div>
			</c:if>
		</c:if>
	</c:forEach>
</div>
	<center>
		<p style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 200%">
			<a
				href="tomycountfgLogin.do?pno=${page.navigateFirstPage}&&goodname=${goodname}">首页</a>&nbsp;
			<a
				href="tomycountfgLogin.do?pno=${page.hasNextPage ? page.nextPage:page.navigateLastPage}&&goodname=${goodname}">下页</a>&nbsp;
			<a
				href="tomycountfgLogin.do?pno=${page.hasPreviousPage ? page.prePage:page.navigateFirstPage}&&goodname=${goodname}">上页</a>&nbsp;
			<a
				href="tomycountfgLogin.do?pno=${page.navigateLastPage}&&goodname=${goodname}">末页</a>&nbsp;当前第${page.pageNum}页/共${page.pages}页
		</p>
	</center>
<!-- product details inner end --> <footer class="footer-wrapper">

	<!-- popup-->
	<div id="content1" class="popup-effect">
		<div class="popup">
			<!--login form-->
			<div class="letter-w3ls">
				<form name="uploadFileForm" id="inserttg" action="douploadfg.do"
					method="post" enctype="multipart/form-data">
					<ol>
						<li><label for="name">失物名</label><input type="text"
							name="goodname" id="name" value="" /></li>
						<li><label for="content">描述</label><input type="text"
							name="content" id="content" value="" /></li>
						<li><label for="picture">图片</label><input type="file"
							name="file" /><br /></li>

						<li><label for="classify">类型</label>
						<!-- <input type="text" name="classify"
							id="classify" value="" /> --> <select id="classifyList"
							name="classifyList">
								<option value="生活用品">生活用品</option>
								<option value="电子产品">电子产品</option>
								<option value="证件类">证件类</option>
								<option value="饰品类">饰品类</option>
								<option value="文件类">文件类</option>
								<option value="食物">食物</option>
								<option value="其他">其他</option>
						</select></li>
						<li><label for="place">捡到地点</label><input type="text"
							name="place" id="place" value="" /></li>
						<li><label for="phone">联系电话</label><input type="text"
							name="phone" id="phone" value="" /></li>
						<input type="hidden" name="uid" value="${sessionScope.user.uid}">
						<li><input type="submit" value="添加" /></li>
					</ol>
				</form>
				<div class="clear"></div>
			</div>
			<!--//login form-->
			<a class="close" href="#">&times;</a>
		</div>
	</div>
	<!-- //popup -->

	<!-- footer bottom area start -->
	<div class="footer-bottom-area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 order-2 order-md-1"></div>
				<div class="col-md-6 order-1 order-md-2">
					<div class="footer-social-link">
						<a href="#"></i></a> <a href="#"></i></a> <a href="#"></i></a> <a href="#"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer bottom area end -->

</footer> </main>

</body>
</html>