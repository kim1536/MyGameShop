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
<form:form action="../item/entryItem.html" method="post" modelAttribute="item"
	enctype="multipart/form-data" name="frm" onsubmit="return check(this)">
<input type="hidden" name="IDCHECK"/>
<input type="hidden" name="REALID"/>
<table width="50%" style="border:1px solid black">
	<tr><td width="30%">상품 번호 </td>
		<td width="70%"><form:input path="item_id" size="30"/>
		<input type="button" value="중복확인" style="height:20pt;"
					onClick="idCheck()">
			<font color="red"><form:errors path="item_id"/></font></td></tr>
	<tr><td width="30%">상품 이름</td>
		<td width="70%"><form:input path="item_name" size="30"/>
			<font color="red"><form:errors path="item_name"/></font></td></tr>
	<tr><td width="30%">가격</td>
		<td width="70%"><form:input path="price" size="30"/>
			<font color="red"><form:errors path="price"/></font></td></tr>
	<tr><td width="30%">원산지</td>
		<td width="70%"><form:input path="origin" size="30"/>
			<font color="red"><form:errors path="origin"/></font></td></tr>
	<tr><td width="30%">제조업체</td>
		<td width="70%"><form:input path="manufacturer" size="30"/>
			<font color="red"><form:errors path="manufacturer"/></font></td></tr>
	<tr><td width="30%">브랜드</td>
		<td width="70%"><form:input path="brand" size="30"/>
			<font color="red"><form:errors path="brand"/></font></td></tr>
	<tr><td width="30%">카테고리</td>
		<td width="70%">
		<form:select path="category">
			<form:option value="PS">PS</form:option>
			<form:option value="NS">NS</form:option>
			<form:option value="XB">XB</form:option>		
		</form:select>
			<font color="red"><form:errors path="category"/></font></td></tr>
	<tr><td width="30%">이미지</td>
		<td width="70%"><input type="file" name="image" size="30"/>
	<tr><td width="30%">상품 설명</td>
		<td width="70%"><form:textarea rows="10" cols="60" path="context"/><br/>
			<font color="red"><form:errors path="context"/></font></td></tr>
</table><br/>
<input type="submit" value="상품등록"/> <input type="reset" value="취소"/>
</form:form>
</div>
<br/><%@ include file="../home/footer.jsp" %>
<script type="text/javascript">
function idCheck(){
	if(document.frm.item_id.value == ''){
		alert("상품번호를 입력하세요.");
		return;
	}
	var url="../item/check.html?ITEM_ID="+document.frm.item_id.value;
	window.open(url,"_blank_","width=450,height=200");
}
function check(frm){
	if(frm.IDCHECK.value == ''){
		alert("상품번호 중복 검사를 해주세요."); return false;
	}
}
</script>
</body>
</html>