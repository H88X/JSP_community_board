<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%@ page import="comment.commentBean"%>    
<%@ page import="comment.commentPro"%>     

<% request.setCharacterEncoding("utf-8");		//member 페이지 import
%>

 <jsp:useBean id="comment" class="comment.commentBean">
     <jsp:setProperty name="comment" property="*"/>
 </jsp:useBean>
 
 <%
 	int number = 0;
 	number = Integer.parseInt(request.getParameter("number"));
 	
 	String user_id = null;
	if((String)session.getAttribute("id") != null){ 
		user_id = (String)session.getAttribute("id");
		
		commentPro cp = commentPro.getInstance();
		cp.commentwrite(comment, number);
	 	%> 
	 	<script>
	    alert("댓글이 저장되었습니다.");
	   		 history.go(-1);
		</script><% 
	  
		 
	}else{%>
		<script>
	    alert("로그인을 해야 사용가능합니다.");
		location.href="./main.jsp";
		</script>
	<%} 
 	
 
 %>