<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style type="text/css">
input {height:20px;}
#submit {height:18pt;}
table {margin:10px;}
.header {text-align:center; border: 1px solid;}
</style>
<h2><a href="../home/template.html">�ΰ�</a></h2>
<div align="right">
<c:if test="${ ! empty sessionScope.USER }">
ȯ���մϴ�~${sessionScope.USER.user_name }��~
<a href="../login/logout.html">�α׾ƿ�</a>
</c:if>
<c:if test="${ ! empty sessionScope.ADMIN }">
�������~${sessionScope.ADMIN.adminId }��~<br/>
<a href="../manager/adminpage.jsp">������ ������</a> <a href="../login/logout.html">�α׾ƿ�</a>
</c:if>
<c:if test="${ empty sessionScope }"></c:if>
</div>
<div align="center">
<form action="../item/allBbs.html">
�� �� : <input type="text" name="SEARCH" size="20px"/> <input type="submit" value="�˻�" id="submit"/>
<table width="80%" >
	<tr class="header">
		<td class="header"><a href="../item/goBbs.html?CATE=PS">PS</a></td>
		<td class="header"><a href="../item/goBbs.html?CATE=NS">NS</a></td>
		<td class="header"><a href="../item/goBbs.html?CATE=XB">XB</a></td>
		<td class="header"><a href="../manager/rankingList.html">�Ǹ� ����</a></td>
		<td class="header"><a href="../qna/qnaList.html">�����ϱ�</a></td>
		<td class="header"><a href="../mypage/myPage.html">����������</a></td>
		<td class="header"><a href="../notice/notice.html">��������</a></td>
		<td class="header"><a href="../login/login.html">�α���</a></td>
	</tr>
</table>
</form>
</div>
