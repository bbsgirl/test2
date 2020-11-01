<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
	
		#re1{
		
			visibility: hidden;
		
		}
	</style>

</head>
<body>



<input type="text" name="idx" value="${re.idx}"readonly >
<input type="text" name="id" value="${re.id}" readonly>
<input type="text" name="gender" value="${re.gender}"readonly >
<br><br>
<input type="text" name="content" value="${re.content}"readonly >
<br>
<form>
	<table>
		<tr>
			<td><textarea cols="50" rows="10"></textarea></td>
		</tr>
		<tr>
			<td id="re1" colspan="2">1</td>
		</tr>
		<tr>
			<td><input type="button" id="retext" value="댓글" onclick="re()" ></td>
		</tr>
	</table>
</form>

<script>
	jQuery(document).ready(function() {
	    if(${id== null}) {
	        alert("게시판을 이용하시려면 로그인하셔야 합니다.");
	        location.href="main";
	    }
	});

	function re(){
		

		}

</script>




</body>
</html>