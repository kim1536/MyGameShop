<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../home/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>나의 정보</h2>
<table>
	<tr>
		<td>아이디</td>
		<td>${sessionScope.USER.user_id }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${sessionScope.USER.user_name }</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${sessionScope.USER.birthday }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${sessionScope.USER.email }</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>${sessionScope.USER.address }</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${sessionScope.USER.tel }</td>
	</tr>
	<tr><td colspan="2">
			<a href="javascript:goModify();">[수정]</a>
			<a href="javascript:goDelete();">[탈퇴]</a></td>
	</tr>
</table><br/>
</div>
<script type="text/javascript">
function goModify(){
	document.move.action="../mypage/modify.html";
	document.move.submit();
}
function goDelete(){
	document.move.action="../mypage/delete.html";
	document.move.submit();
}
</script>
<form name="move" method="post">
	<input type="hidden" value="${userId }"/>
</form>
</body>
</html>