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

<form action="register" method="post" name="frm">
	<table>
		<tr>
			<td>id</td><td><input type="text" name="id" id="idtext" placeholder="id"></td>
		</tr>
		<tr >
			<td id="idck" colspan="2">1</td>
		</tr>
		<tr>
			<td>pw</td><td><input type="text" name="pw" id="pwtext" placeholder="pw"></td>
		</tr>
		<tr>
			<td>name</td><td><input type="text" name="name" id="nametext" placeholder="name"></td>
		</tr>
		<tr>
			<td>gender</td>
			<td>
				<select name="gender" id="genderselect"><!-- ����Ʈ��  �������� �ȿ� value���� �Ѿ�� -->
					
						<option value="f">f</option>
						<option value="m">m</option>
					
				</select>
			</td>
		</tr>
		<tr>
			<td><input type="button" value="Ȯ��" onclick="on1()"></td><td><a href="main"><input type="button" value="���"></a></td>
		</tr>
		
	</table>
</form>
<script>
function on1(){
	if(frm.id.value.trim().length==0){
		alert("���̵� �ʼ�")
		$("#idtext").focus();
	}else if(frm.pw.value.trim().length==0){
		alert("��й�ȣ �ʼ�")
		$("#pwtext").focus();
	}else if(frm.name.value.trim().length==0){
		alert("�̸� �ʼ�")
		$("#nametext").focus();
	}else{
		frm.submit();

		}
	}

 	var idck ="";

 	//�����̸��� �� �����ؾ��Ѵ�

	$("#idtext").keyup(function(){
		var id = "id=" + $("input[name=id]").val();
		$.ajax({
			type:"POST",// �ҹ���	
			url:"registercheck",
			data: id,
			dataType:"json",
			success:function(m){

				if(m.result == "yes"){
						$("#idck").text("����� �� �ִ� ���̵��Դϴ�.");
						$("#idck").css("color", "red");
						$("#idck").css("visibility", "visible");
						idck = "yes";
				}else{
						$("#idck").text("����� �� ���� ���̵��Դϴ�!!");
						$("#idck").css("color", "red");
						$("#idck").css("visibility", "visible");
						idck = "no";
				}
			},
			 error:function(m) {		 
	            	$("#idck").text("�����߻� �ٽ� �õ� ���ֽñ� �ٶ��ϴ�");
	            	$('#idck').css("color", "red");
	            	$("#idck").css("visibility", "visible");
					idck ="no";
	   		 }
			
		});
	});
 
 
	
 
	

</script>




























</body>
</html>