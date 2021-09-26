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
	<h3>등록된 공지사항이 존재하지 않습니다.</h3>
</c:if>
<c:if test="${NOTICELIST != null }">
<h3 align="center">공지사항</h3>
<table class="notice" border="1">
	<tr>
		<th align="center" width="80">글번호</th>
		<th align="center" width="320">글제목</th>
		<th align="center" width="100">작성자</th>
		<th align="center" width="160">작성일</th></tr>
	<c:forEach var="notice" items="${NOTICELIST }">
	<tr>
		<td align="center">${notice.seqno }</td>
		<td align="center"><a href="../notice/notice_read.html?SEQNO=${notice.seqno }">${notice.title }</td>
		<td align="center">관리자</td>
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