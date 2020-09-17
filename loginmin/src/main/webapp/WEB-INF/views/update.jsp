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
	<form action="update" method="post"><!-- 홈컨트롤러보는거 update -->
		<input type="text" name="no" value="${bean.no}"><!-- 받아온것을 재수정해서 폼으로 보낸다  -->
		<input type="text" name="content" value="${bean.content }">
		<input type="submit" value="수정">
	</form></body>

</html>