<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../home/header.jsp"%>
<div align="center">
<h2>��������</h2>
<c:if test="${requestScope.NOTICELIST == null }">
	<h3>��ϵ� ���������� �������� �ʽ��ϴ�.</h3>
</c:if>
<c:if test="${NOTICELIST != null }">
<table class="notice" border="1">
	<tr>
		<th align="center" width="80">�۹�ȣ</th>
		<th align="center" width="320">������</th>
		<th align="center" width="100">�ۼ���</th>
		<th align="center" width="160">�ۼ���</th></tr>
	<c:forEach var="notice" items="${NOTICELIST }">
	<tr>
		<td align="center">${notice.seqno }</td>
		<td align="center"><a href="../notice/notice_read.html?SEQNO=${notice.seqno }">${notice.title }</td>
		<td align="center">������</td>
		<td align="center">${notice.notice_date }</td>
	</tr>
	</c:forEach>
</table>
<c:if test="${ ! empty sessionScope.ADMIN }">
	<div align="right">
		<a href="../notice/notice_write.html">�۾���</a>
	</div>
</c:if>
<c:forEach begin="1" end="${pageCount }" var="page">
	<a href="../notice/notice.html?pageNo=${page }">${page }</a>
</c:forEach>
</c:if>
</div>
</body>
</html>