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
<%@ include file="../home/header.jsp" %>
<script type="text/javascript">
function check(frm){
	if(frm.user_id.value == ''){alert("���̵� �Է��ϼ���."); return false;}
	if(frm.user_name.value == '' ){alert("�̸��� �Է��ϼ���."); return false;}
	if(frm.email.value == ''){alert("�̸����� �Է��ϼ���"); return false;}
}
</script>
<div align="center">
<h3>��й�ȣ ã��</h3>
<form:form action="../login/pwdsearch.html" modelAttribute="user" method="post"
			onSubmit="return check(this)">
<table>
	<tr><td>���� ���̵�</td><td><form:input path="user_id"/></td></tr>
	<tr><td>�����̸�</td><td><form:input path="user_name"/></td></tr>
	<tr><td>�̸���</td><td><form:input path="email"/></td></tr>
</table><br/>
<input type="submit" value="ã��"/>
</form:form>
</div>
<%@ include file="../home/footer.jsp" %>
</body>
</html>