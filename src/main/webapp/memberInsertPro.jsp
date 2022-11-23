<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*" %>
<%@ page import="member.memberPro"%>   

<% request.setCharacterEncoding("utf-8");		//member 페이지 import
%>

 <jsp:useBean id="member" class="member.memberBean">
     <jsp:setProperty name="member" property="*"/>
 </jsp:useBean>
<% 
 	memberPro logon = memberPro.getInstance();  //memberPro에서 가져와서 logon변수에 insert한다
  	logon.insertMember(member); 				//insert는 bean의 member
%>

<script>
    alert("회원가입 되었습니다.");
	location.href="./main.jsp";
</script>
 