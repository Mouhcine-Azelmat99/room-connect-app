<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="en">
<head>
	<title>Login page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
		  rel="stylesheet"
		  integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
		  crossorigin="anonymous">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<section class="ftco-section">
	<div class="container">
		<div class="row justify-content-center shadow-lg p-1 m-3 bg-white rounded">
			<div class="col-md-7 col-lg-5">
				<div class="login-wrap p-4 p-md-5">
					<div class="icon d-flex align-items-center justify-content-center">
						<span class="fa fa-user-o"></span>
					</div>
					<h3 class="text-center mb-4">Sign In</h3>
					<form class="login-form" method="POST">

						<c:if test="${param.error != null}">
							<div class="alert alert-danger col-12">
								<c:choose>
									<c:when test="${param.error == 'disabled'}">Account Disabled</c:when>
									<c:when test="${param.error == 'locked'}">Account Locked</c:when>
									<c:when test="${param.error == 'expired'}">Account Expired</c:when>
									<c:otherwise>Please verify your login or password</c:otherwise>
								</c:choose>
							</div>
						</c:if>

						<c:if test="${param.logout != null}">
							<div class="alert alert-success col-12">You are logged out of the system</div>
						</c:if>

						<div class="form-group">
							<input name="username" type="text"
								   class="form-control rounded-left" placeholder="Username"
								   required>
						</div>
						<div class="form-group d-flex my-3">
							<input name="password" type="password"
								   class="form-control rounded-left" placeholder="Password"
								   required>
						</div>
						<div class="form-group my-3">
							<button type="submit"
									class="form-control btn btn-primary rounded submit px-3">Login
							</button>
						</div>
						<div class="form-group d-md-flex my-3">
							<div class="w-50">
								<label class="checkbox-wrap checkbox-primary">Remember Me
									<input type="checkbox" checked>
									<span class="checkmark"></span>
								</label>
							</div>
							<div class="w-50 text-md-right">
								<a href="#">Forgot Password</a>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</section>

<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
