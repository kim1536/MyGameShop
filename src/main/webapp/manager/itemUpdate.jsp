<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form:form action="../manager/updateDo.html" method="post" onSubmit="return validate(this)" 
	modelAttribute="item">
	<form:hidden path="item_id" value="${item.item_id }"/>
	<table width="80%">
		<tr><th>��ǰ��</th>
			<td><form:input path="item_name" value="${item.item_name }" size="20"/></td></tr>
		<tr><th>����</th>
			<td><form:input path="price" value="${item.price }" size="20"/></td></tr>
		<tr><th>��ǰ����</th>
			<td><form:textarea rows="8" cols="40" 
				path="context" value="${item.context }"></form:textarea></td></tr>
		<tr><td colspan="2"><input type="submit" value="����"/>
							<input type="reset" value="���"/></td></tr>
	</table>
</form:form>
<script type="text/javascript">
function validate(frm){
	if(frm.item_name.value==''){alert("��ǰ���� �Է��ϼ���."); return false;}
	if(frm.price.value==''){alert("������ �Է��ϼ���."); return false;}
	if(frm.context.value==''){alert("��ǰ������ �Է��ϼ���."); return false;}
	if(confirm("������ �����Ͻðڽ��ϱ�?")){
		alert("����Ǿ����ϴ�.");	
	}else{
		return false;
	}
}
</script>
</body>
</html>






