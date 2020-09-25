<%@page import="project.min.dto.TicketBean"%>
<%@page import="project.min.dao.TicketDao"%>
<%@page import="java.util.Date"%>
<%@page import="project.min.dto.MypageCart"%>
<%@page import="project.min.dao.StoreDao"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Bungee&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        
        body{ 
        	-ms-overflow-style: none; 
        }
        
        ::-webkit-scrollbar { 
        	display: none; 
        }

        #wrap{
            width: 85%;
			height: 100vh;
			margin: auto;
			overflow: hidden;
        }
        header{
			display: flex;
			position: fixed;
			z-index: 10;
			width: 100%;
			background-color: white;
        }
        #info{
			margin-top: auto;
			margin-bottom:auto;
        	margin-right: auto;
        }
        #logo{
        	margin-top: 15px;
        	margin-right: 50px;
            width: 80px;
            height: 50px;
			cursor: pointer;
        }
        #login{
			margin-top: auto;
			margin-left: auto;
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
        }
        #logout{
			margin-top: auto;
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
        }
        #join{
			margin-top: auto;
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
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
        nav{
            width: 100%;
            margin: auto;
            height: 80px;
            background-color: black;
            text-align: center;
			position: fixed;
			left: 0px;
			top: 40px;
			z-index: 10;
			font-family: 'Bungee', cursive;
        }
        nav>ul{
            display: flex;
            line-height: 450%;
			justify-content: space-between;
        }
        nav>ul>li{
        	height:80px;
            list-style: none;
			padding-left: 40px;
			padding-right: 40px;
			color: white;
			cursor: pointer;
        }
        li:hover{
        	color: red;
        }
        section{
            margin-top: 130px;
            width: 100%;
            height: 800px;
        }
        aritcle{
			display: flex;
			flex-flow: row wrap;
        }
        #ticket{
			width: 50%;
			height: 775px;
			float: left;
            text-align: center;
            overflow: auto;
            border-right: 3px solid lightgray;
        }
		#goods{
			width: 50%;
			height: 775px;
			float: left;
            text-align: center;
            overflow: auto;
        }
        table{
        	border-top: 3px solid lightgray;
        	margin: auto;
        	table-layout: fixed;
        }
        #welcome{
        	text-align: left;
        	font-size: 20px;
        	font-weight: bolder;
        }
        #bottom{
            width: 100%;
            height: 300px;
            position: relative;
            background-color: black;
            padding: 30px;
        } 
        .bot1{
            display: inline-block;
            cursor: pointer;
            color: white;
        }
        p{
            margin-top: 100px;
        }
      	#f, #t, #u{
      		cursor: pointer;
      	}
    	#g{
	      	font-size:10px;
	      	color: white;
	      	opacity: 0.5;
      	}
        .column1{
        	padding-left: 50px;
        	padding-top: 50px;
        	font-weight: bolder;
        }
        .column2{
        	padding-left: 50px;
        	padding-bottom: 50px;
        }
        .fixed_top {
		  display:table;
		  position:absolute;
		  width:820px;
		  table-layout: fixed;
		  background-color: white;
		  border-bottom: 3px solid lightgray;
		}
</style>
</head>
<body>
<%
	StoreDao dao = new StoreDao();
	TicketDao dao1 = new TicketDao();
	String id = (String)session.getAttribute("id");
	Vector<MypageCart> v = dao.buyAlldata(id);
	Vector<TicketBean> v2 = dao1.ticketAll(id);
	String name = null;
	int name2 = 0;
	int price = 0;
	int count = 0;
	int count2 = 0;
	int total = 0;
	String purchase2 = null;
	Date purchase = null;
	
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
    <header>
        <% if(session.getAttribute("id") == null){ %>
	        <button id = "login" onclick = "login()">로그인</button>
	        <button id = "join" onclick = "join()">회원가입</button>
        <% }else{%>
        	<span id = "info"><%= grade %><%=session.getAttribute("name")%>님 환영합니다!</span>
         <% if(gradechk.equals("admin")){ %>
				<button id = "admin" onclick = "admin()">관리자 페이지</button>
         <% }else{ %>
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
    <div id = "wrap">
        <section>
            <article>
                 <div id = "welcome"><%= session.getAttribute("name") %>님의 마이페이지</div>
                 <div id = "ticket">
                     	<div class = "fixed_top">예매한 티켓</div>
                     	<table align="center">
                    	<%
                  	 	for(int i=0; i<v2.size(); i++){
						name2 = v2.get(i).getT_name();
						count2 = v2.get(i).getP_num();
						purchase2 = v2.get(i).getT_pd();
						%>
						<tr align="center">
							<td align="center" class="tableimg" rowspan="2"> 
							<img src="img/<%= name %>.png" alt="" class="img">
							</td>
							<td></td>
							<td class = "column1">Match Number</td>
							<td class = "column1">Count</td>
							<td class = "column1">Purchase</td>
						</tr>
						<tr align="center">
							<td></td>
						    <td class = "column2"><%= name2 %></td>
							<td class = "column2"><%= count2 %></td>
							<td class = "column2"><%= purchase2 %></td>
						</tr>
						<% } %>
						</table><br>
                 </div>
                 <div id = "goods">
                    	<div class = "fixed_top">구매한 상품</div>
                    	<table align="center">
                    	<%
                  	 	for(int i=0; i<v.size(); i++){
						name = v.get(i).getP_name();
						price = v.get(i).getPrice();
						count = v.get(i).getCount();
						purchase = v.get(i).getP_date();
						total = price*count;
						%>
						<tr align="center">
							<td align="center" class="tableimg" rowspan="2"> 
							<img src="img/<%= name %>.png" alt="" class="img">
							</td>
							<td></td>
							<td class = "column1">Goods</td>
							<td class = "column1">Price</td>
							<td class = "column1">Count</td>
							<td class = "column1">Total</td>
							<td class = "column1">Purchase</td>
						</tr>
						<tr align="center">
							<td></td>
						    <td class = "column2"><%= name %></td>
							<td class = "column2">$<%= price %></td>
							<td class = "column2"><%= count %></td>
							<td class = "column2">$<%= total %></td>
							<td class = "column2"><%= purchase %></td>
						</tr>
						<% } %>
						</table><br>
                 </div>
            </article>
        </section>
    </div>
    <div id="bottom">
        <img src="img/logo2.png"><br>
        <div class="bot1">Privacy Policy </div>  
        <div class="bot1">Terms of Use </div><br>
        <div id="g">대표:민병진 <br> 주소:부산광역시 부산진구<br>저작권 ⓒ2001-ufc판권소유</div>
        <p><img src="img/f.png" id="f"><img src="img/t.png" id="t"><img src="img/u.png" id="u"></p>
     </div>
</body>
<script>
	$("#logo").click(function(){
		location.href = "Main.do";
	});
	
	function login(){
		location.href = "Login.do";
	}
	
	function join(){
		location.href = "Join.do";
	}
	
	function logout(){
		location.href = "Logout.do";
	}
	
	function change(){
		location.href = "Change.do";
	}
	
	function mypage(){
		location.href = "MemberMyPage.do";
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
</html>