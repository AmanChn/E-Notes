<%
		User user2 = (User)session.getAttribute("userDetails");
		if( user2 == null ){
			response.sendRedirect("login.jsp");
			session.setAttribute("login-error" , "Please Login First !!");
		}
	%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<style type="text/css">
.backimg{
	background-image: url("img/notes-bg.png");
	width: 100%;
	height: 100vh;
	opacity:0.8;
	background-repeat: no-repeat;
	background-size: cover;
	color: #000000;
	font-size: 50px;
} 

</style>


<title>Note Taker : Home page</title>
<%@include file="all_js_css.jsp"%>

</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid backimg">
		<br>
		
		<div class="card  shadow bg-white py-5">
			<img alt="" class="img-fluid mx-auto" style="max-width: 400px;"
				src="img/notepad.png">
			<h1 class="text-primary text-uppercase text-center mt-3">Start
				Taking your notes</h1>

			<div class="container text-center">
				<a href="add_notes.jsp" class="btn btn-outline-primary text-center">Start
					here</a>
			</div>

		</div>

	</div>
<%@include file="footer.jsp"%>



</body>
</html>