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
<h2>주문 내역 목록</h2>
<c:if test="${ empty Order }">
	<h3>주문 내역이 없습니다.</h3>
</c:if>
<c:if test="${ ! empty Order }">
	<table>
		<tr><th width="100">주문번호</th><th width="100">상품번호</th><th width="100">주문일시</th><th width="100">주문금액</th>
			<th width="100">주문상태</th><th width="100">수령확인</tr>
		<c:forEach var="order" items="${Order}">
		<form>
			<tr align="center"><td>${order.seqno }</td>
				<td><a href="../item/itemDetail.html?ID=${order.item_id }">${order.item_id }</a>
				</td><td>${order.order_date }</td><td>
				<fmt:formatNumber groupingUsed="true">${order.total_price }</fmt:formatNumber>원</td>
				<td>${order.condition}</td>
				<td></td></tr>
		</form>
		</c:forEach>
	</table><br/>
<c:set var="startPage"
value="${currentPage-(currentPage % 10 == 0 ? 10 : (currentPage % 10))+1 }"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>
<c:if test="${startPage > 10 }">
	<a href="javascript:goPage(${startPage - 1 })">[이전]</a>
</c:if>
<c:forEach var="pageNo" begin="${startPage }" end="${endPage }">
	<c:if test="${currentPage == pageNo }">
	<font size="6">
	</c:if>
		<a href="javascript:goPage(${pageNo })">${pageNo }</a>
		<c:if test="${currentPage == pageNo }">
	</font>
	</c:if>
</c:forEach>
<c:if test="${endPage < pageCount }">
	<a href="javascript:goPage(${endPage + 1 })">[다음]</a>
</c:if>
</c:if>

</div>
<script type="text/javascript">
function goPage(no){
	document.move.action = "../mypage/orderList.html";
	document.move.PAGE_NUM.value = no;
	document.move.submit();
}
</script>
<form name="move" method="post" >
	<input type="hidden" name="PAGE_NUM" value="${currentPage }"/>
</form>
</body>
</html>