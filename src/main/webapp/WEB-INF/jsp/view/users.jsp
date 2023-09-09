<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container my-5">

    <jsp:include page="./layout/menu.jsp" />
    <div class="d-flex justify-content-end">
        <a href="/app/admin/register" class="btn btn-primary">Ajouter un compte</a>
    </div>
    <c:if test="${not empty message}">
        <div class="alert alert-success my-2">${message}</div>
    </c:if>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">Role</th>
            <th scope="col">Reset Password</th>
            <th scope="col">Supprimer</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${data}">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td>
                    <form action="/app/admin/resetPassword" method="post">
                        <input type="hidden" name="user_id" value="${user.id}">
                        <button type="submit" class="btn btn-success">motpass oublier</button>
                    </form>
                </td>
                <td>
                    <form action="/app/admin/deleteUser" method="post">
                        <input type="hidden" name="user_id" value="${user.id}">
                        <button type="submit" class="btn btn-danger">Supprimer</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
