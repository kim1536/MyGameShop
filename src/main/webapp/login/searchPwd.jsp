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
	if(frm.user_id.value == ''){alert("아이디를 입력하세요."); return false;}
	if(frm.user_name.value == '' ){alert("이름을 입력하세요."); return false;}
	if(frm.email.value == ''){alert("이메일을 입력하세요"); return false;}
}
</script>
<div align="center">
<h3>비밀번호 찾기</h3>
<form:form action="../login/pwdsearch.html" modelAttribute="user" method="post"
			onSubmit="return check(this)">
<table>
	<tr><td>유저 아이디</td><td><form:input path="user_id"/></td></tr>
	<tr><td>유저이름</td><td><form:input path="user_name"/></td></tr>
	<tr><td>이메일</td><td><form:input path="email"/></td></tr>
</table><br/>
<input type="submit" value="찾기"/>
</form:form>
</div>
<%@ include file="../home/footer.jsp" %>
</body>
</html>