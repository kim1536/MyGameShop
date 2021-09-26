<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../home/header.jsp" %><br/>
<div align="center">
<form name="frm">
<table width="60%" style="border:1px solid black">
	<tr>
		<td><img alt="" src="${pageContext.request.contextPath }/upload/${ITEM.picture_url }"></td>
		<td>
			상품명 : ${ITEM.item_name }<br/>
			판매 가격 :<fmt:formatNumber groupingUsed="true">${ITEM.price }</fmt:formatNumber>원<br/>
			원산지 : ${ITEM.origin }<br/>
			제조업체 : ${ITEM.manufacturer }<br/>
			브랜드 : ${ITEM.brand }<br/>
			카테고리 : ${ITEM.category }<br/>
			등록일 : ${ITEM.reg_date }<br/>
			갯수 : <input type="text" name="quantity"  size="1" value="1">
			<br/><br/>
			<input type="button" value="장바구니" onclick="goCart();"/>
			<input type="button" value="바로 구매" onclick="goBuy();"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">상품설명 : ${ITEM.context }</td>
	</tr>
</table>
</form>
</div>
<script type="text/javascript">
function goCart(){
	alert("장바구니로");
	var quantity = document.frm.quantity.value;
	window.open('../cart/addCart.html?CODE=${ITEM.item_id }&QUANTITY='+quantity,'cart','width=400,height=150')
}
function goBuy(){
	alert("바로 구매하기");
	var quantity = document.frm.quantity.value;
	location.href="../cart/goBuy.html?CODE=${ITEM.item_id }&QUANTITY="+quantity;
}
</script>
<br/><%@ include file="../home/footer.jsp" %>
</body>
</html>