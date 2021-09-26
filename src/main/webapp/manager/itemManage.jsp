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
<h2>상품관리</h2>
<c:if test="${requestScope.ITEMLIST == null }">
	<h3>등록된 상품이 존재하지 않습니다.</h3>
</c:if>
<c:if test="${ITEMLIST != null }">
<table class="item" border="1">
	<tr>
		<th align="center" width="120">상품번호</th>
		<th align="center" width="120">이미지</th>
		<th align="center" width="320">상품이름</th>
		<th align="center" width="120">카테고리</th>
		<th align="center" width="160">작성일</th></tr>
	<c:forEach var="item" items="${ITEMLIST }">
	<tr>
		<td align="center">${item.item_id }</td>
		<td align="center"><img alt="" 
			src="${pageContext.request.contextPath }/upload/${item.picture_url }" 
			width="40" height="30"></td>
		<td align="center"><a href="../item/itemDetail.html?ID=${item.item_id }">${item.item_name }</a></td>
		<td align="center">${item.category }</td>
		<td align="center">${item.reg_date }</td>		
		<td align="center" width="80"><a href="../manager/itemUpdate.html?itemId=${item.item_id }">수정</a></td>
		<td align="center" width="80"><a href="../manager/itemDelete.html?itemId=${item.item_id }">삭제</a></td>
	</tr>
	</c:forEach>
</table>
<c:if test="${ ! empty sessionScope.ADMIN }">
	<div align="right">
		<a href="../item/goItemEntry.html">상품등록</a>
	</div>
</c:if>
<c:forEach begin="1" end="${pageCount }" var="page">
	<a href="../manager/itemManage.html?pageNo=${page }">${page }</a>
</c:forEach>
</c:if>
</div>

</body>
</html>
