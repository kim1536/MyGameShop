<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.container {
  width: 200px;
  height: 150px;
  overflow: hidden;
}
.data { padding : 30px;}
</style>
</head>
<body>
<%@ include file="../home/header.jsp" %><br/>
<c:if test="${ empty itemList }">
<h2 align="center">상품이 존재하지 않습니다.</h2>
</c:if>
<c:if test="${ ! empty itemList }">
<div align="center">
<table width="60%">
	<tr>
	<c:forEach var="item" items="${itemList }" varStatus="status">
	<td class="data"><a href="../item/itemDetail.html?ID=${item.item_id }">
	<img alt="" src="${pageContext.request.contextPath }/upload/${item.picture_url }"
		class="container"></a><br/>
		<a href="../item/itemDetail.html?ID=${item.item_id }">${item.item_name }</a><br/>
		<fmt:formatNumber groupingUsed="true">${item.price }</fmt:formatNumber>원
	</td>
	<c:if test="${status.count == 4 }">
	<tr></tr>
	</c:if>
	</c:forEach>
	</tr>
</table>
<c:forEach var="page" begin="1" end="${COUNT }">
	<a href="../item/allBbs.html?pageNo=${page }&SEARCH=${SEARCH }">${page }</a>
</c:forEach>
</c:if>
</div>
<c:if test="${! empty sessionScope.ADMIN }">
<div align="right">
<a href="../item/goItemEntry.html">상품 등록</a>
</div>
</c:if>
<br/><%@ include file="../home/footer.jsp" %>
</body>
</html>