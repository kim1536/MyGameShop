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
<h2>��ٱ��� ���</h2>
��ٱ��Ͽ� ${CODE }�� ��ǰ�� ${NUM }�� ��ҽ��ϴ�.<br/><br/>
<input type="button" value="��ٱ��� ����" onClick="goCart()"/>
<input type="button" value="���� ����ϱ�" onClick="doShopping()"/>
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