<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "EUC-KR">
   <title>Document</title>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
         *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        #wrap{
            width: 85%;
			height: 80vh;
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
        #join{
			margin-top: auto;
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
        }
         #search1{
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
            margin-left: 120px;
        }
        #search2{
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
            margin-right: 120px;
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
        }
        nav>ul{
            display: flex;
            line-height: 450%;
			justify-content: space-between;
        }
        nav>ul>li{
            list-style: none;
			padding-left: 40px;
			padding-right: 40px;
			color: white;
			cursor: pointer;
        }
        section{
        	margin-top: 150px;
        }
        article{
            border: 1px solid black;
            width: 500px;
            margin: auto;
            height: 350px;
            text-align: center;
            font-weight: bold;
            font-size: 25px;
        }
        table{
            width: 500px;
            height: 200px;
            text-align: center;
            font-weight: bold;
            font-size: 25px;
            margin-top: 20px;
        }
        input[type = text]{
            width: 350px;
            height: 40px;
            font-size: 20px;
        }
        input[type = password]{
            width: 350px;
            height: 40px;
            font-size: 20px;
        }
        input[type = submit]{
            width: 300px;
            height: 50px;
            background-color: dimgray;
            border: 1px solid dimgray;
            color: white;
            margin-top: 20px;
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
        @media(max-width: 700px){
			#wrap{
				width: 100%;
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
    </style>
</head>
<body>
<% 
	String name = (String)request.getAttribute("name");
	String id = (String)request.getAttribute("id"); 
%>
<div id = "back"></div>
        <header>
            <button id = "login" onclick = "login()">로그인</button>
            <button id = "join" onclick = "join()">회원가입</button>
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
          <br>
            <article>
               <form action = "Loginok.do" method = "post">
                  <table>
                  <br>
                   <b><%= name %>님의 아이디</b>
                   <br>
                   <tr>
                       <td colspan="2"><span><%= name %>님의 아이디는 <%= id %> 입니다.</span></td>
                   </tr>
                    <tr>
                        <td><input type = "button" value = "로그인"  id = "search1" onclick = "login()"></td><td><input type = "button" value = "비밀번호 찾기" id = "search2" onclick = "pws()"></td>
                    </tr>
                  </table>
                </form>
            </article>
            <br>
        </section>
    </div>
        <footer>
            <div id="bottom">
            <img src="img/logo2.png"><br>
            <div class="bot1">Privacy Policy </div>  
            <div class="bot1">Terms of Use </div><br>
            <div id="g">대표:민병진 <br> 주소:부산광역시 부산진구<br>저작권 ⓒ2001-ufc판권소유</div>
             <p><img src="img/f.png" id="f"><img src="img/t.png" id="t"><img src="img/u.png" id="u"></p>
         </div>
        </footer>
</body>
<script>
	function login() {
		location.href = "Login.do";
	}
	function join() {
		location.href = "Join.do";
	}
	function pws() {
		location.href = "PwSearch.do";
	}
	$("#logo").click(function(){
		location.href = "Main.do";
	});
	
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