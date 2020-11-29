<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="/WEB-INF/views/common/common.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <style>
         /*위에꺼 어썸폰트*/
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        .page1{
            width: 100%;
            height: 100vh;
            background-color: black;
            position: relative;
            overflow: hidden;
        }
        .page2{
            width: 100%;
            height: 190vh;
            background-color: pink;
            position: relative;
            display: flex;
            overflow: hidden;
             /*플렉스때문에 수직은 쌓는다 인라인플렉스를 했다면 수평으로 쌓인다*/
         
            /*row은 왼쪽에서 오른쪽으로 수평축
            wrap은 안에들어가있는 것을 여러줄로 묶는다는뜻*/
/*            overflow: hidden;*/
        }
        
        
        
          .title1 {
            width: 99.9%;
            height: 100px;
            position: fixed;
            display: flex;
            flex-flow: row wrap;
            background-color: black;
            z-index: 1;
            top:0;
            left: 0;
            opacity: 0.8;

        }
        
          .search{
            width: 220px;
            height: 40px;
            margin: 30px auto;
      
        
        }
  
        .titles1 {

            width: 100px;
            height: 100px;
            left:80%;
            position:absolute;
            float:right;
            

        }
        
        .titlel1{
          
            width: 130px;
            height: 100px;
            
            
        }
        .logo1{
            width: 120px;
            height: 0;
            border: 8px solid pink;
            position: absolute;
            opacity: 0.2;
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
/*          display: none;*/
            top:-20px;
           
            
        }
        .logo3{
            width: 30px;
            height: 0;
            left: 15px;
            top: 5px;
            border: 6px solid pink;
            position: absolute;
            top:-20px;
            
        }
        .login {
            width: 90px;
            height: 90px;
            text-align: center;
            padding-top: 30px;
            color: aliceblue;
            border-radius: 30px;
            cursor: pointer;
            font-weight: lighter;
            position: relative;

        }
        
        
         #logout {
            width: 120px;
            height: 50px;
            text-align: center;
            border-radius: 30px;
            cursor: pointer;
            position: absolute;
            top:10px;
            left:80%;

        }
        
        .movie{
            width: 350%;
            height: 100vh;
            left: -610px;
            top: 0;
            position: absolute;
            
        }
        
        .view{
            width: 99.9%;
            height: 100vh;
/*            overflow: hidden;*/
            position: absolute;
        }
        @media(min-width:500px){
            
            /*차태현 얼굴하고잎으면 마진주면된다*/
            .movie{
                width: 300%;
                left: -450px;
                top: 0;
               
            }
            .titles1 {

            width: 100px;
            height: 100px;
            left:80%;
            position:absolute;
            float:right;
            

        	}
           
        }
         @media(min-width:550px){
            .movie{
                width: 250%;
                left: -450px;
                top: 0;
               
            }
            .titles1 {

            width: 100px;
            height: 100px;
            left:80%;
            position:absolute;
            float:right;
            

        	}
          
        }
         @media(min-width:600px){
            .movie{
                width: 220%;
                left: -430px;
                top: 0;
               
            }
             .premovie{
         
                 display: none;
            
           	}
             .page2{
                 height: 150vh;
             }
                   
              .search{
            width: 400px;
           
            }
        
            .titles1 {

            width: 100px;
            height: 100px;
            left:80%;
            position:absolute;
            float:right;
            

        }
    
   
        }
         @media(min-width:700px){
            .movie{
                width: 250%;
                left: -560px;
                top: 0;
                
            }
         
             .search{
            width: 500px;
            
        }
            .movie{
                width: 200%;
                left: -450px;
                top: 0;
               
            }
          
            .titles1 {

            width: 100px;
            height: 100px;
            left:80%;
            position:absolute;
            float:right;
            

        } 
            
        }
        @media(min-width:900px){
            .movie{
                width: 150%;
                left: -200px;
                top: 0;
                
            }
        
             .titles1 {

            width: 100px;
            height: 100px;
            left:80%;
            position:absolute;
            float:right;
            

        }
     
        }
         @media(min-width:1000px){
            .movie{
                width: 130%;
                left: -280px;
                top: 0;
               
            }
        
            .search{
            width: 500px;
           
            }
        
            .titles1 {

            width: 100px;
            height: 100px;
            left:80%;
            position:absolute;
            float:right;
            

        }
          
      
        }
        
        .aboxtitle1{
            width: 100%;
           
            position: absolute;
            
        }

        .aboxgroup1{/*영상의 큰틀*/
            width: 100%;
            height: 250px;
            position: absolute;
            white-space: nowrap;
            overflow-x: hidden;/*나가는거 히든*/
            cursor: pointer;
/*            background-color: aqua;*/
              display: flex;
          /*인라인블럭과 같은 수평쌓임이다 각각의 내용이 주는것이아니라 껍데기가준다
            여기안에있는것이 
            */
          
        }
        
        .aboxgroup1 .active{
            background-color: rgba(0,0,0,0.5);
            cursor: grabbing; 
      
        }
        
        .afile{
             
/*일단 주석처리*/
/*            비디오와 막이 있는 틀이다*/
         
         
/*            position:absolute;*/
            /*안에 있는데 앱솔주면 겹쳐진다*/
            display: flex;
           margin-left: 20px;
    /*플래스 주니까 막이랑 같이 겹쳐진다*/
            width: 400px;
            height: 250px;
            

        }
    
       .aiframe{
         
            

            width: 400px;
            height: 250px;
            
        }
       .amac{
            
            width: 400px;
            height: 250px;
          
            position: absolute;
/*            display: none;*/
            background-color: rgba(0,0,0,0.01);
            z-index: 100;
   /*집에가서 mac 다따로 위치줘야한다*/
/*              border: 1px solid black;*/
           
        }
     
        .bboxtitle1{
            width: 100%;
            margin-top:300px;
            height: 300px;
            position: absolute;
   
/*            display: flex; 플렉스 주니까 위에 붙어버린다*/
            
        }

        .bboxgroup1{/*영상의 큰틀*/
            width: 100%;
            height: 250px;
            position: absolute;
            white-space: nowrap;
            overflow-x: hidden;/*나가는거 히든*/
            cursor: pointer;
/*            background-color: aqua;*/
              display: flex;
             /*인라인블럭과 같은 수평쌓임이다 각각의 내용이 주는것이아니라 껍데기가준다
            여기안에있는것이 
            */
          
        }
        
        .bboxgroup1 .active{
            background-color: rgba(0,0,0,0.5);
            cursor: grabbing; 
      
        }
        
    .bfile{
            width: 400px;
            height: 250px;
            
            display: flex;
             justify-content: space-around;  
/*      justify-content: space-around;  을 넣어도 효과가없다                */
/*       옆으로 마진넣기     */
        margin-left: 20px;

        }
    .biframe{
         
            
/*              비디오*/
            width: 400px;
            height: 250px;
            
        }
       .bmac{
            
            width: 400px;
            height: 250px;
          
            position: absolute;
/*            display: none;*/
            background-color: rgba(0,0,0,0.01);
            z-index: 100;
         /*집에가서 mac 다따로 위치줘야한다*/
/*              border: 1px solid black;*/
           
           
        }
           
        
        
        
        
        .cboxtitle1{
            position: absolute;
            width: 100%;
            margin-top:600px;
            height: 300px;
   
/*            display: flex; 플렉스 주니까 위에 붙어버린다*/
           }

        .cboxgroup1{/*영상의 큰틀*/
            width: 100%;
            height: 250px;
            position: absolute;
            white-space: nowrap;
            overflow-x: hidden;/*나가는거 히든*/
            cursor: pointer;
/*            background-color: aqua;*/
              display: flex;
       /*인라인블럭과 같은 수평쌓임이다 각각의 내용이 주는것이아니라 껍데기가준다
            여기안에있는것이 
            */
          
          
        }
        
        .cboxgroup1 .active{
            background-color: rgba(0,0,0,0.5);
            cursor: grabbing; 
      
        }
        
    .cfile{
            width: 400px;
            height: 250px;
           display: flex;
             justify-content: space-around;  
/*     justify-content: space-around;  을 넣어도 효과가없다          */
            margin-left: 20px;

        }
    .ciframe{
         
            

            width: 400px;
            height: 250px;
            
        }
     .cmac{
            
            width: 400px;
            height: 250px;
          
            position: absolute;
/*            display: none;*/
            background-color: rgba(0,0,0,0.01);
            z-index: 100;
      /*집에가서 mac 다따로 위치줘야한다*/
/*              border: 1px solid black;*/
           
        }
        
        
          .dboxtitle1{
            position: absolute;
            width: 100%;
            margin-top:900px;
            height: 550px;
            left: 1px;
/*            border: 1px solid black;*/
            background-color: pink;
            overflow: hidden;
   
/*            display: flex; 플렉스 주니까 위에 붙어버린다*/
           }
        
        .dboxgroup1{
            width: 300%;
            height: 550px;
            position: absolute;
            display: flex;
            flex-flow: row;
        }
        .dfile1,.dfile2,.dfile3,.dfile4,.dfile5,.dfile6,.dfile7,.dfile8,.dfile9,.dfile10,.dfile11,.dfile12{
            width: 20%;
            height: 500px;
             transition: all 1s linear;
            transform: scale(0.9);
        }
        .diframe{
            
            width: 100%;
            height: 500px;
            border: 1px solid black;
          
            
            
        }
        
        .left1{
            font-size: 100px;
            color:black;
            position: absolute;
            z-index: 5;
            top: 230px;
            left: 0;
             cursor: pointer;
        }
         .right1{
            font-size: 100px;
            color:black;
            position: absolute;
            z-index: 5;
            top:230px;
             right: 0;
            cursor: pointer;
        }
        
        .premovie{
            width: 100%;
            height: 350px;
            margin-top: 1450px;
            position: absolute;
            background-color: pink;
/*            border: 1px solid red;*/
/*            overflow: hidden;*/
            
        }
        
        .u1{
            width: 500px;
            height: 300px;
        }
        .u{
            width: 100%;
            height: 300px;
           
            
        }
        .boxmovie1{
            
            width: 480px;
            height: 500px;
            z-index: 10;
            position: absolute;
            top: -500px;
            display: none;
        }
        .bm1{
            width: 100%;
            height: 100%;
        }
        
        #home{
            position: absolute;
            left: 150px;
            top:30px;
            color: white;
            font-size: 20px;
            opacity: 0.9;
            cursor: pointer;
            color: black;
            width: 150px;
            height: 50px;
        }
        
        .row1,.row2,.row3,.row4{
            width: 0px;
            height: 7px;
            background-color: red;
            position: absolute;
            top: 30px;
            opacity: 0.6;
        }
        
       
        
      /*    #reid1{
            position: absolute;
            width: 70px;
            height: 30px;
/*            border: 1px solid white;*/
            top: 54px;
            left: 40px;
            color: white;
            font-size:15px;
        }
        #repid{
            position: absolute;
            width: 140px;
            height: 30px;
            top: 50px;
            left: 120px;
                 
                 
        }
         */
        #repass1{
            width: 70px;
            height: 30px;
