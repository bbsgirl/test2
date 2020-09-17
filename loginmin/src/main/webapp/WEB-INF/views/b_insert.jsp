<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

***Session Test***<br>
${id}<br>

<form action="b_insert" method=post>

<table>
	<tr>
	<td>content</td><td><input type="text" name="content"></td>
						<input type="hidden" name="id" value="${id}">
	
	</tr>
	<td><input type="submit" value="저장"></td>
</table>


</form>
</body>
</html>