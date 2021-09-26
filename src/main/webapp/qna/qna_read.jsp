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
<c:if test="${ empty QNA }">�������� �ʴ� �Խñ� �Դϴ�.</c:if>
<c:if test="${ ! empty QNA }">
<table width="80%">
	<tr><th>������</th><td>${QNA.title }</td></tr>
	<tr><th>�ۼ���</th><td>${QNA.reg_date }</td></tr>
	<tr><th>�ۼ���</th><td>
	<c:if test="${ ! empty QNA.user_id }">
		${QNA.user_id }
	</c:if>
	<c:if test="${ ! empty QNA.admin_id }">
		${QNA.admin_id }
	</c:if>
	</td></tr>
	<tr><th>�̸���</th><td>${QNA.email }</td></tr>
	<tr><td colspan="2"><img alt="" src="${pageContext.request.contextPath }/upload/${QNA.image_url }" 
				width="350" height="300"></td></tr>
	<tr><th>�۳���</th><td>${QNA.content }</td></tr>
	<tr><td colspan="2">
			<c:if test="${ ! empty sessionScope.ADMINID }">
			<a href="javascript:goReply()">[���]</a>
			</c:if>
			<a href="javascript:goModify()">[����]</a>
			<a href="javascript:goDelete()">[����]</a>
			<a href="../qna/qnaList.html">[���]</a></td></tr>
</table>
</c:if>
</div>

<script type="text/javascript">
function goReply(){
	document.move.action="../qna/qna_reply.html";
	document.move.submit();
}
function goModify(){
	document.move.action="../qna/qna_update.html";
	document.move.submit();
}
function goDelete(){
	document.move.action="../qna/qna_delete.html";
	document.move.submit();
}
</script>
<form name="move" method="post">
	<input type="hidden" name="seqno" value="${QNA.seqno }"/>
	<input type="hidden" name="parent_seqno" value="${QNA.seqno }"/>
	<input type="hidden" name="group_id" value="${QNA.group_id }"/>
</form>
</body>
</html>