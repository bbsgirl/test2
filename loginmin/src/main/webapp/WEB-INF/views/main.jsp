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

${id}���� �����Ͽ����ϴ�.<br>

<a href="goInsert"><input type="button" value="ȸ������"></a>
<a href="gob_insert"><input type="button" value="�Խ���"></a>
<a href="gologin"><input type="button" value="�α���"></a>

<table border="1">
	<tr>
		<td>��ȣ</td><td>Id</td><td>content</td><td>��¥</td><td>����</td><td>����</td>
	</tr>
		<c:forEach var="bean" items="${list}">	
			<tr>
				<td>${bean.no}</td>
				<td>${bean.id}</td>
				<td>${bean.content}</td>
				<td>${bean.day}</td>
				<td><a href="delete?no=${bean.no}"><input type="button" value="����"></a>
				<td><a href="goupdate?no=${bean.no}&content=${bean.content}"><input type="button" value="����"></td>
			</tr>
		</c:forEach>
</table>

</body>
</html>