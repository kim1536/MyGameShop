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
<h2>���� ����</h2>
<table>
	<tr>
		<td>���̵�</td>
		<td>${sessionScope.USER.user_id }</td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td>${sessionScope.USER.user_name }</td>
	</tr>
	<tr>
		<td>�������</td>
		<td>${sessionScope.USER.birthday }</td>
	</tr>
	<tr>
		<td>�̸���</td>
		<td>${sessionScope.USER.email }</td>
	</tr>
	<tr>
		<td>�ּ�</td>
		<td>${sessionScope.USER.address }</td>
	</tr>
	<tr>
		<td>��ȭ��ȣ</td>
		<td>${sessionScope.USER.tel }</td>
	</tr>
	<tr><td colspan="2">
			<a href="javascript:goModify();">[����]</a>
			<a href="javascript:goDelete();">[Ż��]</a></td>
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