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
            text-align: center;
            border: 1px solid black;
            width: 800px;
            height: 500px;
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
        td{
            font-size: 22px;
            font-weight: bold;
            text-align: center;
        }
        input[type = text]{
            width: 500px;
            height: 40px;
            font-size: 20px;
            margin-bottom: 30px;
            border: 1px solid black;
            font-family: "����ü";
        }
        input[type = password]{
            width: 500px;
            height: 40px;
            font-size: 20px;
            margin-bottom: 30px;
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
            cursor: pointer;
        }
        #nametext{
            float: left;
            width: 250px;
            margin-left: 60px;
            margin-right: 50px;
        }
        #agetext{
            width: 140px;
        }
        #gen{
            position: relative;
            top: -17px;
            left: -10px;
        }
        #register{
            width: 100px;
            height: 35px;
            margin-left: 170px;
            font-weight: bold;
            background-color: white;
            border: 1px solid black;
            margin-top: 30px;
        }
        #idchk{
        	text-align: left;
            float: left;
            position: relative;
            height: 0px;
            top: -30px;
            left: 65px;
            visibility: hidden;
            font-size: 15px;
        }
        #pwchk{
            text-align: left;
            float: left;
            position: relative;
            height: 0px;
            top: -30px;
            left: 65px;
            visibility: hidden;
            font-size: 15px;
        }
        #emchk1{
            text-align: left;
            float: left;
            position: relative;
            height: 0px;
            top: -30px;
            left: 65px;
            visibility: hidden;
            font-size: 15px;
        }
        #emchk2{
            text-align: left;
            float: left;
            position: relative;
            height: 0px;
            top: -30px;
            left: 65px;
            visibility: hidden;
            font-size: 15px;
        }
        #emchk3{
            text-align: left;
            float: left;
            position: relative;
            height: 0px;
            top: -30px;
            left: 425px;
            visibility: hidden;
            font-size: 15px;
        }
        input[type = radio]{
            width: 50px;
            height: 20px;
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
			input[type=text]{
				margin-left: 15px;
			}
			input[type=password]{
				margin-left: 15px;
			}
			#nametext{
				margin-right: 20px;
				width: 180px;
			}
			#check{
				position: relative;
				height: 35px;
				top: 357px;
				left: -370px;
			}
			#register{
				position: relative;
				top: 40px;
			}
			#gen{
	            position: relative;
	          	font-size: 20px;
				top: 50px;
				left: -300px;
      	 	}
      	 	input[type=radio]{
      	 		width:20px;
      	 		height:20px;
      	 		margin-left: 10px;
      	 		margin-right: 15px;
      	 	}
      	 	#idchk{
      	 		position: relative;
      	 		left: 17px;
      	 	}
      	 	#emchk1{
      	 		position: relative;
      	 		left: 17px;
      	 	}
      	 	#emchk2{
      	 		position: relative;
      	 		left: 60px;
      	 	}
      	 	#emchk3{
      	 		position: absolute;
      	 		top: 495px;
      	 		left: 330px;
      	 	}
      	 	#pwchk{
      	 		position: relative;
      	 		left: 17px;
      	 	}
    </style>
</head>
<body>
    <div id = "back"></div>
        <header>
            <button id = "login" onclick = "login()">�α���</button>
            <button id = "join" onclick = "join()">ȸ������</button>
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
               <form action = "join" method = "post" accept-charset = "utf-8" name = "frm">
                    <table>
                        <br>
                        <b>ȸ������</b><br><br>
                        <tr>
                            <td><input type = "text" placeholder = "���̵�" id = "idtext" name = "id"></td>
                        </tr>
                        <tr>
                        	<td id = "idchk">1</td>
                        </tr>
                        <tr>
                            <td><input type = "password" placeholder = "��й�ȣ" id = "password1" name = "pw"></td>
                        </tr>
                        <tr>
                            <td id = "emchk1">1</td>
                        </tr>
                         <tr>
                            <td><input type = "password" placeholder = "��й�ȣ Ȯ��" id = "password2"></td>
                        </tr>
                        <tr>
                            <td id = "pwchk">1</td>
                        </tr>
                        <tr>
                            <td>
	                            <input type = "text" placeholder = "�̸�" id = "nametext" name = "name">
	                            <input type = "text" placeholder = "����" id = "agetext" name = "age" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                            </td>
                            <td id = "gen">
	                            <label for = "m">��</label>
	                            <input type = "radio" id = "m" name = "g" value = "man" checked>
	                            <label for = "f">��</label>
	                            <input type = "radio" id = "f" name = "g" value = "female">
                            </td>
                        </tr>
                        <tr>
                            <td id = "emchk2">1</td><td id = "emchk3">1</td>
                        </tr>
                        <tr>
                            <td><input type = "button" value = "ȸ������"  id = "register" onclick = "reg()"></td>
                        </tr>
                   </table>
               </form>
            </article>
        </section>
    </div>
        <footer>
            <div id="bottom">
            <img src="img/logo2.png"><br>
            <div class="bot1">Privacy Policy </div>  
            <div class="bot1">Terms of Use </div><br>
            <div id="g">��ǥ:�κ��� <br> �ּ�:�λ걤���� �λ�����<br>���۱� ��2001-ufc�ǱǼ���</div>
             <p><img src="img/f.png" id="f"><img src="img/t.png" id="t"><img src="img/u.png" id="u"></p>
         </div>
        </footer>
