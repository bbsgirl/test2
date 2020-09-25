<%@page import="com.min.UFC.dto.GameBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#wrap{
		margin: 0 auto;
		/* border: 1px solid black; */
	}
	table{
		margin:150px auto;
	}
	.btn2{
 			
 			width: 70px;
 			height: 32px;
 			background-color: black;
 			color: white;
 			outline: 0;
 			border: 0;
 			border-radius: 0.35em;
 			
 		}
 		
 		.btn2:hover{
 		
 			color: red;
 		}
 		
 		table{
 			text-align:center;
 			width: 80%;
 			/* border: 1px solid black;*/
 		}
 		
 		input[type = text]{
 		/* width:250px;
  	   
  	   	font-size: 20px;
 		
 		 */
 		 width: 100%;
 		 height: 35px;
 		 
 		}
 		td{
 			/* border:1px solid black; */
 			
 			
 		}
 		td:NTH-CHILD(1) {
			width: 30%;
			font-weight: bolder;
		}
		td:NTH-CHILD(2) {
			width: 70%;
			font-size: 25px;
			font-weight: bolder;
		}
	
</style>
</head>
<body>
경기 수정 페이지
<hr>
<% GameBean bean = (GameBean)request.getAttribute("result");
%>
<div id="wrap">
	<form action="GameUpdateOk.do" method="post" name="frm">
	<table>
		<tr>
			<td>경기명</td>
			<td><input type="text" value="<%=bean.getG_name() %>" name="g_name"></td>
		</tr>
		<tr>
			<td>경기 시간</td>
			<td><input type="text" value="<%=bean.getG_time() %>" name="g_time"></td>
		</tr>
		<tr>
			<td>경기 날짜</td>
			<td><input type="text" value="<%=bean.getG_date() %>" name="g_date"></td>
		</tr>	
		<tr>
			<td>경기 장소</td>
			<td><input type="text" value="<%=bean.getG_place() %>" name="g_place"></td>
		</tr>	
		<tr>
			<td>선수1</td>
			<td><input type="text" value="<%=bean.getG_player1() %>" name="g_player1"></td>
		</tr>	
		<tr>
			<td>선수2</td>
			<td><input type="text" value="<%=bean.getG_player2() %>" name="g_player2"></td>
		</tr>	
		<tr>
			<td>티켓수</td>
			<td><input type="text" value="<%=bean.getT_ticket() %>" name="t_ticket"></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" value="<%=bean.getT_price() %>" name="t_price"></td>
		</tr>
		<tr>
			<td>이미지</td>
			<td><input type="text" value="<%=bean.getG_img() %>" name="g_img"><input type="hidden" value="<%=bean.getIdx() %>" name="idx"></td>
		</tr>
		<tr>
			
			
			<td colspan="2"><input class="btn2" type="button" value="수정완료" onclick="btn_up()"><input class="btn2" type="button" value="취소" onclick="btn_can()"></td>
		</tr>
	
	</table>
	</form>	

</div>
<br>		

<script>
	function btn_up(){
		frm.submit();	
	}
	function btn_can(){
		location.href="Admin.do";
	}
</script>	

</body>
</html>