
<%@page import="com.min.UFC.dto.playerBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Bungee&display=swap" rel="stylesheet">  
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
	* {
		padding: 0;
		margin: 0;
		box-sizing: border-box;
	}
	
	#wrap {
		width: 100%;
		margin: auto;
	}
	
	header {
		display: flex;
		position: fixed;
		z-index: 5;
		width: 100%;
		background-color: white;
	} 


	#info{
			margin-top: auto;
			margin-bottom:auto;
        	margin-right: auto;
     }
	
	#logo {
		width: 80px;
		height: 50px;
		cursor: pointer;
		margin-right: 50px;
        margin-top: 15px; 
	}
	 #admin{
        	margin-top: auto;
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
        }
        
     #mypage{
        	margin-top: auto;
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
    }
        
      #change{
        	margin-top: auto;
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
     }
	
	#logout {
		margin-top: auto;
		height: 40px;
		width: 100px;
		background-color: white;
		cursor: pointer;
		border: none;
	}
	
	nav {
		width: 100%;
		margin: auto;
		border: 1px solid black;
		height: 80px;
		background-color: black;
		position: fixed;
		left: 0px;
		top: 40px;
		z-index: 5;
		font-family: 'Bungee', cursive;
	}
	
	nav>ul {
		display: flex;
		line-height: 450%;
		justify-content: space-between;
	}
	
	nav>ul>li {
		height:80px;
		list-style: none;
		padding-left: 40px;
		padding-right: 40px;
		cursor: pointer;
		color: white;
		
	}
	 li:hover{
        	color: red;
        }
	
	#page1 {
		width: 100%;
		height: 100vh;
		position: relative;
	}
	
	#page2 {
		width: 100%;
		height: 100vh;
		position: relative;
	}
	
	#pro {
		width: 500px;
		height: 500px;
		position: absolute;
		top: 300px;
		left: 800px;
	}
	
	td {
		text-align: center;
		width: 245px;
		height: 80px;
		font-size: 20px;
	}
	
	#grim1 {
		width: 100%;
		height: 100%;
		position: absolute;
	}
	
	#grim2 {
		top: 150px;
		left: 250px;
		position: absolute;
	}
	
	h1 {
		text-align: center;
	}
	
	#bottom {
		width: 100%;
		height: 300px;
		position: relative;
		background-color: black;
		padding: 30px;
	}
	
	.bot1 {
		display: inline-block;
		cursor: pointer;
		color: white;
	}
	
	p {
		margin-top: 100px;
	}
	
	#f, #t, #u {
		cursor: pointer;
	}
	
	#g {
		font-size: 10px;
		color: white;
		opacity: 0.5;
	}
	
	td{
      	
      	font-family: inherit;
      	font-weight: bolder;
      
      }
      .tt:hover{
      	color: red;
      
      }
      
      
</style>


</head>
<body>


<%
String grade = "";
String gradechk = (String)session.getAttribute("admin");
	if(session.getAttribute("id") != null){
		if(gradechk.equals("no")){
			grade = "";
		}else{
			grade = "(관리자) ";
		}
	}
