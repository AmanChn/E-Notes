<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<div class="container-fluid color-login">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5">
					<div class="card-header text-center purple">
						<i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
							<h2>Login</h2>
					</div>
					
					<%
						String invalidMsg = (String) session.getAttribute("login-failed");
						if (invalidMsg != null) {
					%>
						<div class="alert alert-danger" role="alert"><%= invalidMsg %></div>
					<%
						session.removeAttribute("login-failed");
					}
					%>
					
					<%
						String withoutLogin = (String) session.getAttribute("login-error");
						if (withoutLogin != null) {
					%>
						<div class="alert alert-danger" role="alert"><%= withoutLogin %></div>
					<%
						session.removeAttribute("login-error");
					}
					%>
					
					<%
						String lgMsg = (String) session.getAttribute("logoutMSg");
						if (lgMsg != null) {
					%>
						<div class="alert alert-success" role="alert"><%= lgMsg %></div>
					<%
						session.removeAttribute("logoutMSg");
					}
					%>
					
					
					<div class="card-body mt-3">
					<form action="<%=request.getContextPath()%>/login" method="post">
						<div class="form-group">
							<label>Enter Email Address</label> <input type="email" 
								class="form-control" name="email" id="email"
								aria-describedby="emailHelp" placeholder="Email" required>
						</div>

						<div class="form-group">
							<label>Enter Password</label> <input type="password"
								class="form-control" name="password" id="passowrd"
								placeholder="Password" required>
						</div>

						<div class="container text-center">

							<button type="submit" class="btn btn-primary">Login</button>
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