<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.lqt.pojo.enumm.Role" %>

<html>
<head>
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <f:form method="POST" action="/app/auth/register" modelAttribute="user">
        <div class="row">
            <div class="col-8 my-5 mx-auto shadow p-4">
                <h3 class="my-4">Create an Account</h3>
                <div class="mb-3">
                    <label for="firstName" class="form-label">First Name</label>
                    <f:input class="form-control" path="firstName"/>
                </div>
                <div class="mb-3">
                    <label for="lastName" class="form-label">Last Name</label>
                    <f:input class="form-control" path="lastName"/>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <f:input class="form-control" path="username"/>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <f:input type="password" class="form-control" path="password"/>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <f:input type="email" class="form-control" path="email"/>
                </div>
                <div class="mb-3">
                    <label for="phoneNumber" class="form-label">Phone Number</label>
                    <f:input class="form-control" path="phoneNumber"/>
                </div>
                <div class="mb-3">
                    <label for="role" class="form-label">Role</label>
                    <f:select path="role" class="form-control">
                        <c:forEach var="role" items="${Role.values()}">
                            <option value="${role}">${role}</option>
                        </c:forEach>
                    </f:select>
                </div>
                <div class="d-grid gap-2 mb-3">
                    <button class="btn btn-primary" type="submit">Register</button>
                    <a href="/app/admin/users" class="btn btn-outline-dark" type="submit">Cancel</a>
                </div>
            </div>
        </div>
    </f:form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
