<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="board.boardBean"%>    
<%@ page import="board.boardPro"%>
 <%@ page import="comment.commentBean"%>    
<%@ page import="comment.commentPro"%>
 <%@ page import= "java.util.*" %>    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<% String id = (String)session.getAttribute("id");
int number = 0;
number = Integer.parseInt(request.getParameter("number"));
 
boardPro details = boardPro.getInstance();  
boardBean detail = details.boarddetail(number); 

commentPro comment = commentPro.getInstance();


%> 
  <% if(session.getAttribute("id") !=null){ %>
<title>Insert title here</title>
<link rel="stylesheet" href="./common/style.css">
</head>
<body>
<jsp:include page="./Topnavbar.jsp" flush="false" />

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Comunity Board</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div >
						<table class="table" align="center" >
						  <thead class="thead-primary">
						    <tr>
						      <th><center>글 내용</center> </th>
						      
						    </tr>
						  </thead>
						  <tbody>
						  <tr>
						 
						  </tr>
						    <tr>
						      <td  height="60" ><%=detail.getTitle() %> </td>  
						    </tr>
						    <tr > 
						      <td height="200"> <%=detail.getContent() %> </td>  
						    
						    
						    </tr>
						    <tr>
						  		 
						    </tr>
						  </tbody>
					
						</table>
						
						<div class="container"> 
							<div class="form-group">
								<form method="post"  action="commentWrite.jsp?id=<%= id %>&number=<%=number%>">
									<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd "> 
										<tr>
											<td style="border-bottom:none;" valign="middle"><br><br><%= id	 %></td> 
											<td><input type="text" style="height:100px;" class="form-control" placeholder="댓글 작성" name ="comment_content"></td>
											<input type="hidden"  class="form-control" name ="user_id" value='<%=id%>'>
											<td><br><br><input type="submit" class="btn-primary pull" value="댓글 작성"></td>  
										</tr> 
										
									</table>
								</form>
							</div> 
						</div>
						
					</div>
					
					
					<div class="container">
						<div class="row">
							<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
								<tbody>
									<tr>
										<td align="left" bgcolor="white"  >댓글</td>    
									</tr>
									<tr>
									<%
									    ArrayList<commentBean> cp = comment.getcomment_array(number);
										for(int i=0;i<cp.size();i++){
										commentBean list =cp.get(i);  
										
									%>
											<div class="container">		
												<div class="row">
													<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
														<tbody>
															<tr>	 					
																<td align="left"><%= list.getUser_id() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.getComment_date().substring(0,11) + list.getComment_date().substring(11,13) + "시" + list.getComment_date().substring(14,16) + "분" %></td>		
																<td colspan="2"></td>
																<td align="right">  
																   
																	<%
																	 if(list.getUser_id() != null && list.getUser_id().equals(id)){   //댓글 쓴사람과 지금 유저가 같을 때 수정과 삭제를 가능하게 함
																	%> 
																		 <button class="btn btn-outline-primary" type="button"
																				  onclick="location.href='commentUpdate.jsp?comment_number=<%=list.getComment_number()%>&number=<%=list.getNumber()%>' ">댓글수정</button>
																			<button class="btn btn-outline-primary" type="button"
																			  onclick="location.href='commentDelete.jsp?comment_number=<%=list.getComment_number()%>' ">댓글삭제</button>																	
																	<%
																	}   
																	%> 
																	
																</td>
																
															</tr>
															<tr>
															<td align="left"> <%=list.getComment_content() %> </td>
															</tr>
															<%
															} 
															%>
														</tbody>
													</table>			
												</div>
											</div>
											
									</tr>
							</table>
						</div>
				</div>
				
					
					 <% if(id.equals(detail.getId()) ){ %>
						 <button class="btn btn-outline-primary" type="button"
								  onclick="location.href='writeUpdate.jsp?number=<%=number%>' ">글수정</button>
						<button class="btn btn-outline-primary" type="button"
								  onclick="location.href='writeDelete.jsp?number=<%=number%>' ">글삭제</button>
						<%} %>
						<div align="right">
						 <button class="btn btn-outline-primary" type="button"
								  onclick="location.href='main.jsp' ">글목록</button>
					</div>
				</div>
			</div>
		</div>
	</section>

 
	<%} else{ %>
			<script>
			 alert("로그인이 필요한 서비스입니다");
			 location.href="./main.jsp";
			</script>  
<%} %>
	</body>
</html>