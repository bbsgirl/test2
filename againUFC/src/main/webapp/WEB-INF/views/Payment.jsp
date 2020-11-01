
<%@page import="project.min.dto.StoreBean"%>
<%@page import="project.min.dao.StoreDao"%>
<%@page import="java.util.Vector"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
    .img{
        float: left;
    }
    .right1{
        float: right;
    }
    .price{
        display: flex;
    }
    .clear, .payment{
        clear: both;
    }
    .clear{
    	margin-bottom: 3%;
    }
    #img{
    	width: 40%;
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
<body>
<%
	StoreDao dao = new StoreDao();
	String id = (String)session.getAttribute("id");
	Vector<StoreBean> v = dao.cartAlldata(id);
	
	String name = null;
	int count = 0;
	int price = 0;
	int total = 0;
	int subtotal = 0;
	String memberId = null;
	if(v.size()!=0){
		for(int i=0; i<v.size(); i++){
			name = v.get(i).getP_name();
			count = v.get(i).getCount();
			price = v.get(i).getPrice();
			total = price*count;
			subtotal += total;
			memberId = (String)session.getAttribute("id");

%>
		<div class="img">
			<img src="img/<%= name %>.png" id="img">
			<div><%= name %></div>
		</div>
		<div class="right1">
			<div class="price">
			    <div>가격:</div>
			    <div><%= total %></div>
			</div>
			 <select>
			     <option>S</option>
			     <option>M</option>
			     <option>L</option>
			     <option>XL</option>
			     <option>XXL</option>
			 </select>
		</div>
		<div class="clear"></div>
		<% } %>
		<div align="end">subTotal : <%=subtotal%></div>
		    <div class="payment" align="end">
		       <input type="button" value="닫기" onclick="payclose()">
		        <input type="button" value="결제하기" id="<%=memberId%>" onclick="payment(this.id)">
		    </div>	
 <%}else {%>
 	<input type="button" value="닫기" onclick="payclose()">
 <%}%>
    <script>
    	function payment(clicked_id){
    		var id = clicked_id;
    		location.href="payment.do?id="+id;
    		/* opener.document.location.href="/projectmin/cart.jsp"; */
    	}
    	function payclose(){
    		opener.document.location.href="/projectmin/cart.jsp";
    		window.close();
    	}
    	
    </script>
</body>
</html>