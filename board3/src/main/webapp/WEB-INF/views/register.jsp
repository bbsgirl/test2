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
		#pwck1{
		
		visibility: hidden;
		}
		
		#pwck2{
		
		visibility: hidden;
		}
		
		#namechk{
		
		visibility: hidden;
		}
		
		
	
	
	</style>

</head>
<body>

ȸ������
<form action="register" method="post" name="frm">
<table>
	<tr>
		<td>id</td> <td><input type="text" name="id" placeholder="id" id="idtext"></td>
	</tr>
	<tr>
		<td id="idck" colspan="2">1</td>
	</tr>
	<tr>
		<td>pw</td> <td><input type="password" name="pw" placeholder="pw" id="pwtext1"></td>
	</tr>
	<tr>
		<td id="pwck1" colspan="2">1</td>
	</tr>
	<tr>
		<td>pwck</td> <td><input type="password" name="pwck" placeholder="pwck" id="pwtext2"></td>
	</tr>
	<tr>
		<td id="pwck2" colspan="2">1</td>
	</tr>
	<tr>
		<td>name</td> <td><input type="text" name="name" placeholder="name" id="nametext"></td>
	</tr>
	<tr>
		<td id="namechk" colspan="2">1</td>
	</tr>
	
	<tr>
		<td>email</td> 
		<td><input type="text" name="email1">@ 
			<select name="email2">
					<option value="hanmail.net">hanmail.net</option>
					<option value="naver.com">naver.com</option>  
			</select>
		</td>
		
	</tr>
	
	<tr>
		<td>gender</td> 
		<td>
			<select name="gender" id="genderselect">
				<option value="f">f</option>
				<option value="m">m</option> 
			</select>
		</td>
	</tr>
	<tr>
		<td><input type = "button" value = "Ȯ��" onclick="on1()"></td><td><input type="button" value="���" onclick="c()"></td>
	</tr>

</table>


</form>
<script>

    var idck = "";
	var pw1chk = "";
	var pw2chk = "";
	var namechk = "";

		
 
	   $("#idtext").focusout(function(){
			if($("#idtext").val().trim().length==0){
				 
				$("#idck").text("��ĭ�� �ֽ��ϴ�");
			    $("#idck").css("color", "red");
				$("#idck").css("visibility", "visible");
	            $("#idtext").css("border-color", "red");
	            idck = "no";  
			}
			
	    });
 
	  $("#pwtext1").focusout(function(){
		
	        var pwtext1 = $("#pwtext1").val();
	        	
			if(pwtext1.trim().length==0){
				
	            $("#pwck1").text("��ĭ�� �ֽ��ϴ�.");
				$("#pwck1").css("color", "red");
				$("#pwck1").css("visibility", "visible");
	            $("#pwtext1").css("border-color", "red"); 
	            pw1chk = "no"; 
			}else{
				
			    $("#pwck1").css("visibility", "hidden");
	             $("#pwtext1").css("border-color", "black"); 
	            pw1chk = "yes";
			}
		});
 
	 $("#pwtext2").keyup(function(){
		
		var pwtext1 = $("#pwtext1").val();
		var pwtext2 = $("#pwtext2").val();
		if(pwtext2.trim().length==0){
		
			$("#pwck2").css("visibility", "hidden");
			pw2chk = "no";
		}else if(pwtext1 == pwtext2){
			
			$("#pwck2").text("��й�ȣ�� ��ġ�մϴ�.");
			$("#pwck2").css("color", "skyblue");
			$("#pwck2").css("visibility", "visible");
             $("#pwtext2").css("border-color", "black"); 
            pw2chk = "yes";
		}else{
			
			$("#pwck2").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			$("#pwck2").css("color", "red");
			$("#pwck2").css("visibility", "visible");
            $("#pwtext2").css("border-color", "red"); 
            pw2chk = "no";
		}
	});
 
	 $("#nametext").focusout(function(){
		
	        var nametext = $("#nametext").val();
			if(nametext.trim().length==0){
				
	            $("#namechk").text("��ĭ�� �ֽ��ϴ�.");
				$("#namechk").css("color", "red");
				$("#namechk").css("visibility", "visible");
	            $("#nametext").css("border-color", "red"); 
	            namechk = "no";
			}else{
				
			    $("#emchk2").css("visibility", "hidden");
	            $("#nametext").css("border-color", "black"); 
	            namechk = "yes";
			}
		});




		$("#idtext").keyup(function(){
			var id = "id=" + $("input[name=id]").val();
			$.ajax({
				type:"POST",
				url:"registerck",
				data: id,
				dataType:"json",
				success:function(args){
					
					if(args.result == "yes"){
	            		if($("#idtext").val().trim().length==0){
	            			$("#idck").text("��ĭ�� �ֽ��ϴ�");
	            			$("#idck").css("color", "red");
	    	    			$("#idck").css("visibility", "visible");
	    	    			$("#idtext").css("border-color", "red");
	    	    			idck = "no";
	            		}else{
	            			$("#idck").text("����� �� �ִ� ���̵��Դϴ�");
	    	            	$("#idck").css("color", "skyblue");
	        				$("#idck").css("visibility", "visible");
	        	            $("#idtext").css("border-color", "black");
	        	            idck = "yes";
	            		}
	            	}else{
	            		$("#idck").text("����� �� ���� ���̵��Դϴ�");
	          	  		$("#idck").css("color", "red");
		    			$("#idck").css("visibility", "visible");
		    			$("#idtext").css("border-color", "red");
		    			idck = "no";
	            	}
				},
				error:function(args) {		 
		            	$("#idck").text("�����߻� �ٽ� �õ� ���ֽñ� �ٶ��ϴ�");
		            	$("#idck").css("color", "red");
		    			$("#idck").css("visibility", "visible");
		    			$("#idtext").css("border-color", "red");
		    			idck = "no";
		        }
			});
		});

		function on1(){
	 	 	
			 if(idck == ""|| idck == "no"){
				alert("���̵� �Է��� Ȯ�ιٶ��ϴ�");
				$("#idtext").focus();
			}else if(pw1chk == "" || pw1chk == "no"){
				alert("��й�ȣ�� Ȯ�ιٶ��ϴ�");
				$("#pwtext1").focus();
			}else if(pw2chk == "" || pw2chk == "no"){
				alert("��й�ȣ�� Ȯ�ιٶ��ϴ�");
				$("#pwtext2").focus();
			}else if(namechk == "" || namechk == "no"){
				alert("�̸��Է��� Ȯ�ιٶ��ϴ�");
				$("#nametext").focus();
			}else{
				frm.submit();
			}   
		} 

		


 



</script>
</body>
</html>