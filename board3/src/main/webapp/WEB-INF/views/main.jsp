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

<a href="goregister"><input type="button" value="회원가입"></a>
<a href="gologin"><input type="button" value="로그인"></a>
<a href="goinsert"><input type="button" value="게시글등록"></a>

${id}님이 입장하였습니다.
<br>
성별은${gender}입니다

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