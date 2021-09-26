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
<h2>공지사항 글쓰기</h2><br/>
<form:form action="../notice/notice_reg.html" method="post" modelAttribute="notice" 
	 enctype="multipart/form-data">
제 목 : <form:input path="title" placeHolder="제목"/><br/>
<font color="red"><form:errors path="title"/></font><br/>
이미지<input type="file" name="image"/><br/>
<form:textarea rows="5" cols="80" path="content" placeHolder="내용"></form:textarea><br/>
<font color="red"><form:errors path="content"/></font>
<div align="center">
<input type="submit" value="글올리기"/><input type="reset" value="취 소"/>
</div>
</form:form>
</div>

</body>
</html>




