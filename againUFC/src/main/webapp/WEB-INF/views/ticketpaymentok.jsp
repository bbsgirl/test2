<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <%
      String id = (String)session.getAttribute("id");
    System.out.println("ticketpay-ok.jsp "+id);
       %> <!--종준씨코드참고한건데 틀릴수도있음;-->
    
<script>
alert("결제가 완료되었습니다.");
location.href="Match.do"; //여기아니면 그냥 마이페이지정도로 이동하는게 끝 
</script>
</body>
</html>