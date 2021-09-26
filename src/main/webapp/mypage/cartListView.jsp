<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>장바구니 목록</h2>
<c:if test="${CARTLIST == null }">
	<h3>장바구니가 비었습니다.</h3>
</c:if>
<c:if test="${CARTLIST != null }">
	<table>
		<tr><th width="80">상품번호</th><th width="100">상품이름</th><th width="80">상품가격</th>
			<th width="80">상품갯수</th><th width="100">합 계</th><th width="100">수정/삭제</th></tr>
		<c:forEach var="item" items="${CARTLIST}">
		<form action="../cart/modify.html" method="post">
			<input type="hidden" name="CODE" value="${item.item_id }"/>
			<tr><td>${item.item_id }</td><td>${item.item_name }</td><td>
				<fmt:formatNumber groupingUsed="true">${item.price }</fmt:formatNumber></td>
				<td><input type="text" name="NUM" value="${item.quantity }" size="3"/></td>
				<td><fmt:formatNumber 
					groupingUsed="true">${item.price * item.quantity }</fmt:formatNumber></td><td>
					<input type="submit" value="수정" name="BTN"/>
					<input type="submit" value="삭제" name="BTN"/></td></tr>
		</form>
		</c:forEach>
	</table><br/>
	총 합 : <fmt:formatNumber groupingUsed="true">${TOTAL }</fmt:formatNumber>원<br/>
	<form action="../cart/goCartBuy.html">
		<input type="hidden" name="CART" value="${CARTLIST }"/>
		<input type="hidden" name="TOTAL" value="${TOTAL }"/>
		<input type="submit" value="결제하기"/>
	</form>
</c:if>
</div>
<br/><br/>
</body>
</html>






