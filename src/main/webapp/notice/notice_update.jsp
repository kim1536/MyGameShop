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
<form:form action="../notice/updateDo.html" method="post" enctype="multipart/form-data"
		onSubmit="return validate(this)" modelAttribute="notice">
	<form:hidden path="seqno" value="${notice.seqno }"/>
	<table width="80%">
		<tr><th>������</th>
			<td><form:input path="title" value="${notice.title }" size="20"/></td></tr>
		<tr><th>�̹���</th><td>
			<img alt="" 
			src="${pageContext.request.contextPath }/upload/${notice.image_url }" 
			width="350" height="300"><br/>
			<input type="file" name="image"/></td></tr>
		<tr><th>�۳���</th>
			<td><form:textarea rows="8" cols="40" 
				path="content" value="${notice.content }"></form:textarea></td></tr>
		<tr><td colspan="2"><input type="submit" value="����"/>
							<input type="reset" value="���"/></td></tr>
	</table>
</form:form>
<script type="text/javascript">
function validate(frm){
	if(frm.title.value == ''){alert("������ �Է��ϼ���."); return false;}
	if(frm.content.value == ''){alert("�� ������ �Է��ϼ���."); return false;}
	if(confirm("������ �����Ͻðڽ��ϱ�?")){
		alert("����Ǿ����ϴ�.");	
	}else{
		return false;
	}
}
</script>
</body>
</html>






