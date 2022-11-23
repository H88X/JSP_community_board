<%@page import="javax.security.auth.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.boardBean"%>
<%@ page import="board.boardPro"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String id = (String) session.getAttribute("id");

boardPro boardlist = boardPro.getInstance();
%>
<%
int pageNumber = 1;
if (request.getParameter("pageNumber") != null) {
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>


<title>Insert title here</title>
<link rel="stylesheet" href="./common/style.css">

</head>
<body>
	<jsp:include page="./Topnavbar.jsp" flush="false" />

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Developer Comunity Board</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div>
						<table class="table">

							<thead class="thead-primary">
								<tr>
									<th>번호</th>
									<th>주제</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>

								<%
								ArrayList<boardBean> boardpage = boardlist.getboardpage(pageNumber);
								for (int i = 0; i < boardpage.size(); i++) {
									boardBean listpage = boardpage.get(i);
									int number = listpage.getNumber();
									String board_kindName = "";
									String subject = listpage.getSubject();
									if (subject.equals("100"))
										board_kindName = "JSP ";
									else if (subject.equals("200"))
										board_kindName = "DataBase";
									else if (subject.equals("300"))
										board_kindName = "AI";
								%>

								<tr>

									<td><%=listpage.getNumber()%></td>
									<td><%=board_kindName%></td>
									<td><a
										href="writeDetail.jsp?number=<%=listpage.getNumber()%>">
											<%=listpage.getTitle()%>
									</a></td>
									<td><%=listpage.getId()%></td>
									<td><%=listpage.getDate().substring(0, 11) + listpage.getDate().substring(11, 13) + "시"
		+ listpage.getDate().substring(14, 16) + "분"%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>


					<div class=container style="text-align: center">
						<%
						//int number = boardlist.numberCount();
						//System.out.print(number);
						int pages = (int) Math.ceil(boardlist.numberCount() / 10) + 1;
						for (int j = 1; j <= pages; j++) {
						%>
						<button class="btn btn-outline-primary" type="button"
							onclick="location.href='main.jsp?pageNumber=<%=j%>'"><%=j%></button>
						<%
						}
						%>
					</div>


					<div align="right">
						<button class="btn btn-outline-primary" type="button"
							onclick="location.href='write.jsp' ">글작성</button>



					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">JSP Comunity Board</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div>
						<table class="table" >

							<thead class="thead-primary">
								<tr>
									<th>번호</th>
									<th>주제</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>

								<%
								ArrayList<boardBean> jspboard = boardlist.getjspboard();
								for (int i = 0; i < jspboard.size(); i++) {
									boardBean jsp = jspboard.get(i);
									int number = jsp.getNumber();
									String board_kindName = "";
									String subject = jsp.getSubject();
									if (subject.equals("100"))
										board_kindName = "JSP ";
									else if (subject.equals("200"))
										board_kindName = "DataBase";
									else if (subject.equals("300"))
										board_kindName = "AI";
								%>

								<tr>

									<td><%=jsp.getNumber()%></td>
									<td><%=board_kindName%></td>
									<td><a href="writeDetail.jsp?number=<%=jsp.getNumber()%>">
											<%=jsp.getTitle()%>
									</a></td>
									<td><%=jsp.getId()%></td>
									<td><%=jsp.getDate().substring(0, 11) + jsp.getDate().substring(11, 13) + "시" + jsp.getDate().substring(14, 16) + "분"%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
	</section>
<br><br><br>
	<section>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">DataBase Comunity Board</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div>
						<table class="table">

							<thead class="thead-primary">
								<tr>
									<th>번호</th>
									<th>주제</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>

								<%
								ArrayList<boardBean> Databaseboard = boardlist.getdatabaseboard();
								for (int i = 0; i < Databaseboard.size(); i++) {
									boardBean DataBase = Databaseboard.get(i);
									int number = DataBase.getNumber();
									String board_kindName = "";
									String subject = DataBase.getSubject();
									if (subject.equals("100"))
										board_kindName = "JSP ";
									else if (subject.equals("200"))
										board_kindName = "DataBase";
									else if (subject.equals("300"))
										board_kindName = "AI";
								%>

								<tr>

									<td><%=DataBase.getNumber()%></td>
									<td><%=board_kindName%></td>
									<td><a
										href="writeDetail.jsp?number=<%=DataBase.getNumber()%>">
											<%=DataBase.getTitle()%>
									</a></td>
									<td><%=DataBase.getId()%></td>
									<td><%=DataBase.getDate().substring(0, 11) + DataBase.getDate().substring(11, 13) + "시"
		+ DataBase.getDate().substring(14, 16) + "분"%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
	</section>
<br><br><br>
	<section>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">AI Comunity Board</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div>
						<table class="table">

							<thead class="thead-primary">
								<tr>
									<th>번호</th>
									<th>주제</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>

								<%
								ArrayList<boardBean> AIboard = boardlist.getaiboard();
								for (int i = 0; i < AIboard.size(); i++) {
									boardBean AI = AIboard.get(i);
									int number = AI.getNumber();
									String board_kindName = "";
									String subject = AI.getSubject();
									if (subject.equals("100"))
										board_kindName = "JSP ";
									else if (subject.equals("200"))
										board_kindName = "DataBase";
									else if (subject.equals("300"))
										board_kindName = "AI";
								%>

								<tr>

									<td><%=AI.getNumber()%></td>
									<td><%=board_kindName%></td>
									<td><a href="writeDetail.jsp?number=<%=AI.getNumber()%>">
											<%=AI.getTitle()%>
									</a></td>
									<td><%=AI.getId()%></td>
									<td><%=AI.getDate().substring(0, 11) + AI.getDate().substring(11, 13) + "시" + AI.getDate().substring(14, 16) + "분"%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
	</section>

<br><br><br>

</body>
</html>