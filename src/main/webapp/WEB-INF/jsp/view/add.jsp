<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mouhcine.companiesManagement.core.bo.enumm.Situation" %>
<%@ page import="com.mouhcine.companiesManagement.core.bo.enumm.TypeSociete" %>

<html>
<head>
    <title>Add Domiciliation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container">
<h1 class="my-4">ajouter un nouveau domiciliation</h1>
<f:form method="POST" action="/app/addDomiciliation" modelAttribute="domiciliation_model">
<div class="row">
    <div class="col-6">
        <div class="mb-3">
            <label for="societe.nom" class="form-label">Nom De Societe</label>
            <f:input class="form-control" path="societe.nom"/>
        </div>
        <div class="mb-3">
            <label for="societe.ICE" class="form-label">ICE</label>
            <f:input class="form-control" path="societe.ICE"/>
        </div>
        <div class="mb-3">
            <label for="societe.gerant.nom" class="form-label">Nom gerant</label>
            <f:input class="form-control"  path="societe.gerant.nom"/>
        </div>
        <div class="mb-3">
            <label for="societe.gerant.CIN" class="form-label">CIN gerant</label>
            <f:input class="form-control"  path="societe.gerant.CIN"/>
        </div>
        <div class="mb-3">
            <label for="societe.gerant.address" class="form-label">Address gerant</label>
            <f:input class="form-control"  path="societe.gerant.address"/>
        </div>
        <div class="mb-3">
            <label for="societe.gerant.dateNaissance" class="form-label">Date Naissance gerant </label>
            <f:input path="societe.gerant.dateNaissance" class="form-control"/>
        </div>

        <div class="mb-3">
            <label for="societe.tel" class="form-label">Tel</label>
            <f:input class="form-control" path="societe.tel"/>
        </div>
        <div class="mb-3">
            <label for="societe.email" class="form-label">Email</label>
            <f:input path="societe.email" type="email" class="form-control"/>
        </div>
    </div>

    <div class="col-6">
        <div class="mb-3">
            <label for="societe.typeSociete" class="form-label">Type de Societe</label>
            <f:select path="societe.typeSociete" class="form-control">
                <c:forEach var="typeSociete" items="${TypeSociete.values()}">
                    <option value="${typeSociete}">${typeSociete}</option>
                </c:forEach>
            </f:select>
        </div>
        <div class="mb-3">
            <label for="periode" class="form-label">periode (mois)</label>
            <f:input type="number" path="periode" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="dateDebut" class="form-label">date Debut </label>
            <f:input path="dateDebut" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="montant" class="form-label">montant </label>
            <f:input path="montant" type="number" class="form-control"/>
        </div>
    <%--    comptable--%>
        <div class="mb-3">
            <label for="comptable.nom" class="form-label">Nom Comptable</label>
            <f:input path="comptable.nom" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="comptable.tel" class="form-label">tel Comptable</label>
            <f:input path="comptable.tel" class="form-control"/>
        </div>

        <div class="mb-3">
            <label for="situation" class="form-label">situation</label>
            <f:select path="situation" class="form-control">
                <c:forEach var="situation" items="${Situation.values()}">
                    <option value="${situation}">${situation}</option>
                </c:forEach>
            </f:select>
        </div>
    </div>
    <div class="d-grid gap-2 mb-3">
        <button class="btn btn-primary" type="submit">Ajouter</button>
        <a class="btn btn-primary" href="/app/">Annuler</a>
    </div>
</div>
</f:form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
