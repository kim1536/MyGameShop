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
<%@ include file="../home/header.jsp" %><br/>
<div align="center">
<h2>질의/응답 글쓰기</h2><br/>
<form:form action="../qna/qna_reg.html" method="post" enctype="multipart/form-data" modelAttribute="qna">
	<form:hidden path="order_no" value="${qna.order_no + 1 }"/>
	<c:if test="${ ! empty qna.group_id }">
		<form:hidden path="group_id" value="${qna.group_id }"/>
	</c:if>
	<c:if test="${ ! empty qna.parent_seqno }">
		<form:hidden path="parent_seqno" value="${qna.parent_seqno }"/>
	</c:if>
	<table border="1" width="30%">
	<tr><th width="30%">글제목</th>
		<td><form:input path="title" value="${title }"/>
			<form:errors path="title"/></td></tr>
	<tr><th width="30%">작성자</th>
		<c:if test="${ ! empty USERID }">
			<td>${USERID }</td>
		</c:if>
		<c:if test="${ ! empty ADMINID }">
			<td>${ADMINID }</td>
		</c:if>
	<tr><th width="30%">이메일</th>
		<td><form:input path="email" size="20"/>
			<form:errors path="email"/></td></tr>
	<tr><td><input type="file" name="image" size="20"/></td></tr>
	<tr><th width="30%">글내용</th>
		<td><form:textarea rows="8" cols="40" path="content"></form:textarea></td></tr>
	<tr align ="center"><td colspan="2"><input type="submit" value="등 록"/>
						<input type="reset" value="취 소"/></td></tr>	
</table>
</form:form>
</div>
<%@ include file="../home/footer.jsp" %><br/>
</body>
</html>