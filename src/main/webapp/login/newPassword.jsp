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
	if(frm.PWD.value == ''){alert("��й�ȣ�� �Է����ּ���"); return false;}
	if(frm.PWD.value != frm.confirm.value){alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�."); return false;}
}
</script>
<div align="center">
<form action="../login/newPwdResult.html?USERID=${userId }" method="post">
<input type="hidden" value="${userId }"/>
<table>
	<tr><td>�� ��й�ȣ �Է�</td><td><input type="password" name="PWD"/></td></tr>
	<tr><td>��й�ȣ Ȯ��</td><td><input type="password" name="confirm"/></td></tr>
</table><br/>
<input type="submit" value="����"/>
</form>
</div>
</body>
</html>