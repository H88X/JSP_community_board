
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.memberPro"%>
<%@ page import="java.util.*"%>
<%@ page import="member.memberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">


</head>
<body>
	<%  memberPro member = memberPro.getInstance();
	ArrayList<memberBean> mb = member.getmember();
	String id = (String)session.getAttribute("id");
	
%>

	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="./main.jsp">Developer Comunity</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">Category</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle"
					href="./boardCategory.jsp?subject=100" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> JSP 게시판 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">


						<div class="container">
							<div class="row">
								<div class="col-md-4">
									<span class="text-uppercase text-white">Category 1</span>
									<ul class="nav flex-column">
										<li class="nav-item"><a class="nav-link active"
											href="./boardCategory.jsp?subject=100">JSP 게시판</a>
									</ul>
								</div>
							</div>
						</div>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle"
					href="./boardCategory.jsp?subject=200" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> DataBase 게시판 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">


						<div class="container">
							<div class="row">
								<div class="col-md-4">
									<span class="text-uppercase text-white">Category 2</span>
									<ul class="nav flex-column">
										<li class="nav-item"><a class="nav-link active"
											href="./boardCategory.jsp?subject=200">DataBase 게시판</a></li>

									</ul>
								</div>
							</div>
						</div>
					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle"
					href="./boardCategory.jsp?subject=300" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> AI 게시판 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">




					</div></li>

			</ul>
			<span style="color: white;"><%=id %>님 환영합니다! </span>
			<%    try{
	 		if(session.getAttribute("id")==null){   //로그인을 안했다면%>
			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-outline-light my-2 my-sm-0" type="button"
					onclick="location.href='loginform.jsp' ">로그인</button>
				<button class="btn btn-outline-light my-2 my-sm-0" type="button"
					onclick="location.href='memberInsert.jsp' ">회원가입</button>
			</form>
			<%  }	else{ %>
			<form class="form-inline my-2 my-lg-0">
				<button class="btn btn-outline-light my-2 my-sm-0" type="button"
					onclick="location.href='logout.jsp' ">로그아웃</button>
				<button class="btn btn-outline-light my-2 my-sm-0" type="button"
					onclick="location.href='memberUpdate.jsp?key=<%=id%>' ">회원정보
					변경</button>
				<button class="btn btn-outline-light my-2 my-sm-0" type="button"
					onclick="location.href='memberDelete.jsp?key=<%=id%>' ">회원탈퇴</button>
			</form>
			<%			} 
	 		
 }
 	   catch(NullPointerException e){
 		  e.printStackTrace();
 		}
 %>

		</div>


	</nav>


</body>
</html>