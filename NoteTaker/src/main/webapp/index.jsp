<%
		User user4 = (User)session.getAttribute("userDetails");
		if( user4 != null ){
			response.sendRedirect("home.jsp");
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
	
		<div class="text-center">		
		<h1 class="text-black"><i class="fa fa-book" aria-hidden="true"></i>E-Notes : Save Your Notes</h1>
		<a href="login.jsp" class="btn btn-light text-center"><i class="fa fa-user-circle-o mr-1" aria-hidden="true">
			</i>Login</a>
		<a href="register.jsp" class="btn btn-light text-center"><i class="fa fa-user-plus mr-1" aria-hidden="true">
			</i>Register</a>
		
		</div>

	</div>



<%@include file="footer.jsp"%>
</body>
</html>