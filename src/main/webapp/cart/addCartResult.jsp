<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<h2>장바구니 담기</h2>
장바구니에 ${CODE }번 상품을 ${NUM }개 담았습니다.<br/><br/>
<input type="button" value="장바구니 보기" onClick="goCart()"/>
<input type="button" value="쇼핑 계속하기" onClick="doShopping()"/>
</div>
<script type="text/javascript">
function doShopping(){
	self.close();
	opener.document.location.href = "../item/allBbs.html?SEARCH=";
}
function goCart(){
	self.close();
	opener.document.location.href = "../cart/show.html";
}
</script>
</body>
</html>