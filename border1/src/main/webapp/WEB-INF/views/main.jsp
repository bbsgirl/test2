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
메인
<a href="goInsert">값넣기</a>
<hr>
<table>
	<tr>
		<td>idx</td><td>name</td><td>content</td> <td>date</td><td>delete</td>
	</tr>
	<c:forEach var="bean" items="${list}">
	<tr>
		<td><a href="get?idx=${bean.idx}">${bean.idx}</a></td>
		<td><a href="get?idx=${bean.idx}">${bean.name}</a></td>
		<td>
			<a href="get?idx=${bean.idx}">${bean.content}</a>
		</td>
		<td><a href="get?idx=${bean.idx}">${bean.date1}</a></td>
		<td><a href="delete?idx=${bean.idx}"><input type="button" value="삭제"></a></td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="2">
			<c:forEach var="i" begin="1" end="${pageCount }" step="1">
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