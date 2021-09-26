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
<h2>��ǰ����</h2>
<c:if test="${requestScope.ITEMLIST == null }">
	<h3>��ϵ� ��ǰ�� �������� �ʽ��ϴ�.</h3>
</c:if>
<c:if test="${ITEMLIST != null }">
<table class="item" border="1">
	<tr>
		<th align="center" width="120">��ǰ��ȣ</th>
		<th align="center" width="120">�̹���</th>
		<th align="center" width="320">��ǰ�̸�</th>
		<th align="center" width="120">ī�װ�</th>
		<th align="center" width="160">�ۼ���</th></tr>
	<c:forEach var="item" items="${ITEMLIST }">
	<tr>
		<td align="center">${item.item_id }</td>
		<td align="center"><img alt="" 
			src="${pageContext.request.contextPath }/upload/${item.picture_url }" 
			width="40" height="30"></td>
		<td align="center"><a href="../item/itemDetail.html?ID=${item.item_id }">${item.item_name }</a></td>
		<td align="center">${item.category }</td>
		<td align="center">${item.reg_date }</td>		
		<td align="center" width="80"><a href="../manager/itemUpdate.html?itemId=${item.item_id }">����</a></td>
		<td align="center" width="80"><a href="../manager/itemDelete.html?itemId=${item.item_id }">����</a></td>
	</tr>
	</c:forEach>
</table>
<c:if test="${ ! empty sessionScope.ADMIN }">
	<div align="right">
		<a href="../item/goItemEntry.html">��ǰ���</a>
	</div>
</c:if>
<c:forEach begin="1" end="${pageCount }" var="page">
	<a href="../manager/itemManage.html?pageNo=${page }">${page }</a>
</c:forEach>
</c:if>
</div>

</body>
</html>
