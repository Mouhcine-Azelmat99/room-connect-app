<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mouhcine.companiesManagement.lqt.pojo.enumm.Situation" %>
<%@ page import="com.mouhcine.companiesManagement.lqt.pojo.enumm.TypeSociete" %>

<html>
<head>
    <title>Demande de Domiciliation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container">
<h1 class="my-4">Demande de Domiciliation</h1>
<form method="POST" action="/public/domiciliation/addDemande" enctype="multipart/form-data">
<div class="row">
    <div class="col-6">
        <div class="mb-3">
            <label for="societe.nom" class="form-label">Nom De Societe</label>
            <input class="form-control" id="societe.nom" name="societenom"/>
        </div>
        <div class="mb-3">
            <label for="societe.ICE" class="form-label">ICE</label>
            <input class="form-control" id="societe.ICE" name="societeICE"/>
        </div>
        <div class="mb-3">
            <label for="societe.gerant.nom" class="form-label">Nom gerant</label>
            <input class="form-control" name="societegerantNom" id="societe.gerant.nom"/>
        </div>
        <div class="mb-3">
            <label for="societe.gerant.CIN" class="form-label">CIN gerant</label>
            <input class="form-control" name="societegerantCIN" id="societe.gerant.CIN"/>
        </div>
        <div class="mb-3">
            <label for="societe.gerant.address" class="form-label">Address gerant</label>
            <input class="form-control" id="societe.gerant.address" name="societegerantAddress"/>
        </div>
        <div class="mb-3">
            <label for="societe.gerant.dateNaissance" class="form-label">Date Naissance gerant </label>
            <input name="societegerantdateNaissance" type="date" id="societe.gerant.dateNaissance" class="form-control"/>
        </div>

        <div class="mb-3">
            <label for="societe.tel" class="form-label">Tel</label>
            <input class="form-control" id="societe.tel" name="societetel"/>
        </div>
        <div class="mb-3">
            <label for="societe.email" class="form-label">Email</label>
            <input name="societeemail" id="societe.email" type="email" class="form-control"/>
        </div>
    </div>

    <div class="col-6">
        <div class="mb-3">
            <label for="societe.typeSociete" class="form-label">Type de Societe</label>
            <select name="typeSociete" id="societe.typeSociete" class="form-control">
                <c:forEach var="typeSociete" items="${TypeSociete.values()}">
                    <option value="${typeSociete}">${typeSociete}</option>
                </c:forEach>
            </select>
        </div>
    <%--    comptable--%>
        <div class="mb-3">
            <label for="comptable.nom" class="form-label">Nom Comptable</label>
            <input id="comptable.nom" name="comptablenom" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="comptable.tel" class="form-label">tel Comptable</label>
            <input id="comptable.tel" name="comptabletel" class="form-control"/>
        </div>

        <div class="mb-3">
            <label for="periode" class="form-label">periode (mois)</label>
            <input type="number" id="periode" name="periode" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="dateDebut" class="form-label">date Debut </label>
            <input id="dateDebut" type="date" name="dateDebut" class="form-control"/>
        </div>

            <%--    Files --%>
        <div class="mb-3">
            <label for="cinFile" class="form-label">CIN Fichier</label>
            <input type="file" id="cinFile" name="cinFile" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="certificatNegative" class="form-label">certificat Négative</label>
            <input type="file" id="certificatNegative" name="certificatNegative" class="form-control"/>
        </div>

        <div class="d-grid gap-2 mb-3">
            <button class="btn btn-primary" type="submit">Ajouter</button>
        </div>
    </div>


</div>
</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
