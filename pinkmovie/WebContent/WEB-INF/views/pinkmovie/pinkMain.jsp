<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
    <title>Document</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .wrap {

            position: relative;
            display: flex;
            flex-flow: column;

        }

        .page1 {
            width: 100%;
            height: 100vh;
            background-color: black;
        }

        .page2 {
            width: 100%;
            height: 100vh;
            background-color: lightpink;
            position: relative;

        }

        .page3 {
            width: 100%;
            height: 100vh;
            background-color: black;
            position: relative;

        }

        .bottom {
            left: 0;
            bottom: 0;
            width: 100%;
            height: 100px;
            position: fixed;
            background-color: rgba(219, 112, 147, 0.5);
            z-index: 2;


        }

        .rkbtn {
            margin: 0 auto;
            width: 350px;
            height: 30px;
            /*            height: 20px;*/
            position: relative;
            /*            border: 1px solid black;*/
            /*
            display: flex;
            flex-flow: row wrap;
*/
            overflow: hidden;
        }

        .rk {
            width: 350px;
            height: 30px;
            position: absolute;

            /*            border: 1px solid red;*/
        }

        .rk1,.rk2,.rk3,.rk4,.rk5,.rk6,.rk7,.rk8 {
            width: 100%;
            height: 30px;
            font-size: 20px;
            font-weight: bolder;
            text-align: center;

        }

        #h2 {
            color: white;
            font-family: sans-serif;
            opacity: 0.5;
        }

        .ptop1,.ptop2,.ptop3,.ptop4,.ptop5,.ptop6,.ptop7 {
            width: 300px;
            height: 60px;

            position: absolute;
            /*            border: 1px solid red;*/
            overflow: hidden;

        }

        .ptop1 {
            top: 40px;
        }

        .ptop2 {
            top: 80px;
            /*             overflow: hidden*/
        }

        .ptop3 {
            top: 120px;
        }

        .ptop4 {
            top: 160px;
        }

        .ptop5 {
            top: 200px;
        }

        .ptop6 {
            top: 240px;
        }

        .ptop7 {
            top: 280px;
        }

        #LoVE,#MoVIES,#WaTCHINH {
            width: 100%;
            font-size: 50px;
            color: palevioletred;
            position: absolute;
            /*            border: 1px solid yellow;*/
            top: 50px;
        }

        #p1,#i,#n,#k {
            width: 100%;
            font-size: 50px;
            color: palevioletred;
            position: absolute;
            left: -50px;
        }

     
        .ptop {
            position: relative;
            width: 350px;
            height: 400px;
            padding-left: 10px;
            margin: 150px auto;
            /*핑크 마진넣은것*/
            border: 20px solid pink;
        }

        .title1 {
            width: 99.9%;
            height: 100px;
            border: 1px solid palevioletred;
            position: relative;

        }
        .titlec1 {
            width: 200px;
            height: 100px;
            left:130px;
            position: relative;

        }
        #gotoPage2 {
            width: 200px;
            height: 50px;
            left:0;
            top:20px;
            position: absolute;
            border-radius: 20px;
            cursor: pointer;
            

        }

        .titles1 {

            width: 400px;
            height: 100px;
            position:relative;
            float:right;
            top:-100px;
         
            /*            border: 1px solid red;*/


        }
        
        .titlel1{
            float: left;
            width: 130px;
            height: 100px;
            
            
        }
        .logo1{
            width: 120px;
            height: 0;
            border: 8px solid pink;
            position: absolute;
/*            display: none;*/
            top: -20px;
        }
        .logo2{
            width: 70px;
            height: 0;
            left: 15px;
            top: 5px;
            border: 5px solid pink;
            position: absolute;
/*            display: none;*/
            top:-20px;
            
           
            
        }
        .logo3{
            width: 30px;
            height: 0;
            left: 15px;
            top: 5px;
            border: 6px solid pink;
            position: absolute;
/*            display: none;*/
             top:-20px;
            
        }
        
         #insert {
            width: 120px;
            height: 50px;
            right: 100px;
            text-align: center;
            border-radius: 30px;
            cursor: pointer;
            position: absolute;
            top: 20px;
   
        }
      
        #login {
            width: 120px;
            height: 50px;
            text-align: center;
            border-radius: 30px;
            cursor: pointer;
            position: absolute;
            top:20px;

        }
        
        #logout {
            width: 120px;
            height: 50px;
            text-align: center;
            border-radius: 30px;
            cursor: pointer;
            position: absolute;
            top:20px;
            left:200px;

        }
        
        #session{
        
       	 	color: white;
       	 	width: 200px;
       	 	height: 100px;
       	 	font-weight: bolder;
       	 	position: absolute;
       	 	top:30px;
        
        }
        
        .loginbox{
            width: 310px;
            height: 300px;
            left: 18%;/*min 50% 잊지말기*/
            top: 30%;
            padding-top: 20px;
            border: 1px solid red;
            display: none;
            position: fixed;
            background-color: black;
            z-index: 5;
            border-radius: 10%;
            
        }
        
        .bigmid {
            width: 100%;
            height: 100%;
            overflow: hidden;
            margin: 0 auto;
            position: absolute;
            border: 1px solid black;

        }
        
        .bidmid2 {
            left: 30px;
            top: 560px;
            width: 440px;
            height: 300px;
            /*            display: none;*/
            background-color: rgba(234, 100, 96, 0.5);
            position: absolute;
            display: none;
            z-index: 1;

        }

        .box {
            width: 100%;
            padding: 3%;
            position: absolute;
            float: left;
        }

        #gp1 {
            ;
            width: 150px;
            height: 270px;
            float: right;
        }
        
        .premovie{
            left: 600px;
            top: 200px;
            position: absolute;
            display: none;
         
            
        }
        #movie1{
            width: 1200px;
            height: 700px;
             display: none;
        }

        #g1 {

            position: absolute;
            width: 120%;
            /*            height: 120%;*/


        }

        @media(min-width:500px) {
            .ptop {
                position: relative;
                width: 350px;
                height: 400px;
                padding-left: 10px;
                margin: 150px auto;
                /*핑크 마진넣은것*/
                border: 20px solid pink;
            }
            #g1 {
                margin-left: -100px;
                /*얼굴 가운데로 조정줄수있다*/
                width: 400%;
                position: absolute;
                top: 100px;

            }
            .premovie{
            position: absolute;
            display: none;
            }

        }

        @media(min-width:600px) {

            #g1 {

                width: 350%;
                position: absolute;
                top: 100px;

            }
           

        }

        @media(min-width:650px) {
            #g1 {

                width: 330%;
                position: absolute;
                top: 100px;
            }
       
            

        }

        @media(min-width:700px) {
            .ptop {
                position: relative;
                width: 550px;
                height: 400px;
                padding-left: 10px;
                margin: 150px auto;
                /*핑크 마진넣은것*/
                border: 20px solid pink;
            }
            #g1 {

                width: 300%;
                position: absolute;
                top: 100px;
              }
            


        }

        @media(min-width:750px) {

            #g1 {

                width: 280%;
                position: absolute;
                top: 100px;
            }
          
        }

        @media(min-width:850px) {
            .ptop {
                position: relative;
                width: 650px;
                height: 400px;
                padding-left: 10px;
                margin: 150px auto;
                /*핑크 마진넣은것*/
                border: 20px solid pink;
            }
        

            #g1 {

                width: 265%;
                position: absolute;
                top: 100px;
            }
             .loginbox{
           left: 35%;/*min 50% 잊지말기*/
            
                
            }
                   
        }

        @media(min-width:900px) {
            #g1 {

                width: 250%;
                position: absolute;
                top: 100px;

            }
            
            p{
            color: aliceblue;
            font-size: 15px;
            }
            /*박스에다 기본설정하고 반응형은 p로 줬다*/
         

        }

        @media(min-width:1000px) {
            .ptop {
                position: relative;
                width: 750px;
                height: 400px;
                padding-left: 10px;
                margin: 150px auto;
                /*핑크 마진넣은것*/
                border: 20px solid pink;
            }
          


            #g1 {

                width: 225%;
                position: absolute;
                top: 100px;
            }

        }

        @media(min-width:1100px) {
            #g1 {

                width: 230%;
                position: absolute;
                top: 100px;
            }
              .loginbox{
           left: 40%;/*min 50% 잊지말기*/
            
                
            }
      
        }

        @media(min-width:1200px) {
            #g1 {

                width: 160%;
                position: absolute;
                top: 100px;
            }
        }

        @media(min-width:1300px) {

            #g1 {
                top: 0;
                width: 120%;
            }
      
        }
        
        @media(min-width:1900px){
             #movie1{
                 width: 1200px;
                 height: 700px;
                 display: block;
            }
        }

        #h1 {
            margin-top: 30px;
            text-align: center;

        }

        .footer {
            width: 400px;
            height: 400px;
           text-align: center;
            border: 3px solid white;
            margin: 250px auto;
            display: flex;
            /*안에 들어가있기때문에 엡솔안주고 마진으로 정렬*/
        }

        .footsay {

            font-size: 30px;
            color: white;
            padding: 95px;
            font-weight: bolder;
        }
        
        .footerbot{
            width: 100%;
            height: 100px;
       
            position: absolute;
            top:800px;
            text-align: center;
            font-size: 10px;
            
            
        }

      
        .blackbox{
            
            width: 100%;
            height: 100vh;
            position: fixed;
            background-color:  rgba(0,0,0,0.8);
             display: none;
            z-index: 4;
        }
        
        p{
            color: aliceblue;
/*            font-size: 1px;*/
        }
        
        a{
            color: aliceblue;
            opacity: 0.4;
/*            font-size: 1px;*/
        }
        
        #id1{
            position: absolute;
            width: 70px;
            height: 30px;
