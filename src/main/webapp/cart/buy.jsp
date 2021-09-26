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
<h3>구매 정보</h3>
<form:form action="../cart/buy.html" method="post" modelAttribute="order"
			onSubmit="return validate(this)">
	<form:hidden path="item_id" value="${CODE }"/>
	<form:hidden path="quantity" value="${QUANTITY }"/>
<table border="1" width="50%">
	<tr>
		<td rowspan="3" align="center" width="150">주문자 정보</td>
		<td align="center" width="120">주문자</td>
		<td><form:input path="recipient_name" size="20"/></td>
	</tr>
	<tr>
		<td align="center" width="120">주소</td>
		<td><form:input path="recipient_address" size="20"/></td>
	</tr>
	<tr>
		<td align="center" align="center" width="120">코멘트</td>
		<td><form:textarea path="order_com" rows="5" cols="40"></form:textarea></td>
	</tr>
</table><br/>
<table border="1" width="30%">
	<tr>
		<td rowspan="3" align="center" width="120">결제 금액</td>
		<td align="center" width="120">상품 합계 금매</td>
		<td align="center"><fmt:formatNumber groupingUsed="true">${PRICE }</fmt:formatNumber>원</td>
	</tr>
	<tr>
		<td align="center" width="120">배송비</td>
		<td align="center">500원</td>
	</tr>
	<tr>
		<td align="center" width="120">총 결제 금액</td>
		<td align="center"><fmt:formatNumber groupingUsed="true">${TOTALPRICE }</fmt:formatNumber>원</td>
	</tr>
	
</table>
<table>
<tr align="center"><input type="submit" value="구매"/><input type="reset" value="취소"/></tr>
</table>
</form:form>
</div>
<script type="text/javascript">
function validate(frm){
	if(frm.recipient_name.value == ''){alert("이름 입력하세요."); return false;}
	if(frm.recipient_address.value == ''){alert("주소 입력하세요."); return false;}
	var r = confirm("주문 정보의 문제 없으십니까?");
	if(r == false) return false;
}
</script>
<%@ include file="../home/footer.jsp" %><br/>
</body>
</html>