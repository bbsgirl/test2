<%@page import="com.min.UFC.dto.StoreBean"%>
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
    #logo{
      		width: 80px;
            height: 50px;
       		cursor: pointer;
			margin-right: 50px;
    }
    #info{
			margin-top: auto;
			margin-bottom:auto;
        	margin-right: auto;
    }
    #logout{
			margin-top: auto;
            height: 40px;
            width: 100px;
            border: 0px;
            background-color: white;
            cursor: pointer;
            float: right;
    }
    .cart{
        
        width: 30px;
        cursor: pointer;
    }
    .ufcpage{
        position: absolute;
        width: 70px;
        left: 27%;
    }
    .menubar{
    	font-family: 'Bungee', cursive;
        width: 100%;
        height: 80px;
        padding-top:10px;
        margin-bottom: 20px;
        border: 1px solid black;
        display: flex;
        position:fixed;
        justify-content: space-around;
        line-height: 50px;
        background-color: black;
        color: white;
        top:35px;
        
    }
    .shoppingBasket{
    	font-size: 28px;
    	font-weight: bolder;
    }
    .top, .bottom, .cap, #logo, .cartimg, .RecycleBin, .ufcpage{
        cursor: pointer;
    }
    .size{
    	width: 20px;
    }
    .RecycleBin{
    	width: 20%;
    	height: 20%;
    }
    table{
        margin: 100px auto;
    }
    .img{
        width: 120px;
    }
    .tableimg{
        width: 20%;
    }
    .count{
    	width: 30px;
    	text-align: center;
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
    #bottom{
       	margin-top:50px;
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
    #box{
    	width:500px;
    	border:1px solid black;
    	margin: 0 auto;
    }
    #end{
    	margin:auto 80%;
    }
    header{
		display: flex;
		position: fixed;
		z-index: 5;
		width: 100%;
		background-color: white;
    }
    #btn1{
   		width: 70px;
		height: 32px;
		background-color: black;
		color: white;
		outline: 0;
		border: 0;
		border-radius: 0.35em;
    }
    #btn1:hover{
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
	  	   			alert("로그인시 이용할수있습니다");
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
           <img src="img/logo2.png" id ="logo" onclick="location.href='top.jsp'">
           <div onclick="location.href='top.jsp'" class="top">TOP</div>
           <div onclick="location.href='bottom.jsp'" class="bottom">PANTS</div>
           <div onclick="location.href='cap.jsp'" class="cap">CAP</div>
           
        </div>
        <div align="center" class="shoppingBasket">장바구니</div>
        <table align="center" id="ta">
        
<%
	StoreDao dao = new StoreDao();
	String id = (String)session.getAttribute("id"); //회원아이디
	Vector<StoreBean> v = dao.cartAlldata(id);
	String name = null;
	int price = 0;
	int count = 0;
	int total = 0;
	String dup = null;
	int subtotal = 0;
	for(int i=0; i<v.size(); i++){
		name = v.get(i).getP_name();
		price = v.get(i).getPrice();
		count = v.get(i).getCount();
		dup = v.get(i).getDup();
		total = price*count;
		subtotal += total;
%>
        
            <tr align="center">
               <td align="center" class="tableimg">
                   <img src="img/<%= name %>.png" alt="" class="img">
               </td>
                <td>Price</td>
                <td>Count</td>
                <td>Delete</td>
                <td>Total</td>
            </tr>
            <tr align="center">
                <td><%= name %></td>
                <td class="size">$<%= price %></td>
                <td class="size">
                <form action="updateCount.do">
                    <input type="text" name="count" value="<%= count %>" class="count">
                    <input type="hidden" name="name" value="<%= name %>">
                </form>
                </td>
                <td class="size">
                	<img src="img/RecycleBin.png" name="<%= dup %>" id="<%= name %>" class="RecycleBin" onclick="bin(this.id)">
                </td>                
                <td class="size">$<%= total %></td>
            </tr>
<% } %>
        </table><br>
        <div id="end">
            <div align="end">SubTotal</div>
            <div align="end">$<%= subtotal %></div><br>
        
        <div align="end"><input id="btn1" type="button" value="결제하기" onclick="popup()"></div>
        </div>
    </div>
    
     <div id="bottom">
         <img src="img/logo2.png"><br>
         <div class="bot1">Privacy Policy </div>  
         <div class="bot1">Terms of Use </div><br>
         <div id="g">대표:민병진 <br> 주소:부산광역시 부산진구<br>저작권 ⓒ2001-ufc판권소유</div>
         <p><img src="img/f.png" id="f"><img src="img/t.png" id="t"><img src="img/u.png" id="u"></p>
     </div>
    <script>
    	
    	function popup(){
    		var url = "Payment.jsp";
    		window.open(url,"","width=500, height=500, resizable=no, scrollbars=yes, status=yes, left=100, top=50 fullscreen=yes;"); //팝업창띄우기
    	
    		}
    	function bin(clicked_id){
    		var name = clicked_id;
    		alert("삭제되었습니다");
    		location.href="deleteProduct.do?id="+name;
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