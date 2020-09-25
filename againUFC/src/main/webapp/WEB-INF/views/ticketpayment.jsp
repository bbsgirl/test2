
<%@page import="com.min.UFC.dto.GameBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
 #wrap{
     	display: block;
     	justify-content: center;
     	left:10%;
     	top:20%;
     	position:absolute;
     	width:80%;
     	height: 400px;
     	margin:200,auto;
     	border: 1px solid red;
    }
    .item{
    	width: 100%;
    	height: 200px;
    	border: 1px solid black; 
         display: flex;
         justify-content: center;
    }
    .gname{
        font-size: 25px;
    }
    .game_img{
    	position:absolute;
    	left: 30%;
    	top:30%;
    }
    .game_img img{
    	position:absolute;
    	left:0;
    	top:0;
        width: 200px;
        height: auto;
        margin-right: 10px;
    } 
    .btn_p{
        align-content: left;
        margin-left: 90%;
    }
    .gsubname{
        font-size: 15px;
        color: gray;
        margin-top:10px;
       
    }
    .t_p{
        margin-top: 10px;
        margin-left: 5px;
    }
    .tt{
    	padding: 10px;
        margin-left: 0px;
        font-size: 15px;
    }
    .total_pricediv{
    	position:absolute;
    	width: 300px;
    	height: 30px;
    	margin-left: 75%;
    	margin-top:100px;
    	/*position: absoulte:*/
    	border: 1px solid black;
    	border: 1px solid black;
    	top:60%;
    }
    .purchase_tic{
    position:absolute;
    width:100%;
    height:200px;
    top:25%;
    left:50%;
    font-size: 30px;
    font-weight: 900;
    }

</style>
</head>

<body>
<%
	System.out.println("빈 담기 전");
	GameBean bean = (GameBean)request.getAttribute("bean");
	String id = (String)session.getAttribute("id");
	System.out.println("빈 담기 후");
	int n_tic=0;
	if(request.getAttribute("nticket").equals("no")){
		n_tic=0;
	}else{
		n_tic = Integer.parseInt((String)request.getAttribute("nticket"));
	}
	System.out.println("초기변수 다 저장");
	//넘어온 거 게임빈이랑 현재 예매수 이제 니가 여기 jsp 작성해라
	
%>
<div id="wrap">
 <h1> 결 제 </h1>
 <form action="Ticketpaymentok.do" method="post">
	<div class="item">
			<div class="game_img"><img src="img/<%=bean.getG_img()%>.png" alt="이미지에러" name="game_img"></div>
			<div class="purchase_tic">
				<div class="gname"><%= bean.getG_name()%></div>
				<div class="gsubname"><%=bean.getG_date() %></div>
				<input type = "hidden" value = <%= id %> name = "id">
				<input type="hidden" value="<%=bean.getIdx()%>" name="idx">
				<input type="hidden" value="<%=bean.getT_ticket()%>" name="ticket">
				<input type="hidden" value="<%=n_tic %>" name="n_tic">
				<input type="hidden" value="<%=bean.getT_price()%>" name="tp" id = "ss">
				<div class="tt">좌석수<input type="text" name="p_tic" id="sit" class="t_p" size=2></div>
				예매된 좌석수 / 총 좌석수 : <%=n_tic%> / <%=bean.getT_ticket()%>
			</div>
	
			</div>
		
		<div class="total_pricediv">총 결제금액 : <input type="text" value="<%=bean.getT_price()%>" id="total_price" size=5>원
			<input type="submit" value="결제하기">
		
		</div>  
		</div>
		
		
		</form>	
<script>
$("#sit").on("keyup",function(){
	var cnt = parseInt($("#sit").val() || 1);
	var price = parseInt($("#ss").val());
	alert(cnt);
	var p = cnt * price;
	alert(p);
	$("#total_price").val(p);
});


</script>
</body>
</html>