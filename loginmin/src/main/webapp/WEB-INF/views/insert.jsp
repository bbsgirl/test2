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
ȸ������ <a href="/gologin"><input type="button" value="�α���"></a>
	<form action="insert" method="post">
		id : <input type="txet" name="id"><br>
		pw : <input type="txet" name="pw"><br>
		name : <input type="txet" name="name"><br>
		<input type="submit" value="����">
	</form>
</body>
</html>