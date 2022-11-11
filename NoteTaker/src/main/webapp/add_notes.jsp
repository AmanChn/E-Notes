<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%
		User user1 = (User)session.getAttribute("userDetails");
		if( user1 == null ){
			response.sendRedirect("login.jsp");
			session.setAttribute("login-error" , "Please Login First !!");
		}
	%>
	

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body style="margin: 0px" >
	<%@include file="navbar.jsp"%>
	<div class="container ">
		
		<br>

		<h1 class="text-center mt-5">Please Fill Your Note Detail</h1>
		<br>

		<!-- this is add form  -->

		<form action="SaveNoteServlet" method="post">

			<div class="form-group">
			
			<%
				User us = (User)session.getAttribute("userDetails");
				if( us != null ){
			%>
				<input name="uid" type="hidden" value=<%= us.getId() %> id="uid" />
			<%
				}
			%>
			
				<label for="title" id="note_title"><b>Note title</b></label> 
				<input 
				name="title"
				required 
				type="text"
				class="form-control" 
				id="title" 
				aria-describedby="emailHelp"
				placeholder="Enter here" />

			</div>


			<div class="form-group">
				<label for="content"><b>Note Content</b></label>
				<textarea 
				name="content"
				required 
				id="content"
				placeholder="Enter your content here"				 
				class="form-control" 
				style="height: 300px;"		
					></textarea>

		
			</div>

			<div class="container text-center">

				<button type="submit" class="btn btn-primary mb-5">Add</button>
			</div>

		</form>

	</div>

<%@include file="footer.jsp"%>
</body>
</html>