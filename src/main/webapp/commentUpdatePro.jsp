<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page import="comment.commentBean"%>    
<%@ page import="comment.commentPro"%>   
<% request.setCharacterEncoding("utf-8"); %>   
 
 <jsp:useBean id="comment" class="comment.commentBean">
     <jsp:setProperty name="comment" property="*"/>
 </jsp:useBean>
 
 <%
 	commentPro cp = commentPro.getInstance();  
 	int x = cp.commentupdate(comment);
 	
 	
 	 
    
 %>
<script>
 alert("댓글이 수정되었습니다.");
 	history.go(-2);
</script>   