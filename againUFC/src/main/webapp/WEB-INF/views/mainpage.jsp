<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset = "EUC-KR">
<title>UFC</title>
<link href="https://fonts.googleapis.com/css2?family=Bungee&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<meta charset = "EUC-KR">

    <style>
        *{
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }
        #wrap{
            width: 85%;
			height: 250vh;
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
        	padding-left: 20px;
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
            line-height: 450%;
			justify-content: space-between;
        }
        nav>ul>li{
            list-style: none;
			padding-left: 40px;
			padding-right: 40px;
			color: white;
			cursor: pointer;
			height:80px;
        }
        li:hover{
        	color: red;
        }
		#video{
			 position: absolute;
			 top: -111px;
			 left: -17px;
			 overflow: hidden;
			 z-index: 3;
		}
		#banner{
			position: relative;
			width: 100%;
		}
		#banner2{
			position: relative;
			width: 100%;
			height: 100vh;
			z-index: 4;
			opacity: 0;
		}
		#banner3{
			position: absolute;
			top: 400px;
			left: 600px;
			text-align: center;
			color: white;
			z-index: 5;
			line-height: 50px;
		}
		#banner3>b:nth-child(1){
			font-size: 30px;
		}
		#banner3>b:nth-child(3){
			font-size: 80px;
			padding-right: 50px;
		}
		#banner3>b:nth-child(5){
			font-size: 20px;
		}
		#banner3>input[type = button]{
			width: 100px;
			height: 40px;
		}
		#fighter{
			width: 150px;
			height: 50px;
			border: 1px solid white;
			font-weight: bolder;
			cursor: pointer;
			background-color: white;
		}
		#highlight{
			width: 100%;
			height: 850px;
		}
		#moviebanner{
			display: flex;
			flex-flow: row wrap;
		}
		.movie{
			position: relative;
			display: flex;
			flex-flow: row wrap; 
			top: 300px;
            width: 40%;
			height: 300px;
			border: 3px solid lightgray;
			margin-left: 125px;
			margin-top: 55px;
			opacity: 0;
		}
		.match{
            margin-top: 2%;
            width: 65%;
			border: 4px solid black;
        }
		.mimg{
			width: 100%;
			height: 295px;
			cursor: pointer;
		}
		#fight{
			width: 100%;
			height: 850px;
		}
		.head1{
			position: relative;
			font-size: 40px;
		}
        #dbanner{
			position: relative;
			left: -100%;
            display: flex;
            flex-flow: row wrap;
			opacity: 0;
        }
        #up{
            border: 1px solid black;
            width: 50px;
            height: 50px;
            text-align: center;
            line-height: 300%;
            float: right;
			position: fixed;
			top: 93%;
			left: 96.5%;
			cursor: pointer;
			z-index: 1;
			background-color: white;
        }
        .date{
			margin: auto;
			margin-top: 100px;
            width: 40%;
            height: 200px;
            display: flex;
			border-top: 1px solid dimgray;
			border-bottom: 1px solid dimgray;
			transition: transform 0.3s linear;
			transform: scale(1);
			cursor: pointer;
        }
		.date:hover{
			border-top: 5px solid dimgray;
			border-bottom: 5px solid dimgray;
			transition: transform 0.3s linear;
			transform: scale(1.3);
		}
		.date:hover ul:nth-child(2)>li:nth-child(1){
			color: red;
        }
		hr{
			border: 3px solid lightgray;
		}
        .date>ul{
            margin: auto;
        }
        .date>ul>li{
            list-style: none;
        }
        .date>ul:first-child>li:first-child{
            margin-left: 35%;
        }
        .date>ul:nth-child(2)>li:nth-child(1){
            margin-left: 40%;
            margin-top: 30%;
        }
        .date>ul:nth-child(2)>li:nth-child(2){
            margin-top: 40%;
        }
        .date>ul:nth-child(3)>li:first-child{
            margin-left: 35%;
        }
		#goods{
			width: 100%;
			height: 850px;
		}
		#shop{
			position: relative;
			opacity: 0;
			top: 200px;
            display: flex;
            flex-flow: row wrap;
		}
		.item{
			margin-top: 100px;
			width: 250px;
			height: 300px;
			margin-left: 13%;
			cursor: pointer;
			border-top: 5px solid lightgray;
			border-bottom: 5px solid lightgray;
			transition: transform 0.3s linear;
			transform: scale(1);
		}
		.item:hover{
			border-top: 5px solid dimgray;
			border-bottom: 5px solid dimgray;
			transition: transform 0.3s linear;
			transform: scale(1.3);
		}
		.itemimg{
			width: 90%;
			height: 200px;
		}
        .item>ul>li{
			flex-flow: row wrap;
            list-style: none;
        }
        .item>ul>li:first-child{
			text-align: center;
			font-size: 20px;
			padding-top: 10%;
        }
        .item>ul>li:nth-child(2){
			margin-top: 10%;
            margin-left: 10%;
        }
        .item>ul>li:nth-child(3){
            margin-left: 10%;
        }
		#bottom{
            width: 100%;
            height: 300px;
            position: relative;
            background-color: black;
            padding: 30px;
            z-index: 0;
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
		#hr1{
			position: relative;
			width: 100%;
			left: -100%;
		}
		#hr2{
			position: relative;
			width: 100%;
			left: -100%;
		}
		#hr3{
			position: relative;
			width: 100%;
			left: -100%;
		}
		#black{
			position: fixed;
			width: 100%;
			height: 100vh;
			z-index: 5;
			background-color: rgba(0, 0, 0, 0.9);
			display: none;
		}
		#exit{
			position: absolute;
			top: 20%;
			left: 76%;
			width: 40px;
			height: 40px;
			border: 3px solid lightgray;
			z-index: 3;
		}
		.vidset{
			position: absolute;
			top: 25%;
			left: 25%;
			border: 3px solid lightgray;
			width: 50%;
			height: 50%;
		}
		@media(max-width: 700px){
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
			#banner3{
				top: 420px;
				left: 180px;
			}
			#banner3>b:nth-child(1){
				font-size: 20px;
				color: white;
			}
			#banner3>b:nth-child(3){
				position: absolute;
				width: 400px;
				left: -110px;
				font-size: 35px;
				color: white;
			}
			#banner3>input[type = button]{
				font-size: 15px;
				color: black;
			}
			#video{
				top: -150px;
			}
			#moviebanner{
				position: relative;
				left: -65px;
				width: 100%;
			}
			.movie{
				width: 100%;
			}
			.movie:nth-child(3){
				display: none;
			}
			.movie:nth-child(4){
				display: none;
			}
			.pc{
				width: 100%;
				height: 100%;
			}
			.date{
				display: flex;
				width: 75%;
			}
			.date:nth-child(3){
				display: none;
			}
			.date:nth-child(4){
				display: none;
			}
			#up{
				width: 30px;
				height: 30px;
				left: 90%;
				line-height: 30px;
			}
			.item{
				width: 15%;
			}
		}
    </style>
