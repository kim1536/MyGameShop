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
<form:form action="../notice/deleteDo.html" method="post" onSubmit="return validate(this)"
	modelAttribute="notice">
	<form:hidden path="seqno" value="${notice.seqno }"/>
	<table width="80%">
	<tr><th>글제목</th><td>${notice.title }</td></tr>
	<tr><th>작성자</th><td>${notice.admin_id }</td></tr>
	<tr><th>이미지</th><td><img alt="" 
			src="${pageContext.request.contextPath }/upload/${notice.image_url }"
			width="350" height="300"></td></tr>
	<tr><td colspan="2"><input type="submit" value="삭제"/>
		<input type="reset" value="취소" onClick="javascript:history.go(-1)"/></td></tr>
	</table>
</form:form>
<script type="text/javascript">
function validate(frm){
	if(confirm("정말 삭제하시겠습니까?")){
		alert("삭제되었습니다.");
	}else{
		return false;
	}
}
</script>
</body>
</html>