/*            border: 1px solid white;*/
            position: absolute;
            left: 40px;
            top: 95px;
             color: white;
               font-size:15px;
        }
       
        #reppass{
           
            position: absolute;
            width: 140px;
             left: 120px;
            height: 30px;
            top: 90px;
        }
         #repass2{
        	width: 100px;
            height: 30px;
/*            border: 1px solid white;*/
            position: absolute;
            left: 60px;
            top: 25px;
              color: white;
               font-size:15px;
        
        }
        #reppass2{
            left: 40px;
            position: absolute;
            width: 225px;
            height: 30px;
            top:50px;
        }
        
        #reidenter{
            position: absolute;
            width: 80px;
            height: 40px;
            top: 220px;
            left: 60px;
            
        }
        #reidcencel{
            position: absolute;
             width: 80px;
            height: 40px;
            top: 220px;
            left: 160px;
        }
           .blackbox{
            
            width: 100%;
            height: 100vh;
            position: fixed;
            background-color:rgba(0,0,0,0.8);
            display: none;
            z-index: 1;
        }
        
        #pinkno{
        
        	width: 220px;
        	height: 50px;
        	position: relative;
        	top:70px;
        	left:40px;
        
        
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
	              
	                    <div class="home">
	                              <form action="/pinkmovie/pinkGoBoard.do" >
		                                 <input type="hidden" id="session" name="sessionId" value="${sessionId}">
				                         <input type="submit" id="home" value="요청영상">
		                           </form>
	                     </div>
                        <div class="titlel1">
                            <div class="logo1">
                                <div class="logo2">
                                    <div class="logo3"></div>
                                </div>
                            </div>
                        </div> 

                         <div class="titles1">
                                <div id="logout">
                                      <a href="/pinkmovie/pinkLogOut.do"><input type="button" value="로그아웃" id="logout"></a>
                                </div>
                         </div>
                    </div>

                
            <div class="movie">
                <div class="view">
                     <iframe width="100%" height="960" src="https://www.youtube.com/embed/WRyZS31pLwE?rel=0&amp;autoplay=1&amp;mute=1&amp;loop1;playlist=WRyZS31pLwE"
                     frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
