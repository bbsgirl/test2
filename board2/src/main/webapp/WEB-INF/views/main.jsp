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


메인~~~<br>



<table border="1">
	<tr>
		<td>no</td><td>id</td><td>gender</td><td>content</td><td>day</td><td>수정</td><td>삭제</td>
	</tr>
	<c:forEach var="bean" items="${list}"><!-- "${list}" 조심 -->
		<tr>
			<td>${bean.no}</td>
			<td>${bean.id}</td>
			<td>${bean.gender}</td>
			<td>${bean.content}</td>
			<td>${bean.day}</td>
			<td><a href="gomodify?no=${bean.no}&content=${bean.content}"><input type="button" value="수정"></a></td>
			<td><a href="delete?no=${bean.no}"><input type="button" value="삭제"></a></td>
		</tr>
	</c:forEach>
</table>

</body>
</html>