<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../home/tag.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.container {
  width: 200px;
  height: 150px;
  overflow: hidden;
}
.data { padding : 30px;}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../home/header.jsp" %><br/>
<c:if test="${ empty itemList }">
<h2 align="center">상품이 존재하지 않습니다.</h2>
</c:if>
<c:if test="${ ! empty itemList }">
<div align="center">
<form action="../item/searchItem.html">
<input type="hidden" name="CATEGORY" value="${CATEGORY }">
${CATEGORY }상품검색 : <input type="text" name="SEARCH"/> <input type="submit" value="검색" style="height:20pt"/>
</form>
<table width="60%">
	<tr>
	<c:forEach var="item" items="${itemList }" varStatus="status">
	<td class="data"><a href="../item/itemDetail.html?ID=${item.item_id }">
	<img alt="" src="${pageContext.request.contextPath }/upload/${item.picture_url }"
		class="container"></a><br/>
		<a href="../item/itemDetail.html?ID=${item.item_id }">${item.item_name }</a>	<br/>
			<fmt:formatNumber groupingUsed="true">${item.price }</fmt:formatNumber>원
	</td>
	<c:if test="${status.count == 4 }">
	<tr></tr>
	</c:if>
	</c:forEach>
	</tr>
</table>
<c:if test="${ empty SR }">
<c:forEach var="page" begin="1" end="${COUNT }">
	<a href="../item/goBbs.html?pageNo=${page }&CATE=${CATEGORY}">${page }</a>
</c:forEach>
</c:if>
<c:if test="${! empty SR }">
<c:forEach var="page" begin="1" end="${COUNT }">
	<a href="../item/searchItem.html?pageNo=${page }&CATEGORY=${CATEGORY}
		&SEARCH=${SEARCH }">${page }</a>
</c:forEach>
</c:if>
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