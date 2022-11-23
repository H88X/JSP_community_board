<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="comment.commentBean"%>    
<%@ page import="comment.commentPro"%>   

<%
 int comment_number = 0;
comment_number = Integer.parseInt(request.getParameter("comment_number"));
commentPro delete = commentPro.getInstance();  
delete.commentdelete(comment_number);
	   
%>
	 
<script>
 alert("댓글이 삭제되었습니다.");
 	history.go(-1);
</script>  