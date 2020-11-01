<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>Home</title>
</head>
<body>

<p> ${result1}</p>
<p> ${result2.idx}/${result2.content}</p>
<p> ${result3.idx}/${result3.contetn}</p>
<p>
	<c:forEach var="dummy" items="${result4}">
		${dummy.idx}/${dummy.content}
		<a href="delete?idx=${dummy.idx}"> delete</a>
		<a href="goupdate?idx=${dummy.idx}&content=${dummy.content}"> update</a>
		<br>
	</c:forEach>
		

</p>
<form action="insert" method="post">
	<input type="text" name="content">
	<input type="submit" >
</form>

</body>
</html>
