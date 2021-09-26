<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form:form action="../notice/updateDo.html" method="post" enctype="multipart/form-data"
		onSubmit="return validate(this)" modelAttribute="notice">
	<form:hidden path="seqno" value="${notice.seqno }"/>
	<table width="80%">
		<tr><th>글제목</th>
			<td><form:input path="title" value="${notice.title }" size="20"/></td></tr>
		<tr><th>이미지</th><td>
			<img alt="" 
			src="${pageContext.request.contextPath }/upload/${notice.image_url }" 
			width="350" height="300"><br/>
			<input type="file" name="image"/></td></tr>
		<tr><th>글내용</th>
			<td><form:textarea rows="8" cols="40" 
				path="content" value="${notice.content }"></form:textarea></td></tr>
		<tr><td colspan="2"><input type="submit" value="수정"/>
							<input type="reset" value="취소"/></td></tr>
	</table>
</form:form>
<script type="text/javascript">
function validate(frm){
	if(frm.title.value == ''){alert("제목을 입력하세요."); return false;}
	if(frm.content.value == ''){alert("글 내용을 입력하세요."); return false;}
	if(confirm("정말로 변경하시겠습니까?")){
		alert("변경되었습니다.");	
	}else{
		return false;
	}
}
</script>
</body>
</html>






