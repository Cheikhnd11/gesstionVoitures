<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation d'Ajout de Voiture</title>
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
    </style>
</head>
<body>
<div class="container">
    <c:choose>
        <c:when test="${messageType == 'success'}">
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">Succès!</h4>
                <p>${message}</p>
                <hr>
                <p class="mb-0">Vous pouvez consulter la liste des <a href="ListeVoituresServlet" class="btn btn-primary btn-custom">Voitures</a> ou continuer à Ajouter des <a href="AjoutVoiture.jsp" class="btn btn-secondary btn-custom">voitures</a>.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Erreur!</h4>
                <p>${message}</p>
                <hr>
                <p class="mb-0">Veuillez <a href="AjoutVoiture.jsp" class="btn btn-primary btn-custom">réessayer</a> ou contacter le <a href="support.jsp" class="btn btn-secondary btn-custom">support</a> si le problème persiste.</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