</body>
<script>
	var idchk = "";
	var pw1chk = "";
	var pw2chk = "";
	var namechk = "";
	var agechk = "";
	
    $("#password1").focusout(function(){
        var password1 = $("#password1").val();
		if(password1.trim().length==0){
            $("#emchk1").text("��ĭ�� �ֽ��ϴ�.");
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
			$("#pwchk").text("��й�ȣ�� ��ġ�մϴ�.");
			$('#pwchk').css("color", "skyblue");
			$("#pwchk").css("visibility", "visible");
            $("#password2").css("border-color", "black");
            pw2chk = "yes";
		}else{
			$("#pwchk").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			$('#pwchk').css("color", "indianred");
			$("#pwchk").css("visibility", "visible");
            $("#password2").css("border-color", "indianred");
            pw2chk = "no";
		}
	});
    
    $("#nametext").focusout(function(){
        var nametext = $("#nametext").val();
		if(nametext.trim().length==0){
            $("#emchk2").text("��ĭ�� �ֽ��ϴ�.");
			$('#emchk2').css("color", "indianred");
			$("#emchk2").css("visibility", "visible");
            $("#nametext").css("border-color", "indianred");
            namechk = "no";
		}else{
		    $("#emchk2").css("visibility", "hidden");
            $("#nametext").css("border-color", "black");
            namechk = "yes";
		}
	});
    
    $("#agetext").focusout(function(){
        var agetext = $("#agetext").val();
		if(agetext.trim().length==0){
            $("#emchk3").text("��ĭ�� �ֽ��ϴ�.");
			$('#emchk3').css("color", "indianred");
			$("#emchk3").css("visibility", "visible");
            $("#agetext").css("border-color", "indianred");
            agechk = "no";
        }else if(agetext <= 14){
            $("#emchk3").text("15�� �̸��� �����ϽǼ� �����ϴ�.");
			$('#emchk3').css("color", "indianred");
			$("#emchk3").css("visibility", "visible");
            $("#emchk3").css("left", "visible");
            $("#agetext").css("border-color", "indianred");
            agechk = "no";
		}else{
		    $("#emchk3").css("visibility", "hidden");
            $("#agetext").css("border-color", "black");
            agechk = "yes";
		}
	});
    
    $("#idtext").focusout(function(){
		if($("#idtext").val().trim().length==0){
			$("#idchk").text("��ĭ�� �ֽ��ϴ�");
			$('#idchk').css("color", "indianred");
			$("#idchk").css("visibility", "visible");
            $("#idtext").css("border-color", "indianred");
            idchk = "no";
		}
    });
    
    $("#idtext").keyup(function(){
		var id = "id="+$("input[name=id]").val();
		$.ajax({
            type:"POST",
            url:"joincheck.jsp",
            data:id,
            dataType:"json", //�޴� type�� json���
            success:function(args) { // ������� json������� args�� ���� ����
            	if(args.result == "YES"){
            		if($("#idtext").val().trim().length==0){
            			$("#idchk").text("��ĭ�� �ֽ��ϴ�");
            			$('#idchk').css("color", "indianred");
    	    			$("#idchk").css("visibility", "visible");
    	    			$("#idtext").css("border-color", "indianred");
    	    			idchk = "no";
            		}else{
            			$("#idchk").text("����� �� �ִ� ���̵��Դϴ�");
    	            	$('#idchk').css("color", "skyblue");
        				$("#idchk").css("visibility", "visible");
        	            $("#idtext").css("border-color", "black");
        	            idchk = "yes";
            		}
            	}else{
            		$("#idchk").text("����� �� ���� ���̵��Դϴ�");
          	  		$('#idchk').css("color", "indianred");
	    			$("#idchk").css("visibility", "visible");
	    			$("#idtext").css("border-color", "indianred");
	    			idchk = "no";
            	}
            },		 
            error:function(args) {		 
            	$("#idchk").text("�����߻� �ٽ� �õ� ���ֽñ� �ٶ��ϴ�");
            	$('#idchk').css("color", "indianred");
    			$("#idchk").css("visibility", "visible");
    			$("#idtext").css("border-color", "indianred");
    			 = "no";
            }
        });	
	});
	
	function reg(){
		if(idchk == "" || idchk == "no"){
			alert("���̵� �Է��� Ȯ�ιٶ��ϴ�");
			$("#idtext").focus();
		}else if(pw1chk == "" || pw1chk == "no"){
			alert("��й�ȣ�� Ȯ�ιٶ��ϴ�");
			$("#password1").focus();
		}else if(pw2chk == "" || pw2chk == "no"){
			alert("��й�ȣ�� Ȯ�ιٶ��ϴ�");
			$("#password2").focus();
		}else if(namechk == "" || namechk == "no"){
			alert("�̸��Է��� Ȯ�ιٶ��ϴ�");
			$("#nametext").focus();
		}else if(agechk == "" || agechk == "no"){
			alert("���� �Է��� Ȯ�ιٶ��ϴ�");
			$("#agetext").focus();
		}else{
			frm.submit();
		}
	}
    
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