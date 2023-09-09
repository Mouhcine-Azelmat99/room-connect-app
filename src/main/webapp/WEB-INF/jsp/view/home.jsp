<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mouhcine.companiesManagement.core.bo.Domiciliation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <h1>role : ${role}</h1>
    <div class="d-flex justify-content-end">
        <form action="/app/domiciliation/search">
        <div class="d-flex">
            <input type="search" name="search_value" value="${param.search_value}" class="form-control" placeholder="Searching ...">
            <select name="col" class="mx-2">
                <option value="id" disabled>Search By</option>
                <option value="societe">Societe</option>
                <option value="periode">Periode</option>
                <option value="dateDebut">Date Debut</option>
                <option value="dateFin">Date Fin</option>
                <option value="montant">Montant</option>
            </select>
            <button type="submit" class="btn btn-primary">Search</button>
        </div>
        </form>
        <form action="/app/domiciliation/trier" method="get">
            <div class="d-flex mx-3">
                <select name="col" class="mx-2">
                    <option value="id">Id</option>
                    <option value="societe">Nom Societe</option>
                    <option value="ICE">ICE</option>
                    <option value="periode">Periode</option>
                    <option value="dateDebut">Date Debut</option>
                    <option value="dateFin">Date Fin</option>
                    <option value="montant">Montant</option>
                    <option value="situation">Situation</option>
                </select>
                <button type="submit" class="btn btn-primary">Trier</button>
            </div>
        </form>
        <div class="dropdown">
            <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                Telecharger En excel
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/app/exportDomiciliations?resilier=non">Excel Domciliations</a></li>
                <hr>
                <li><a class="dropdown-item" href="/app/exportDomiciliations?resilier=oui">Excel Domciliations Resilier</a></li>
                </li>
            </ul>
        </div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Societe</th>
            <th scope="col">ICE</th>
            <th scope="col">periode</th>
            <th scope="col">dateDebut</th>
            <th scope="col">dateFin</th>
            <th scope="col">montant</th>
            <th scope="col">situation</th>
            <th scope="col">comptable</th>
            <th scope="col">renouvellements</th>
            <th scope="col">Date de création</th>
            <th scope="col">Edit</th>
            <c:choose>
                <c:when test="${role.toString().contains('ROLE_ADMIN')}">
                    <th scope="col">Delete</th>
                </c:when>
            </c:choose>

            <th scope="col">Contrat</th>
            <th scope="col">Résiliation</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="domiciliation" items="${data}">
            <tr>
                <td>${domiciliation.id}</td>
                <td>
                    <a href="/app/societe/show/${domiciliation.societe.getId()}">${domiciliation.societe.getNom()}</a>
                </td>
                <td>${domiciliation.societe.getICE()}</td>
                <td>${domiciliation.periode}</td>
                <td><fmt:formatDate value="${domiciliation.dateDebut}" pattern="yyyy-MM-dd" /></td>
                <td><fmt:formatDate value="${domiciliation.dateFin}" pattern="yyyy-MM-dd" /></td>
                <td>${domiciliation.montant}</td>
                <td>${domiciliation.situation}</td>
                <td>
                    <a href="/app/comptables/show/${domiciliation.comptable.getId()}">${domiciliation.comptable.getNom()}</a>
                </td>
                <td>
                    <a href="/app/domiciliation/renouvlement/${domiciliation.id}">${domiciliation.renouvlements.size()} renouvellements</a>
                </td>
                <td>${domiciliation.created_at}</td>
                <td>
                    <a class="btn btn-primary" href="/app/domiciliation/edit/${domiciliation.id}">Modifier</a>
                </td>
                <c:choose>
                    <c:when test="${role.toString().contains('ROLE_ADMIN')}">
                    <td>
                        <form action="/app/admin/deleteDomiciliation" method="post">
                            <input value="${domiciliation.id}" name="domiciliationId" type="hidden">
                            <button class="btn btn-danger">Supprimer</button>
                        </form>
                    </td>
                    </c:when>
                </c:choose>
                <td>
                    <a class="btn btn-dark" href="/app/domiciliation/contrat/${domiciliation.id}">contrat</a>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${domiciliation.resiliation == null}">
                        <form action="/app/admin/domiciliation/resilier" method="post">
                            <input value="${domiciliation.id}" name="domiciliationId" type="hidden">
                            <button class="btn btn-danger">Resilier</button>
                        </form>
                        </c:when>
                        <c:otherwise>
                            <a class="btn btn-success" href="/app/domiciliation/resiliation/${domiciliation.id}">Contrat</a>
                        </c:otherwise>
                        </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
