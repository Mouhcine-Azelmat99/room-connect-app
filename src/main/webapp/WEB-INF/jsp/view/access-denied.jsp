<html>

<head>
<title>Accès Refusé</title>
	<style>
		body{
			background-color: black;
			color: white;
		}

		h1 {
			color: red;
		}

		h6{
			margin-top: 15px;
			color: red;
			text-decoration: underline;
		}

	</style>
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

</head>

<body>

<%--	<h2>Accès Refusé</h2>--%>

<%--	<hr>--%>
<%--	<p>Vous n'êtes pas autorisé à accéder à--%>
<%--		cette ressource</p>--%>
<%--	<a href="${pageContext.request.contextPath}/">Retour à la page--%>
<%--		d'accueil de l'application</a>--%>

	<div class="w3-display-middle">
		<h1 class="w3-jumbo w3-animate-top w3-center"><code>Accès Refusé</code></h1>
		<hr class="w3-border-white w3-animate-left" style="margin:auto;width:50%">
		<h3 class="w3-center w3-animate-right">Vous n'êtes pas autorisé à accéder.</h3>
		<h6 class="w3-center w3-animate-zoom">error code:403 forbidden</h6>
	</div>

</body>

</html>