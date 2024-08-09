<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 08/08/2024
  Time: 22:19
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation d'Ajout - Bool's Agence</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2);
            padding: 30px;
            max-width: 500px;
            text-align: center;
        }
        .alert {
            margin-bottom: 20px;
        }
        .btn-custom {
            margin-top: 20px;
            font-size: 1rem;
        }
        .h4{
            color: #842029;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="alert alert-success" role="alert">
        <h4 style="color: #a71d2a" class="alert-heading">Gestionnaire Supprimer!</h4>
        <p>Le gestionnaire a été supprime avec succès.</p>
        <hr>
        <p class="mb-0">
            <a href="RecuperUserServlet" class="btn btn-primary btn-custom">Retour au tableau de bord</a>
            <a href="ListeGestionnaireServlet" class="btn btn-secondary btn-custom">Voir la Liste des Gestionnaires</a>
        </p>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
