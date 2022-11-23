<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<form method="post" action="loginpro.jsp">
    <div class="wrap">
        <div class="login">
            <h2>Log-in</h2>
            <div class="login_id">
                <h4>ID</h4>
                <input type="text" name="id" id="" placeholder="ID">
            </div>
            <div class="login_pw">
                <h4>Password</h4>
                <input type="password" name="passwd" id="" placeholder="Password">
            </div>
            <div class="submit">
                <input type="submit" value="submit">
            </div>
        </div>
    </div>
</form>
</body>
</html>