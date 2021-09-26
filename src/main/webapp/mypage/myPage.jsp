<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../home/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#menus { margin-top:10px; margin-left:20px; width:30%;
		font-size:16px; font-weight:bold; line-height:1.6em;
		padding-left:5px;}
#content {width:70%;}
</style>
</head>
<body>
<%@ include file="../home/header.jsp" %><br/>
<div>
<table width="70%">
	<tr>
		<td id="menus">
			<div>
				<a href="../cart/cartListView.html">장바구니</a><br/>
				<a href="../mypage/orderList.html">주문 내역</a><br/>
				<a href="../mypage/myData.html">회원 정보</a><br/>
			</div>
		</td>
		<td id="content">
			<c:choose>
				<c:when test="${BODY != null }">
					<jsp:include page="${BODY }"/>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>
<%@ include file="../home/footer.jsp" %><br/>
</div>
</body>
</html>