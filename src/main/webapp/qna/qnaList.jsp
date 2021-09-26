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
<c:if test="${ empty QNA }">
	<h3>문의사항이 존재하지 않습니다.</h3>
</c:if>
<c:if test="${ ! empty QNA }">
<h3>문의사항</h3>
<table  width="50%">
	<tr align="right"><td><b>${startRow } ~ ${endRow } / ${count }</b></td></tr>
</table>
<table width="80%" border="1">
	<th>글제목</th><th>작성자</th><th>작성일</th></tr>
	<c:forEach var="qna" items="${QNA }">
		<td align="center"><a href="javascript:goView(${qna.seqno })">${qna.title }</a></td>
		<td align="center">
		<c:if test="${ ! empty qna.user_id }">
		${qna.user_id }
		</c:if>
		<c:if test="${ ! empty qna.admin_id }">
		${qna.admin_id }
		</c:if>
		</td>
		<td align="center">${qna.reg_date }</td></tr>
	</c:forEach>
</table>
<c:set var="startPage"
value="${currentPage-(currentPage % 10 == 0 ? 10 : (currentPage % 10))+1 }"/>
<c:set var="endPage" value="${startPage + 9 }"/>
<c:if test="${endPage > pageCount }">
	<c:set var="endPage" value="${pageCount }"/>
</c:if>
<c:if test="${startPage > 10 }">
	<a href="javascript:goPage(${startPage - 1 })">[이전]</a>
</c:if>
<c:forEach var="pageNo" begin="${startPage }" end="${endPage }">
	<c:if test="${currentPage == pageNo }">
		<font size="3">
	</c:if>
	<a href="javascript:goPage(${pageNo })">${pageNo }</a>
	<c:if test="${currentPage == pageNo }">
		</font>
	</c:if>
</c:forEach>
<c:if test="${endPage < pageCount }">
	<a href="javascript:goPage(${endPage + 1 })">[다음]</a>
</c:if>

</c:if>
</div>
<div align="right">
<c:if test="${ ! empty sessionScope.ADMIN || !empty sessionScope.USER }">
		<a href="../qna/qna_write.html">글쓰기</a>
</c:if>
</div>

<script type="text/javascript">
function goView(id){
	document.move.action = "../qna/qna_read.html";
	document.move.pid.value = id;
	document.move.submit();
}
function goPage(no){
	document.move.action = "../qna/qnaList.html";
	document.move.PAGE_NUM.value = no;
	document.move.submit();
}
</script>
<form name="move" method="post" >
	<input type="hidden" name="PAGE_NUM" value="${currentPage }"/>
	<input type="hidden" name="pid"/>
</form>
</body>
</html>