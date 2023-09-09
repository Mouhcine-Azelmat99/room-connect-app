<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mouhcine.companiesManagement.lqt.pojo.Domiciliation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Modifications</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container my-5">

    <jsp:include page="./layout/menu.jsp" />

    <h3>Modifications des domiciliations</h3>
    <c:forEach var="item" items="${data_domiciliation}">
    <table class="table table-bordered my-2">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th>Societe</th>
            <th scope="col">periode</th>
            <th scope="col">dateDebut</th>
            <th scope="col">situation</th>
            <th scope="col">Date de création</th>
<%--            <th>Action</th>--%>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td>${item.modification.id}</td>
                <td>${item.domiciliation.societe.nom}</td>
                <td>${item.modification.periode}</td>
                <c:choose>
                    <c:when test="${item.modification.dateDebut !=null}">
                        <td><fmt:formatDate value="${item.modification.dateDebut}" pattern="yyyy-MM-dd" /></td>
                    </c:when>
                    <c:otherwise>
                        <td><fmt:formatDate value="${item.domiciliation.dateDebut}" pattern="yyyy-MM-dd" /></td>
                    </c:otherwise>
                </c:choose>

                <td>${item.modification.situation}</td>
                <td>${item.modification.created_at}</td>
                <td class="d-flex justify-content-start">
                    <form action="/app/admin/modification/confirme" method="post">
                        <input value="${item.domiciliation.id}" name="domiciliationId" type="hidden">
                        <input value="${item.modification.id}" name="modificationId" type="hidden">
                        <button class="btn btn-success">Confirme</button>
                    </form>
                    <form action="/app/admin/modification/annuler" method="post">
                        <input value="${item.modification.id}" name="modificationId" type="hidden">
                        <button class="btn btn-danger mx-3">Annuler</button>
                    </form>
                </td>
            </tr>
            <tr class="bg-primary text-white">
                <td>${item.modification.id}</td>
                <td>${item.domiciliation.societe.nom}</td>
                <td>${item.domiciliation.periode}</td>
                <td><fmt:formatDate value="${item.domiciliation.dateDebut}" pattern="yyyy-MM-dd" /></td>
                <td>${item.domiciliation.situation}</td>
            </tr>
        </tbody>
    </table>
    </c:forEach>
<%--    Societe--%>
    <h3>Modifications des societes</h3>
    <c:forEach var="item" items="${data_societe}">
    <table class="table table-bordered my-2">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th>Nom Societe</th>
            <th scope="col">ICE</th>
            <th scope="col">Tel</th>
            <th scope="col">Email</th>
            <th scope="col">Type</th>
            <th scope="col">Nom Gerant</th>
            <th scope="col">CIN Gerant</th>
            <th scope="col">Adress Gerant</th>
            <th scope="col">Date Naissance Gerant</th>
            <th scope="col">Date de création</th>
        </tr>
        </thead>
        <tbody>
            <tr>
                <td>${item.modification.id}</td>
                <td>${item.modification.nom}</td>
                <td>${item.modification.ICE}</td>
                <td>${item.modification.tel}</td>
                <td>${item.modification.email}</td>
                <td>${item.modification.typeSociete}</td>
                <td>${item.modification.gerantNom}</td>
                <td>${item.modification.gerantCIN}</td>
                <td>${item.modification.gerantAddress}</td>
                <c:choose>
                    <c:when test="${item.modification.gerantDateNaissance !=null}">
                        <td><fmt:formatDate value="${item.modification.gerantDateNaissance}" pattern="yyyy-MM-dd" /></td>
                    </c:when>
                    <c:otherwise>
                        <td><fmt:formatDate value="${item.societe.gerant.dateNaissance}" pattern="yyyy-MM-dd" /></td>
                    </c:otherwise>
                </c:choose>
                <td>${item.modification.created_at}</td>
                <td class="d-flex justify-content-start">
                    <form action="/app/admin/societe/modification/confirme" method="post">
                        <input value="${item.societe.id}" name="societeId" type="hidden">
                        <input value="${item.modification.id}" name="modificationId" type="hidden">
                        <button class="btn btn-success">Confirme</button>
                    </form>
                    <form action="/app/admin/societe/modification/annuler" method="post">
                        <input value="${item.modification.id}" name="modificationId" type="hidden">
                        <button class="btn btn-danger mx-3">Annuler</button>
                    </form>
                </td>
            </tr>
            <tr class="bg-primary text-white">
                <td></td>
                <td>${item.societe.nom}</td>
                <td>${item.societe.ICE}</td>
                <td>${item.societe.tel}</td>
                <td>${item.societe.email}</td>
                <td>${item.societe.typeSociete}</td>
                <td>${item.societe.gerant.nom}</td>
                <td>${item.societe.gerant.CIN}</td>
                <td>${item.societe.gerant.address}</td>
                <td><fmt:formatDate value="${item.societe.gerant.dateNaissance}" pattern="yyyy-MM-dd" /></td>
            </tr>
        </tbody>
    </table>
    </c:forEach>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
