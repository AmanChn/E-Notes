<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid color-register">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center purple">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h2>Register</h2>
					</div>
					
					<%
						String regMsg = (String)session.getAttribute("reg-success");
						if (regMsg != null) {
					%>
						<div class="alert alert-success" role="alert"><%= regMsg %> For Login  <a href="login.jsp">Click Here</a></div>
					<%
						session.removeAttribute("reg-success");
					}
					%>
					
					<%
						String failedMsg = (String) session.getAttribute("failed-msg");
						if (failedMsg != null) {
					%>
						<div class="alert alert-danger" role="alert"><%= failedMsg %></div>
					<%
						session.removeAttribute("failed-msg");
					}
					%>


					<div class="card-body mt-3">
						<form action="<%=request.getContextPath()%>/register"
							method="post">
							<!-- <form action="UserController" method="post"> -->
							<div class="form-group">
								<label>Enter Full Name</label> <input type="text"
									class="form-control" name="fullName" id="fullName"
									aria-describedby="emailHelp" placeholder="Full Name" required>
							</div>


							<div class="form-group">
								<label>Enter Email Address</label> <input type="email"
									class="form-control" name="email" id="email"
									aria-describedby="emailHelp" placeholder="Email" required>
							</div>

							<div class="form-group">
								<label>Enter Password</label> <input type="password"
									class="form-control" name="password" id="password"
									placeholder="Password" required>
							</div>

							<div class="container text-center">

								<button type="submit" class="btn btn-primary">Register</button>
							</div>
						</form>
					</div>

				</div>

			</div>

		</div>
	</div>
<%@include file="footer.jsp"%>
</body>
</html>