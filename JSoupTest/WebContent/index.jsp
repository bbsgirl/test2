<%@page import="java.util.ArrayList"%>
<%@page import="com.hs.core.JSoupUtil"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	JSoupUtil util = new JSoupUtil();
	ArrayList<String> result = util.getData();
	for(int i=0;i<result.size();i++){
		out.println(result.get(i)+"<br>");
	}
	
%>
</body>
</html>





