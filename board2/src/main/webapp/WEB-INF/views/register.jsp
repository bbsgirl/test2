<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
regisert

<form action="register" method="post">
	<table>
		<tr>
			<td>id</td><td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>pw</td><td><input type="text" name="pw"></td>
		</tr>
		<tr>
			<td>name</td><td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>gender</td>
			<td>
				<select name="gender"><!-- 셀렉트로  보낼때는 안에 value값이 넘어간다 -->
					
						<option value="f">f</option>
						<option value="m">m</option>
					
				</select>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="확인"></td><td><a href="main"><input type="button" value="취소"></a></td>
		</tr>
		
	</table>
</form>

</body>
</html>