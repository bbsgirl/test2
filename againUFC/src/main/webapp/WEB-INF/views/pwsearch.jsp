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
			z-index: 5;
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
			z-index: 5;
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
        	margin-top: 200px;
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
            margin-bottom: 20px;
        }
        input[type = submit]{
            width: 300px;
            height: 50px;
            background-color: dimgray;
            border: 1px solid dimgray;
            color: white;
            margin-top: 20px;
            cursor: pointer;
        }
        span{
        	font-size: 20px;
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
               <form action = "PwSearchOk.do" method = "post">
                  <table>
                  <br>
                   <b>비밀번호 찾기</b>
                   <br>
                    <tr>
                        <td colspan="2"><span>아이디와 이름을 입력해주시기 바랍니다</span></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type = "text" placeholder = "아이디" name = "id"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type = "text" placeholder = "이름" name = "name"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><input type = "submit" value = "비밀번호 찾기"></td>
                    </tr>
                  </table>
                </form>
            </article>
            <br>
    </div>
        </section>
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