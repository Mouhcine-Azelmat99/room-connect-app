<%@ page import="com.mouhcine.companiesManagement.core.bo.Domiciliation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.mouhcine.companiesManagement.core.bo.enumm.EtatDemande" %>

<html>
<head>
    <title>demandes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container my-5">
    <jsp:include page="./layout/menu.jsp" />
    <div class="d-flex justify-content-end">
        <form action="/app/domiciliation/demande/search">
            <div class="d-flex">
                <input type="search" name="search_value" value="${param.search_value}" class="form-control" placeholder="Searching ...">
                <select name="col" class="mx-2">
                    <option value="id" disabled>Recherche par</option>
                    <option value="societe">Nom Societe</option>
                    <option value="ICE">ICE</option>
                    <option value="etat">Etat</option>
                    <option value="periode">Periode</option>
                    <option value="dateDebut">Date Debut</option>
                </select>
                <button type="submit" class="btn btn-primary">Recherche</button>
            </div>
        </form>
        <form action="/app/domiciliation/demande/trier" method="get">
            <div class="d-flex mx-3">
                <select name="col" class="mx-2">
                    <option value="id">Id</option>
                    <option value="societe">Nom Societe</option>
                    <option value="ICE">ICE</option>
                    <option value="periode">Periode</option>
                    <option value="etat">Etat</option>
                </select>
                <button type="submit" class="btn btn-primary">Trier</button>
            </div>
        </form>
    </div>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">Id</th>
            <th scope="col">Societe</th>
            <th scope="col">Periode</th>
            <th scope="col">Date de debut</th>
            <th scope="col">Comptable</th>
            <th scope="col">Etat</th>
            <th scope="col">CIN File</th>
            <th scope="col">Certificat Negative</th>
            <th scope="col">Date de création</th>
            <th scope="col">Action</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="demande" items="${data}">
            <tr>
                <td>${demande.id}</td>
                <td>
                    <a href="/app/societe/show/${demande.societe.getId()}">${demande.societe.getNom()}</a>
                </td>
                <td>${demande.periode}</td>
                <td><fmt:formatDate value="${demande.dateDebut}" pattern="yyyy-MM-dd" /></td>
                <td>
                    <a href="/app/comptables/show/${demande.comptable.getId()}">${demande.comptable.getNom()}</a>
                </td>
                <td>${demande.etat}</td>
                <td>
                    <a href="/app/demande/download/cin/${demande.cinFile}">Télécharger</a>
                </td>
                <td>
                    <a href="/app/demande/download/certificatNegative/${demande.certificatNegative}">Télécharger</a>
                </td>
                <td>${demande.created_at}</td>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Action
                        </button>
                        <ul class="dropdown-menu ">
                            <li>
                                <form action="/app/demande/changeEtat" method="post">
                                    <input type="hidden" name="etat" value="CONFIRMER">
                                    <input type="hidden" name="demande_id" value="${demande.id}">
                                    <button type="submit" class="dropdown-item">Confirmer</button>
                                </form>
                            </li>
                            <hr>
                            <li>
                                <form action="/app/demande/changeEtat" method="post">
                                    <input type="hidden" name="etat" value="REJECTER">
                                    <input type="hidden" name="demande_id" value="${demande.id}">
                                    <button type="submit" class="dropdown-item ">Rejecter</button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
