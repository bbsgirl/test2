<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
		#idck{
		 visibility: hidden;
		
		}


	</style>

</head>
<body>
regisert

<form action="register" method="post">
	<table>
		<tr>
			<td>id</td><td><input type="text" name="id" id="idtext" placeholder="id"></td>
		</tr>
		<tr >
			<td id="idck" colspan="2">1</td>
		</tr>
		<tr>
			<td>pw</td><td><input type="text" name="pw"></td>
		</tr>
		<tr>
			<td>name</td><td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>gender</td>
			<td>
				<select name="gender"><!-- 셀렉트로  보낼때는 안에 value값이 넘어간다 -->
					
						<option value="f">f</option>
						<option value="m">m</option>
					
				</select>
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="확인"></td><td><a href="main"><input type="button" value="취소"></a></td>
		</tr>
		
	</table>
</form>
<script>
 	var idck ="";


 	//변수이름은 다 통일해야한다

	$("#idtext").keyup(function(){
		var id = "id=" + $("input[name=id]").val();
		$.ajax({
			type:"POST",// 소문자	
			url:"registercheck",
			data: id,
			dataType:"json",
			success:function(m){

				if(m.result == "yes"){
						alert("사용할 수 있는 아이디입니다.");
						$("#idck").text("사용할 수 있는 아이디입니다.");
						$("#idck").css("color", "red");
						$("#idck").css("visibility", "visible");
						idck = "yes";
				}else{
						$("#idck").text("사용할 수 없는 아이디입니다!!");
						$("#idck").css("color", "red");
						$("#idck").css("visibility", "visible");
						idck = "no";
				}
			},
			 error:function(m) {		 
	            	$("#idck").text("오류발생 다시 시도 해주시길 바랍니다");
	            	$('#idck').css("color", "red");
	            	$("#idck").css("visibility", "visible");
					idck ="no";
	   		 }
			
		});
	});

</script>




























</body>
</html>