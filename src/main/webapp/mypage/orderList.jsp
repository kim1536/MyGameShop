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
<h2>�ֹ� ���� ���</h2>
<c:if test="${ empty Order }">
	<h3>�ֹ� ������ �����ϴ�.</h3>
</c:if>
<c:if test="${ ! empty Order }">
	<table>
		<tr><th width="100">�ֹ���ȣ</th><th width="100">��ǰ��ȣ</th><th width="100">�ֹ��Ͻ�</th><th width="100">�ֹ��ݾ�</th>
			<th width="100">�ֹ�����</th><th width="100">����Ȯ��</tr>
		<c:forEach var="order" items="${Order}">
		<form>
			<tr align="center"><td>${order.seqno }</td>
				<td><a href="../item/itemDetail.html?ID=${order.item_id }">${order.item_id }</a>
				</td><td>${order.order_date }</td><td>
				<fmt:formatNumber groupingUsed="true">${order.total_price }</fmt:formatNumber>��</td>
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
	<a href="javascript:goPage(${startPage - 1 })">[����]</a>
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
	<a href="javascript:goPage(${endPage + 1 })">[����]</a>
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