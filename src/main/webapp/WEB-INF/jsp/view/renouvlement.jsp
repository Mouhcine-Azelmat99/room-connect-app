<%@ page import="com.mouhcine.companiesManagement.lqt.pojo.Domiciliation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>renouvlement</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container my-5">
    <jsp:include page="./layout/menu.jsp" />
    <div class="d-flex justify-content-end">
        <a class="btn btn-primary" href="/app/domiciliation/renouvlement/add/${domiciliationId}">Ajouter Renouvellement</a>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Periode</th>
            <th scope="col">DateDebut</th>
            <th scope="col">dateFin</th>
            <th scope="col">montant</th>
            <th scope="col">Situation</th>
            <th scope="col">Annuler</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="item" items="${data}">
            <tr>
                <td>${item.id}</td>
                <td>${item.periode}</td>
                <td>${item.dateDebut}</td>
                <td>${item.dateFin}</td>
                <td>${item.montant}</td>
                <td>${item.situation}</td>
                <td>
                    <form action="/app/admin/deleteRenouvlement" method="POST">
                        <input value="${domiciliationId}" name="domiciliationId" type="hidden">
                        <input value="${item.id}" name="renouvlementId" type="hidden">
                        <button class="btn btn-danger">Supprimer</button>
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
