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
<%@ include file="../home/header.jsp" %><br/>
<div align="center">
<h3>���� ����</h3>
<form:form action="../cart/buy.html" method="post" modelAttribute="order"
			onSubmit="return validate(this)">
	<form:hidden path="item_id" value="${CODE }"/>
	<form:hidden path="quantity" value="${QUANTITY }"/>
<table border="1" width="50%">
	<tr>
		<td rowspan="3" align="center" width="150">�ֹ��� ����</td>
		<td align="center" width="120">�ֹ���</td>
		<td><form:input path="recipient_name" size="20"/></td>
	</tr>
	<tr>
		<td align="center" width="120">�ּ�</td>
		<td><form:input path="recipient_address" size="20"/></td>
	</tr>
	<tr>
		<td align="center" align="center" width="120">�ڸ�Ʈ</td>
		<td><form:textarea path="order_com" rows="5" cols="40"></form:textarea></td>
	</tr>
</table><br/>
<table border="1" width="30%">
	<tr>
		<td rowspan="3" align="center" width="120">���� �ݾ�</td>
		<td align="center" width="120">��ǰ �հ� �ݸ�</td>
		<td align="center"><fmt:formatNumber groupingUsed="true">${PRICE }</fmt:formatNumber>��</td>
	</tr>
	<tr>
		<td align="center" width="120">��ۺ�</td>
		<td align="center">500��</td>
	</tr>
	<tr>
		<td align="center" width="120">�� ���� �ݾ�</td>
		<td align="center"><fmt:formatNumber groupingUsed="true">${TOTALPRICE }</fmt:formatNumber>��</td>
	</tr>
	
</table>
<table>
<tr align="center"><input type="submit" value="����"/><input type="reset" value="���"/></tr>
</table>
</form:form>
</div>
<script type="text/javascript">
function validate(frm){
	if(frm.recipient_name.value == ''){alert("�̸� �Է��ϼ���."); return false;}
	if(frm.recipient_address.value == ''){alert("�ּ� �Է��ϼ���."); return false;}
	var r = confirm("�ֹ� ������ ���� �����ʴϱ�?");
	if(r == false) return false;
}
</script>
<%@ include file="../home/footer.jsp" %><br/>
</body>
</html>