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
			<td><input type="text" name="id" value="${id}" ></td><td><input type="text" name="content"></td>
			<input type="hidden" name="gender" value="${gender}">
		</tr>
		<tr>
			<td><input type="submit" value="Ȯ��"></td><td><input type="button" valew="���"></td>
		</tr>
	</table>
</form>

</body>
</html>