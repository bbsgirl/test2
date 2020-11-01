<%@page import="com.min.UFC.dto.playerBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
	#player{
		width: 200px;
		margin: 0 auto;
	}
	table{
		margin: 0 auto;
		font-size: 20px;
		font-weight: bolder;
	}
	#btn1{
   		width: 70px;
		height: 32px;
		background-color: black;
		color: white;
		outline: 0;
		border: 0;
		border-radius: 0.35em;
		margin-left: 80px;
    }
    #btn1:hover{
		color: red;
	}
	#btn2{
   		width: 70px;
		height: 32px;
		background-color: black;
		color: white;
		outline: 0;
		border: 0;
		border-radius: 0.35em;
    }
    #btn2:hover{
		color: red;
	}
</style>
</head>
<body>
<div id = "player">
	선수명<br>
	<% Vector<playerBean> v = (Vector<playerBean>)request.getAttribute("result_com"); 
	for(int i=0;i<v.size();i++){ %>
		<%= v.get(i).getName()%><br>
	<% }%>
</div>
<hr>
<form action="gameinsert.do" method="post" name = "frm">
	<input type="hidden" name="g_weight" value=<%=request.getAttribute("weight")%>><br>
	<table>
		<tr>
			<td>경기명</td><td><input type="text" name="g_name"></td>
		</tr>
		<tr>
			<td>경기 시간</td><td><input type="text" name="g_time"></td>
		</tr>
		<tr>
			<td>경기 날짜</td><td><input type="text" name="g_date"></td>
		</tr>
		<tr>
			<td>경기 장소</td><td><input type="text" name="g_place"></td>
		</tr>
		<tr>
			<td>선수1</td><td><input type="text" name="g_player1"></td>
		</tr>
		<tr>
			<td>선수2</td><td><input type="text" name="g_player2"></td>
		</tr>
		<tr>
			<td>티켓 수</td><td><input type="text" name="t_ticket"></td>
		</tr>
		<tr>
			<td>티켓가격</td><td><input type="text" name="t_price"></td>
		</tr>
		<tr>
			<td>이미지</td><td><input type="text" name="g_img"></td>
		</tr>
		<tr>
			<td><input type="button" id = "btn1" value="경기추가"></td><td><input type="button" id = "btn2" value="뒤로가기"></td>
		</tr>
	</table>
</form>
</body>
<script>
	$("#btn1").click(function(){
		frm.submit();
	});
	$("#btn2").click(function(){
		location.href = "Admin.do";
	});
</script>
</html>