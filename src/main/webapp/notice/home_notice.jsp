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
<form:form action="../notice/home_notice.html" method="post" modelAttribute="notice">
<div align="center">
<c:if test="${requestScope.NOTICELIST == null }">
	<h3>��ϵ� ���������� �������� �ʽ��ϴ�.</h3>
</c:if>
<c:if test="${NOTICELIST != null }">
<h3 align="center">��������</h3>
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
	</tr><br/>
	</c:forEach>
</table>
</c:if>
</div>
<div align="right"><a href="../notice/notice.html">more..</a></div>
</form:form>
</body>
</html>