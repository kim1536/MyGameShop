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
<jsp:include page="../notice/home_notice.html"/>
<jsp:include page="../manager/homeRank.html"/>
<%@ include file="../home/footer.jsp" %><br/>
</body>
</html>