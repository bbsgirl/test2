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


</script>
<form action="/pinkmovie/pinkWriteAction.do">
	<table id="totaltb" align="center">
		
		<tr>
			<td>
				<table border ="1" id="tb">
					
					<tr id="tabledelete">
						<td align="center" id="writer">
						Writer
						</td>
						<td>
						${id}
						 <input type="hidden" name="sessionId" value="${id}">
						</td>
					</tr>
					<tr id="tb0">
						<td height="300" align="center" id="comment">
						Comment
						</td>
						<td valign="top">
						<textarea name="Comment" rows="20" cols="55" ></textarea>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href="/pinkmovie/boardList.do">List</a>
			</td>
			<td align="right">
				<input type="submit"  value="작성">
			</td>
		</tr>
		
		
	</table>
</form>	
</body>
</html>