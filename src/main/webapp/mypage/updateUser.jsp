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
<form action="../mypage/updateUserDo.html" method="post" onSubmit="return validate(this)">
	<input type="hidden" value="${userId }" name="userId"/>
	<table width="80%">
	<tr><td>비밀번호 입력</td><td><input type="password" name="PWD"/></td></tr>
	<tr><td>비밀번호 확인</td><td><input type="password" name="confirm"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="확인"/>
							<input type="reset" value="취소"/></td></tr>
</table>
</form>
<script type="text/javascript">
function validate(frm){
	if(frm.PWD.value == ''){alert("비밀번호를 입력해주세요"); return false;}
	if(frm.PWD.value != frm.confirm.value){alert("비밀번호가 일치하지 않습니다."); return false;}
}
</script>
</body>
</html>