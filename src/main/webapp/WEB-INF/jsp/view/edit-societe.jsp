<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mouhcine.companiesManagement.core.bo.enumm.TypeSociete" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <title>Modifier societe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container">
<h3 class="my-3">Modifier Societe</h3>
<c:choose>
    <c:when test="${role.toString().contains('ROLE_ADMIN')}">
        <form method="POST" action="/app/admin/updateSociete" modelAttribute="societe">
    </c:when>
    <c:otherwise>
        <form method="POST" action="/app/updateSociete" modelAttribute="societe">
    </c:otherwise>
</c:choose>

<div class="row">
    <div class="col-md-6">
        <input type="hidden" value="${societe.id}" name="id">
        <div class="mb-3">
            <label for="societenom" class="form-label">Nom De Societe</label>
            <input name="societenom" id="societenom" class="form-control" value="${societe.nom}"/>
        </div>
        <div class="mb-3">
            <label for="societeICE" class="form-label">ICE</label>
            <input name="societeICE" id="societeICE" class="form-control" value="${societe.ICE}"/>
        </div>
<%--        Gerant --%>
        <div class="mb-3">
            <label for="societegerantNom" class="form-label">Nom gerant</label>
            <input type="hidden" name="societegerantId"  value="${societe.gerant.id}"/>
            <input name="societegerantNom" id="societegerantNom" class="form-control"  value="${societe.gerant.nom}"/>
        </div>
        <div class="mb-3">
            <label for="societegerantCIN" class="form-label">CIN gerant</label>
            <input name="societegerantCIN" id="societegerantCIN" class="form-control"  value="${societe.gerant.CIN}"/>
        </div>
        <div class="mb-3">
            <label for="societegerantAddress" class="form-label">Address gerant</label>
            <input name="societegerantAddress" id="societegerantAddress" class="form-control"  value="${societe.gerant.address}"/>
        </div>
    </div>
    <div class="col-md-6">
        <div class="mb-3">
            <label for="gerantDateNaissance" class="form-label">DateNaissance gerant - <fmt:formatDate value="${societe.gerant.dateNaissance}" pattern="yyyy-MM-dd" /></label>
            <input type="date" name="gerantDateNaissance" id="gerantDateNaissance" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="societetel" class="form-label">Tel</label>
            <input name="societetel" id="societetel" class="form-control" value="${societe.tel}"/>
        </div>
        <div class="mb-3">
            <label for="societeemail" class="form-label">Email</label>
            <input value="${societe.email}" type="email" name="societeemail" id="societeemail" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="situation" class="form-label">situation -  ${societe.typeSociete}</label>
            <select value="${typeSociete}" name="typeSociete" id="situation" class="form-control">
                <c:forEach var="typeSociete" items="${TypeSociete.values()}">
                    <option value="${typeSociete}">${typeSociete}</option>
                </c:forEach>
            </select>
        </div>
        </div>
        <div class="d-grid gap-2 mb-3">
            <button class="btn btn-primary" type="submit">Modifier</button>
            <a href="/app/societe" class="btn btn-outline-primary" type="submit">Annuler</a>
        </div>
</div>
</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
