<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>
    <!-- <link href="https://fonts.googleapis.com/css?family=Amiri" rel="stylesheet"> -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/app.js"></script>

</head>
<style>
    p{
        /*font-size: 0.7rem;*/
        margin-bottom: 6px;
    }

    .date {
        font-weight: bold;
        text-align: end;
        text-decoration: underline;
    }

    h3 {
        font-weight: bold;
        font-size: 1.2rem;

    }

    .sign {
        text-align: center;
        font-weight: bold;
        text-decoration: underline;
        margin: 120px 0;
    }
</style>
<body>
<div class="pdf">
    <div class="main container">
        <div class="row">
            <div class="col-12 mx-auto p-4" id="content">
                <div class="date my-5">
                    <p style="text-decoration:underline">Rabat le <fmt:formatDate value="${domiciliation.resiliation.created_at}" pattern="yyyy-MM-dd" /></p>
                </div>
                <h3 class="my-5 py-5">Objet : Résiliation de domiciliation.</h3>
                <div class="content my-5">
                    <p class="my-3">
                        En date du <strong>21/12/2022   </strong>, nous avons mets à la disposition de la société <strong>${domiciliation.societe.nom}</strong>, gratuitement une attestation de domiciliation sur notre adresse suivante :
                    </p>
                    <p ><strong>45 AVENUE DE FRANCE APPT 8 AGDAL RABAT.</strong></p>
                    <p class="my-3">
                        Suite à la décision de transfert du siège sociale de la société <strong>${domiciliation.societe.nom}</strong>, nous décidons de mettre fin à cette domiciliation, donc cette résiliation prendra effet à compter du <strong>19/04/2023</strong>.
                    </p>
                    <p>
                        Veuillez agréer, Madame, Monsieur, l’expression de mes salutations distinguées.
                    </p>
                </div>
                <div class="sign">
                    <p>Signature</p>
                    <p>ABDELHADI CHBILI</p>
                    <p>86/10</p>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="d-flex justify-content-center">
    <button onclick="convertToPdf()" class="btn-generate">Télécharger</button>
    <a href="/app" class="btn-cansel">Annuler</a>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>