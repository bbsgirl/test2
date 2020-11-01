
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "EUC-KR">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Bungee&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        #wrap{
            width:100%;
            margin: auto;
        }
        header{
			display: flex;
        }
        #info{
			margin-top: auto;
			margin-bottom:auto;
        	margin-right: auto;
        	padding-left: 20px;
        }
        #logo{
        	margin-top: 15px;
        	margin-right: 50px;
            width: 80px;
            height: 50px;
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
        #mcgh{
        	margin-top: auto;
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
        nav{
    		font-family: 'Bungee', cursive;
            width: 100%;
            margin: auto;
            height: 80px;
            background-color: black;
            text-align: center;
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
        li:hover{
        	color: red;
        }
        article{
            text-align: center;
            border: 1px solid black;
            width: 800px;
            height: 600px;
            margin: auto;
            margin-top: 40px;
            margin-bottom: 40px;
        }
        table{
            width: 800px;
            margin: auto;
        }
        b{
            font-size: 25px;
        }
        td:nth-child(1){
            float: left;
            margin-left: 50px;
            font-size: 22px;
            font-weight: bold;
        }
        td:nth-child(2){
            font-size: 22px;
            font-weight: bold;
            text-align: center;
            float: left;
        }
        input[type = text]{
            width: 400px;
            height: 40px;
            font-size: 20px;
            margin-bottom: 30px;
            margin-left: 200px;
            border: 1px solid black;
            font-family: "굴림체";
        }
        input[type = password]{
            width: 400px;
            height: 40px;
            font-size: 20px;
            margin-bottom: 30px;
            margin-left: 75px;
            border: 1px solid black;
        }
        input[name = pw]{
            width: 400px;
            height: 40px;
            font-size: 20px;
            margin-bottom: 30px;
            margin-left: 126px;
            border: 1px solid black;
        }
        input[type = button]{
            width: 100px;
            height: 33px;
            margin-bottom: 30px;
            margin-right: 30px;
            font-weight: bold;
            background-color: white;
            border: 1px solid black;
        }
        #nametext{
            float: left;
            width: 400px;
            margin-left: 220px;
            margin-right: 50px;
        }
        #agetext{
            width: 400px;
            margin-left: 220px;
        }
        #gender{
            width: 400px;
            margin-left: 220px;
        }
        #change{
            width: 200px;
            height: 35px;
            margin-left: 240px;
            font-weight: bold;
            background-color: white;
            border: 1px solid black;
            margin-top: 30px;
        }
        #pwchk{
            text-align: left;
            float: left;
            position: relative;
            height: 0px;
            top: -30px;
            left: 265px;
            visibility: hidden;
            font-size: 15px;
        }
        #emchk1{
            text-align: left;
            float: left;
            position: relative;
            height: 0px;
            top: -30px;
            left: 265px;
            visibility: hidden;
            font-size: 15px;
        }
        @media(max-width: 700px){
			#wrap{
				width: 100%;
				overflow:hidden;
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
			article{
				width: 100%;
			}
			table{
				width: 100%;
			}
			td:nth-child(1){
				float:left;
				margin-left: 20px;
			}
			td:nth-child(2){
				float:left;
				width: 300px;
			}
			input[type=text]{
				width: 300px;
				margin-left: 99px;
			}
			input[type=password]{
				float:left;
				width: 240px;
				margin: 0px;
				margin-left: 240px;
				margin-bottom: 30px;
			}
			input[name = pw]{
				float:left;
				width: 240px;
				margin: 0px;
				margin-left: 80px;
				margin-bottom: 30px;
			}
			#nametext{
				float:left;
				margin-left: 200px;
				width: 300px;
			}
			#change{
				position: relative;
				top: -10px;
				left: -80px;
			}
      	 	#emchk1{
      	 		position: relative;
      	 		left: 220px;
            }
      	 	#pwchk{
      	 		position: relative;
      	 		left: 220px;
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

	String gender = "";
	String genderchk = (String)session.getAttribute("gender");
	if(session.getAttribute("id") != null){
		if(genderchk.equals("man")){
			gender = "남";
		}else{
			gender = "여";
		}
	}
