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
<h2>�������� �۾���</h2><br/>
<form:form action="../notice/notice_reg.html" method="post" modelAttribute="notice" 
	 enctype="multipart/form-data">
�� �� : <form:input path="title" placeHolder="����"/><br/>
<font color="red"><form:errors path="title"/></font><br/>
�̹���<input type="file" name="image"/><br/>
<form:textarea rows="5" cols="80" path="content" placeHolder="����"></form:textarea><br/>
<font color="red"><form:errors path="content"/></font>
<div align="center">
<input type="submit" value="�ۿø���"/><input type="reset" value="�� ��"/>
</div>
</form:form>
</div>

</body>
</html>




