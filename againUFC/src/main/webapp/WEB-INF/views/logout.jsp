<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script>
	alert("�α׾ƿ� �Ǿ����ϴ�.");
	<% session.invalidate(); %>
	location.href = "Main.do";
</script>
</body>
</html>