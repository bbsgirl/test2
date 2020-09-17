<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
로그인
	<form action = "login" method = "post">
		<table>
			<tr>
				<td>아이디</td><td><input type = "text" name = "id"></td>
			</tr>
		
			<tr>
				<td>비밀번호</td><td><input type = "text" name = "pw"></td>
			</tr>
			<tr>
				<td colspan = "2"><input type = "submit" value = "로그인"></td>
			</tr>
			
		</table>
	</form>
</body>
</html>