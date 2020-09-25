<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
	<style>
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
    body{
        background-color: darkgray;
    }
	#wrap{
		text-align: center;
        margin-top: 30px;
	}
	#title{
		font-size: 70px;
        margin-left: 500px;
        margin-right: 500px;
		font-weight: bolder;
	}
	#box{
		display: flex;
	}
	#player1{
        float: left;
		font-size: 30px;
		width: 500px;
		height: 400px;
		text-align: center;
		border: 1px solid black;
        margin-top: 150px;
        margin-left: 150px;
        margin-right: 300px;
	}
	#player2{
        float: right;
		font-size: 30px;
		width: 500px;
		height: 400px;
		text-align: center;
		border: 1px solid black;
        margin-top: 150px;
        margin-left: 300px;
	}
	span{
		margin-right: 50px;
	}
    .winner{
        background-image: url(img/winner.gif);
        background-size: cover;
    }
    .loser{
        background-image: url(img/loser.gif);
        background-size: cover;
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
<body>
<%
    String name1 = (String)request.getAttribute("name1");
    String name2 = (String)request.getAttribute("name2");
    String weight = (String)request.getAttribute("weight");
    String idx = (String)request.getAttribute("idx");
%>
<div id="wrap">
    <span id = "title">승자 선택</span><input type = "button" id = "btn2" value="완료">
    <input type = "button" id = "btn1" value = "뒤로가기">
    <div id = "box">
    <form action="GameCountOk.do" method="post" name = "frm">
        <div id = "player1">
            <span><%=name1%></span>
            <input type="radio" name="chk_win" id = "name1" value="<%=name1%>"><label for = "name1">승</label><br>
        </div>
        <input type="hidden" name="idx" value="<%=idx%>">
        <input type="hidden" name="weight" value="<%=weight%>">
        <input type="hidden" name="name1" value="<%=name1%>">
        <input type="hidden" name="name2" value="<%=name2%>">
        <div id = "player2">
            <span><%=name2%></span>
            <input type="radio" name="chk_win" id = "name2" value="<%=name2%>"><label for = "name2">승</label><br>
        </div>
    </form>
    </div>
</div>
</body>
<script>
    $("#name1").change(function(){
       if($("#name1").is(":checked")){
           $("#player1").removeClass();
           $("#player2").removeClass();
           $("#player1").addClass("winner");
           $("#player2").addClass("loser");
       }
    });
    $("#name2").change(function(){
       if($("#name2").is(":checked")){
           $("#player1").removeClass();
           $("#player2").removeClass();
           $("#player1").addClass("loser");
           $("#player2").addClass("winner");
       }
    });
    $("#btn2").click(function(){
        frm.submit();
    });
    $("#btn1").click(function(){
    	location.href = "Admin.do";
    });
</script>
</html>