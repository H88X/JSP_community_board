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
<jsp:include page="./Topnavbar.jsp" flush="false" />

<form method="post" action="writepro.jsp">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Comunity Board</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					
						<table class="table" align="center" >
						  <thead class="thead-primary">
						    <tr>
						      <th><center>글 작성하기</center> </th>
						      
						    </tr>
						  </thead>
						  <tbody>
						  <tr>
						  <td> <select name="subject">
							           <option value="100">JSP</option>
							           <option value="200">DataBase</option>
							           <option value="300">AI</option>
							       </select></td>
						  </tr>
						    <tr>
						      <td><input type="text" class="form-control" placeholder="글 제목" name="title"> </td>  
						    </tr>
						    <tr>
						       <td><textarea type="text" class="form-control" placeholder="글 내용" name="content" style="height:350px"></textarea> </td>  
						    
						    </tr>
						    <tr>
						     <td>  <center>  <div class="submit">
           				     <input type="submit" value="저장하기"> </div>  </center></td>
						    </tr>
						  </tbody>
						</table>
					</div>
					 
				</div>
				
			</div>
		
	</section>

	
</form>
	</body>
</html>