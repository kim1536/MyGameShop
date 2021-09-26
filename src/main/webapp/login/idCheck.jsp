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
<div align="center">
	<h2>계정 중복 확인</h2>
	<form action="../login/check.html" method="get" name="frm">
	<input type="hidden" name="OK_ID" value="${ID }"/>
	계 정 : <input type="text" name="USER_ID" value="${ID }"/>
	<input type="submit" value="중복 검사"/><br/>
	<c:if test="${ DUP == 'YES' }">
		<script type="text/javascript">
			opener.document.frm.user_id.value = '';	
		</script>
	${ID }는 이미 사용 중입니다.
	</c:if>
	<c:if test="${ DUP == 'NO' }">
	${ID }는 사용 가능합니다.
	<input type="button" value="사용" onClick="idOK()"/>
	</c:if>
	</form>
</div>
<script type="text/javascript">
function idOK(){
	opener.document.frm.user_id.value = document.frm.OK_ID.value;
	opener.document.frm.REALID.value = document.frm.OK_ID.value;
	opener.document.frm.IDCHECK.value = "OK";
	self.close();
}
</script>
</body>
</html>









