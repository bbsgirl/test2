
<%@page import="com.min.UFC.dto.TicketBean"%>
<%@page import="com.min.UFC.dto.GameBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table{
	margin:0 auto;
	text-align:center;
	height:auto;
	}
	td{
		border: 1px solid black;
	}
	#home{
	margin-left: 80%;
	
	}
	table img{
	width:200px;
	}
	.combox{
	/* margin:0 auto; */
	margin-left:45%
	
	
	}
	input[type = button]{
   		width: 70px;
		height: 32px;
		background-color: black;
		color: white;
		outline: 0;
		border: 0;
		border-radius: 0.35em;
    }
    input[type = button]:hover{
		color: red;
	
	}
	
	.btn_combox{
			width: 100px;
 			height: 32px;
 			background-color: black;
 			color: white;
 			outline: 0;
 			border: 0;
 			border-radius: 0.35em;
	}
	.btn_combox:hover{
 		
 		color: red;
 		}
 		#select{
 			width: 130px;
  			height: 37px;
  			padding-left:30px;
  			border-radius: 20px;
 		}
 		
 		#home{
 			width: 100px;
 			height: 32px;
 			background-color: black;
 			color: white;
 			outline: 0;
 			border: 0;
 			border-radius: 0.35em;
 		
 		}
 		#home:hover{
 		color: red;
 		}
 		
 		.tt{
 			
 		}
 		.btt{
 			
 		}
 		.stt{
 			height: 100px;
 			padding-top: 30px;
 		}
	
</style>
</head>
<body>

<h1>관리자용 페이지</h1><button id="home" onclick="home()">home</button>
<hr>
체급선택
<hr>
<div class="stt">
	<div class="combox">
		<form action="GameCombox.do" name="frm">
			<select value="weight" name="weight" id="select">
				<option value="playerheavy" name="plw">heavy</option>
				<option value="playerlight" name="plw">light</option>
				<option value="playerwv" name="plw">womanventom</option>
				<option value="playerfly" name="plw">fly</option>
			</select>
			<input type="button" class="btn_combox" value="체급 선택" onclick="btn_combox()"><br>
		</form>
		
	</div>
</div>	
<br>



경기리스트 
<hr>
<div class="btt">
<table>
	<tr>
		<td>경기명</td>
		<td>경기 시간</td>
		<td>경기 날짜</td>
		<td>경기 장소</td>
		<td>선수1</td>
		<td>선수2</td>
		<td>티켓 수 </td>
		<td>티켓 가격</td>
		<td>이미지</td>
		<td>수정</td>
		<td>삭제</td>
		<td>승패체크</td>
	</tr>
	<% Vector<GameBean> v = (Vector<GameBean>)request.getAttribute("result");
		Vector<TicketBean> v2 = (Vector<TicketBean>)request.getAttribute("result_t");
		
		for(int i=0;i<v.size();i++) {
			if(v.get(i).getIsfinish().equals("running")){
				int idx = v.get(i).getIdx();%> 
				
				<tr>
					<td><%= v.get(i).getG_name()%></td>
					<td><%= v.get(i).getG_time()%></td>
					<td><%= v.get(i).getG_date()%></td> 
					<td><%= v.get(i).getG_place()%></td>
					<td><%= v.get(i).getG_player1()%></td>
					<td><%= v.get(i).getG_player2()%></td>
					<td><%= v.get(i).getT_ticket()%></td>
					<td><%= v.get(i).getT_price()%></td>	
					<td>
					<img src="img/<%=v.get(i).getG_img()%>.png" alt="이미지x" class="img" >
					</td>
					<td><input type="button" value="수정" onclick="btn_update(<%=idx%>)"></td>
					<td><input type="button" value="삭제" onclick="btn_del(<%=idx%>)"></td>
					<td><input type="button" value="승패확인" onclick="btn_count('<%=v.get(i).getG_player1()%>','<%=v.get(i).getG_player2()%>','<%=v.get(i).getG_weight()%>',<%=idx%>)"></td>
				</tr>
		
		
		<%	}}%>
	</table>
	
</div>	
	<br>

	경기 종료
	<hr>
<div class="tt">
	<table>
	<%
	for(int i=0;i<v.size();i++) {
		if(v.get(i).getIsfinish().equals("finish")){
			int idx = v.get(i).getIdx();%>
			<tr>
				<td><%= v.get(i).getG_name()%></td>
				<td><%= v.get(i).getG_time()%></td>
				<td><%= v.get(i).getG_date()%></td> 
				<td><%= v.get(i).getG_place()%></td>
				<td><%= v.get(i).getG_player1()%></td>
				<td><%= v.get(i).getG_player2()%></td>
				<td><%= v.get(i).getT_ticket()%></td>
				<td><%= v.get(i).getT_price()%></td>	
				<td>
				<img src="img/<%=v.get(i).getG_img()%>.png" alt="이미지x" class="img" >
				</td>
				<td><input type="button" value="삭제" onclick="btn_del(<%=idx%>)" ></td>
			</tr>
	<%	}}%>
	</table>
</div>
	<br>

	예매내역
	<hr>
<div class="tt">	
	<table>
		 <tr>
	            <td>경기num</td>
	            <td>구매아이디(이름땡겨오고싶으면 이름 땡겨오도록)</td>
	            <td>구매날짜</td>
	            <td>구매수</td>
	       </tr>
		   <%  for(int i=0;i<v2.size();i++) { %>
			<tr>
				<td><%= v2.get(i).getT_name()%></td>			
				<td><%= v2.get(i).getT_user()%></td>
				<td><%= v2.get(i).getT_pd()%></td> 
				<td><%= v2.get(i).getP_num()%></td> 
	         </tr>
	       <% } %> 
	</table>
</div>

	<script>
	function btn_combox(){
		frm.submit();
	}
	function btn_update(idx){
		location.href="GameUpdate.do?idx="+idx;
	}
	function btn_del(idx){
		location.href="GameDelete.do?idx="+idx;
	}
	function btn_count(name1,name2,weight,idx){
		location.href="GameCount.do?player1="+name1+"&player2="+name2+"&weight="+weight+"&idx="+idx;
	}
	function home(){
		location.href="Main.do";
	}	
		
</script>

</body>
</html>