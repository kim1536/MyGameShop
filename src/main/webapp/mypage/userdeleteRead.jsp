<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="../home/tag.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:if test="${ QSEQNO == 'ok' }">
	<script type="text/javascript">
		alert("�̿����ּż� �����մϴ�.");
		location.href="../home/template.html"
	</script>
</c:if>
<c:if test="${ QSEQNO == 'nok' }">
	<script type="text/javascript">
		alert("��й�ȣ�� �ٸ��ϴ�. �ٽ� �õ�  ���ּ���.");
		location.href="../mypage/myPage.html";
	</script>
</c:if>
<script type="text/javascript">

</script>
</body>
</html>