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
<form:form action="../qna/updateDo.html" method="post" enctype="multipart/form-data"
		onSubmit="return validate(this)" modelAttribute="qna">
	<form:hidden path="seqno" value="${qna.seqno }"/>
	<table width="80%">
		<tr><th>글제목</th>
			<td><form:input path="title" value="${qna.title }" size="20"/></td></tr>
		<tr><th>작성자</th>
		<c:if test="${ ! empty qna.admin_id }">
			<td>${qna.admin_id }</td>
		</c:if>
		<c:if test="${ ! empty qna.user_id }">
			<td>${qna.user_id }</td>
		</c:if>
		</tr>
		<tr><th>이메일</th><td><form:input path="email" value="${qna.email }" 
								size="20"/></td></tr>
		<tr><th>이미지</th><td>
			<img alt="" 
			src="${pageContext.request.contextPath }/upload/${qna.image_url }" 
			width="350" height="300"><br/>
			<input type="file" name="image"/></td></tr>
		<tr><th>글내용</th>
			<td><form:textarea rows="8" cols="40" 
				path="content" value="${qna.content }"></form:textarea></td></tr>
		<tr><td colspan="2"><input type="submit" value="수정"/>
							<input type="reset" value="취소"/></td></tr>
	</table>
</form:form>
<script type="text/javascript">
function validate(frm){
	if(${qna.admin_id != sessionScope.ADMINID}){alert("로그인 및 작성자 정보를 확인하세요."); 
	location.href="../qna/qnaList.html"; return false;}
	if(${qna.user_id != sessionScope.USERID}){alert("로그인 및 작성자 정보를 확인하세요."); 
	location.href="../qna/qnaList.html";return false;}
	if(confirm("정말 수정하시겠습니까?")){
		alert("수정되었습니다.");
	}else{
		return false;
	}
}
</script>
</body>
</html>






