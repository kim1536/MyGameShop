<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form:form action="../qna/deleteDo.html" method="post" onSubmit="return validate(this)"
	modelAttribute="qna">
	<form:hidden path="seqno" value="${qna.seqno }"/>
	<table width="80%">
	<tr><th>������</th><td>${qna.title }</td></tr>
	<tr><th>�ۼ���</th>
	<c:if test="${ ! empty qna.admin_id }">
		<td>${qna.admin_id }</td>
	</c:if>
	<c:if test="${ ! empty qna.user_id }">
		<td>${qna.user_id }</td>
	</c:if>
	</tr>
	<tr><th>�̹���</th><td><img alt="" 
			src="${pageContext.request.contextPath }/upload/${qna.image_url }"
			width="350" height="300"></td></tr>
	<tr><td colspan="2"><input type="submit" value="����"/>
		<input type="reset" value="���" onClick="javascript:history.go(-1)"/></td></tr>
	</table>
</form:form>
<script type="text/javascript">
function validate(frm){
	if(${qna.admin_id != sessionScope.ADMINID}){alert("�α��� �� �ۼ��� ������ Ȯ���ϼ���."); 
	location.href="../qna/qnaList.html"; return false;}
	if(${qna.user_id != sessionScope.USERID}){alert("�α��� �� �ۼ��� ������ Ȯ���ϼ���."); 
	location.href="../qna/qnaList.html";return false;}
	if(confirm("���� �����Ͻðڽ��ϱ�?")){
		alert("�����Ǿ����ϴ�.");
	}else{
		return false;
	}
}
</script>
</body>
</html>