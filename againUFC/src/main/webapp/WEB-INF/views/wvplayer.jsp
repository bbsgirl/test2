<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
     <%	request.setCharacterEncoding("euc-kr");%> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css2?family=Bungee&display=swap" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
    
      
        header{
			display: flex;
			position: fixed;
			z-index: 5;
			width: 100%;
			background-color: white;
			margin-top: -200px;
			
           
        }
        #info{
			margin-top: auto;
			margin-bottom:auto;
        	margin-right: auto;
        	padding-left: 11.5px;
        }
        #logo{
            width: 80px;
            height: 50px;
            margin-right: 50px;
            cursor: pointer;
        }
         .admin{
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
        #logout{
			margin-top: auto;
			height: 40px;
            width: 100px;
            background-color: white;
            cursor: pointer;
            border:none;
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
			z-index: 5;
			
        }
        nav>ul{
            
            display: flex;
            line-height: 250%;
			justify-content: space-between;
			
        }
        nav>ul>li{
        	height:80px;
            list-style: none;
			padding-left: 0px;
			padding-right: 40px;
            cursor: pointer;
            color:white;
        }
         li:hover{
        	color: red;
        }
        #photo{
            width: 100px;
            height: 140px;
            border: 1px solid black;
            
            
        }
         input[type=button]{
        	width: 70px;
 			height: 32px;
 			background-color: black;
 			color: white;
 			outline: 0;
 			border: 0;
 			border-radius: 0.35em;
        }
        
        
 		td{
 			font-size: 18px;
 			
 		}
        input[type = text]{
 		width:250px;
  	   	height: 35px;
  	   	font-size: 20px;
 		
 		
 		}
 		input[type = button]:hover{
 		
 			color: red;
 		}
 		#box{
        	width: 350px;
        	/* border:1px solid black; */
        	margin:200px auto;
        	
        
        } 
        #dd{
 			font-size: 23px;
 			font-weight: bold;
 		
 		}
        
      
    </style>
    
</head>
<body>


  		<header>
 			<c:choose>
		 		<c:when test="${empty name }">
					<button id = "login" onclick = "login()">�α���</button>
					<button id = "join" onclick = "join()">ȸ������</button>
				</c:when>
				<c:when test="${not empty name }">
	            		<span id = "info">${admin}${name}�� ȯ���մϴ�!</span>
	            	<c:if test="${admin eq '(������) '}">
		          		<button class = "admin" onclick = "admin()">��� ���</button>
						<button class = "admin" onclick = "admin2()">���� ���</button>
					</c:if>	
	           		<c:if test="${admin ne '(������) '}">
	           			<button id = "mypage" onclick = "mypage()">���� ������</button>
					</c:if>           	
						<button id = "change" onclick = "change()">ȸ������ ����</button>
						<button id = "logout" onclick = "logout()">�α׾ƿ�</button>
            	</c:when>
            </c:choose>

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
<div id="box">
    <input type="button" value="�ö���" onclick="fly()">
	<input type="button" value="���" onclick="heavy()">
	<input type="button" value="����Ʈ" onclick="light()">
    <br><br>
    <hr>
   <form action="registerwv" method="post" name="frm"><!-- ���� -->
    <div id="dd">������� �������ұ� weight<62 </div>
       
    <table>
    	
    	<tr>
    	 	<td>�̸�</td><td><input type="text" name="name"></td>  	
    	</tr>
    	<tr>
    	 	<td>����</td><td><input type="text" name="age"></td>  	
    	</tr>
    	<tr>
    	 	<td>����</td><td><input type="text" name="nationality"></td>  	
    	</tr>
    	<tr>
    	 	<td>Ű</td><td><input type="text" name="height"></td>  	
    	</tr>
    	<tr>
    	 	<td>����</td><td><input type="text" name="weight"></td>  	
    	</tr>
    	<tr>
    	 	<td>��</td><td><input type="text" name="win"></td>  	
    	</tr>
    	<tr>
    	 	<td>��</td><td><input type="text" name="lose"></td>  	
    	</tr>
    
   		<tr>
    	 	<td> <input type="button" value="Ȯ��" onclick="e()"></td>
    	 	<td> <input type="button" value="���" onclick="c()"></td>  	
    	</tr>
    	
    
    </table>
     
    </form>    
</div>
	<script>
		function e() {
			if(frm.name.value.trim().length == 0){
				alert("�̸��� �Էµ����ʾҽ��ϴ�.");
			}else if(frm.age.value.trim().length==0){
				alert("���̰� �Էµ����ʾҽ��ϴ�.");
			}else if(frm.nationality.value.trim().length==0){
				alert("������ �Էµ����ʾҽ��ϴ�.");
			}else if(frm.height.value.trim().length==0){
				alert("Ű�� �Էµ����ʾҽ��ϴ�.");
			}else if(frm.weight.value.trim().length==0){
				alert("�����԰� �Էµ����ʾҽ��ϴ�.");
			}else if(frm.win.value.trim().length==0){
				alert("�� �Էµ����ʾҽ��ϴ�.");
			}else if(frm.lose.value.trim().length==0){
				alert("�� �Էµ����ʾҽ��ϴ�.");
			}else{
				frm.submit();
			}
		}
		
		function c(){
			location.href="Main";
		}
	
		function light(){
			location.href="golightplayer";
		}
		
		function heavy(){
			location.href="goheavyplayer";
		}
		function fly(){
			location.href="goadmin2";
		}
		
		  function logout(){
		 		location.href = "gologout";
		 	}
		     function change(){
		 		location.href = "Change";
		 	}
		    
		    function mypage(){
		 		location.href = "MyPage";
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
	    		location.href="topCart";
	    	});
	    	
	    	 $("#logo").click(function(){
			     	location.href="*";    	 
			      });
	    	function admin(){
				location.href = "Admin";
			}
		
	
	</script>