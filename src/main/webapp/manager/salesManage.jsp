<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>매출관리</h2>
<c:if test="${requestScope.SALESLIST == null }">
	<h3>등록된 상품이 존재하지 않습니다.</h3>
</c:if>
<c:if test="${SALESLIST != null }">
<table class="item" border="1">
	<tr>
		<th align="center" width="120">상품번호</th>
		<th align="center" width="200">판매량</th>
		<th align="center" width="200">총판매액</th>
	<c:forEach var="sales" items="${SALESLIST }">
	<tr>
		<td align="center">${sales.item_id }</td>
		<td align="center">${sales.total_quantity }</td>
		<td align="center">${sales.total_sales } 원</td>		
	</tr>
	</c:forEach>
</table>
<table>
	<tr>
	<th align="center">총판액 :</th><td align="center">${SUM } 원</td>
	</tr>
</table>
<c:forEach begin="1" end="${pageCount }" var="page">
	<a href="../manager/salesManage.html?pageNo=${page }">${page }</a>
</c:forEach>
</c:if>
</div>

</body>
</html>
