<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="board.*"%>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Category 게시판</title>
</head>
<link rel="stylesheet" href="./common/style.css">
<body>
<%
  String subject = request.getParameter("subject");
%>

<%
 	List<boardBean> boardLists = null;
	boardBean boardList = null;
 	String board_kindName="";
  
 	boardPro boardProo = boardPro.getInstance();
 	boardLists = boardProo.getcategory(subject);
	 if(subject.equals("100"))
		 board_kindName="JSP "; 
	 else if(subject.equals("200")) 
		 board_kindName="DataBase";  
	 else if(subject.equals("300"))
		 board_kindName="AI";
	  
%>  

   
  <jsp:include page="./Topnavbar.jsp" flush="false" />

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section"><%=board_kindName %> Board</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div>
						<table class="table">
						
						  <thead class="thead-primary">
						    <tr>
						      <th>번호</th>
						      <th>제목</th>
						      <th>작성자</th>
						      <th>작성일</th>
						    </tr>
						  </thead>
						  <tbody>
						<%
							for(int i=0;i<boardLists.size();i++){
						    	boardList = (boardBean)boardLists.get(i);	
						%>
						    <tr> 
						    
						      <td> <%=boardList.getNumber() %></td> 
						      <td><a href="writeDetail.jsp?number=<%=boardList.getNumber() %>">
						      		<%=boardList.getTitle()%> </a></td> 
						      <td><%=boardList.getId() %></td>
						      <td><%=boardList.getDate() %></td> 
						    </tr>
						    <% }%>  
						  </tbody> 
						</table>
					</div>
					<div align="right">
					 <button  class="btn btn-outline-primary" type="button"
					  onclick="location.href='write.jsp' ">글작성</button>
					  </div>
				</div>
			</div>
		</div>
	</section>
  


</body>
</html>