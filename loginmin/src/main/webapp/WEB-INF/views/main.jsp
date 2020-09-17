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

${id}님이 입장하였습니다.<br>

<a href="goInsert"><input type="button" value="회원가입"></a>
<a href="gob_insert"><input type="button" value="게시판"></a>
<a href="gologin"><input type="button" value="로그인"></a>

<table border="1">
	<tr>
		<td>번호</td><td>Id</td><td>content</td><td>날짜</td><td>삭제</td><td>수정</td>
	</tr>
		<c:forEach var="bean" items="${list}">	
			<tr>
				<td>${bean.no}</td>
				<td>${bean.id}</td>
				<td>${bean.content}</td>
				<td>${bean.day}</td>
				<td><a href="delete?no=${bean.no}"><input type="button" value="삭제"></a>
				<td><a href="goupdate?no=${bean.no}&content=${bean.content}"><input type="button" value="수정"></td>
			</tr>
		</c:forEach>
</table>

</body>
</html>