<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="board.boardBean"%>    
<%@ page import="board.boardPro"%>    
<!DOCTYPE html>

<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./common/style.css">
</head>
<body>
<% String id = (String)session.getAttribute("id");
int number = 0;
number = Integer.parseInt(request.getParameter("number"));
 

boardPro details = boardPro.getInstance();  
boardBean detail = details.boarddetail(number); 
System.out.println(number);

%> 
<jsp:include page="./Topnavbar.jsp" flush="false" />

<form method="post" action="writeUpdatePro.jsp">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Comunity Board</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table" align="center" >
						  <thead class="thead-primary">
						    <tr>
						      <th><center>글 수정하기</center> </th>
						      
						    </tr>
						  </thead>
						  <tbody>
						  <tr>
						  <td>
						  <% if(detail.getSubject()=="100"){%> 
						  <select name="subject">
							           <option value="100">JSP</option>
							           <option value="200">DataBase</option>
							           <option value="300">AI</option>
							       </select>
							<%} else if(detail.getSubject()=="200") {%>
							 <select name="subject">
							           <option value="100">JSP</option>
							           <option value="200">DataBase</option>
							           <option value="300">AI</option>
							       </select>
							      <%} else {%>  
							  <select name="subject">
							           <option value="100">JSP</option>
							           <option value="200">DataBase</option>
							           <option value="300">AI</option>
							       </select>  
							       <% } %>        
						</td>
						  </tr>
						    <tr>
						      <td><input type="text" class="form-control" placeholder="글 제목" name="title" value='<%=detail.getTitle()%>' /></td>  
						    </tr>
						    <tr>
						          <td><input type="text" class="form-control" placeholder="글 내용" name="content" value='<%=detail.getContent()%>' style="height:350px"/>< </td>  
						    
						    </tr>
						  		 <td> <input type = "hidden" name = "number" value='<%=detail.getNumber()%>' /></td> 
						  		  <input type="hidden" name="id" value='<%=detail.getId()%>' />
						  		 <input type = "hidden" name = "date" value='<%=detail.getDate()%>' />
						    <tr> 
						     <td>  <center>  <div class="submit"> 
           				      <input type="submit" value="수정하기"> </div>  </center></td>
						    </tr>
						  </tbody>
						</table>
					</div>
					 
				</div>
				
			</div>
		</div>
	</section>

	
</form> 
	</body>
</html>