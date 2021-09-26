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
  width: 100px;
  height: 100px;
  overflow: hidden;
}
.data { padding : 30px;}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${ empty RANKLIST }">
<h2 align="center">상품이 존재하지 않습니다.</h2>
</c:if>
<c:if test="${ ! empty RANKLIST }">
<div align="center">
<h3 align="center">판매순위</h3>
<table width="60%">
	<tr>
	<c:forEach var="rank" items="${RANKLIST }" varStatus="status">
	<td class="data"><a href="../item/itemDetail.html?ID=${rank.item_id }">
	<img alt="" src="${pageContext.request.contextPath }/upload/${rank.picture_url }"
		class="container"></a><br/>
		<a href="../item/itemDetail.html?ID=${rank.item_id }">${rank.item_name }</a>	<br/>
			<fmt:formatNumber groupingUsed="true">${rank.price }</fmt:formatNumber>원
	</td>
	<c:if test="${status.count == 5}">
	<tr></tr>
	</c:if>
	</c:forEach>
	</tr>
</table>
</c:if>
</div>
</body>
</html>