<%@page import="java.util.Vector"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link href="https://fonts.googleapis.com/css2?family=Bungee&display=swap" rel="stylesheet">  
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
   

    <style>
         *{
            padding: 0;
            margin: 0; 
            box-sizing: border-box;
        }
        
    #wrap{
            width: 100%;
            margin-top:150px;
        }
        
        header{
			display: flex;
			position: fixed;
			z-index: 5;
			width: 100%;
			background-color: white;
			margin-top: -150px;
			
           
        }
        #info{
			margin-top: auto;
			margin-bottom:auto;
        	margin-right: auto;
        	padding-left: 20px;
        }
        #logo{
            width: 80px;
            height: 50px;
            margin-right: 50px;
            margin-top: 15px; 
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
            line-height: 450%;
			justify-content: space-between;
			
        }
        nav>ul>li{
        	height:80px;
            list-style: none;
			padding-left: 40px;
			padding-right: 40px;
            cursor: pointer;
            color:white;
        }
         li:hover{
        	color: red;
        }
     
        #ran{
            margin-top: 30px;
            text-align: center;
            font-size: 60px;
            font-weight: bolder;
        }
        #box{
        	
        	
        	margin-top:50px;
        	width:85%;
        	margin-left: 200px;
        	           	
           
        }
             
            #box1{
            	
             	width:370px;
                display: inline-table;
                text-align:center;  
            }
             #box2{
            	
             	width:370px;
             	display: inline-table;
                text-align:center;  
            }
             #box3{
            	
             	width:370px;
                display: inline-table;
                text-align:center;  
            }
             #box4{
            	
             	width:370px;
                display: inline-table;
                text-align:center;  
            }
        .ranking1 {
            
            width: 95%;
            text-align: center;
            
        }
       
       
        .ranNo{
            font-size: 23px;
            margin: 20px;
             cursor: pointer;
             transform: scale(0.7);
             font-weight: bolder;
             
        }
        #r1{
            width: 200px;
        }
        
        #grade{
        	color:red;
        	font-weight:bolder;
        	font-size: 15px;
        	
        
        }
        
        
        
     /* ============================================================= */   
        
   
        @media(max-width:700px){
            
            
            nav>ul>li{
           
			padding-left: 10px;
			padding-right: 10px;
            
            }
            #box{
            width:100%;
            margin-left: 0;
           
                      
            
            }
            
            #box1{
            	
             	width:100%;
             	
            
                position: static;  
            }
             #box2{
            	
             	width:100%;
             	             
                position: static;  
            }
             #box3{
            	
             	width:100%;
             	
               
                position: static;    
            }
             #box4{
            	
             	width:100%;
             	
               
                position: static;    
            }
            .ranNo{
               
                width: 100%;
                height: 100%;
                font-size: 30px;
                text-align:center;  
                transform: scale(0.7);
            }
            #wrap{
            width: 100%;
            margin: auto;
            }
            .cham{
                font-size: 20px;
            }
            #logo{
         
            width: 80px;
            height: 50px;
            cursor: pointer;
			
           }
	         #bottom{
	            
	          	margin-top:50px;
	            width: 100%;
	            height: 300px;
	            position: relative;
	            background-color: black;
	            padding: 30px;
	            
           }
           
          header{
			display: flex;
			position: fixed;
			z-index: 5;
			width: 100%;
			background-color: white;
		    margin-top: -30px;
			
           
        }
          
        
   
            
        }
        
  
        
        
      
        
   /*  ================================================================= */    
        #bottom{
      		
      		
            width: 100%;
            height: 300px;
            position: relative;
            background-color: black;
            padding: 30px;
            margin-top: 50px;
            
        }
        
        .bot1{
            
            display: inline-block;
            
            cursor: pointer;
            color: white;
            
        }
        p{
            margin-top: 100px;
        }
        
        td{
        	text-align: center;
        	height: 60px;
        	
        
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
  		
  		#segrade{
  			width: 130px;
  			height: 37px;
  			padding-left:30px;
  			border-radius: 20px;
  	   }
  	   #se{
  	 	
  	   	width:250px;
  	   	height: 35px;
  	   	font-size: 20px;
  	   
  	   }
 		#btn2{
 			
 			width: 70px;
 			height: 32px;
 			background-color: black;
 			color: white;
 			outline: 0;
 			border: 0;
 			border-radius: 0.35em;
 			
 		}
 		
 		#btn2:hover{
 		
 			color: red;
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
           		<c:otherwise>
           				<span id = "info">${admin}/${name}님 환영합니다!</span>	
           			<c:if test="${admin eq '(관리자) '}">
		          		<button class = "admin" onclick = "admin()">경기 등록</button>
						<button class = "admin" onclick = "admin2()">선수 등록</button>
					</c:if>	
           		    <c:if test="${admin ne '(관리자) '}">
	           			<button id = "mypage" onclick = "mypage()">마이 페이지</button>
					</c:if>           	
						<button id = "change" onclick = "change()">회원정보 수정</button>
						<button id = "logout" onclick = "logout()">로그아웃</button>
           		</c:otherwise>
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
        <div id="ran">선수랭킹</div>
        
        <form action="playersearch.do" name="formsearch">
        	<div id ="search">
       			 <select name="grade" id="segrade">
	       			 <option value="playerfly" name="sg">플라이급</option>
	       			 <option value="playerlight" name="sg">라이트급</option>
	       			 <option value="playerheavy" name="sg">헤비급</option>
	       			 <option value="playerwv" name="sg">여성벤텀급</option>
       			  </select>
       			  
       			 <input type="text" placeholder = "name" name="n" id="se" >
       			 <input type="button" name="btn" value="search" id="btn2" >
        	</div>
        <!-- 셀렉트이름과 텍스트이름으로 값이 넘어간다 -->
        </form>
        
        <br><br>
     <script>
     $("#btn2").click(function(){
     	if(formsearch.n.value.trim().length == 0){
     		alert("이름을 입력해주세요!!");
     	}else{
     		formsearch.submit();
     	}
     });
     
     $("#shop").click(function(){
    	location.href="topCart.do";    	 
     });
     
     $("#video").click(function(){
    	location.href="video.do";    	 
     });
     
     $("#logo").click(function(){
     	location.href="*.do";    	 
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
     </script>
        
        
        
      
        
    	<div id="box">
		        <table id="box1">
		        <tr>
		        	<td id="grade" colspan="2">플라이급</td>
		        </tr>
		        
		       <c:forEach var="i" begin="0"  items="${playerfly}" varStatus="status">
		        
		        	<tr class="ranNo">
		        		<c:choose>
			        			<c:when test="${status.index == 0 }">
			        				<td>ChamPion</td><td class="pro"><a href="profile.do?age=${i.age}&name=${i.name}&nationality=${i.nationality}&height=${i.height }&weight=${i.weight }&win=${i.win }&lose=${i.lose}>">     ${i.name }<img src="resources/img/fly.png"></a></td>
			        			</c:when>
			        		
				        		<c:when test="${status.index lt 6 }">
				        			<td>${status.index}</td><td><a href="profile.do?age=${i.age}&name=${i.name}&nationality=${i.nationality}&height=${i.height }&weight=${i.weight }&win=${i.win }&lose=${i.lose}>"> ${i.name }</a></td><td></td>
				        		</c:when>
		        		</c:choose>
		        	</tr>
		        
		        </c:forEach>
		        </table>
		        
		      
		        
		    
		        <table id="box2">
		       <tr>
		        	<td id="grade" colspan="2">라이트급</td>
		        </tr>
		       
		         <c:forEach var="i" begin="0"  items="${playerlight}" varStatus="status">
		        
		        	<tr class="ranNo">
		        		<c:choose>
			        			<c:when test="${status.index == 0 }">
			        				<td>ChamPion</td><td class="pro"><a href="profile.do?age=${i.age}&name=${i.name}&nationality=${i.nationality}&height=${i.height }&weight=${i.weight }&win=${i.win }&lose=${i.lose}>">     ${i.name }<img src="resources/img/li.png"></a></td>
			        			</c:when>
			        		
				        		<c:when test="${status.index lt 6 }">
				        			<td>${status.index}</td><td><a href="profile.do?age=${i.age}&name=${i.name}&nationality=${i.nationality}&height=${i.height }&weight=${i.weight }&win=${i.win }&lose=${i.lose}>"> ${i.name }</a></td><td></td>
				        		</c:when>
		        		</c:choose>
		        	</tr>
		        
		        </c:forEach>
		        </table>
		        
		        
		 	
		 	
		 		<table id="box3">
				       <tr>
				        	<td id="grade" colspan="2">헤비급</td>
				        </tr>
		       
		       <c:forEach var="i" begin="0"  items="${playerheavy}" varStatus="status">
		        
		        	<tr class="ranNo">
		        		<c:choose>
			        			<c:when test="${status.index == 0 }">
			        				<td>ChamPion</td><td class="pro"><a href="profile.do?age=${i.age}&name=${i.name}&nationality=${i.nationality}&height=${i.height }&weight=${i.weight }&win=${i.win }&lose=${i.lose}>">     ${i.name }<img src="resources/img/heavy.png"></a></td>
			        			</c:when>
			        		
				        		<c:when test="${status.index lt 6 }">
				        			<td>${status.index}</td><td><a href="profile.do?age=${i.age}&name=${i.name}&nationality=${i.nationality}&height=${i.height }&weight=${i.weight }&win=${i.win }&lose=${i.lose}>"> ${i.name }</a></td><td></td>
				        		</c:when>
		        		</c:choose>
		        	</tr>
		        
		        </c:forEach>
		        </table>
		        
		              
		      
		   	   <table id="box4">
			         <tr>
			        	<td id="grade" colspan="2">여성벤텀급</td>
			        </tr>
		       
		       	<c:forEach var="i" begin="0"  items="${playerwv}" varStatus="status">
		        
		        	<tr class="ranNo">
		        		<c:choose>
			        			<c:when test="${status.index == 0 }">
			        				<td>ChamPion</td><td class="pro"><a href="profile.do?age=${i.age}&name=${i.name}&nationality=${i.nationality}&height=${i.height }&weight=${i.weight }&win=${i.win }&lose=${i.lose}>">     ${i.name }<img src="resources/img/wv.png"></a></td>
			        			</c:when>
			        		
				        		<c:when test="${status.index lt 6 }">
				        			<td>${status.index}</td><td><a href="profile.do?age=${i.age}&name=${i.name}&nationality=${i.nationality}&height=${i.height }&weight=${i.weight }&win=${i.win }&lose=${i.lose}>"> ${i.name }</a></td><td></td>
				        		</c:when>
		        		</c:choose>
		        	</tr>
		        
		        </c:forEach>
		        </table>
		        
      </div>
  
    </div>
         <div id="bottom">
            <img src="resources/img/logo2.png"><br>
            <div class="bot1">Privacy Policy </div>  
            <div class="bot1">Terms of Use </div><br>
            <div id="g">대표:민병진 <br> 주소:부산광역시 부산진구<br>저작권 ⓒ2001-ufc판권소유</div>
             <p><img src="resources/img/f.png" id="f"><img src="resources/img/t.png" id="t"><img src="resources/img/u.png" id="u"></p>
         </div>
        
    
    <script>
    
        $(document).ready(function(){
            $(".ranNo").stop().mouseenter(function(){
               $(this).css("transform","scale(0.9)"); 
            });
            $(".ranNo").stop().mouseleave(function(){
               $(this).css("transform","scale(0.7)"); 
            });
                                   
        });
        
        $("#f").click(function() {
			location.href=" https://www.facebook.com/ ";
		});
        $("#t").click(function(){
        	location.href=" https://www.twitter.com/ ";
        });
        $("#u").click(function(){
        	location.href=" https://www.instagram.com/ ";
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
    		location.href="Cap.do";
    	});
    	function admin(){
			location.href = "Admin.do";
		}
		function admin2(){
			location.href = "Admin2.do";
		}
    </script>
    
</body>
</html>