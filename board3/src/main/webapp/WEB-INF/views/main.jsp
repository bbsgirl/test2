<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<style>
	
	
	
	</style>

</head>
<body>

<a href="goregister"><input type="button" value="ȸ������"></a>
<a href="gologin"><input type="button" value="�α���"></a>
<a href="goinsert"><input type="button" value="�Խñ۵��"></a>

<br>
${id}���� �����Ͽ����ϴ�.
<br>
������${gender}�Դϴ�

<table border="1">
	
	
	<tr>
		<td>NO</td><td>id</td><td>content</td><td>gender</td><td>date</td>
	</tr>
	<c:forEach var="bean" items="${list}">
	<tr>
		<td>${bean.idx}</td>
		<td>${bean.id}</td>
		<td>${bean.content}</td>
		<td>${bean.gender}</td>
		<td>${bean.day}</td>
		<td><a href="gomodify?idx=${bean.idx}&id=${bean.id}&content=${bean.content}&id1=${id}"><input type="button" value="����"></a></td>
	
	</tr>
	</c:forEach>
	<tr>
		<td colspan="2">
				<c:forEach var="i" begin="1" end="${pageCount}" step="1">
					<c:choose>
						<c:when test="${i eq pageNum }">
							[${i}]
						</c:when>
					    
						<c:otherwise>
							<a href="main?pageNum=${i}">[${i}]</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
		</td>
	</tr>
	

</table>

</body>
</html>