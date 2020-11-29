<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
	<style>
	.phonetext{
		width: 45px;
	}
	
	#idck{
	
		visibility: hidden;
	}
	#pwck1{
		visibility: hidden;
	}
	#pwck2{
		visibility: hidden;
	}
	#nameck{
		visibility:hidden;
	}
	#phone{
		visibility:hidden;
	}
	#phone2{
		visibility:hidden;
	}
	#postNock{
		visibility:hidden;
	}
	#addrestck{
		visibility:hidden;
	}
	#compantyck{
		visibility:hidden;
	}
	
	#jointb{
		width: 800px;
		height: 500px;
	}
	
	</style>

</head>
<body>

<form action="/pinkmovie/pinkJoin.do" method="post" name="frm">
<table align="center">
	<tr>
		<td align="left">
			<a href="/pinkmovie/pinkMain.do">Main</a>
		</td>
	</tr>

	<tr>
		<td>
			<table border = "1" id="jointb">
				<tr>
					<td align="center" >id</td>							<!--정규식  영어 대소 만 사용-->
					<td><input type="text" name="id" id="idtext" onkeyup="this.value=this.value.replace(/[^a-zA-Z0-9+]/g,'');" maxlength="14"  ></td>
					<td style="border: 0px"><input type="button" value="중복확인" id="idckbtn" onclick="ck()"></td>
					<td id="idck" colspan="1" width="200">1</td>
					
				</tr>
				<tr>
					<td align="center">pw</td>
					<td><input type="password" name="pw" id="pwtext" placeholder="pw" minlength="6" maxlength="12"></td>
					<td id="pwck1" colspan="2">1</td>
				</tr>
				<tr>
					<td align="center">pw check</td>
					<td><input type="password" name="pwck" id="pwcktext"></td>
					<td id="pwck2" colspan="2">1</td>
					
				</tr>
				<tr>
					<td align="center">name</td>															<!-- 한글코드:\uAC00-\uD7AF 한글자모:\u1100-\u11FF 다른버젼은 ^가-히ㅎ -->
					<td><input type="text" name="name" id="nametext" maxlength="3" onkeyup="this.value=this.value.replace(/[^\uAC00-\uD7AF\u1100-\u11FF]/g ,'');"></td>
					<td id="nameck" colspan="2">1</td>	
				</tr>
				<tr>
					<td align="center">phone</td>
						<td>
							<select name="phone1">
								<c:forEach var="ph" items="${pnumberVo}">
								
									<option value="${ph.phNumber}"> ${ph.phNumber}</option>
								</c:forEach>	 
							</select>
							-<input type="text" id="ph1" name="phone2" class="phonetext" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							-<input type="text" id="ph2" name="phone3" class="phonetext" maxlength="4" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">			
						</td><td id="phone" colspan="2">1</td>
						<!-- </td><td id="phone2" colspan="1">1</td> -->
				</tr>
				<tr>
					<td align="center">postNo</td>
					<td><input type="text" id="postno" name="postno" maxlength="7" ></td>
					<td id="postNock" colspan="2">1</td>
				</tr>
				<tr>
					<td align="center">address</td>
					<td><input type="text" name="address" id="address" maxlength="100"></td>
					<td id="addrestck" colspan="2">1</td>
				</tr>
				<tr>
					<td align="center">company</td>
					<td><input type="text" name="company" maxlength="50"></td>
					<td id="compantyck" colspan="2">1</td>
				</tr>
			
			
			
			</table>
		</td>
	</tr>
	<tr >
		<td align="right">
			<!-- <a href="/board/boardJoin.do">Join</a> -->
			<input type="button" value=" Join" onclick="join()">
		</td>
	</tr>
</table>
</form>

<script >
/*y는 안되는거 n는 되는거  */

var idck = "";
var idck2 = "";
var pw1="";
var pw2="";
var name="";
var ph1="";
var ph2="";
var post="";
var idyo="";
 	
 	/*id   */
$j("#idtext").focusout(function(){
	
		if($j("#idtext").val().trim().length==0){
			
			idck="Y";
			
		}else{
		
			idck="N";
			
		}
 	});
 	
 	
 	
 	
 	/* 커서이동 */
 	$j("body").focusin(function(){
 		$j("#idck").css("visibility","hidden");
 	});
 	
 	/* 중복확인 */