/*            border: 1px solid white;*/
            top: 54px;
            left: 40px;
        }
        #pid{
            position: absolute;
            width: 140px;
            height: 30px;
            top: 50px;
            left: 120px;
           
        }
        
        #pass1{
            width: 70px;
            height: 30px;
/*            border: 1px solid white;*/
            position: absolute;
            left: 40px;
            top: 95px;
        }
        #ppass{
            left: 120px;
            position: absolute;
            width: 140px;
            height: 30px;
            top: 90px;
        }
        #identer{
            position: absolute;
            width: 80px;
            height: 40px;
            top: 150px;
            left: 60px;
            
        }
        #idcencel{
            position: absolute;
             width: 80px;
            height: 40px;
            top: 150px;
            left: 160px;
        }
        
         #inid1{
            position: absolute;
            width: 70px;
            height: 30px;
/*            border: 1px solid white;*/
            top: 54px;
            left: 40px;
        }
        #inpid{
            position: absolute;
            width: 140px;
            height: 30px;
            top: 50px;
            left: 120px;
           
        }
        
        #inpass1{
            width: 70px;
            height: 30px;
/*            border: 1px solid white;*/
            position: absolute;
            left: 40px;
            top: 95px;
        }
       
        #inppass{
           
            position: absolute;
            width: 140px;
             left: 120px;
            height: 30px;
            top: 90px;
        }
         #inpass2{
        	width: 70px;
            height: 30px;
