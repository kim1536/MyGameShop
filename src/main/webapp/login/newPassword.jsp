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
<script type="text/javascript">
function check(frm){
	if(frm.PWD.value == ''){alert("비밀번호를 입력해주세요"); return false;}
	if(frm.PWD.value != frm.confirm.value){alert("비밀번호가 일치하지 않습니다."); return false;}
}
</script>
<div align="center">
<form action="../login/newPwdResult.html?USERID=${userId }" method="post">
<input type="hidden" value="${userId }"/>
<table>
	<tr><td>새 비밀번호 입력</td><td><input type="password" name="PWD"/></td></tr>
	<tr><td>비밀번호 확인</td><td><input type="password" name="confirm"/></td></tr>
</table><br/>
<input type="submit" value="변경"/>
</form>
</div>
</body>
</html>