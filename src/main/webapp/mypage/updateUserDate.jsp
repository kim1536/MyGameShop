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
<div align="center">
<h2>회원 정보 수정</h2>
<form:form action="../mypage/updateDo.html" modelAttribute="user" method="post" name="frm"
			onSubmit="return check(this)">
	<form:hidden path="user_id" value="${sessionScope.USER.user_id }"/>
<table>
	<tr>
		<td>아이디</td>
		<td>${sessionScope.USER.user_id }</td>
	</tr>
	<tr><td>비밀번호</td>
		<td><form:password path="password" name="password"/><br/>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="CHECK"/></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><form:input path="user_name"/><br/>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${sessionScope.USER.birthday }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><form:input path="email"/><br/>
	</tr>
	<tr>
		<td>주소</td>
		<td><form:input path="address"/><br/>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>
			<form:input path="tel1" size="3" maxlength="3" />
			<form:input path="tel2" size="3" maxlength="4" />
			<form:input path="tel3" size="3" maxlength="4" /><br/>
		</td>
	</tr>
</table><br/>
<input type="submit" value="변경"/> <input type="reset" value="취소"/>
</form:form>
</div>
<script type="text/javascript">

function check(frm){
	if(frm.password.value == ""){
		alert("비밀번호를 입력 해주세요.");return false;
	}
	if(frm.password.value != frm.CHECK.value){
		alert("비밀번호가 같지 않습니다.");return false;
	}
	if(frm.user_name.value == ""){
		alert("이름을 입력 해주세요.");return false;
	}
	if(frm.yaer.value == "" || frm.month.value == "" || frm.date.value == "" ){
		alert("생녕월일 선택 해주세요.");return false;
	}
	if(frm.email.value == ""){
		alert("이메일을 입력 해주세요.");return false;
	}
	if(frm.address.value == ""){
		alert("주서를 입력 해주세요.");return false;
	}
	if(frm.tel1.value == "" || frm.tel2.value == "" || frm.tel3.value == ""){
		alert("전화번호를 입력 해주세요.");return false;
	}
}

var today = new Date();
var today_year= today.getFullYear();
var index=0;
for(var y=1960; y<=today_year; y++){
	document.getElementById('select_year').options[index] = new Option(y, y);
	index++;
}
index=0;
for(var m=1; m<=12; m++){
	document.getElementById('select_month').options[index] = new Option(m, m);
	index++;
}
lastday();
function lastday(){
	var Year=document.getElementById('select_year').value;
	var Month=document.getElementById('select_month').value;
	var day=new Date(new Date(Year,Month,1)-86400000).getDate();
	var dayindex_len=document.getElementById('select_day').length;
	if(day>dayindex_len){
		for(var i=(dayindex_len+1); i<=day; i++){
			document.getElementById('select_day').options[i-1] = new Option(i, i);
		}
	}
	else if(day<dayindex_len){
		for(var i=dayindex_len; i>=day; i--){
			document.getElementById('select_day').options[i]=null;
		}
	}
}
</script>
<br/>
</body>
</html>