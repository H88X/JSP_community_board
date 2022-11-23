<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.memberPro"%> 
    <%@ page import="member.memberBean"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./common/login.css">
</head>
<body>
<jsp:include page="./Topnavbar.jsp" flush="false" />


<%
	String id = request.getParameter("key");
	memberPro update = memberPro.getInstance(); 
	memberBean mb = update.updateGetmember(id);
	System.out.println(id);
%>

<form method="post" action="memberUpdatePro.jsp">
    <div class="wrap">
        <div class="login">
            <h2>회원가입</h2>
            <div class="login_id">
                <h4>ID</h4>
                <input type="text" name="id" id="" placeholder="ID" value='<%=mb.getId()%>' readonly>
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="passwd" id="" placeholder="Password" value='<%=mb.getPasswd()%>'>
            </div>
            <div class="login_id">
                <h4>Name</h4>
                <input type="text" name="name" id="" placeholder="Name" value='<%=mb.getName()%>'>
            </div>
            <div class="login_id">
                <h4>Email</h4>
                <input type="text" name="email" id="" placeholder="Email" value='<%=mb.getEmail()%>'>
            </div>
            <div class="login_id">
                <h4>Nickname</h4>
                <input type="text" name="nickname" id="" placeholder="Nickname" value='<%=mb.getNickname()%>'>
            </div>
            <div class="submit">
                <input type="submit" value="submit">
              
            </div>
        </div>
    </div>
</form>
</body>
</html>