<%
		User user3 = (User)session.getAttribute("userDetails");
		if( user3 == null ){
			response.sendRedirect("login.jsp");
			session.setAttribute("login-error" , "Please Login First !!");
		}
	%>


<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes: Note Taker</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>
	
	<%
		String addMsg = (String) session.getAttribute("addMsg");
		if (addMsg != null) {
	%>
		<div class="alert alert-success" role="alert"><%= addMsg %></div>
	<%
		session.removeAttribute("addMsg");
		}
	%>
	
	<%
		String updateMsg = (String) session.getAttribute("updateMsg");
		if (updateMsg != null) {
	%>
		<div class="alert alert-success" role="alert"><%= updateMsg %></div>
	<%
		session.removeAttribute("updateMsg");
		}
	%>
	
	<%
		String deleteMsg = (String) session.getAttribute("deleteMsg");
		if (deleteMsg != null) {
	%>
		<div class="alert alert-success" role="alert"><%= deleteMsg %></div>
	<%
		session.removeAttribute("deleteMsg");
		}
	%>

	<div class="container">
		
		<br>
		<h1 class="text-uppercase text-center mt-5">All Notes</h1>


		<div class="row">

			<div class="col-12 mb-5">

				<%
				if( user3 != null ){
				
				Session s = FactoryProvider.getFactory().openSession();
				int u_id = user3.getId();
				Query q = s.createQuery("FROM Note N WHERE N.uid = :u_id").setParameter("u_id",u_id);

				List<Note> list = q.list();
				for (Note note : list) {
				%>

				<div class="card mt-5" >
					<img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="img/notepad.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><b><%= note.getTitle() %></b></h5>
						<p class="card-text">
						<%= note.getContent() %>
						</p>
						<p ><b class="text-info">Published By: <%= user3.getFullName()  %></b></p>
						<p ><b class="text-info">Published Date: <%= note.getAddedDate()  %></b></p>
						<div class="container text-center mt-2">
						<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger mb-3">Delete</a>
						<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary mb-3">Update</a>
						</div>
					</div>
				</div>

				<%
					}

				s.close();
				}
				%>


			</div>

		</div>


	</div>
<%@include file="footer.jsp"%>
</body>
</html>