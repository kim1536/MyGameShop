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
	<tr><td>��й�ȣ �Է�</td><td><input type="password" name="PWD"/></td></tr>
	<tr><td>��й�ȣ Ȯ��</td><td><input type="password" name="confirm"/></td></tr>
		<tr><td colspan="2"><input type="submit" value="Ȯ��"/>
							<input type="reset" value="���"/></td></tr>
</table>
</form>
<script type="text/javascript">
function validate(frm){
	if(frm.PWD.value == ''){alert("��й�ȣ�� �Է����ּ���"); return false;}
	if(frm.PWD.value != frm.confirm.value){alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�."); return false;}
}
</script>
</body>
</html>