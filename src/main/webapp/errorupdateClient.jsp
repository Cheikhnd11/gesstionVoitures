<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 07/08/2024
  Time: 03:33
  To change this template use File | Settings | File Templates.
--%>
<<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 27/07/2024
  Time: 04:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Erreur - Agence Location</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        body {
            padding-top: 50px;
            text-align: center;
        }
        .error-container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #f44336;
            border-radius: 5px;
            background-color: #ffe6e6;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">Agence Location</a>
        </div>
    </div>
</nav>

<div class="container error-container">
    <h2>Une Erreur s'est Produite</h2>
    <p>Désolé, une erreur est survenue lors du traitement de votre demande.</p>
    <p><strong>Code d'erreur :</strong> <span id="errorCode">404</span></p>
    <p><strong>Le client saisi n'est pas dans la base !</strong> </p>

    <h4>Que faire maintenant ?</h4>
    <ul>
        <li><a href="RecuperUserServlet">Retourner au Tableau de Bord</a></li>
        <li><a href="#" onclick="window.history.back();">Revenir à la page précédente</a></li>
        <li><a href="support.jsp">Contacter le Support</a></li>
    </ul>
</div>

<script>
    // Script pour récupérer les informations d'erreur (si disponibles)
    const urlParams = new URLSearchParams(window.location.search);
    const errorCode = urlParams.get('code') || 'Erreur inconnue';
    const errorMessage = urlParams.get('message') || 'Une erreur inattendue est survenue.';

    document.getElementById('errorCode').textContent = errorCode;
    document.getElementById('errorMessage').textContent = errorMessage;
</script>

</body>
</html>
