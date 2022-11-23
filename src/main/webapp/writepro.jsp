<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%@ page import="board.boardBean"%>    
<%@ page import="board.boardPro"%>     

<% request.setCharacterEncoding("utf-8");		//member 페이지 import
%>

 <jsp:useBean id="board" class="board.boardBean">
     <jsp:setProperty name="board" property="*"/>
 </jsp:useBean>
 
 <%
 	String id = null;
	if((String)session.getAttribute("id") != null){ 
		id = (String)session.getAttribute("id");
		
		boardPro bp = boardPro.getInstance();
	 	bp.write(board,id);
	 	%>
	 	<script>
	    alert("글이 저장되었습니다.");
		location.href="./main.jsp";
		</script><% 
	  
	}else{%>
		<script>
	    alert("로그인을 해야 사용가능합니다.");
		location.href="./main.jsp";
		</script>
	<%} 
 	
 
 %>