<!--                ?rel=0&amp;autoplay=1&amp;mute=1&amp;loop1;playlist=WRyZS31pLwE" 자동반복재생하는 입력값 mute는음소거 음소거해야지 되는게 많다 -->
                
                
                </div>
            </div>
            
            
        </div>

        <div class="page2">
            <div class="aboxtitle1"><h1>액션영화<div class="row1"></div></h1>
               
                <div class="aboxgroup1">
                       <div class="afile">
                        <iframe  class="aiframe"  src="https://www.youtube.com/embed/SkKX1fVMj7Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                       
                   <div class="amac"></div>
                        </div>
                       <div class="afile">
                       <iframe class="aiframe" src="https://www.youtube.com/embed/CFJ0ar_aa48" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        
                    <div  class="amac">
                        </div>
                        </div>
                     <div class="afile">
                      <iframe class="aiframe" src="https://www.youtube.com/embed/5ZDoRKGYD08" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    
                     <div class="amac">
                    </div>
                    </div>
                    
                    <div class="afile">
                     <iframe class="aiframe"  src="https://www.youtube.com/embed/D4SkEKhq-Y0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                   
                    
                    <div class="amac">
                    </div>
                    </div>
                    <div class="afile">
                     <iframe class="aiframe"src="https://www.youtube.com/embed/svsTQk13LTQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    
                    <div class="amac">
                     </div>
                     </div>
                    <div class="afile">
                 <iframe class="aiframe" src="https://www.youtube.com/embed/KX5kI-Ubojc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                 
                     <div class="amac">
                    </div>
                    </div>
                    <div class="afile">
                    <iframe class="aiframe"  src="https://www.youtube.com/embed/ip4rNmlupnw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                 
                    <div class="amac">
                    </div>
                    </div>
                    <div class="afile">
                  <iframe class="aiframe" src="https://www.youtube.com/embed/a_CDuqSjnq8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <div class="amac">
                    </div>
                    </div>
                    <div class="afile">
                    <iframe  class="aiframe" src="https://www.youtube.com/embed/WRyZS31pLwE?wmode=opaque" frameborder="0" style="z-index:0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                  <div class="amac">
                    </div>
                    </div>
                    <div class="afile">
                   <iframe class="aiframe" src="https://www.youtube.com/embed/5C8mX-galkg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <div class="amac">
                      </div>
                        </div>
                </div>
               
            </div>
            
    
          <div class="bboxtitle1"><h1>호러영화<div class="row2"></div></h1>
               
                <div class="bboxgroup1">
                       <div class="bfile">
                        <iframe  class="biframe" src="https://www.youtube.com/embed/WRyZS31pLwE?wmode=opaque" frameborder="0" style="z-index:0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                   <div class="bmac"></div>
                        </div>
                       <div class="bfile">
                        <iframe class="biframe"src="https://www.youtube.com/embed/svsTQk13LTQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <div class="bmac">
                        </div>
                        </div>
                     <div class="bfile">
                    <iframe class="biframe" src="https://www.youtube.com/embed/5C8mX-galkg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                     <div class="bmac">
                    </div>
                    </div>
                    
                    <div class="bfile">
                    <iframe class="biframe"  src="https://www.youtube.com/embed/YsA0eYFLP6o" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    
                    <div class="bmac">
                    </div>
                    </div>
                    <div class="bfile">
                     <iframe class="biframe" src="https://www.youtube.com/embed/CFJ0ar_aa48" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    
                    <div class="bmac">
                     </div>
                     </div>
                    <div class="bfile">
                 <iframe class="biframe"  src="https://www.youtube.com/embed/D4SkEKhq-Y0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                 
                     <div class="bmac">
                    </div>
                    </div>
                    <div class="bfile">
                    <iframe class="biframe"  src="https://www.youtube.com/embed/ip4rNmlupnw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                 
                    <div class="bmac">
                    </div>
                    </div>
                    <div class="bfile">
                  <iframe class="biframe" src="https://www.youtube.com/embed/a_CDuqSjnq8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <div class="bmac">
                    </div>
                    </div>
                    <div class="bfile">
                    <iframe  class="biframe"  src="https://www.youtube.com/embed/SkKX1fVMj7Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                  <div class="bmac">
                    </div>
                    </div>
                    <div class="bfile">
                    <iframe class="biframe" src="https://www.youtube.com/embed/5ZDoRKGYD08" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <div class="bmac">
                      </div>
                        </div>
                </div>
               
            </div>
            
            
               <div class="cboxtitle1"><h1>로맨스영화<div class="row3"></div></h1>
               
                <div class="cboxgroup1">
                       <div class="cfile">
                       <iframe class="ciframe" src="https://www.youtube.com/embed/DO845EqU3eE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                   <div class="cmac"></div>
                        </div>
                       <div class="cfile">
                         <iframe class="ciframe" src="https://www.youtube.com/embed/hJhf7YXJBdI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <div class="cmac">
                        </div>
                        </div>
                     <div class="cfile">
                      <iframe class="ciframe"  src="https://www.youtube.com/embed/YsA0eYFLP6o" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                     <div class="cmac">
                    </div>
                    </div>
                    
                    <div class="cfile">
                    <iframe class="ciframe" src="https://www.youtube.com/embed/KX5kI-Ubojc" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    
                    <div class="cmac">
                    </div>
                    </div>
                    <div class="cfile">
                     <iframe class="ciframe" src="https://www.youtube.com/embed/CFJ0ar_aa48" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    
                    <div class="cmac">
                     </div>
                     </div>
                    <div class="cfile">
                 <iframe class="ciframe"  src="https://www.youtube.com/embed/D4SkEKhq-Y0" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                 
                     <div class="cmac">
                    </div>
                    </div>
                    <div class="cfile">
                    <iframe class="ciframe"  src="https://www.youtube.com/embed/ip4rNmlupnw" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                 
                    <div class="cmac">
                    </div>
                    </div>
                    <div class="cfile">
                  <iframe class="ciframe" src="https://www.youtube.com/embed/a_CDuqSjnq8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <div class="cmac">
                    </div>
                    </div>
                    <div class="cfile">
                    <iframe  class="ciframe"  src="https://www.youtube.com/embed/SkKX1fVMj7Q" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                  <div class="cmac">
                    </div>
                    </div>
                    <div class="cfile">
                    <iframe class="ciframe" src="https://www.youtube.com/embed/5ZDoRKGYD08" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    <div class="cmac">
                      </div>
                        </div>
                </div>
               
            </div>
           
        <div class="dboxtitle1"><h1>신규영상<div class="row4"></div></h1>
                   <div class="left1">
                        <i class="fas fa-angle-left"></i>
                   </div>
           <div class="dboxgroup1">
                    
                    
                    <div class="dfile1">
                        <iframe class="diframe"  src="https://www.youtube.com/embed/DO845EqU3eE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                     <div class="dfile2">
                      
                         <iframe class="diframe" src="https://www.youtube.com/embed/hJhf7YXJBdI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                     <div class="dfile3">
                          <iframe class="diframe" src="https://www.youtube.com/embed/CFJ0ar_aa48" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div class="dfile4">
                         <iframe class="diframe" src="https://www.youtube.com/embed/5ZDoRKGYD08" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div class="dfile5">
                         <iframe class="diframe" src="https://www.youtube.com/embed/ZadfI47Tp_8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div class="dfile6">
                         <iframe class="diframe" src="https://www.youtube.com/embed/5ZDoRKGYD08" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div class="dfile7">
                         <iframe class="diframe" src="https://www.youtube.com/embed/hJhf7YXJBdI" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div class="dfile8">
                       <iframe class="diframe" src="https://www.youtube.com/embed/a_CDuqSjnq8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                     <div class="dfile9">
                        <iframe class="diframe"  src="https://www.youtube.com/embed/YsA0eYFLP6o" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                     <div class="dfile10">
                         <iframe class="diframe" src="https://www.youtube.com/embed/5ZDoRKGYD08" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div class="dfile11">
                          <iframe class="diframe" src="https://www.youtube.com/embed/a_CDuqSjnq8" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    <div class="dfile12">
                         <iframe class="diframe" src="https://www.youtube.com/embed/5ZDoRKGYD08" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                    </div>
                    
                   
                    </div>
                    <div class="right1">
                         <i class="fas fa-angle-right"></i>
                    </div>
           
            </div>
           
            <div class="premovie"><h1>개봉예정작<div class="row"></div></h1>
                
                <div class="movieposter">
                   <div class="u1">
                        <img class="u" src="http://img.youtube.com/vi/M07KM18X_yY/0.jpg">
   
                        </div>
                    </div>
                    
                <div class="boxmac"></div>
                <div class="boxmovie1">
                     <iframe class="bm1" src="https://www.youtube.com/embed/M07KM18X_yY?rel=0&amp;autoplay=1&amp;mute=1&amp;loop1;playlist=WRyZS31pLwE" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                    
                </div>
                
           
