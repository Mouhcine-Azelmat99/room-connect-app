<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mouhcine.companiesManagement.lqt.pojo.enumm.SituationRenouvlement" %>

<html>
<head>
    <title>Add Renouvlement</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container">
<h1 class="my-4">ajouter un nouveau Renouvlement</h1>
<f:form method="POST" action="/app/addRenouvlement" modelAttribute="renouvlement_model">
<div class="row">
    <div class="col-6">
        <div class="mb-3">
            <input type="hidden" name="domiciliationId" value="${domiciliationId}">
            <label for="periode" class="form-label">periode (en mois)</label>
            <f:input type="number" class="form-control" path="periode"/>
        </div>
        <div class="mb-3">
            <label for="dateDebut" class="form-label">date Debut </label>
            <f:input path="dateDebut" type="date" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="dateFin" class="form-label">date Fin </label>
            <f:input path="dateFin" type="date" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="montant" class="form-label">montant </label>
            <f:input path="montant" type="number" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="situation" class="form-label">situation</label>
            <f:select path="situation" class="form-control">
                <c:forEach var="situation" items="${SituationRenouvlement.values()}">
                    <option value="${situation}">${situation}</option>
                </c:forEach>
            </f:select>
        </div>

    </div>

<%--    <div class="col-6">--%>
<%--    </div>--%>
    <div class="d-grid gap-2 mb-3">
        <button class="btn btn-primary" type="submit">Ajouter</button>
    </div>
</div>
</f:form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
