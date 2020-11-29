<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

	$j(document).ready(function(){
		
		$j("#submit").on("click",function(){
			var $frm = $j('.pinkModify :input'); //:input 전체를 지칭한다 입력태그
			var param = $frm.serialize();
			
			$j.ajax({
			    url : "/pinkmovie/${idx}/pinkModify.do",
			    dataType: "json", //리턴형식이라 생각하면된다
			    type: "POST",
			    data : param,
			    success: function(data, textStatus, jqXHR)
			    				//데이터에서 보내준값 , 성공여부, 호출한헤더값
			    {
					alert("수정완료");
					
					alert("메세지:"+data.success);
							/* ?pageNo= */
					location.href = "/pinkmovie/pinkGoBoard.do"; /*여기에 페이지가 있었다  */
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    
			    {
			    	
			    	alert("실패");
			    }
			});
		});
	});
	
</script>



<form class="pinkModify">
	<table align="center">
		<tr>
			<td align="right">
				<input id="submit" type="button" value="수정">
			</td>
		</tr>
		<tr>
			<td>
				<table border ="1"> 
					<tr>
						<td width="120" align="center">
						Title
						</td>
						<td width="400">
						<input name="boardTitle" type="text" size="50" value="${idx}"> 
						</td>
					</tr>
					<tr>
						<td height="300" align="center">
						Comment
						</td>
						<td valign="top">
						<textarea name="boardComment"  rows="20" cols="55" >${comment}</textarea>
						</td>
					</tr>
					<tr>
						<td align="center">
						Writer
						</td>
						<td>
						${id}
						
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/pinkmovie/pinkGoBoard.do">List</a>
			</td>
		</tr>
		
	</table>
</form>	
</body>
</html>