<!--
            <p></p>
 여기기능 필요없다 좌표보기위해서
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    
-->
         
        </div>
     
    </div>
    
    <script>
     $j(document).ready(function() {
         
         $j(".aboxtitle1").mouseenter(function(){
            $j(".row1").stop().animate({
                    width:"160px"
                },500);
                
            });
         $j(".aboxtitle1").stop().mouseleave(function(){
                $j(".row1").animate({
                    width:"0px"
                },500);
        	 });

         $j(".bboxtitle1").mouseenter(function(){
            	$j(".row2").stop().animate({
                    width:"160px"
                },500);
	         });
         $j(".bboxtitle1").mouseleave(function(){
             	$j(".row2").stop().animate({
                    width:"0px"
                },500);
	         });
         $j(".cboxtitle1").mouseenter(function(){
            	$j(".row3").stop().animate({
                    width:"160px"
                },500);
	         });
         $j(".cboxtitle1").mouseleave(function(){
                $j(".row3").stop().animate({
                    width:"0px"
                },500) ;
             });    
         $j(".dboxtitle1").mouseenter(function(){
            	$j(".row4").stop().animate({
                    width:"160px"
                },500);
             });
         $j(".dboxtitle1").mouseleave(function(){
                $j(".row4").stop().animate({
                    width:"0px"
                },500);
	         });

   
         $j(".u1").mouseenter(function(){
             $j(".boxmovie1").css("display","block");
             
             
         });
          $j(".u1").mouseleave(function(){
             $j(".boxmovie1").css("display","none");
             
             
         });
     
          
         
//            for( var i=0 ;i<12;i++ ){
//          var s =$j(".dboxgroup1").children().eq(i);
//                   alert(s);
//              
//                if(s == i){
//     }
//                       }
//$j(".dboxgroup1").children().eq(s).css("transform","scale(1.5)");
            
    //아예 클래스에다가 줘버렸다
         /*$j(".dfile1").stop().mouseenter(function(){
              $j(".dfile1").css("transform","scale(1.1)");
            }); 
          $j(".dfile1").stop().mouseleave(function(){
              $j(".dfile1").css("transform","scale(0.9)");
            
         }); 
         
         $j(".dfile2").stop().mouseenter(function(){
        $j(".dfile2").css("transform","scale(1.1)");
            }); 
          $j(".dfile2").stop().mouseleave(function(){
              $j(".dfile2").css("transform","scale(0.9)");
           
             
      */
      //밑에 배너들 크기조절
         $j(".dboxgroup1").children().stop().mouseenter(function(){
              $j(this).css("transform","scale(1.1)");
            }); 
          $j(".dboxgroup1").children().stop().mouseleave(function(){
              $j(this).css("transform","scale(0.9)");
           }); 
           
        //this라는 것을 내가 지정하는것!!!   
        //위에 로고      
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
                   },500)
                    
                });
            });
       
          //마지막꺼 화살표로 움직이기
         $j(".left1").click(function(){
             
             $j(".dboxgroup1").animate({
                left:"-100%"
                 
                 
             },1000,function(){
                 var fi =$j(".dboxgroup1").children().eq(0).detach();
                 var se =$j(".dboxgroup1").children().eq(0).detach();
                 var th=$j(".dboxgroup1").children().eq(0).detach();
                 var fou =$j(".dboxgroup1").children().eq(0).detach();
                    $j(".dboxgroup1").append(fi);
                    $j(".dboxgroup1").append(se);
                    $j(".dboxgroup1").append(th);
                    $j(".dboxgroup1").append(fou);
                    $j(".dboxgroup1").css("left",0);
             });
         });
         
         $j(".right1").click(function(){
              var f=$j(".dboxgroup1").children().eq(11).detach();
              var s=$j(".dboxgroup1").children().eq(10).detach();
              var t=$j(".dboxgroup1").children().eq(9).detach();
              var fo=$j(".dboxgroup1").children().eq(8).detach();
                    $j(".dboxgroup1").prepend(f);
                    $j(".dboxgroup1").prepend(s);
                    $j(".dboxgroup1").prepend(t);
                    $j(".dboxgroup1").prepend(fo);
                    $j(".dboxgroup1").css("left","-100%");
              
             $j(".dboxgroup1").animate({
                 left: "0px"
             },1000);
         });
            
         
          //모든 스크롤  다 적용
        var isDown=false; 
        var startX=0;
         var startY=0;
        
        
        $j(".aboxgroup1").mousedown(function(e){
            isDown=true;
            $j(".aboxgroup1").addClass("active");
//          $j("p").eq(1).text("스크롤의 위치 : "+scrollLeft);
        });
           