</head>
<body>


<div id = "black">
	<button id = "exit">X</button>
	<iframe width="1100" height="600" src="https://www.youtube.com/embed/P9iwTW2_3mE?autoplay=1" frameborder="0" allow="autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen id = "video1" class = "vidset"></iframe>
	<iframe width="1100" height="600" src="https://www.youtube.com/embed/3qHwtLzOQ9s?autoplay=1" frameborder="0" allow="autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen id = "video2" class = "vidset"></iframe>
	<iframe width="1100" height="600" src="https://www.youtube.com/embed/BV3FcAecXL0?autoplay=1" frameborder="0" allow="autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen id = "video3" class = "vidset"></iframe>
	<iframe width="1100" height="600" src="https://www.youtube.com/embed/7i_qMoKhEJQ?autoplay=1" frameborder="0" allow="autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen id = "video4" class = "vidset"></iframe>
</div>
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
        <section>
        	<article id = "videobanner">
				<video id = "video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0">
      				<source src="resources/img/movie.mp4" id = "banner">
				</video>
      			<img src = "resources/img/image.jpg" id = "banner2">
       			<div id = "banner3">
        			<b>UFC VEGAS 9</b><br>
        			<b>오브레임 VS 사카이</b><br>
        			<b>10월 3일 토요일</b><br>
				</div>
        	</article>
        </section>
    <div id = "wrap">
        <section>
            <article id = "highlight">
              	<br>
               	<b class = head1>지난 하이라이트</b><br><br>
               	<hr id = "hr1">
               	<div id = "moviebanner">
					<div class = "movie" id = "m1">
						<img src = "http://img.youtube.com/vi/P9iwTW2_3mE/mqdefault.jpg" class = "mimg">
					</div>
					<div class = "movie" id = "m2">
						<img src = "http://img.youtube.com/vi/3qHwtLzOQ9s/mqdefault.jpg" class = "mimg">
					</div>
					<div class = "movie" id = "m3">
						<img src = "http://img.youtube.com/vi/BV3FcAecXL0/mqdefault.jpg" class = "mimg">
					</div>
					<div class = "movie" id = "m4">
						<img src = "http://img.youtube.com/vi/7i_qMoKhEJQ/mqdefault.jpg" class = "mimg">
					</div>
               	</div>
            </article>
		</section>
        <section>
        	<article id = "fight">
                <br><hr><br>
               	<b class = head1>경기 일정</b><br><br>
               	<hr id = "hr2">
                <div id = "dbanner">
                    <div class = "date">
                        <ul>
                            <li>Joseph Benavidez</li>
                            <li><img src = "resources/img/BENAVIDEZ_JOSEPH.png"></li>
                        </ul>
                        <ul>
                            <li>VS</li>
                            <li>2020.09.10</li>
                        </ul>
                        <ul>
                            <li>Brandon Moreno</li>
                            <li><img src = "resources/img/MORENO_BRANDON.png"></li>
                        </ul>
                    </div>
                    <div class = "date">
                        <ul>
                            <li>Jusitin Gaethje</li>
                            <li><img src = "resources/img/GAETHJE_JUSTIN.png"></li>
                        </ul>
                        <ul>
                            <li>VS</li>
                            <li>2020.09.14</li>
                        </ul>
                        <ul>
                            <li>Dustin Poirier</li>
                            <li><img src = "resources/img/POIRIER_DUSTIN.png"></li>
                        </ul>
                    </div>
                    <div class = "date">
                        <ul>
                            <li>Francis Ngannou</li>
                            <li><img src = "resources/img/NGANNOU_FRANCIS.png"></li>
                        </ul>
                        <ul>
                            <li>VS</li>
                            <li>2020.09.17</li>
                        </ul>
                        <ul>
                            <li>Curtis Blaydes</li>
                            <li><img src = "resources/img/BLAYDES_CURTIS.png"></li>
                        </ul>
                    </div>
                    <div class = "date">
                        <ul>
                            <li>Aspen Ladd</li>
                            <li><img src = "resources/img/LADD_ASPEN.png"></li>
                        </ul>
                        <ul>
                            <li>VS</li>
                            <li>2020.09.23</li>
                        </ul>
                        <ul>
                            <li>Holly Holm</li>
                            <li><img src = "resources/img/HOLM_HOLLY.png"></li>
                        </ul>
                    </div>
                </div>
            </article>
        </section>
        <section>
        	<article id = "goods">
              	<br><hr><br>
               	<b class = head1>SHOP</b><br><br>
               	<hr id = "hr3">
               	<div id = "shop">
					<div class = "item" id = "cap">
						<ul>
							<li>모자</li>
							<li><img src = "resources/img/ufc-300Red-C.png" class = "itemimg"></li>
						</ul>
					</div>
					<div class = "item" id = "top">
						<ul>
							<li>상의</li>
							<li><img src = "resources/img/ufc-101Red-T.png" class = "itemimg"></li>
						</ul>
					</div>
					<div class = "item" id = "pants">
						<ul>
							<li>하의</li>
							<li><img src = "resources/img/ufc-201Red-P.png" class = "itemimg"></li>
						</ul>
					</div>
                </div>
            </article>
            <br>
        </section>
    </div>
            <div id = "up">↑</div>
        <footer>
            <div id="bottom">
            <img src="resources/img/logo2.png"><br>
            <div class="bot1">Privacy Policy </div>  
            <div class="bot1">Terms of Use </div><br>
            <div id="g">대표:민병진 <br> 주소:부산광역시 부산진구<br>저작권 ⓒ2001-ufc판권소유</div>
		 	<p><img src="resources/img/f.png" id="f"><img src="resources/img/t.png" id="t"><img src="resources/img/u.png" id="u"></p>
         	</div>
        </footer>
