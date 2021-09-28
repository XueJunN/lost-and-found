<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div align="center">
		<div class="popup">
			<!--login form-->
			<div class="letter-w3ls">
				<c:forEach items="${clist}" var="c">
					<c:if test="${sessionScope.throwGoods.tgid==c.tgid}">
						<p class="pro-desc" style="color: red">
							联系捡到者：${c.phone}
							<c:if test="${c.clo1!='Y'}">(被举报)</c:if>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a
								href="delecttgcontanct.do?pid=${c.pid}">举报</a>
						</p>
					</c:if>
				</c:forEach>
				<div class="clear"></div>
			</div>
		</div>
		<a href="javascript:history.back(-1)">
			<p
				style="font-family: \5FAE\8F6F\96C5\9ED1; color: pink; font-size: 100%">确定

			
		</a>
	</div>
</body>
</html>