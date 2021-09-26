<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC_KR">
<title>Insert title here</title>
<style type="text/css">
#menus { margin-top:10px; margin-left:20px; width:30%;
		font-size:16px; font-weight:bold; line-height:1.6em;
		padding-left:5px;}
#content {width:70%;}
</style>
</head>
<body>
<%@ include file="../home/header.jsp" %><br/>
<table  width="70%">
	<tr>
		<td id="menus">
			<div>
				<a href="../manager/salesManage.html">�������</a><br/>
				<a href="../manager/itemManage.html">��ǰ����</a><br/>
				<a href="../qna/qnaList.html">��������</a><br/>
				<a href="../notice/notice.html">��������</a><br/>
			</div>
		</td>
		<td id="content">
			<c:choose>
				<c:when test="${BODY != null }">
					<jsp:include page="${BODY }"/>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
</table>
<%@ include file="../home/footer.jsp" %><br/>
</body>
</html>