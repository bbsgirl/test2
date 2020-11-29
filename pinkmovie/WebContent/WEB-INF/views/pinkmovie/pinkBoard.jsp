<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>요청영상</title>
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style>
	
		 * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
		.wrap{
			
            position: relative;
            display: flex;
            flex-flow: column;
		}
		
		
		#tr1{
			
			background-color:rgba(128,128,128,0.5);
			height:80px;
			
			
		
		}
	
		
		table{
			margin: 30px auto;
			width:1300px;
			/* border:1px solid #444444; */
			border-collapse:collapse;
			text-align: center;
		
			
		}
		 td {
		 border-bottom: 1px solid #444444;
		 padding:10px;
		 
		  }
		
		.page1{
		
			width:100%;
			height:30vh;
			background-color: black;
			position:relative;
			overflow: hidden;
			
		
		}
		
		.page2{
			
			
			height:70vh;
			width: 100%;
			background-color: pink;
			position: relative;
		
		}
		.a{
			font-size:25px;
			font-weight: bolder;
		
		
		}
		
		.b{
			height:45px;
			
		
		}
	
		#grim{
			width:120%;
			height:99vh;
			top:-100px;
			position: absolute;
		
		}
		.silmang{
			text-align:center;
			top:300px;
			left:600px;
			width:600px;
			margin: 0 auto;
		}
		
		
		   .title1 {
            width: 99.9%;
            height: 100px;
            position: fixed;
            display: flex;
            flex-flow: row wrap;
            background-color: black;
            z-index: 1;
            top:0;
            left: 0;
            opacity: 0.5;

        }
         .titles1 {

            width: 100px;
            height: 100px;

        }

        .login {
            width: 120px;
            height: 50px;
            text-align: center;
            padding-top: 30px;
            color: aliceblue;
            border-radius: 30px;
            cursor: pointer;
            font-weight: lighter;
            position: absolute;
            left:90%;

        }	
        
        
        a{
        	text-decoration: none;
        	color:black;
        }
    
        .rcbox{
            width: 490px;
            height: 450px;
            left: 36%;/*min 50% 잊지말기*/
            top: 30%;
            padding-top: 20px;
            border: 1px solid red;
            display: none; 
            position: fixed;
            background-color: black;
            z-index: 100;
            border-radius: 10%;
            
        }
      
              #reppass2{
            left: 40px;
            position: absolute;
            width: 405px;
            height: 200px;
            top:50px;
        }
        
         #reidenter{
            position: absolute;
            width: 80px;
            height: 40px;
            top: 300px;
            left: 60px;
            
        }
        
            #reidcencel{
            position: absolute;
             width: 80px;
            height: 40px;
            top: 300px;
            left: 300px;
        }
        .comment{
        	width: 250px;
        	height: 40px;
        }
        #submit{
        	width: 100px;
        	height: 39px;
        }
       
	</style>
</head>
<body>

           <div class="title1">
	               
                         <div class="titles1">
                                <div class="login">
                                    <div id="logout" onclick="logout()">로그아웃</div>
                               </div>
                         </div>
          </div>
 
<div class="wrap">
			<div class = "page1">
			
					<img src="/resources/img/av.jpg" id="grim">
			
			</div>
			
			<div class = "page2">
						
					
						<div class="table">
						<form class="pinkWrite">		
						<table>
									<tr>
										<td colspan="7" id="title" ><input type="hidden" name="sessionId" value="${id}">요청영상<input type="text" name="Comment" class="comment"><input  type="button" id="submit" value="요청"></td>
										
									</tr>
									<tr>
										<td><a href="/board/${id}/pinkGoSe.do">MovieList</a></td>
										
										<td >Total : ${totalCnt }</td>
									</tr>
									<tr id="tr1">
										<td class="a">번호</td>
										<td class="a">아 이 디</td>
										<td class="a">요 청 영 상</td>
										<td class="a">날 짜</td>
										<td class="a">삭제</td>
										<td class="a">수정</td>
										<td class="a"></td>
									</tr>
									<c:forEach var ="pink" items="${pinkList}">
									<tr>
										<td>${pink.boardIdx}</td>
										<td>${pink.boardId}</td>
										<td>${pink.boardComment}</td>
										<td>${pink.boardTime}</td>
										<td><a href="/pinkmovie/pinkDelete.do?delete=${pink.boardIdx}&boardId=${pink.boardId}&sessionId=${id}">delete</a></td>
										<td><a href="/pinkmovie/pinkGoModify.do?boardIdx=${pink.boardIdx}&boardId=${pink.boardId}&boardComment=${pink.boardComment}&sessionId=${id}">modify</a></td>
										<td></td>
									</tr>	
									</c:forEach>
									<tr>
										<td>
											<c:forEach var="i" begin="1" end="${pageCount}" step="1">
												<c:choose >
													<c:when test ="${i eq pageNo }">
														[${i}]
													</c:when>
													
													<c:otherwise>
														<a href="/pinkmovie/pinkGoBoard.do?pageNo=${i}">[${i}]</a>
													</c:otherwise>						
												</c:choose>
												
											</c:forEach>
										</td>
									</tr>
										
						</table>
						</form>
							<div class="silmang">	
							</div>
								
					   </div>
			</div>
</div>
			
<script>
					function logout(){
						
						location.href="/pinkmovie/pinkLogOut.do";
					}
			        	
										
				$(document).ready(function(){	
					$(".home").click(function(){
			        	   $(".rcbox").slideDown();
			           
			             
			          });
			          
			          $("#reidcencel").click(function(){
			        	  $(".rcbox").stop().slideUp();
			            
					});
			          
				});

				$j(document).ready(function(){
					
					$j("#submit").on("click",function(){
						var $frm = $j('.pinkWrite :input'); //:input 전체를 지칭한다 입력태그
						var param = $frm.serialize();//serialize는 폼의 객체를 한번에 받을수가 있다.
						
						$j.ajax({
						    url : "/pinkmovie/pinkWriteAction.do",// 보내는곳
						    dataType: "json", //리턴형식이라 생각하면된다 주고 받을 수 있는 자료형은 숫자, 문자열, boolean, 배열, 객체이며   기본 데이터 배열은 KEY와 VALUE로 구성되어 있으며 중괄호로 감싼다.

						    type: "POST",
						    data : param,
						    success: function(data, textStatus, jqXHR)
						    				//데이터에서 보내준값 , 성공여부, 호출한헤더값
						    {
								alert("작성완료");
								
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
</body>
</html>