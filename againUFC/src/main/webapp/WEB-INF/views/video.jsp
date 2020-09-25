<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
  <link href="https://fonts.googleapis.com/css2?family=Bungee&display=swap" rel="stylesheet">
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <style>
 		*{
            padding: 0;
            margin: 0; 
            box-sizing: border-box;
        }
        
    #wrap{
            width: 100%;
            margin: auto;
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
            border: 1px solid black;
            height: 80px;
            background-color: black;
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
            cursor: pointer;
            color:white;
        }
         li:hover{
        	color: red;
        }
        
          #bottom{
            position: relative;
            width: 100%;
            height: 300px;
            display: flow-root;
            flex-wrap: wrap;
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
  
  
  		#page{
  		margin-top:120px;
        float:left;
  		width: 100%;
  	    display: flex;    
        flex-wrap: nowrap; 
        overflow: hidden;

  		
  		}
        
        .ufcmovie{
            width: 391px;
            height: 400PX;
            border: 1px solid black;
            margin-left: 50PX;
            margin-top: 20px;
            margin-bottom: 20px;
            float:left;
            
        }
        .title{
            font-size: 25px;
            font-weight:bolder; 
        }
        
        .ufctitle{
        
        	margin: 20px;
        	
        }
        
    
     /*=============================================*/   
        @media(max-width:500px){
            #wrap{
                width: 100%;
                margin: auto;
            }
            
            nav>ul>li{

                padding-left: 10px;
                padding-right: 10px;
            
            }
            
            #page{
                 
                display: inline-flex;
               
            }
             .ufcmovie{
           
            margin-left: 20PX;
            
            
        }
            
       
      
            
        }
        /*=============================================*/     
        h1{
            
            text-align: center;
            color:red;
            
        }
        .who{
        
        	font-weight: bolder;
        	font-size: 20px;
        
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
  

  
  
  
 <div id="wrap">
         <header>
           <% if(session.getAttribute("id") == null){ %>
				<script>
	  	   			alert("로그인시 이용할수있습니다"); //아이디가없으면 메인으로돌아간다
	  	   			location.href = "*.do";
	  	   		</script>
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
        <br>
        <div id="page">
		        
		      
		        <hr>
		        <div class="ufctitle">
		        
		          <h1><div class="row1">최 신 경 기</div></h1>
		       	
		       	<hr>
		        
                     <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/P9iwTW2_3mE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> <div class="title">free fight</div><div class="who">Alistair Overeem vs Walt Harris</div><div class="content">UFC heavyweight Alistair Overeem continued his decade-long stretch of contending at the top of the division with a knockout win over Walt Harris earlier this year. Overeem faces Augusto Sakai in Saturday's main event.</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/3qHwtLzOQ9s" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">free fight</div><div class="who">Augusto Sakai vs Marcos Conrado</div><div class="content">Augusto Sakai earned a UFC contract with this performance on the debut episode of the Brazilian season of Dana White's Contender Series. After winning his first four UFC bouts, Sakai next faces Alistair Overeem in the main event on Saturday night.</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/H51pQ1nwlM8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">free fight</div><div class="who">Brock Lesnar vs Heath Herring </div><div class="content">On this day in 2008, Brock Lesnar won a decisive unanimous decision victory over Heath Herring at UFC 87 in Minneapolis. Lesnar would go on to challenge Randy Couture for the UFC heavyweight title after this fight at UFC 91.</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/azpKSklrw4Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">Fight Island 2</div><div class="who"> Figueiredo vs Benavidez 2 </div><div class="content">Montel Jackson, Brett Johns and Grant Dawson are just three fighters we think you should get to know ahead of Fight Island 2, headlined by a rematch between Deiveson Figueiredo and Joseph Benavidez for the UFC flyweight title.</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/-isSQZNILPw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">free fight</div><div class="who"> Conor McGregor vs Max Holloway</div><div class="content">On this day seven years ago, two future UFC featherweight champions met on the prelims of a Fight Night event in Boston. Two years later Conor McGregor would win the interim title on his way to becoming the undisputed champion, and three years after this bout Max Holloway would do the same.</div></div>
                     <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/BV3FcAecXL0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">UFC 159, 2013</div><div class="who"> Jon Jones vs Chael Sonnen </div><div class="content">Jon Jones defended his light heavyweight belt for the fifth time when he faced fellow TUF 17 coach Chael Sonnen at UFC 159 in 2013.</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/fnV1p_7Z5Lo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">UFC Florida Pelea Gratis</div><div class="who">  Overeem vs Lesnar</div><div class="content">Mira esta actuacion de Alistair Overeem quien regresa este sabado en la estelar de</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/rrHnH7xwjZk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">UFC Era Pelea Gratis</div><div class="who">McGregor vs Mendes</div><div class="content">Revive uno de los combates que hizo temblar al mundo, cuando Conor McGregor se enfrento a Chad Mendes por el titulo interino de peso pluma.</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/ro7xvYB1nd8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">UFC Era Pelea Gratis</div><div class="who"> Couture vs Lesnar</div><div class="content">UFC 91 enfrentaba a dos titanes de las MMA y la pelea no decepcionaria. </div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/KlxgOub5dsk" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">UFC PELEA GRATIS</div><div class="who"> McGregor vs Diaz 2</div><div class="content">Una de las mejores peleas peso welter en la historia fue a manos de dos pesos ligeros naturales. Mira Diaz vs McGregor.</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/L0GH5cw4ajo" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">free fight</div><div class="who"> Kimbo Slice vs Houston Alexander</div><div class="content">Kimbo Slice made his much-anticipated UFC debut at The Ultimate Fighter 10 Finale in 2009.</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/yoUbQxvDVss" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">UFC 168, 2013</div><div class="who">Ronda Rousey vs Miesha Tate</div><div class="content">Season 17 of The Ultimate Fighter culminated at UFC 168 when Ronda Rousey faced Miesha Tate for the second time for the UFC bantamweight championship.</div></div>
                     <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/cINJim4gWN4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">TUF 23 Finale, 2016</div><div class="who"> Joanna Jedrzejczyk vs Claudia Gadelha</div><div class="content">Joanna Jedrzejczyk held onto her strawweight title after she emerged victorious from her rematch with Claudia Gadelha at the Finale of season 23 of The Ultimate Fighter in 2018.</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/b_UQ2qgu3tw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">free fight</div><div class="who">Amanda Nunes vs Sheila Gaff</div><div class="content">Long before Amanda Nunes was a two-division UFC champion she made her UFC debut at UFC 163 and impressed with a first-round knockout performance.</div></div>
		        	 <div class="ufcmovie"><iframe width="390" height="200" src="https://www.youtube.com/embed/HRTh5Vawd6c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe><div class="title">UFC Pelea Gratis</div><div class="who"> Penne vs Markos</div><div class="content">Jessica Penne debutaba en UFC con una victoria sobre Randa Markos para levantar los brazos en el octagono luego de su paso por Invicta FC donde gano el titulo.</div></div>
		        	     
		        </div>
        </div>
        
        
        
	
	
		 
         
         
    </div>
    
    <div id="bottom">
            <img src="img/logo2.png" class="loge"><br>
            <div class="bot1">Privacy Policy </div>  
            <div class="bot1">Terms of Use </div><br>
            <div id="g">대표:민병진 <br> 주소:부산광역시 부산진구<br>저작권 ⓒ2001-ufc판권소유</div>
             <p><img src="img/f.png" id="f"><img src="img/t.png" id="t"><img src="img/u.png" id="u"></p>
         </div>
         
         <script>
         
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
     		location.href = "MyPage.do";
     	}
        function admin(){
     		location.href = "Admin.do";
     	}
     	function admin2(){
     		location.href = "Admin2.do";
     	}
                  
         
         </script>
   
    
</body>
</html>