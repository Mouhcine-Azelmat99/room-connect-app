<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mouhcine.companiesManagement.lqt.pojo.enumm.Situation" %>

<html>
<head>
    <title>Add Contact</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container">
<h1 class="my-4">modifier domiciliation</h1>
<f:form method="POST" action="/updateDomiciliation" modelAttribute="domiciliationModel">
<div class="row">
    <div class="col-6">
        <f:input type="hidden" class="form-control" path="id"/>
        <div class="mb-3">
            <f:input type="hidden" class="form-control" path="societe.id"/>
            <label for="societe.nom" class="form-label">Nom De Societe</label>
            <f:input class="form-control" path="societe.nom"/>
        </div>
        <div class="mb-3">
            <label for="societe.ICE" class="form-label">ICE</label>
            <f:input class="form-control" path="societe.ICE"/>
        </div>
        <div class="mb-3">
            <label for="societe.gerant" class="form-label">gerant</label>
            <f:input class="form-control"  path="societe.gerant"/>
        </div>
        <div class="mb-3">
            <label for="societe.tel" class="form-label">Tel</label>
            <f:input class="form-control" path="societe.tel"/>
        </div>
        <div class="mb-3">
            <label for="societe.email" class="form-label">Email</label>
            <f:input path="societe.email" type="email" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="periode" class="form-label">periode (mois)</label>
            <f:input type="number" path="periode" class="form-control"/>
        </div>
    </div>

    <div class="col-6">
        <div class="mb-3">
            <label for="dateDebut" class="form-label">date Debut </label>
            <f:input path="dateDebut" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="dateFin" class="form-label">date Fin </label>
            <f:input path="dateFin" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="montant" class="form-label">montant </label>
            <f:input path="montant" type="number" class="form-control"/>
        </div>
    <%--    comptable--%>
        <div class="mb-3">
            <f:input type="hidden" path="comptable.id" class="form-control"/>

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
<%--            <option value="paye">paye</option>--%>
<%--            <option value="paye">paye</option>--%>
<%--            <option value="paye">paye</option>--%>
                <c:forEach var="situation" items="${Situation.values()}">
                    <option value="${situation}">${situation}</option>
                </c:forEach>
            </f:select>
        </div>
    </div>
    <div class="d-grid gap-2 mb-3">
        <button class="btn btn-primary" type="submit">Modifier</button>
    </div>
</div>
</f:form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
