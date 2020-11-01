
<%@page import="com.min.UFC.dto.GameBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Bungee&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
 <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
            overflow: hidden;
        }
        body{
        	width: 100%;
        }
        #wrap{
            width: 100%;
			margin-top:150px;
        }
        header{
			display: flex;
			position: fixed;
			/* z-index: 1; */
			width: 100%;
			background-color: white;
			top: 0;
        }
        #info{
			margin-top: auto;
			margin-bottom:auto;
        	margin-right: auto;
        }
        #logo{
        	margin-right: 50px;
            width: 80px;
            height: 50px;
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
        #admin{
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
       		font-family: 'Bungee', cursive;
            width: 100%;
            margin: auto;
            height: 80px;
            background-color: black;
            text-align: center;
			position: fixed;
			left: 0px;
			top: 40px;
			z-index: 10;
        }
        nav>ul{
            display: flex;
            line-height: 250%;
			justify-content: space-between;
        }
        nav>ul>li{
            list-style: none;
			padding-left: 40px;
			padding-right: 40px;
			color: white;
			cursor: pointer;
        }
        li:hover{
        	color: red;
        }
		hr{
			border: 3px solid lightgray;
		}
		#bottom{
            width: 100%;
            height: 300px;
            position: relative;
            background-color: black;
            padding: 30px;
            z-index: 0;
            left:0;
        }
        .bot1{
            display: inline-block;
            cursor: pointer;
            color: white;
        }
        p{
            margin-top: 100px;
        }
        #search{
        	margin-top:40px;
        	text-align: center;
        }
        a{
        	text-decoration: none;
        	color:#000000;
        }
      	#f, #t, #u{
      		cursor: pointer;
    	}
     	#g{
			font-size:10px;
			color: white;
			opacity: 0.5;
      	}
		/* @media(max-width: 700px){
			#wrap{
				width: 100%;
				overflow: hidden;
			}
			header{
				width: 100%;
			}
			nav>ul{
				list-style: none;
			}
			nav>ul>li{
				padding-left: 10px;
				padding-right: 10px;
			}
		} */
        
     	#game{
	     width: 100%;
	     align-content: center;
	    }
 
    #game div{
         /*border: 1px solid red;*/
        align-content: center;
         display: flex;
      justify-content: center;
    }
    
  
    #game table{
      display: flex;
      justify-content: center;
      margin-left: 40%;
    }
    
    .gameTitle {
        text-align:left;
    }
    table{
        width: 400px;
    }
    table td{
        font-size: 25px;
    }
    .gname{
        font-size: 30px;
        
    }
    .gsubname {
    	margin-left: 8px;
        font-size: 18px;
        color: gray;
        padding-top:15px;
    }
    .game_img img{
        width: 400px;
        height: auto;
    }
    .game{
        display: flex;
        
    }
    td{
         text-align:center;
    }
    .btn_ticket{
         text-align:right;
         padding-bottom:50px;
         
    }
    #mypage{
        	margin-top: auto;
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
    }
    .gp{
    	font-size:18px;
    }
    .game_img{
    	padding-top:80px;
    	}

</style>
</head>
<body>

 <header>
		  <c:choose>
		 		<c:when test="${empty name }">
					<button id = "login" onclick = "login()">로그인</button>
					<button id = "join" onclick = "join()">회원가입</button>
				</c:when>
				<c:when test="${not empty name }">
	            		<span id = "info">${admin}${name}님 환영합니다!</span>
	            	<c:if test="${admin eq '(관리자) '}">
		          		<button class = "admin" onclick = "admin()">경기 등록</button>
						<button class = "admin" onclick = "admin2()">선수 등록</button>
					</c:if>	
	           		<c:if test="${admin ne '(관리자) '}">
	           			<button id = "mypage" onclick = "mypage()">마이 페이지</button>
					</c:if>           	
						<button id = "change" onclick = "change()">회원정보 수정</button>
						<button id = "logout" onclick = "logout()">로그아웃</button>
            	</c:when>
            </c:choose>
</header>
         <nav>
            <ul>
                <li id="ranksite">Ranking</li>
	            <li id="matchsite">Match</li>
	            <li><img src = "resources/img/logo2.png" id = "logo"></li>
	            <li id="shopsite">Shop</li>
	            <li id="videosite">Video</li>
            </ul>
        </nav>
<div id="wrap">
        <section>
        <%
        if(session.getAttribute("id") !=null){ //나중에 로 바꿀것
        	Vector<GameBean> v = (Vector<GameBean>)request.getAttribute("result");
        %>
        <hr>
                <hr class="line1">
                <h1 class="gameTitle">경기시간표</h1>
                <hr>
                <div id="game">
                           <%
	for(int i=0;i<v.size();i++){
		if(v.get(i).getIsfinish().equals("running")){%>
             <div class="game_img">
				<img src="resources/img/<%=v.get(i).getG_img()%>.png" alt="이미지x" class="img" >
			</div>
			<table>
			<tr>
			<td class="gname"><%= v.get(i).getG_name()%></td>
			 <td class="gsubname"><%= v.get(i).getG_date()%>/<%= v.get(i).getG_time()%></td>
			 </tr>
			 <tr>
			 <td colspan="2"><h2 class="gp">장소 : <%= v.get(i).getG_place()%></h2></td>	
			 </tr>
			
			<tr>
			<td colspan="2" class="btn_ticket"><input type="button" value="예매하기" onclick="gogo(<%=v.get(i).getIdx()%>)"></td>
			</tr>
			</table>
			<hr>

	<%
		}
	} %>
	
		</div>
</div>
	<% }else{ %>
<script>
       alert("로그인시 이용할 수 있습니다.");
       location.href = "mainpage";
</script>      
       <%  } %>


	</section>
       <!--  <footer> -->
            <div id="bottom">
	            <img src="resources/img/logo2.png"><br>
	            <div class="bot1">Privacy Policy </div>  
	            <div class="bot1">Terms of Use </div><br>
	            <div id="g">대표:민병진 <br> 주소:부산광역시 부산진구<br>저작권 ⓒ2001-ufc판권소유</div>
			 	<p><img src="resources/img/f.png" id="f"><img src="resources/img/t.png" id="t"><img src="resources/img/u.png" id="u"></p>
         	</div>
        <!-- </footer> -->
</body>
<script>
	function gogo(idx){
		location.href="TicketAdd?idx="+idx;
	}
	
	function mypage(){
		location.href="gomemberMyPage";
	}
	
	function logout(){
		location.href = "gologout";
	}
	function change(){
		location.href = "Change";
	}
	
	function admin(){
		location.href = "goadmin";
	}
	function admin2(){
		location.href = "goadmin2";
	}
	$("#ranksite").click(function(){
		location.href="rank";
		
	});
	
	$("#matchsite").click(function(){
		location.href = "Match";
	});
		
	$("#videosite").click(function(){
		location.href="video";
	
	});

	$("#shopsite").click(function(){
		location.href="Cap";
	
	});
	$("#logo").click(function(){
		location.href = "Main";
	});
</script>
</html>