%>
    <div id = "back"></div>
    <div id = "wrap">
        <header>
            <span id = "info"><%= grade %><%=session.getAttribute("name")%>님 환영합니다!</span>
            <% if(gradechk.equals("admin")){ %>
            		 	<button id = "admin" onclick = "admin()">관리자 페이지</button>
           	<% }else{ %>
           		<button id = "mypage" onclick = "mypage()">마이 페이지</button>
        	<% } %>
            <button id = "mcgh" onclick = "mchg()">회원정보 수정</button>
            <button id = "logout" onclick = "logout()">로그아웃</button>
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
        <section>
            <article>
               <form action = "ChangeOk.do" method = "post" name = "frm">
                    <table>
                        <br>
                        <b>회원 정보</b><br><br>
                        <tr>
                            <td>아이디</td><td><input type = "text" id = "idtext" name = "id" readonly = "readonly" value = <%= session.getAttribute("id") %>></td>
                        </tr>
                        <tr>
                            <td>비밀번호 변경</td><td><input type = "password" placeholder = "비밀번호" id = "password1" name = "pw"></td>
                        </tr>
                        <tr>
                            <td id = "emchk1">1</td>
                        </tr>
                         <tr>
                            <td>비밀번호 변경 확인</td><td><input type = "password" placeholder = "비밀번호 확인" id = "password2"></td>
                        </tr>
                        <tr>
                            <td id = "pwchk">1</td>
                        </tr>
                        <tr>
                            <td>이름</td><td><input type = "text" id = "nametext" name = "name" readonly = "readonly" value = <%= session.getAttribute("name") %>></td>
                        </tr>
                        <tr>
                            <td>나이</td><td><input type = "text" id = "agetext" name = "age" readonly = "readonly" value = <%= session.getAttribute("age") %>></td>
                        </tr>
                        <tr>
                            <td>성별</td>
                            <td><input type = "text" id = "gender" readonly = "readonly" value = <%= gender %>></td>
                        </tr>
                        <tr>
                            <td><input type = "button" value = "회원정보 수정"  id = "change" onclick = "chg()"></td>
                        </tr>
                   </table>
               </form>
            </article>
        </section>
        <footer>
            <hr>
        </footer>
    </div>
</body>
<script>
    var pw1chk = "";
    var pw2chk = "";
    
    $("#password1").focusout(function(){
        var password1 = $("#password1").val();
		if(password1.trim().length==0){
            $("#emchk1").text("빈칸이 있습니다.");
			$('#emchk1').css("color", "indianred");
			$("#emchk1").css("visibility", "visible");
            $("#password1").css("border-color", "indianred");
            pw1chk = "no";
		}else{
		    $("#emchk1").css("visibility", "hidden");
            $("#password1").css("border-color", "black");
            pw1chk = "yes";
		}
	});
    
	$("#password2").keyup(function(){
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		if(password2.trim().length==0){
			$("#pwchk").css("visibility", "hidden");
			pw2chk = "no";
		}else if(password1 == password2){
			$("#pwchk").text("비밀번호가 일치합니다.");
			$('#pwchk').css("color", "skyblue");
			$("#pwchk").css("visibility", "visible");
            $("#password2").css("border-color", "black");
            pw2chk = "yes";
		}else{
			$("#pwchk").text("비밀번호가 일치하지 않습니다.");
			$('#pwchk').css("color", "indianred");
			$("#pwchk").css("visibility", "visible");
            $("#password2").css("border-color", "indianred");
            pw2chk = "no";
		}
	});
    
    function chg(){
      	if(pw1chk == "" || pw1chk == "no"){
			alert("비밀번호를 확인바랍니다");
			$("#password1").focus();
		}else if(pw2chk == "" || pw2chk == "no"){
			alert("비밀번호를 확인바랍니다");
			$("#password2").focus();
		}else{
			frm.submit();
		}
	}
    
    function admin() {
		location.href = "Login.do";
	}
	function logout() {
		location.href = "Logout.do";
	}
	function mchg() {
		location.href = "Change.do";
	}
	function mypage(){
		location.href = "MemberMyPage.do";
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