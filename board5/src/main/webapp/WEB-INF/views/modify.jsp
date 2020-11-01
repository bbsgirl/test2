<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<form action="modify">
	<table>
		<tr>
			<td><input type="text" name="idx" value="${bean.idx}"></td><td><input type="text" name="content" value="${bean.content }"></td> 
		</tr>
		<tr>
			<td><input type="submit" value="확인"></td>
		</tr>
	</table>
</body>
</html>