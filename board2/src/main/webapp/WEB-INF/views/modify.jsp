<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
modify

<form action="modify" method="post">
<table>
	<tr>
		<td><input type="text" name="no" value="${bean.no}"></td><td><input type="text" name="content" value="${bean.content}"></td>
	</tr>
	<tr>
		<td><input type="submit" value="확인"></td>	
	</tr>
</table>
</form>
</body>
</html>