/*            border: 1px solid white;*/
            position: absolute;
            left: 40px;
            top: 165px;
        
        }
        #inppass2{
            left: 120px;
            position: absolute;
            width: 140px;
            height: 30px;
            top:160px;
        }
        
        #inidenter{
            position: absolute;
            width: 80px;
            height: 40px;
            top: 220px;
            left: 60px;
            
        }
        #inidcencel{
            position: absolute;
             width: 80px;
            height: 40px;
            top: 220px;
            left: 160px;
        }
        
    </style>

</head>

<body>
    <div class="wrap">

                    <div class="blackbox">
<!--                        흑막-->
                    </div>
        <div class="page1">
            <div class="title1">
                
                <div class="titlel1">
                    <div class="logo1">
                        <div class="logo2">
                            <div class="logo3"></div>
                        </div>
                    </div>
                </div> 
                  <div class="titlec1">
                    <c:choose>
                    	 <c:when test="${not empty id }">
                 			<div><input type= "button" value="비디오모음" onclick="goPage2()" id="gotoPage2"></div>
                    	 </c:when>
                    </c:choose>
                  </div>
                 <div class="titles1">
                 
                 	<c:choose>
                        <c:when test="${not empty id }">
                        
                        	<div class="session">
                        		<div id ="session">${id}님이 입장하셨습니다.</div>
                        	</div>
                        	 <div class="logout">
	                            <a href="/board/pinkLogOut.do"><input type="button" value="로그아웃" id="logout"></a>
	                        </div>
                        </c:when>
                 		<c:when test="${empty id}">
	                 		<div class="insert">
	                 			<a href="/board/pinkGoJoin.do"><input type="button" value="회원가입" id="insert"></a>
	                 		</div>
	                        <div class="login">
	                            <a href="/board/pinkGoLogin.do"><input type="button" value="로그인" id="login"></a>
	                        </div>
                        </c:when>
                    </c:choose>    
                 </div>
            </div>

            <div class="ptop">
                <div class="ptop1">
                    <div id="p1">P</div>
                </div>
                <div class="ptop2">
                    <div id="i">I</div>
                </div>
                <div class="ptop3">
                    <div id="n">N</div>
                </div>
                <div class="ptop4">
                    <div id="k">K</div>
                </div>
                <div class="ptop5">
                    <div id="LoVE">LoVE</div>
                </div>
                <div class="ptop6">
                    <div id="MoVIES">MoVIES</div>
                </div>
                <div class="ptop7">
                    <div id="WaTCHINH">WaTCHINHG</div>
                </div>

            </div>

        </div>
        <div class="page2">


            <div class="bigmid">
                <div class="midtxt1">
                    <h1 id="h1">주말영화</h1>
                </div>
                <img src="${pageContext.request.contextPath}/resources/img/gp1.jpg" id="g1">
                <!--                    <img src="gg1.png" id="g2">-->

            </div>

            <div class="bidmid2">

                <div class="box"><img src="/resources/img/gp1.jpg" id="gp1">
				                    감독 곽재용<br>
				                    출연 <a href="https://search.naver.com/search.naver?where=nexearch&sm=tab_jum&query=%EC%A0%84%EC%A7%80%ED%98%84">전지현</a>(그녀),<a href="https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%B0%A8%ED%83%9C%ED%98%84&oquery=%EC%A0%84%EC%A7%80%ED%98%84&tqi=UxtvXlp0J1sssc%2BUzAZssssssg0-501283">차태현</a>(견우)<br>
				                    등급 [국내] 15세 관람가<br>
				                    <h3>줄거리</h3>
				                    <h4>전지현+차태현의 절라유쾌 사랑이야기 그녀와의 무서운 데이트가 시작된다!2001년 여름, 온몸이 뽀사지도록 즐거워집니다!</h4> ‘전반전’. 그녀와 저는 같은 문으로 함께 인천행 지하철을 타게 되씀미다. 취해서 비틀거리지만 안는다면 정말 매력저기고 갠차는 아가씨여저...
				                    푸하하핫! 진짜 특이하다!.....

                </div>
  		   </div>
            
            <div class="premovie">
                <iframe id="movie1" src="https://www.youtube.com/embed/enO5vBVTsSI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

        	</div>
        </div>
        <div class="page3">

            <div class="footer">
                <div class="footsay">시청료의 20%는 사회에 기부되고있습니다.</div>
            </div>
                
            <div class="footerbot">
                <p>고객센터(이용 및 결제 문의 min@min.co.kr&#8226;051-912-1000(유료) / 제휴 및 대외 협력<a> contact@min.com &#8226;010-0000-9999(유료)</a><br>
                <a>주식회사 min / ceo 민병진 / 서울특별시 서초구 강남대로 343 신덕빌딩 3층 / 사업자등록번호 000-00-00000 / 통신판매업 신고번호 제0000&#45;부산서면&#45;0965호 / 대표번호 051&#45;515&#45;9985 / 개인정보 처리방침 </a>
                </p>
            </div>


        </div>

        <div class="bottom">
            <h1 id="h2">금주 영상순위</h1>
            <div class="rkbtn">
                <div class="rk">

                    <div class="rk1">1위 악마 김정현을 보았다</div>
                    <div class="rk2">2위 세상의 중심에서 권태현을 보았다</div>
                    <div class="rk3">3위 홍성민 나 혼자 산다</div>
                    <div class="rk4">4위 정찬욱의 사십끼</div>
                    <div class="rk5">5위 엽기적인 정현</div>
                    <div class="rk6">6위 타짜 권태현</div>
                    <div class="rk7">7위 찬욱 그 강을 건너지마오</div>
                    <div class="rk8">8위 성민 아프니까 청춘이다</div>
                </div>

            </div>
        </div>

    </div>
<script type="text/javascript">
        // 메인 효과   
        $j(document).ready(function() {
            
            
            $j(".logo1").animate({
             height:"97px",
                top:"0"
            },500,function(){
                $j(".logo2").animate({
                    height:"70px",
                    top:"5px"                   
                },500,function(){
                   $j(".logo3").animate({
                       height:"50px",
                       top:"5px"
                   },500,function(){
                        $j("#p1").animate({
                            left: "10px"
                        },300,function(){
                            $j("#p1").animate({
                                left:"0px"
                            }, 300, function() {
                            $j("#i").animate({
                                left: "0px"
                            }, 500, function() {
                                $j("#n").animate({
                                    left: "0px"
                                }, 500, function() {
                                    $j("#k").animate({
                                        left: "0px"
                                    }, 500, function() {
                                        $j("#LoVE").animate({
                                            top: "0px"
                                        }, 500, function() {
                                            $j("#MoVIES").animate({
                                                top: "0px"
                                            }, 500, function() {
                                                $j("#WaTCHINH").animate({
                                                    top: "0px"
                                                }, 500)
                                            });
                                        });
                                    });
                                });
                            });
                        });
                    });
                });
            });                
          }); 
        });        

//스크롤로 창띄우기
        $(window).on("scroll", function() {

            var sc_top = $(this).scrollTop();
            if (sc_top > 950) {
                $(".bidmid2,.premovie").stop().fadeIn(2000, function() {
                
                });

            } else if (sc_top < 1000) {
                $(".bidmid2,.premovie").stop().fadeIn(2000, function() {
                	
                });

            }

            if (sc_top > 1600) {
                $(".bidmid2,.premovie").stop().fadeOut(2000, function() {
                	
                });
               
            }
            if (sc_top < 200) {
                $(".bidmid2,.premovie").stop().fadeOut(2000, function() {
                	
                });
            }
         });
        
             
         setInterval(function() {//  밑에 영상순위
            $j(".rk").animate({
                top: "-30px"
            }, 1500, function() {
                var str = $j(".rk").children().eq(0).detach();
                $j(".rk").append(str);
                $j(".rk").css("top", 0);
            });
        }, 3000);
        

         function goPage2(){
			alert("page");

			location.href="/board/${id}/pinkGoSe.do";
				

             }
        
</script>


</body>

</html>
		      