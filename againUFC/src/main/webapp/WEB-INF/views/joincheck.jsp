<%-- <%@page import="project.min.dao.MemberDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ page trimDirectiveWhitespaces="true" %>
   
<%
	String id = request.getParameter("id");
	MemberDao dao = new MemberDao(); 
	boolean result = dao.memberCheck(id);
	String str="NO";
	if(!result){
		str="YES";
	}
	JSONObject json = new JSONObject();	
	json.put("result", str);
	json.put("result2", str);
	json.put("result3", str);
	out.println(json.toString());
%>



 --%>

