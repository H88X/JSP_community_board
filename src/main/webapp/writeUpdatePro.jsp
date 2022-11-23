<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.boardBean"%>    
<%@ page import="board.boardPro"%>   
<% request.setCharacterEncoding("utf-8"); %>   
 
 <jsp:useBean id="board" class="board.boardBean">
     <jsp:setProperty name="board" property="*"/>
 </jsp:useBean>
 
 <%
 	boardPro bp = boardPro.getInstance();  
 	int x = bp.writeupdate(board);  //member가 usebean의 id값과 같아야한다 , usebean id:board와 () 일치
 	
 	
 	 
   
 %>
 <script>
 alert("글이 수정 되었습니다.");
	location.href="./main.jsp";
</script> 