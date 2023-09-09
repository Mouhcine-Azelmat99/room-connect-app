<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.mouhcine.companiesManagement.lqt.pojo.enumm.Situation" %>

<html>
<head>
    <title>Modifier Domiciliation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

</head>
<body>
<div class="container">
<h3 class="my-3">Modifier Domiciliation</h3>
<c:choose>
    <c:when test="${role.toString().contains('ROLE_ADMIN')}">
        <form method="POST" action="/app/admin/updateDomiciliation" modelAttribute="domiciliationModel">
    </c:when>
    <c:otherwise>
        <form method="POST" action="/app/updateDomiciliation" modelAttribute="domiciliationModel">
    </c:otherwise>
</c:choose>

<div class="row">
        <input type="hidden" value="${domiciliationModel.id}" name="id">
        <div class="mb-3">
            <label for="societenom" class="form-label">Nom De Societe</label>
<%--            <input type="hidden" value="${domiciliationModel.societe.id}" name="societeid">--%>
            <input disabled name="societenom" id="societenom" class="form-control" value="${domiciliationModel.societe.nom}"/>
        </div>
<%--        <div class="mb-3">--%>
<%--            <label for="societeICE" class="form-label">ICE</label>--%>
<%--            <input name="societeICE" id="societeICE" class="form-control" value="${domiciliationModel.societe.ICE}"/>--%>
<%--        </div>--%>
<%--&lt;%&ndash;        Gerant &ndash;%&gt;--%>
<%--        <div class="mb-3">--%>
<%--            <label for="societegerantNom" class="form-label">Nom gerant</label>--%>
<%--            <input type="hidden" name="societegerantId"  value="${domiciliationModel.societe.gerant.id}"/>--%>
<%--            <input name="societegerantNom" id="societegerantNom" class="form-control"  value="${domiciliationModel.societe.gerant.nom}"/>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="societegerantCIN" class="form-label">CIN gerant</label>--%>
<%--            <input name="societegerantCIN" id="societegerantCIN" class="form-control"  value="${domiciliationModel.societe.gerant.CIN}"/>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="societegerantAddress" class="form-label">Address gerant</label>--%>
<%--            <input name="societegerantAddress" id="societegerantAddress" class="form-control"  value="${domiciliationModel.societe.gerant.address}"/>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="societetel" class="form-label">Tel</label>--%>
<%--            <input name="societetel" id="societetel" class="form-control" value="${domiciliationModel.societe.tel}"/>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="societeemail" class="form-label">Email</label>--%>
<%--            <input value="${domiciliationModel.societe.email}" type="email" name="societeemail" id="societeemail" class="form-control"/>--%>
<%--        </div>--%>
<%--    </div>--%>

        <div class="mb-3">
            <label for="periode" class="form-label">periode (mois)</label>
            <input type="number" value="${domiciliationModel.periode}" name="periode" id="periode" class="form-control"/>
        </div>
        <div class="mb-3">
            <label for="dateDebut" class="form-label">date Debut </label>
            <input value="${domiciliationModel.dateDebut}" type="date"  name="dateDebut" id="dateDebut" class="form-control"/>
        </div>

<%--        <div class="mb-3">--%>
<%--            <label for="montant" class="form-label">montant </label>--%>
<%--            <input value="${domiciliationModel.montant}" type="number" name="montant" id="montant" class="form-control"/>--%>
<%--        </div>--%>
    <%--    comptable--%>
<%--        <div class="mb-3">--%>
<%--            <input type="hidden" value="${domiciliationModel.comptable.id}" name="comptableid">--%>
<%--            <label for="comptablenom" class="form-label">Nom Comptable</label>--%>
<%--            <input value="${domiciliationModel.comptable.nom}" name="comptablenom" id="comptablenom" class="form-control"/>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="comptabletel" class="form-label">tel Comptable</label>--%>
<%--            <input value="${domiciliationModel.comptable.tel}" name="comptabletel" id="comptabletel" class="form-control"/>--%>
<%--        </div>--%>

        <div class="mb-3">
            <label for="situation" class="form-label">situation -  ${(domiciliationModel.situation)}</label>
            <select value="${domiciliationModel.situation}" name="situation" id="situation" class="form-control">
                <c:forEach var="situation" items="${Situation.values()}">
                    <option value="${situation}">${situation}</option>
                </c:forEach>
            </select>
        </div>
        <div class="d-grid gap-2 mb-3">
            <button class="btn btn-primary" type="submit">Modifier</button>
            <a href="/app" class="btn btn-outline-primary" type="submit">Annuler</a>
        </div>
</div>
</form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
