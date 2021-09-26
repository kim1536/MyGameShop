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
		<tr><th>상품명</th>
			<td><form:input path="item_name" value="${item.item_name }" size="20"/></td></tr>
		<tr><th>가격</th>
			<td><form:input path="price" value="${item.price }" size="20"/></td></tr>
		<tr><th>상품설명</th>
			<td><form:textarea rows="8" cols="40" 
				path="context" value="${item.context }"></form:textarea></td></tr>
		<tr><td colspan="2"><input type="submit" value="수정"/>
							<input type="reset" value="취소"/></td></tr>
	</table>
</form:form>
<script type="text/javascript">
function validate(frm){
	if(frm.item_name.value==''){alert("상품명을 입력하세요."); return false;}
	if(frm.price.value==''){alert("가격을 입력하세요."); return false;}
	if(frm.context.value==''){alert("상품설명을 입력하세요."); return false;}
	if(confirm("정말로 변경하시겠습니까?")){
		alert("변경되었습니다.");	
	}else{
		return false;
	}
}
</script>
</body>
</html>






