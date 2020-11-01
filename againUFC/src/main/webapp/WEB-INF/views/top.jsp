
<%@page import="project.min.dto.Product"%>
<%@page import="project.min.dao.StoreDao"%>
<%@page import="java.util.Vector"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Bungee&display=swap" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    #wrap{
        width: 100%;
        margin: auto;
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
    }
    .cart{
       
        width: 30px;
        cursor: pointer;
    }
   /*  .ufcpage{
        position: absolute;
        width: 70px;
        left: 27%;
    } */
    
    #logout{
		margin-top: auto;
        height: 40px;
        width: 100px;
        border: 0px;
        background-color: white;
        cursor: pointer;
	}

    .menubar{
    	font-family: 'Bungee', cursive;
        width: 100%;
        height: 80px;
        border: 1px solid black;
        padding-top:10px;
        display: flex;
        position:fixed;
        justify-content: space-around;
        line-height: 50px;
        background-color: black;
        color: white;
        top:35px;
    } 
    .top:hover{
    	color: red;
    }
    .bottom:hover{
    	color: red;
    }
    .cap:hover{
    	color:red;
    }
    
    
    .line{
        width: 100%;
        display: flex;
        margin-top: 40px;
    }
    .img{
        width: 70%;
        height: 200px;
    }
    .goods{
        margin:0 auto;
        margin-top:100px;
        margin-bottom:50px;
        width: 300px;
        font-size: 24px;
        text-align: center;
    }
    #name{
     	color: red;
    }
    #price{
    
    }
    .top, .bottom, .cap, .cartbtn, #buybtn, #logo, .cart, .ufcpage{
        cursor: pointer;
    }
    .btn1{
        display: flex;
        justify-content: space-around;
    }
    header{
		display: flex;
	    position: fixed;
		z-index: 5;
		width: 100%;
		background-color: white;
       	top:-5px;
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
     #p{
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
     
     input[type=button]{
     		width: 70px;
 			height: 32px;
 			background-color: black;
 			color: white;
 			outline: 0;
 			border: 0;
 			border-radius: 0.35em;
     }
     input[type=button]:hover{
    	 color: red;
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
	       <% if(session.getAttribute("id") == null){
		  	   %>
	  	   		<script>
	  	   			alert("로그인시 이용할수있습니다"); //아이디가없으면 메인으로돌아간다
	  	   			location.href = "Main.do";
	  	   		</script>
		  	   <%
	       	  }else {
	       %>
           
           
            
            <span id = "info"><%= grade %><%=session.getAttribute("name")%>님 환영합니다!</span>
           	 <img class="cart" src="img/cart5.png" alt="" onclick="location.href='cart.jsp'">
            <button id = "logout" onclick = "logout()">로그아웃</button>
            <% } %>
        </header>
         <div class="menubar">
           <img src="img/logo2.png" id ="logo">
           <div onclick="location.href='Top.do'" class="top">TOP</div>
           <div onclick="location.href='Pants.do'" class="bottom">PANTS</div>
           <div onclick="location.href='Cap.do'" class="cap">CAP</div>
           
        </div>
   
        <%
        Vector<Product> v = (Vector<Product>)request.getAttribute("bean");
        
        String name = null;
    	int price = 0;
    	int count = 0;
    	String memberId = (String)session.getAttribute("id");
    	for(int i=0; i<v.size(); i++){
    		name = v.get(i).getName();
    		price = v.get(i).getPrice();
    		count = v.get(i).getCount();
	    		if(i%3==0){ //나머지가 0일때마다 line클래스 div를 열어준다 
		%>
       		<div class="line">
   		<%	
	    		}
       	%>
       
       		<div class="goods">
       		<img class="img" src="img/<%=name%>.png">
               <p id="name">상품명 : <%=name%></p>
               <p id="price">가격 : <%=price%>원</p>
               <input  type="button" value="장바구니" class="cartbtn" id="<%=name%>" name="<%=memberId%>" onclick="cartPopup(this.id, this.name)">
            </div>
       	<%
       			if(i%3==2){ //나머지가 2일때마다 line클래스 div를 닫아준다
 		%>
			</div>
		
		<%
    			}
    		}
		%>
    </div>
    
     <div id="bottom">
            <img src="img/logo2.png"><br>
            <div class="bot1">Privacy Policy </div>  
            <div class="bot1">Terms of Use </div><br>
            <div id="g">대표:민병진 <br> 주소:부산광역시 부산진구 <br> 저작권 ⓒ2001-ufc판권소유</div>
            <p id="p"><img src="img/f.png" id="f"><img src="img/t.png" id="t"><img src="img/u.png" id="u"></p>
         </div>
    <script>
        function cartPopup(clicked_id, clicked_name){ //장바구니버튼의 클릭한 아이디와 네임을가져온다
        	var id = clicked_name;
        	var name = clicked_id;
        	alert("장바구니에 추가되었습니다.");
 			location.href="topCart.do?id="+id+"&name="+name; //탑카트.do에 클릭한 아이디와 네임을 넘긴다
        }
        function logout() {
    		location.href = "Logout.do";
    	}
        function change(){
    		location.href = "Change.do";
    	}
        $("#logo").click(function(){
    	    location.href="*.do";    	 
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
    </script>
</body>
</html>