</body>
<script>
	$(document).ready(function(){
		setTimeout(function(){
			$("#banner2").animate({
				opacity: 1
			}, 1000);
		}, 3000);
		
		$(".mimg").eq(0).click(function(){
			$("#black").css("display", "block");
			$("#video1").css("display", "block");
			$("#video2").css("display", "none");
			$("#video3").css("display", "none");
			$("#video4").css("display", "none");
		});
		$(".mimg").eq(1).click(function(){
			$("#black").css("display", "block");
			$("#video1").css("display", "none");
			$("#video2").css("display", "block");
			$("#video3").css("display", "none");
			$("#video4").css("display", "none");
		});
		$(".mimg").eq(2).click(function(){
			$("#black").css("display", "block");
			$("#video1").css("display", "none");
			$("#video2").css("display", "none");
			$("#video3").css("display", "block");
			$("#video4").css("display", "none");
		});
		$(".mimg").eq(3).click(function(){
			$("#black").css("display", "block");
			$("#video1").css("display", "none");
			$("#video2").css("display", "none");
			$("#video3").css("display", "none");
			$("#video4").css("display", "block");
		});
		
		$("#exit").click(function(){
			$("#black").css("display", "none");
		});
		
		 $("section").on("mousewheel DOMMouseScroll",function(e){
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
		 
		 $("#highlight").on("mousewheel DOMMouseScroll",function(e){
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
                 moveTop = $(this).prev().offset().top -90;
             }
             $("html, body").stop().animate({
                 scrollTop : moveTop+"px"
             },800)
         });
		
		$(window).scroll(function(){
			var scroll = $(window).scrollTop() + $(window).height();
			$("#hr1").each(function(){
				if(scroll > 1000){
					$(this).animate({
						left: -0
					},1000);
				}
			});
			$("#m1").each(function(){
				if(scroll > 1200){
					$(this).animate({
						opacity: 1,
						top: -0
					},800);
				}
			});
			$("#m2").each(function(){
				if(scroll > 1200){
					$(this).animate({
						opacity: 1,
						top: -0,
					},800);
				}
			});
			$("#m3").each(function(){
				if(scroll > 1800){
					$(this).animate({
						opacity: 1,
						top: -0,
					},800);
				}
			});
			$("#m4").each(function(){
				if(scroll > 1800){
					$(this).animate({
						opacity: 1,
						top: -0,
					},800);
				}
			});
			$("#hr2").each(function(){
				if(scroll > 2000){
					$(this).animate({
						left: -0
					},1000);
				}
			});
			$("#dbanner").each(function(){
				if(scroll > 2000){
					$(this).animate({
						opacity: 1,
						left: -0,
					},1000);
				}
			});
			$("#hr3").each(function(){
				if(scroll > 2800){
					$(this).animate({
						left: -0
					},1000);
				}
			});
			$("#shop").each(function(){
				if(scroll > 2900){
					$(this).animate({
						opacity: 1,
						top: -0,
					},1100);
				}
			});
		});
		
		$("#up").click(function(){
		  $('html, body').stop().animate({
			  scrollTop: 0
			}, 1000);
		});
			  
	
	});
	function login(){
		location.href = "gologin";
	}
	function join(){
		location.href = "gojoin";
	}
	function logout(){
		location.href = "gologout";
	}
	function change(){
		location.href = "gochange";
	}
	function mypage(){
		location.href = "gomemberMyPage";
	}
	function admin(){
		location.href = "goadmin";
	}
	function admin2(){
		location.href = "goadmin2";
	}
	$("#logo").click(function(){
		location.href = "mainpage";
	});
	
/* 	<ul>
    <li id="ranking">Ranking</li>
    <li id="match">Match</li>
    <li><img src = "resources/img/logo2.png" id = "logo"></li>
    <li id="shop">Shop</li>
    <li id="video">Video</li>
</ul> */
	
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
		location.href="top";
	
	});
	
	$(".date").click(function(){
		location.href = "Match";
	});
	
	$("#cap").click(function(){
		location.href = "cap";
	});
	$("#top").click(function(){
		location.href = "top";	
	});
	$("#pants").click(function(){
		location.href = "bottom";
	});
	
</script>
</html>