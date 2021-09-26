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
<c:if test="${ empty NOTICE }">�������� �ʴ� �Խñ� �Դϴ�.</c:if>
<c:if test="${ ! empty NOTICE }">
<table width="80%">
	<tr><th>�۹�ȣ</th><td>${NOTICE.seqno }</td></tr>
	<tr><th>������</th><td>${NOTICE.title }</td></tr>
	<tr><th>�ۼ���</th><td>${NOTICE.notice_date }</td></tr>
	<tr><th>�ۼ���</th><td>${NOTICE.admin_id }</td></tr>
	<tr><td colspan="2"><img alt="" src="${pageContext.request.contextPath }/upload/${NOTICE.image_url }" 
				width="350" height="300"></td></tr>
	<tr><th>�۳���</th><td>${NOTICE.content }</td></tr>
	<tr><td colspan="2">
		<c:if test="${ ! empty sessionScope.ADMIN }">
			<a href="javascript:goModify()">[����]</a>
			<a href="javascript:goDelete()">[����]</a>
		</c:if>
			<a href="../notice/notice.html">[���]</a></td></tr>
</table>
</c:if>
</div>
<script type="text/javascript">

function goModify(){
	document.move.action="../notice/update.html";
	document.move.submit();
}
function goDelete(){
	document.move.action="../notice/delete.html";
	document.move.submit();
}
</script>
<form name="move" method="post">
	<input type="hidden" name="seqno" value="${NOTICE.seqno }"/>
</form>
</body>
</html>