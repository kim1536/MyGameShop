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
<h2>회원가입</h2>
<form:form action="../login/entry.html" modelAttribute="user" method="post" name="frm"
			onSubmit="return check(this)">
<input type="hidden" name="IDCHECK"/>
<input type="hidden" name="REALID"/>
<table>
	<tr>
		<td>아이디</td>
		<td><form:input path="user_id"/><br/>
			<font color="red"><form:errors path="user_id"/></font></td>
		<td><input type="button" value="중복확인" style="height:20pt;"
					onClick="idCheck()"></td>
	</tr>
		<tr><td>비밀번호</td>
		<td><form:password path="password"/><br/>
			<font color="red"><form:errors path="password"/></font></td>
	</tr>
	<tr>
		<td>비밀번호 확인</td>
		<td><input type="password" name="CHECK"/></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><form:input path="user_name"/><br/>
			<font color="red"><form:errors path="user_name"/></font></td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>
			<form:select path="year" id="select_year" onchange="javascript:lastday();"></form:select>
			<form:select path="month" id="select_month" onchange="javascript:lastday();"></form:select>
			<form:select path="date" id="select_day"></form:select>
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><form:input path="email"/><br/>
			<font color="red"><form:errors path="email"/></font></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><form:input path="address" name=""/><br/>
			<font color="red"><form:errors path="address"/></font></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>
			<form:input path="tel1" size="3" maxlength="3"/>
			<form:input path="tel2" size="3" maxlength="4"/>
			<form:input path="tel3" size="3" maxlength="4"/><br/>
			<font color="red"><form:errors path="tel3"/></font>
		</td>
	</tr>
</table><br/>
<input type="submit" value="등록"/> <input type="reset" value="취소"/>
</form:form>
</div>
<script type="text/javascript">
function idCheck(){
	if(document.frm.user_id.value == ''){
		alert("아이디를 입력하세요.");
		return;
	}
	var url="../login/check.html?USER_ID="+document.frm.user_id.value;
	window.open(url,"_blank_","width=450,height=200");
}
function check(frm){
	if(frm.IDCHECK.value == ''){
		alert("계정 중복 검사를 해주세요."); return false;
	}
	if(frm.password.value != frm.CHECK.value){
		alert("비밀번호가 같지 않습니다."); return false;
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
<br/><%@ include file="../home/footer.jsp" %>
</body>
</html>