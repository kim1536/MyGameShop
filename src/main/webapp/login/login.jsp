<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../home/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
#loginBtn { height:40pt; width:80;}
#a{font-size:13px;}
</style>
</head>
<body> 
<%@ include file="../home/header.jsp" %>
<br/>
<c:if test="${ ! empty sessionScope.USER || ! empty sessionScope.ADMIN }">
<script type="text/javascript">
alert("�̹� �α����� �Ǿ��ֽ��ϴ�.");
location.href="../home/template.html";
</script>
</c:if>
<c:if test="${ empty sessionScope.USER || empty sessionScope.ADMIN }">
<div align="center"><br/>
<form:form action="../login/loginResult.html" modelAttribute="login" method="post">
<table>	
	<tr height="30">
		<th width="30%">���̵�</th>
		<td width="40%"><form:input path="id" size="20"/><br/>
			<font size="2" color="red"><form:errors path="id"/></font></td>
		<td rowspan="2" width="30%" align="center"><input type="submit" value="�α���" id="loginBtn"/></td>
	</tr>
	<tr height="30">
		<th>��й�ȣ</th>
		<td width="120"><form:password path="password" size="20"/><br/>
			<font size="2" color="red"><form:errors path="password"/></font>	</td>
	</tr>
	<tr id="a">
		<td><a href="../login/goentry.html">ȸ������</a></td>
		<td colspan="2" align="right"><a href="../login/gosearchid.html">���̵� ã��</a> 
		<a href="../login/gosearchpwd.html">��й�ȣ ã��</a></div></td>
	</tr>
</table>
</form:form>
</div>
</c:if>
<br/>
<%@ include file="../home/footer.jsp" %>
</body>
</html>