<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 07/08/2024
  Time: 00:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Client - Bool's Agence</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e9ecef;
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
            max-width: 600px;
        }
        .form-control {
            border-radius: 0.375rem;
        }
        .btn-custom {
            font-size: 1rem;
        }
        .alert {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 class="text-center mb-4">Location d'une voiture</h2>

    <!-- Message d'erreur -->

            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Erreur!</h4>
                <p>Le client saisi pour cette location n'est pas inscrit dans la base de donnees !</p>
                <hr>
                <p class="mb-0">Veuillez <a href="RechercherLOUER.jsp" class="btn btn-primary btn-custom">réessayer</a> ou contacter le <a href="support.jsp" class="btn btn-secondary btn-custom">support</a> si le problème persiste.</p>
            </div>

</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
