<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
insert

<form action="insert" method="post">
<table>
	<tr>
		<td>${id }</td>
		<td><input type="text" name="content"> </td>
		<input type="hidden" name="id" value="${id}">
		<input type="hidden" name="gender" value="${gender}"><!-- 젠더를 받아서  보낸다  -->
	</tr>
	<tr>
		<td><input type="submit" value="확인"></td>
	</tr>
</table>
</form>

</body>
</html>