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
	alert("로그아웃 되었습니다.");
	<% session.invalidate(); %>
	location.href = "Main.do";
</script>
</body>
</html>