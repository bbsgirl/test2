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

<a href="goregister"><input type="button" value="ȸ������"></a>
<a href="gologin"><input type="button" value="�α���"></a>
<a href="goinsert"><input type="button" value="�Խñ۵��"></a>

${id}���� �����Ͽ����ϴ�.
<br>
������${gender}�Դϴ�

<table>
	<tr>
		<td>id</td><td>content</td><td>gender</td><td>date</td>
	</tr>
	<%-- <c:forEach>
	<tr>
		<td>id</td><td>content</td><td>gender</td><td>date</td>
	</tr>
	</c:forEach> --%>

</table>

</body>
</html>