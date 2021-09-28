<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/style1.css" rel='stylesheet' type='text/css' media="all">
<jsp:include page="topAndLeft.jsp" />
<style>
table {
	text-align: center;
	margin: auto;
}
</style>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		//全选全不选
		$("#all").click(function() {
			if ($(this).is(":checked")) {
				$('[name="infoids"]').prop("checked", true);
			} else {
				$('[name="infoids"]').prop("checked", false);
			}
		});
		//批量修改
		$("#approvedMany").click(function() {
			var ch = $('[name="infoids"]:checked'); //被选中的元素
			if (ch.length == 0) {//长度为0说明没有被选中元素 
				alert("请至少选中一个要修改的元素!");
				return;//代码不往下执行 
			}//有被选中的元素 
			var url = "approvedManyLogin.do?infoids=";//基础url
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
				$('[name="infoids"]').prop("checked", true);
			} else {
				$('[name="infoids"]').prop("checked", false);
			}
		});
		//批量修改
		$("#notapprovedMany").click(function() {
			var ch = $('[name="infoids"]:checked'); //被选中的元素
			if (ch.length == 0) {//长度为0说明没有被选中元素 
				alert("请至少选中一个要修改的元素!");
				return;//代码不往下执行 
			}//有被选中的元素 
			var url = "notapprovedManyLogin.do?infoids=";//基础url
			for (var i = 0; i < ch.length; i++) {
				url += $(ch[i]).val() + ",";
			}
			window.location.href = url;//发送请求
		});
	});
</script>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
<div class="col-lg-3">
	<div class="header-configure-wrapper">
		<div class="header-configure-area">
			<ul class="nav justify-content-end">
				<form action="docollectLogin.do" method="post">
					<p>
						<input type="button" id="approvedMany" value="批量通过">
						<input type="button" id="notapprovedMany" value="批量不通过">
					</p>
				</form>
			</ul>
		</div>
	</div>
</div>
<div align="center">
	<table border="1" cellpadding="0" cellspacing="0" width="80%">
		<tr>
			<th colspan="9"><h3>评论列表</h3></th>
		</tr>
		<tr>
			<th><input type="checkbox" name="" id="all" value="" /></th>
			<th>用户名</th>
			<th>评论</th>
			<th>是失物信息还是招领信息</th>
			<th>评论状态</th>
			<!-- 0代表注销，1代表没有注销，2代表用户违规被注销 -->
			<th>操作</th>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr class="base">
				<th><input type="checkbox" name="infoids" value="${list.infoid}" /></th>
				<th>${list.username}</th>
				<th>${list.information}</th>
				<th><c:if test="${list.tgid!=null}">
						<p>失物</p>
					</c:if> <c:if test="${list.fgid!=null}">
						<p>招领</p>
					</c:if></th>
				<th><c:if test="${list.clo1=='M'}">
						<p style="color: red">审核中</p>
					</c:if> <c:if test="${list.clo1=='Y'}">
						<p style="color: green">审核通过</p>
					</c:if> <c:if test="${list.clo1=='N'}">
						<p style="color: #888888">信息删除</p>
					</c:if> <c:if test="${list.clo1=='P'}">
						<p style="color: blue">审核不通过</p>
					</c:if></th>
				<th><a style="color: black" href="approvedinfomationLogin.do?infoid=${list.infoid}"
					onclick="javascript:return del1()">审核通过</a>&nbsp; <a style="color: black"
					href="notapprovedinfomationLogin.do?infoid=${list.infoid}"
					onclick="javascript:return del1()">审核不通过</a></th>
			</tr>
		</c:forEach>
	</table>
	<p style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 200%">
		<a
			href="docollectLogin.do?pno=${page.navigateFirstPage}&&username=${username}">首页</a>&nbsp;
		<a
			href="docollectLogin.do?pno=${page.hasNextPage ? page.nextPage:page.navigateLastPage}&&username=${username}">下页</a>&nbsp;
		<a
			href="docollectLogin.do?pno=${page.hasPreviousPage ? page.prePage:page.navigateFirstPage}&&username=${username}">上页</a>&nbsp;
		<a
			href="docollectLogin.do?pno=${page.navigateLastPage}&&username=${username}">末页</a>&nbsp;
		当前页${page.size}条数据,总条数为:${page.total},当前第${page.pageNum}页/共${page.pages}页
	</p>
</div>

<!-- offcanvas search form start -->
<div class="offcanvas-search-wrapper">
	<div class="offcanvas-search-inner">
		<div class="offcanvas-close">
			<i class="lnr lnr-cross"></i>
		</div>
		<div class="container">
			<div class="offcanvas-search-box">
				<center>
					<form action="docollectLogin.do" class="d-flex bdr-bottom w-100"
						method="post">
						<input type="text" name="username"
							value="${username==null?'':username}" style="width: 80%"
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
<!-- offcanvas search form end --> <!-- footer bottom area start -->
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
<!-- footer bottom area end --> </main>
</body>
</html>
