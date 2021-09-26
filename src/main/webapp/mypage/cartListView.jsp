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
<h2>��ٱ��� ���</h2>
<c:if test="${CARTLIST == null }">
	<h3>��ٱ��ϰ� ������ϴ�.</h3>
</c:if>
<c:if test="${CARTLIST != null }">
	<table>
		<tr><th width="80">��ǰ��ȣ</th><th width="100">��ǰ�̸�</th><th width="80">��ǰ����</th>
			<th width="80">��ǰ����</th><th width="100">�� ��</th><th width="100">����/����</th></tr>
		<c:forEach var="item" items="${CARTLIST}">
		<form action="../cart/modify.html" method="post">
			<input type="hidden" name="CODE" value="${item.item_id }"/>
			<tr><td>${item.item_id }</td><td>${item.item_name }</td><td>
				<fmt:formatNumber groupingUsed="true">${item.price }</fmt:formatNumber></td>
				<td><input type="text" name="NUM" value="${item.quantity }" size="3"/></td>
				<td><fmt:formatNumber 
					groupingUsed="true">${item.price * item.quantity }</fmt:formatNumber></td><td>
					<input type="submit" value="����" name="BTN"/>
					<input type="submit" value="����" name="BTN"/></td></tr>
		</form>
		</c:forEach>
	</table><br/>
	�� �� : <fmt:formatNumber groupingUsed="true">${TOTAL }</fmt:formatNumber>��<br/>
	<form action="../cart/goCartBuy.html">
		<input type="hidden" name="CART" value="${CARTLIST }"/>
		<input type="hidden" name="TOTAL" value="${TOTAL }"/>
		<input type="submit" value="�����ϱ�"/>
	</form>
</c:if>
</div>
<br/><br/>
</body>
</html>






