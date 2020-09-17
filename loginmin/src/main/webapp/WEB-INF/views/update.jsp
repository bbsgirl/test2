<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

update
	<form action="update" method="post">
		<input type="text" name="no" value="${bean.no}">
		<input type="text" name="content" value="${bean.content }">
		<input type="submit" value="수정">
	</form></body>

</html>