<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="board.boardBean"%>    
<%@ page import="board.boardPro"%>   

<%
 int number = 0;
 number = Integer.parseInt(request.getParameter("number"));
 boardPro delete = boardPro.getInstance(); 
	delete.deleteboard(number);
	   
%>
	 
<script>
 alert("게시글이 삭제되었습니다.");
	location.href="./main.jsp";
</script>  