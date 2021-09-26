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
<h2>�������</h2>
<c:if test="${requestScope.SALESLIST == null }">
	<h3>��ϵ� ��ǰ�� �������� �ʽ��ϴ�.</h3>
</c:if>
<c:if test="${SALESLIST != null }">
<table class="item" border="1">
	<tr>
		<th align="center" width="120">��ǰ��ȣ</th>
		<th align="center" width="200">�Ǹŷ�</th>
		<th align="center" width="200">���Ǹž�</th>
	<c:forEach var="sales" items="${SALESLIST }">
	<tr>
		<td align="center">${sales.item_id }</td>
		<td align="center">${sales.total_quantity }</td>
		<td align="center">${sales.total_sales } ��</td>		
	</tr>
	</c:forEach>
</table>
<table>
	<tr>
	<th align="center">���Ǿ� :</th><td align="center">${SUM } ��</td>
	</tr>
</table>
<c:forEach begin="1" end="${pageCount }" var="page">
	<a href="../manager/salesManage.html?pageNo=${page }">${page }</a>
</c:forEach>
</c:if>
</div>

</body>
</html>
