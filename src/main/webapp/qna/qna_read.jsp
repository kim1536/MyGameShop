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
<c:if test="${ empty QNA }">존재하지 않는 게시글 입니다.</c:if>
<c:if test="${ ! empty QNA }">
<table width="80%">
	<tr><th>글제목</th><td>${QNA.title }</td></tr>
	<tr><th>작성일</th><td>${QNA.reg_date }</td></tr>
	<tr><th>작성자</th><td>
	<c:if test="${ ! empty QNA.user_id }">
		${QNA.user_id }
	</c:if>
	<c:if test="${ ! empty QNA.admin_id }">
		${QNA.admin_id }
	</c:if>
	</td></tr>
	<tr><th>이메일</th><td>${QNA.email }</td></tr>
	<tr><td colspan="2"><img alt="" src="${pageContext.request.contextPath }/upload/${QNA.image_url }" 
				width="350" height="300"></td></tr>
	<tr><th>글내용</th><td>${QNA.content }</td></tr>
	<tr><td colspan="2">
			<c:if test="${ ! empty sessionScope.ADMINID }">
			<a href="javascript:goReply()">[답글]</a>
			</c:if>
			<a href="javascript:goModify()">[수정]</a>
			<a href="javascript:goDelete()">[삭제]</a>
			<a href="../qna/qnaList.html">[목록]</a></td></tr>
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