function ck() {
		
 		
		
		var id = "id=" + $j("input[name=id]").val();
		
	 /* 치는아이디가 나온다 */ 
		$j.ajax({
			url: "/pinkmovie/pinkIdck.do",
			dataType: "json",
			type: "POST",
			data: id,
			success:function(data, textStatus, jqXHR){
			
				if(data.success=="N"){
					if($j("#idtext").val().trim()==0){
						$j("#idck").text("빈칸이 있습니다.");
						$j("#idck").css("color", "red");
						$j("#idck").css("visibility","visible");
						idck ="Y";
						
					}else{
						alert("사용가능 아이디입니다.");
						$j("#idck").text("사용할수있는아이디입니다.");
						$j("#idck").css("color", "skyblue");
						$j("#idck").css("visibility","visible");
						idck ="N";
						
					}
				}else{
						alert("중복되는 아이디입니다.");
					$j("#idck").text("사용할수없는아이디입니다.");
					$j("#idck").css("color", "red");
					$j("#idck").css("visibility","visible");
					idck ="Y";
				
				} 
			
				idck2="C";
				
			},
			erro:function(jqXHR, textStatus, errorThrown){
				$("#idck").text("오류발생 다시 시도 해주시길 바랍니다");
            	$("#idck").css("color", "red");
    			$("#idck").css("visibility", "visible");
    		
    			idck = "Y";
				alert("실패");
			}
		});
		
		
	}

