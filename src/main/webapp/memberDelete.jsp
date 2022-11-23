<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="member.memberBean"%>   
 <%@ page import="member.memberPro"%>
 
 
<%
	String id = request.getParameter("key");   
	memberPro delete = memberPro.getInstance(); 
 	delete.deletemember(id);
 	session.invalidate(); 
%>
	 
<script>
    alert("회원탈퇴 되었습니다.");
	location.href="./main.jsp";
</script>

	 	 
 