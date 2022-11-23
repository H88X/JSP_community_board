<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="member.memberBean"%>   
 <%@ page import="member.memberPro"%>  

 <% request.setCharacterEncoding("utf-8"); %>   
 
 <jsp:useBean id="member" class="member.memberBean">
     <jsp:setProperty name="member" property="*"/>
 </jsp:useBean>
 
 <%
 	memberPro mp = memberPro.getInstance();  
 	int x = mp.updatemember(member);  //member가 usebean의 id값과 같아야한다
 	 
  
 %>
 <script>
 alert("회원 정보가 변경되었습니다.");
	location.href="./main.jsp";
</script> 
 