//           $j(".aboxgroup1").mousemove(function(e){
//               Y= e.pageY;
//               X = e.pageX;
//                $j("p").eq(0).text("마우스의Y 위치 : "+Y);
//               $j("p").eq(1).text("마우스의X 위치 : "+X);
//               
//           });
        
        $j(".aboxgroup1").mousemove(function(e){
            if(!isDown){
                return;
//            alert("hihihihihih");
            }
            e.preventDefault();//좀더 실해하겠금하는 함수있다
            var x =e.pageX;
            var walk=(x-startX);//이동하는거리
            $j(".aboxgroup1").scrollLeft(scrollLeft-walk);// 스크롤레프트 좌우이동하는법
//          $j("p").eq(2).text("마우스 무빙칠때 위치" +x);
        });
        $j(".aboxgroup1").mouseup(function(e){
            isDown =false;
            $j(".aboxgroup1").removeClass("active");
        });
        $j(".aboxgroup1").mouseleave(function(e){
            isDown=false;
            $j(".aboxgroup1").removeClass("active");
        });
         
        //막사이 y짜로 공간찾기  
        
       
         $j(".aboxgroup1").stop().mousemove(function(e){
        	   //변수 넣으면서 괜찮아지만  마우스옮기고 빠져나올때는 적용이 안된다
            startY= e.pageY;
            scrollLeft=$j(".aboxgroup1").scrollLeft(); 
            $j("p").eq(0).text("마우스의X 위치 : "+startX); 
            $j("p").eq(2).text("마우스의Y 위치 : "+startY);
         if(1100<startY && startY<1150){
             
//            alert("1120과 1150사이에 들어왔다"),
             $j(".amac").css("display","none");
         }
         });
         $j(".aboxgroup1").stop().mouseleave(function(e){
             if(1100<startY && startY<1150){
                 $j(".amac").css("display","block");
             }
         });
         
         
         
     
         //두번째 영상 스크롤
        $j(".bboxgroup1").mousedown(function(e){
            isDown=true;
            $j(".bboxgroup1").addClass("active");
            startX = e.pageX;
            startY= e.pageY;
            scrollLeft=$j(".bboxgroup1").scrollLeft(); 
//            $j("p").eq(0).text("마우스의X 위치 : "+startX); 
			$j("p").eq(0).text("마우스의Y 위치 : "+startY);
            $j("p").eq(1).text("스크롤의 위치 : "+scrollLeft);
            
            
        });
        
        $j(".bboxgroup1").mousemove(function(e){
            if(!isDown){
                return;
//            alert("hihihihihih");
            }
            e.preventDefault();
            var x =e.pageX;
            var walk=(x-startX);
            $j(".bboxgroup1").scrollLeft(scrollLeft-walk);
//                 $j("p").eq(2).text("마우스 무빙칠때 위치" +x);
        });
        $j(".bboxgroup1").mouseup(function(e){
            isDown =false;
            $j(".bboxgroup1").removeClass("active");
        });
        $j(".bboxgroup1").mouseleave(function(e){
            isDown=false;
            $j(".bboxgroup1").removeClass("active");
        });
         
        //스크롤
          $j(".bboxgroup1").stop().mousemove(function(e){
        	     //변수 넣으면서 괜찮아지만  마우스옮기고 빠져나올때는 적용이 안된다
             startX = e.pageX;
            startY= e.pageY;
            scrollLeft=$j(".bboxgroup1").scrollLeft(); 
            $j("p").eq(0).text("마우스의X 위치 : "+startX); 
            $j("p").eq(2).text("마우스의Y 위치 : "+startY);
         if(1400<startY && startY<1460){
             
//          alert("1120과 1150사이에 들어왔다"),
             $j(".bmac").css("display","none");
         }
         });
         $j(".bboxgroup1").stop().mouseleave(function(e){
             if(1400<startY && startY<1460){
                 $j(".bmac").css("display","block");
             }
         });
          
         
         //3번째 스크롤
           $j(".cboxgroup1").mousedown(function(e){
            isDown=true;
            $j(".cboxgroup1").addClass("active");
            startX = e.pageX;
            startY= e.pageY;
            scrollLeft=$j(".cboxgroup1").scrollLeft(); 
//                 $j("p").eq(0).text("마우스의X 위치 : "+startX); 
            $j("p").eq(0).text("마우스의Y 위치 : "+startY);
            
            $j("p").eq(1).text("스크롤의 위치 : "+scrollLeft);
            
            
        });
         
          
        $j(".cboxgroup1").mousemove(function(e){
            if(!isDown){
                return;
//            alert("hihihihihih");
            }
            e.preventDefault();
            var x =e.pageX;
            var walk=(x-startX);
            $j(".cboxgroup1").scrollLeft(scrollLeft-walk);
//            $j("p").eq(2).text("마우스 무빙칠때 위치" +x);;
        });
        $j(".cboxgroup1").mouseup(function(e){
            isDown =false;//왜있지?
            $j(".cboxgroup1").removeClass("active");
        });
        $j(".cboxgroup1").mouseleave(function(e){
            isDown=false;
            $j(".cboxgroup1").removeClass("active");
        });
      

          $j(".cboxgroup1").stop().mousemove(function(e){

            startX = e.pageX;
            startY= e.pageY;
            scrollLeft=$j(".cboxgroup1").scrollLeft(); 
            $j("p").eq(0).text("aaa : "+startX); 
            $j("p").eq(2).text("bbb : "+startY);
         if(1715<startY && startY<1760){             

             $j(".cmac").css("display","none");
         }
         });
         $j(".cboxgroup1").stop().mouseleave(function(e){
             if(1715<startY && startY<1760){
                 $j(".cmac").css("display","block");
             }
         });
         
         
       });
          
          function no(){
        	  location.href="/pinkmoive/pinkBoard.do";
          }
    </script>
    
    
    
</body>
</html>