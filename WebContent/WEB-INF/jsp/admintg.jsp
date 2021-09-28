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
	function app() {
		var msg = "您真的确定要通过审核吗？\n\n请确认！";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
	function notapp() {
		var msg = "您真的确定要不通过审核吗？\n\n请确认！";
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
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		//全选全不选
		$("#all").click(function() {
			if ($(this).is(":checked")) {
				$('[name="tgids"]').prop("checked", true);
			} else {
				$('[name="tgids"]').prop("checked", false);
			}
		});
		//批量修改
		$("#approvedMany").click(function() {
			var ch = $('[name="tgids"]:checked'); //被选中的元素
			if (ch.length == 0) {//长度为0说明没有被选中元素 
				alert("请至少选中一个要修改的元素!");
				return;//代码不往下执行 
			}//有被选中的元素 
			var url = "approvedManyTgLogin.do?tgids=";//基础url
			for (var i = 0; i < ch.length; i++) {
				url += $(ch[i]).val() + ",";
			}
			window.location.href = url;//发送请求
		});
	});
	$(function() {
		//全选全不选
		$("#all").click(function() {
			if ($(this).is(":checked")) {
				$('[name="tgids"]').prop("checked", true);
			} else {
				$('[name="tgids"]').prop("checked", false);
			}
		});
		//批量修改
		$("#notapprovedMany").click(function() {
			var ch = $('[name="tgids"]:checked'); //被选中的元素
			if (ch.length == 0) {//长度为0说明没有被选中元素 
				alert("请至少选中一个要修改的元素!");
				return;//代码不往下执行 
			}//有被选中的元素 
			var url = "notapprovedManyTgLogin.do?tgids=";//基础url
			for (var i = 0; i < ch.length; i++) {
				url += $(ch[i]).val() + ",";
			}
			window.location.href = url;//发送请求
		});
	});
</script>
<style type="text/css">
.img {
	float: right;
}
</style>
<jsp:include page="topAndLeft.jsp" />
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
<form action="toadmintgLogin.do" method="post">
	<p>
		<input type="button" id="approvedMany" value="批量通过"> <input
			type="button" id="notapprovedMany" value="批量不通过"> 全选： <input
			type="checkbox" name="" id="all" value="" />
	</p>
</form>
<br>
<!--<center>
	<a href="inserttg.do"><p
			style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 300%;line-height: 100px">发布失物启示</p></a>
</center>--> <!-- product details inner end -->
<div class="row">
	<c:forEach items="${all}" var="a">
		<div class="col-lg-5">
			<input type="checkbox" name="tgids" value="${a.tgid}" />
			<div class="product-large-slider">
				<div class="pro-large-img img-zoom">
					<a href="#"><img src="assets/img/product/${a.picture}"
						alt="product-details" width="400px" height="400px" /></a>
				</div>
			</div>
			<div class="pro-nav slick-row-10 slick-arrow-style"></div>
		</div>
		<div class="col-lg-7">
			<div class="product-details-des">
				<c:if test="${a.price>0}">
					<p class="img">
						<img alt="" src="images/xuanshan.jpg" height="80" width="130">
					</p>
				</c:if>
				<h3 class="product-name">${a.goodname}</h3>
				<div class="ratings d-flex"></div>
				<p class="pro-desc">类型：${a.classify}</p>
				<p class="pro-desc">赏金：${a.price}</p>
				<p class="pro-desc">丢失地点：${a.place}</p>
				<p class="pro-desc">
					时间：
					<fmt:formatDate value="${a.created}" pattern="yyyy-MM-dd HH:mm:ss" />
				</p>
				<p class="pro-desc">描述：${a.content}</p>
			</div>
			<a href="adminapprovedLogin.do?tgid=${a.tgid}"
				onclick="javascript:return app()">审核通过</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="adminnotapprovedLogin.do?tgid=${a.tgid}"
				onclick="javascript:return notapp()">审核不通过</a>
			<h3 class="product-name" style="color: red">
				状态：
				<c:if test="${a.clo1=='M'}">
					<p style="color: red">审核中</p>
				</c:if>
				<c:if test="${a.clo1=='Y'}">
					<p style="color: green">审核通过</p>
				</c:if>
				<c:if test="${a.clo1=='N'}">
					<p style="color: #888888">信息删除</p>
				</c:if>
				<c:if test="${a.clo1=='P'}">
					<p style="color: blue">审核不通过</p>
				</c:if>
			</h3>
		</div>
	</c:forEach>
</div>
<form>
	<input type="hidden" name="uid" value="${sessionScope.user.uid}">
	<center>
		<p style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 200%">
			<a
				href="toadmintgLogin.do?pno=${page.navigateFirstPage}&&goodname=${goodname}">首页</a>&nbsp;
			<a
				href="toadmintgLogin.do?pno=${page.hasNextPage ? page.nextPage:page.navigateLastPage}&&goodname=${goodname}">下页</a>&nbsp;
			<a
				href="toadmintgLogin.do?pno=${page.hasPreviousPage ? page.prePage:page.navigateFirstPage}&&goodname=${goodname}">上页</a>&nbsp;
			<a
				href="toadmintgLogin.do?pno=${page.navigateLastPage}&&goodname=${goodname}">末页</a>&nbsp;当前第${page.pageNum}页/共${page.pages}页
		</p>
	</center>
</form>
<!-- product details inner end --> <footer class="footer-wrapper">

	<!-- offcanvas search form start -->
	<div class="offcanvas-search-wrapper">
		<div class="offcanvas-search-inner">
			<div class="offcanvas-close">
				<i class="lnr lnr-cross"></i>
			</div>
			<div class="container">
				<div class="offcanvas-search-box">
					<center>
						<form action="toadmintgLogin.do" class="d-flex bdr-bottom w-100"
							method="post">
							<input type="text" name="goodname"
								value="${goodname==null?'':goodname}" style="width: 80%"
								placeholder="Search here...">
							<button class="search-btn">
								<i class="lnr lnr-magnifier"></i><input type="submit"
									style="background-color: transparent; border: 0px" value="搜索" />
							</button>
						</form>
					</center>
				</div>
			</div>
		</div>
	</div>
	<!-- offcanvas search form end -->

	<!-- footer bottom area start -->
	<div class="footer-bottom-area">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-md-6 order-2 order-md-1"></div>
				<div class="col-md-6 order-1 order-md-2">
					<div class="footer-social-link">
						<a href="#"></a> <a href="#"></a> <a href="#"></a> <a href="#"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer bottom area end -->

</footer> </main>

</body>
</html>