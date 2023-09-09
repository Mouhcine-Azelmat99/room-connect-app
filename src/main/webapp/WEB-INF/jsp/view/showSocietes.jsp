<%@ page import="com.mouhcine.companiesManagement.lqt.pojo.Domiciliation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<div class="container my-5">
    <jsp:include page="./layout/menu.jsp" />
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Nom</th>
            <th scope="col">ICE</th>
            <th scope="col">Nom Gerant</th>
            <th scope="col">Address Gerant</th>
            <th scope="col">CIN Gerant</th>
            <th scope="col">Date Naissance Gerant</th>
            <th scope="col">Type</th>
            <th scope="col">Tel</th>
            <th scope="col">Email</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td>${societe.id}</td>
                <td>${societe.nom}</td>
                <td>${societe.nom}</td>
                <td>${societe.ICE}</td>
                <td>${societe.gerant.nom}</td>
                <td>${societe.gerant.address}</td>
                <td>${societe.gerant.CIN}</td>
                <td><fmt:formatDate value="${societe.gerant.dateNaissance}" pattern="yyyy-MM-dd" /></td>
                <td>${societe.typeSociete}</td>
                <td>${societe.tel}</td>
                <td>${societe.email}</td>
            </tr>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
