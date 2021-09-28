<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="css/style1.css" rel='stylesheet' type='text/css' media="all">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="topAndLeft.jsp" />
<style>
table {
	text-align: center;
	margin: auto;
}
.button {
  font: bold 11px Arial;
  text-decoration: none;
  background-color: #EEEEEE;
  color: #333333;
  padding: 2px 6px 2px 6px;
  border-top: 1px solid #CCCCCC;
  border-right: 1px solid #333333;
  border-bottom: 1px solid #333333;
  border-left: 1px solid #CCCCCC;
  }
</style>
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
<div class="col-lg-3">
	<div class="header-configure-wrapper">
		<div class="header-configure-area">
			<ul class="nav justify-content-end">
				<a class="button" href="exportcontanctLogin.do">导出</a>
			</ul>
		</div>
	</div>
</div>
<div align="center">
	<table border="1" cellpadding="0" cellspacing="0" width="80%">
		<tr>
			<th colspan="9"><h3>联系列表</h3></th>
		</tr>
		<tr>
			<th>用户编码</th>
			<th>被举报号码</th>
			<th>举报者号码</th>
			<th>是失物信息还是招领信息</th>
			<th>创建时间</th>
			<th>举报时间</th>
			<th>是否被举报</th>
		</tr>
		<c:forEach items="${list}" var="list">
			<tr class="base">
				<th>${list.uid}</th>
				<th>${list.phone}</th>
				<th>${list.clo2}</th>
				<th><c:if test="${list.tgid!=null}">
						<p>失物</p>
					</c:if> <c:if test="${list.fgid!=null}">
						<p>招领</p>
					</c:if></th>					
		<th><fmt:formatDate value="${list.created}" pattern="yyyy-MM-dd HH:mm:ss" /></th>
		<th><fmt:formatDate value="${list.updateed}" pattern="yyyy-MM-dd HH:mm:ss" /></th>
		<th><c:if test="${list.clo1=='Y'}">
						<p style="color: green">没有被举报</p>
					</c:if> <c:if test="${list.clo1=='N'}">
						<p style="color: red">被举报</p>
					</c:if></th>
		</c:forEach>
	</table>
	<p style="font-family: \5FAE\8F6F\96C5\9ED1; font-size: 200%">
		<a
			href="selectallcontanctadminLogin.do?pno=${page.navigateFirstPage}">首页</a>&nbsp;
		<a
			href="selectallcontanctadminLogin.do?pno=${page.hasNextPage ? page.nextPage:page.navigateLastPage}">下页</a>&nbsp;
		<a
			href="selectallcontanctadminLogin.do?pno=${page.hasPreviousPage ? page.prePage:page.navigateFirstPage}">上页</a>&nbsp;
		<a
			href="selectallcontanctadminLogin.do?pno=${page.navigateLastPage}">末页</a>&nbsp;
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
