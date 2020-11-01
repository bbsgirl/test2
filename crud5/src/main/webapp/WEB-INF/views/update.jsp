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

<form action="update">
 

 	<input type="text" name="content" value="${content}">
 	<input type="text" name="idx" value="${idx}">
 
 <input type="submit" value="hi">
</form>
</body>
</html>