%>
	<%
		Vector<playerBean> v = (Vector) request.getAttribute("memv");

		String name = null;
		String age = null;
		String nationality = null;
		String height = null;
		int weight = 0;
		int win = 0;
		int lose = 0;
		for (int i = 0; i < v.size(); i++) {
			name = v.get(i).getName();
			age = v.get(i).getAge();
			nationality = v.get(i).getNationality();
			height = v.get(i).getHeight();
			weight = v.get(i).getWeight();
			win = v.get(i).getWin();
			lose = v.get(i).getLose();
	%>
	<%
		}
	%>




	<div id="wrap">
		<header>
			<% if(session.getAttribute("id") == null){ %>
				
            <% }else{%>
            	<span id = "info"><%= grade %><%=session.getAttribute("name")%>님 환영합니다!</span>
            <%   if(gradechk.equals("admin")){ %>
				<button id = "admin" onclick = "admin()">경기 등록</button>
				<button id = "admin" onclick = "admin2()">선수 등록</button>
           	<% 	}else{ %>
           		<button id = "mypage" onclick = "mypage()">마이 페이지</button>
           	<%	} %>
				<button id = "change" onclick = "change()">회원정보 수정</button>
				<button id = "logout" onclick = "logout()">로그아웃</button>
            <% } %>
		</header>
		<nav>
		<ul>
			<li id="ranksite">Ranking</li>
            <li id="matchsite">Match</li>
            <li><img src = "img/logo2.png" id = "logo"></li>
            <li id="shopsite">Shop</li>
            <li id="videosite">Video</li>
		</ul>
		</nav>
		<div id="page1">
			<img src="img/<%=name%>.jpg" id="grim1">

		</div>
		<div id="page2">

			<br> <br>
			<h1>프 로 필</h1>

			<img src="img/<%=name%>.png" id="grim2">
			<div id="pro">
				<table>
					<tr>
						<td>이 름 :</td>
						<td class="tt"><%=name%></td>
					</tr>

					<tr>
						<td>나 이 :</td>
						<td class="tt"><%=age%></td>
					</tr>

					<tr>
						<td>국 적 :</td>
						<td class="tt"><%=nationality%></td>
					</tr>

					<tr>
						<td>높 이 :</td>
						<td class="tt"><%=height%></td>
					</tr>

					<tr>
						<td>무 게 :</td>
						<td class="tt"><%=weight%></td>
					</tr>

					<tr>
						<td>승/패 :</td>
						<td class="tt"><%=win%>/<%=lose%></td>
					</tr>

				</table>


			</div>





		</div>
		
	</div>	
		<div id="bottom">
			<img src="img/logo2.png"><br>
			<div class="bot1">Privacy Policy</div>
			<div class="bot1">Terms of Use</div>
			<br>
			<div id="g">
				대표:민병진 <br> 주소:부산광역시 부산진구<br>저작권 ⓒ2001-ufc판권소유
			</div>
			<p>
				<img src="img/f.png" id="f"><img src="img/t.png" id="t"><img
					src="img/u.png" id="u">
			</p>
		</div>


	

	<script>
		$("#f").click(function() {
			location.href = " https://www.facebook.com/ ";
		});
		$("#t").click(function() {
			location.href = " https://www.twitter.com/ ";
		});
		$("#u").click(function() {
			location.href = " https://www.instagram.com/ ";
		});
		
		 $("#logo").click(function(){
		     	location.href="*.do";    	 
		 });
		 
	   	 $("#shop").click(function(){
	    	location.href="topCart.do";    	 
	     });
	     
	     $("#video").click(function(){
	    	location.href="video.do";    	 
	     });
	   
	     $("#rank").click(function(){
	         location.href="rank.do";    	 
	     });
		
	     $("#page1").on("mousewheel DOMMouseScroll",function(e){
             e.preventDefault();
             var e = e.originalEvent;
             var delta=0;
             if(e.detail){
                 delta = e.detail * -40;
             }else{
                 delta = e.wheelDelta;
             }
             var moveTop = 0;
             if(delta<0){
                 moveTop = $(this).next().offset().top -90;
             }else{
                 moveTop = $(this).prev().offset().top -90;
             }
             $("html, body").stop().animate({
                 scrollTop : moveTop+"px"
             },800)
         });
	     $("#page2").on("mousewheel DOMMouseScroll",function(e){
             e.preventDefault();
             var e = e.originalEvent;
             var delta=0;
             if(e.detail){
                 delta = e.detail * -40;
             }else{
                 delta = e.wheelDelta;
             }
             var moveTop = 0;
             if(delta<0){
                 moveTop = $(this).next().offset().top -90;
             }else{
                 moveTop = $(this).prev().offset().top -90;
             }
             $("html, body").stop().animate({
                 scrollTop : moveTop+"px"
             },800)
         });
	     
	     function logout(){
	  		location.href = "Logout.do";
	  	}
	     function change(){
	 		location.href = "Change.do";
	 	}
	 	function mypage(){
			location.href = "MemberMyPage.do";
		}
	 	function admin(){
			location.href = "Admin.do";
		}
		function admin2(){
			location.href = "Admin2.do";
		}
	 	
	 	$("#ranksite").click(function(){
			location.href="rank.do";
			
		});
		
		$("#matchsite").click(function(){
			location.href = "Match.do";
		});
			
		$("#videosite").click(function(){
			location.href="video.do";
		
		});

		$("#shopsite").click(function(){
			location.href="topCart.do";
		
		});
		
	</script>


</body>
</html>