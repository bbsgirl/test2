<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="modify" method="post">
	<table>
		
		<tr>
			<td><input type="text" value="${b.idx}"></td><td><input type="text" value="${b.content}"></td>
		</tr>
		
		<tr>
			<td><input type="submit" value="수정"></td><td><a href="main"><input type="button" value="취소"></a></td>
		</tr>
	</table>

</form>

</body>
</html>