<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<c:forEach items="${mem}" var="bean"><!--보낸것을 받아온다  립에 자르를 jstl를 넣어야한다--> 
	${bean.name}/${bean.age}/${bean.nationality}/${bean.height}/${bean.weight}/${bean.win}/${bean.lose}<br>
</c:forEach> 
<c:forEach items="${memh}" var="bean"><!--보낸것을 받아온다  립에 자르를 jstl를 넣어야한다--> 
	${bean.name}/${bean.age}/${bean.nationality}/${bean.height}/${bean.weight}/${bean.win}/${bean.lose}<br>
</c:forEach> 
<c:forEach items="${meml}" var="bean"><!--보낸것을 받아온다  립에 자르를 jstl를 넣어야한다--> 
	${bean.name}/${bean.age}/${bean.nationality}/${bean.height}/${bean.weight}/${bean.win}/${bean.lose}<br>
</c:forEach> 
<c:forEach items="${memw}" var="bean"><!--보낸것을 받아온다  립에 자르를 jstl를 넣어야한다--> 
	${bean.name}/${bean.age}/${bean.nationality}/${bean.height}/${bean.weight}/${bean.win}/${bean.lose}<br>
</c:forEach> 

</body>
</html>