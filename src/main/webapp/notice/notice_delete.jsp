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
<form:form action="../notice/deleteDo.html" method="post" onSubmit="return validate(this)"
	modelAttribute="notice">
	<form:hidden path="seqno" value="${notice.seqno }"/>
	<table width="80%">
	<tr><th>������</th><td>${notice.title }</td></tr>
	<tr><th>�ۼ���</th><td>${notice.admin_id }</td></tr>
	<tr><th>�̹���</th><td><img alt="" 
			src="${pageContext.request.contextPath }/upload/${notice.image_url }"
			width="350" height="300"></td></tr>
	<tr><td colspan="2"><input type="submit" value="����"/>
		<input type="reset" value="���" onClick="javascript:history.go(-1)"/></td></tr>
	</table>
</form:form>
<script type="text/javascript">
function validate(frm){
	if(confirm("���� �����Ͻðڽ��ϱ�?")){
		alert("�����Ǿ����ϴ�.");
	}else{
		return false;
	}
}
</script>
</body>
</html>