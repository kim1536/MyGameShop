<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
input {height:20px;}
#submit {height:18pt;}
table {margin:10px;}
.header {text-align:center; border: 1px solid;}
</style>
<h2><a href="../home/template.html">로고</a></h2>
<div align="right">
<c:if test="${ ! empty sessionScope.USER }">
환영합니다~${sessionScope.USER.user_name }님~
<a href="../login/logout.html">로그아웃</a>
</c:if>
<c:if test="${ ! empty sessionScope.ADMIN }">
어서오세요~${sessionScope.ADMIN.adminId }님~<br/>
<a href="../manager/adminpage.jsp">관리자 페이지</a> <a href="../login/logout.html">로그아웃</a>
</c:if>
<c:if test="${ empty sessionScope }"></c:if>
</div>
<div align="center">
<form action="../item/allBbs.html">
검 색 : <input type="text" name="SEARCH" size="20px"/> <input type="submit" value="검색" id="submit"/>
<table width="80%" >
	<tr class="header">
		<td class="header"><a href="../item/goBbs.html?CATE=PS">PS</a></td>
		<td class="header"><a href="../item/goBbs.html?CATE=NS">NS</a></td>
		<td class="header"><a href="../item/goBbs.html?CATE=XB">XB</a></td>
		<td class="header"><a href="../manager/rankingList.html">판매 순위</a></td>
		<td class="header"><a href="../qna/qnaList.html">문의하기</a></td>
		<td class="header"><a href="../mypage/myPage.html">마이페이지</a></td>
		<td class="header"><a href="../notice/notice.html">공지사항</a></td>
		<td class="header"><a href="../login/login.html">로그인</a></td>
	</tr>
</table>
</form>
</div>