/*중복확인누르고 재클릭 */
 
 		
	$j("#idtext").focusin(function(){
		var Length= $j("#idtext").val().trim().length ;
 		if(idck2=="C"){
			
 			//길이가 줄어들거나 늘어놧을때  설정
			$j("#idtext").focusout(function(){
				if(Length<Length+1 ||Length>Length-1){
					idck2 = "D";
				}
			}); 
		 }
	});
	
	
	  /* 키보드 이벤트 */
	$j("#pwtext").keyup(function() {
		
		
		var pwck1 = $j("#pwtext").val();
		
		
		if(pwck1.trim().length < 6){
			$j("#pwck1").text("6자리이하는 권장하지않습니다.");
			$j("#pwck1").css("color", "red");
			$j("#pwck1").css("visibility", "visible");
			pw1="Y";
			
		
		}else if(pwck1.trim().length > 12){

	  		alert("12칸을 벗어놨습니다.");
	  		
			$j("#pwck1").text("12칸을 벗어놨습니다.");
			$j("#pwck1").css("color", "red");
			$j("#pwck1").css("visibility", "visible");
			pw1="Y";
		
		}else{
			
			$j("#pwck1").text("가능비번");
			pw1="N";
	
		}
		
	});
	
	/* 커서이동 */
	$j("#pwtext").focusout(function(){
		if($j("#pwtext").val().trim().length >5){
		
 		$j("#pwck1").css("visibility","hidden");
 		pw1="N";
		}
 	});
	
	
	/*length()하지마라 그냥 length  */
	
	$j("#pwcktext").keyup(function(){
		var pwtext1 = $j("#pwtext").val();
		
		var petext2 = $j("#pwcktext").val();
		
		if(petext2.trim().length<6){//순서대로가자 
			
			$j("#pwck2").text("비밀번호 양식이 맞지않습니다");
			$j("#pwck2").css("color","red");
			$j("#pwck2").css("visibility","visible");
			pw2="Y";
		}else if(pwtext1 == petext2){//그리고 같은면 뜨게하기
			
			$j("#pwck2").text("비밀번호가 일치합니다.");
			$j("#pwck2").css("color","skyblue");
			$j("#pwck2").css("visibility","visible");
			pw2="N";
		}else{
			
			$j("#pwck2").text("비밀번호가 불일치합니다.");
			$j("#pwck2").css("color","red");
			$j("#pwck2").css("visibility","visible");
			pw2="Y";
			
		}
	});

	/* 커서이동 */
	$j("#pwcktext").focusout(function(){
		if($j("#pwcktext").val().trim().length >5&&$j("#pwcktext").val()==$j("#pwtext").val()){
			$j("#pwck2").css("visibility","hidden");
 			pw2="N";
 		}
 		
		});	
	
	//name 빈값
	$j("#nametext").keyup(function(){
		
		if($j("#nametext").val().trim()==0){
			
			name="Y";
			
		}else{
			name="N";
			
		}
 	});
	
	
	$j("#ph1").keyup(function(){
		
		
		if($j("#ph1").val().trim().length<4){
			
			$j("#phone").text("4자리를 입력하시오");
			$j("#phone").css("color","red");
			$j("#ph1").css("border-color","red");
			$j("#phone").css("visibility","visible");
			$j("#ph1").focus();
			ph1="Y";
		
		}else if($j("#ph1").val().trim().length==4){
			$j("#phone").text("4자리입료완료");
			$j("#phone").css("color","skyblue");
			$j("#ph1").css("border-color","black");
			$j("#phone").css("visibility","visible");
				
			ph1="N";
			
		}
	});
	
		
	$j("#ph2").keyup(function(){
		
		if($j("#ph2").val().trim().length<4){
			$j("#phone").text("4자리를 입력하시오");
			$j("#phone").css("color","red");
			$j("#ph2").css("border-color","red");
			$j("#phone").css("visibility","visible");
			
			ph2="Y";
		
		}else if($j("#ph2").val().trim().length==4){
			$j("#phone").text("4자리입료완료");
			$j("#phone").css("color","skyblue");
			$j("#ph2").css("border-color","black");
			$j("#phone").css("visibility","visible");
				
			
			ph2="N";
			
		}
	});
			 
	$j("#ph2").focusout(function(){
 		if($j("#ph2").val().trim().length==4){
				
		 		$j("#phone").css("visibility","hidden");
 			}else{
 	 		
 	 			ph2="Y";	
 	 		}
		});		 
	/* 커서이동 */
 	$j("#ph1").focusout(function(){
 		if($j("#ph1").val().trim().length==4){
				
		 		$j("#phone").css("visibility","hidden");
 		}else{
 			
 			ph1="Y";
 		}
	});		 

	$j("#postno").keyup(function(){
		
		if($j("#postno").val().trim().length==7){
			$j("#postNock").text("6자리가 맞습니다");
			$j("#postNock").css("color","skyblue");
			$j("#postNock").css("visibility","visible");
			
			post="N";
			
		}else if($j("#postno").val().trim().length==0){
			
			$j("#postNock").css("visibility","hidden");
			
			post="N";
			
		}else{
			$j("#postNock").text("6자리를 입력하십시오");
			$j("#postNock").css("color","red");
			$j("#postNock").css("visibility","visible");
			
			post="Y";
	
		}
	});

	/* 커서이동 */
	$j("#postno").focusout(function(){
 		if($j("#postno").val().trim().length==7){
				
		 		$j("#postNock").css("visibility","hidden");
 			}
		});	
	
		
		
		/* 하이폰 (대쉬) 자동붙이기*/
	 var postNb = document.getElementById('postno');
			postNb.onkeyup = function(){
				
			this.value = autoHypenPhone(this.value);
			
			}	
	
	var autoHypenPhone = function(str){
		str =str.replace(/[^0-9]/g, '');
		
		var tmp ="";
		if(str.length < 4){
			return str;
		}
		else if(str.length <7){//총 7자리
			tmp+=str.substr(0,3);//
			tmp+="-";
			tmp += str.substr(3,3);
			return tmp;
		}
			
		return str;
	} 
		
	function join(){
 	 	
		 if(idck == ""|| idck == "Y"){
			alert("아이디 입력을 확인바랍니다");
			$j("#idtext").focus();
			
		}else if(idck2 != "C"|| idck2=="D"){
			alert("중복확인바랍니다.");
			$j("#idckbtn").focus();
			
		}else if(pw1 == ""|| pw1 == "Y"){
			alert("비밀번호 입력을 확인바랍니다.");
			$j("#pwtext").focus();
			
		}else if(pw2 == ""|| pw2 == "Y"){
			alert("비밀번호체크 입력을 확인바랍니다.");
			$j("#pwcktext").focus();
			
		}else if(name == ""|| name == "Y"){
			alert("이름 입력을 확인바랍니다.");
			$j("#nametext").focus();
			
		}else if(ph1 == ""|| ph1 == "Y"){
			alert("전화번호 입력을 확인바랍니다.");
			$j("#ph1").focus();
			
		}else if(ph2 == ""|| ph2 == "Y"){
			alert("전화번호 입력을 확인바랍니다.");
			$j("#ph2").focus();
			
		}else if(post == "Y"){
			alert("우편번호의 형식을 맞춰주시기바랍니다.");
			$j("#postno").focus();
			
		}else{
			
			frm.submit();
		}   
	} 
</script>
</body>
</html>