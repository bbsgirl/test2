<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.p{
		width:50px;
	}

</style>



<body>

<form action="/pinkmovie/pinkLogin.do" method="post" name="frm">
	<table align="center">
			<tr>
				<td>
					<table >
						<tr>
							<td align="center">id</td><td><input type ="text" name ="id" id="idid" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9+]/g,'');"></td>
						</tr>
						<tr>
							<td align="center">pw</td><td><input type ="password" name ="pw" id="pwpw"></td>
						</tr>
						
					</table>
				</td>	
			</tr>	
				<tr>
						<td align="right"><input type="button" onclick="on1()" value="login" class="p"><a href="/pinkmovie/pinkMain.do"><input type="button" value="cancel" class="p"></a></td>	
				</tr>
	</table>
</form>

<script type="text/javascript">

//여기서 null값으로 값을 못넘기게한다 

	function on1(){
		var a =$j("#idid").val().trim().length;
		var b =$j("#pwpw").val().trim().length;
		
					
		if(a==0){
			
			alert("아이디를 입력하십시오");
			$j("#idid").focus();
			
		}else if(b==0){
			alert("비밀번호를 입력하십시오");
			$j("#pwpw").focus();
		}else{
			frm.submit();
		}
	}


</script>

</body>
</html>