<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../home/header.jsp" %><br/>
<div align="center">
${userName }님의 아이디<br/>
${userId }<br/><br/>
<input type="button" value="홈으로" onClick="goMain()"/>
</div>
<script type="text/javascript">
function goMain(){
	location.href="../home/template.html"
}
</script><br/>
<%@ include file="../home/footer.jsp" %>
</body>
</html>