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
			��ǰ�� : ${ITEM.item_name }<br/>
			�Ǹ� ���� :<fmt:formatNumber groupingUsed="true">${ITEM.price }</fmt:formatNumber>��<br/>
			������ : ${ITEM.origin }<br/>
			������ü : ${ITEM.manufacturer }<br/>
			�귣�� : ${ITEM.brand }<br/>
			ī�װ� : ${ITEM.category }<br/>
			����� : ${ITEM.reg_date }<br/>
			���� : <input type="text" name="quantity"  size="1" value="1">
			<br/><br/>
			<input type="button" value="��ٱ���" onclick="goCart();"/>
			<input type="button" value="�ٷ� ����" onclick="goBuy();"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">��ǰ���� : ${ITEM.context }</td>
	</tr>
</table>
</form>
</div>
<script type="text/javascript">
function goCart(){
	alert("��ٱ��Ϸ�");
	var quantity = document.frm.quantity.value;
	window.open('../cart/addCart.html?CODE=${ITEM.item_id }&QUANTITY='+quantity,'cart','width=400,height=150')
}
function goBuy(){
	alert("�ٷ� �����ϱ�");
	var quantity = document.frm.quantity.value;
	location.href="../cart/goBuy.html?CODE=${ITEM.item_id }&QUANTITY="+quantity;
}
</script>
<br/><%@ include file="../home/footer.jsp" %>
</body>
</html>