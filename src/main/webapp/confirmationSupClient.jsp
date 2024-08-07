<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 06/08/2024
  Time: 22:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmation de Suppression</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/5.2.3/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #f0f4f8, #c9d6e3);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            padding: 40px;
            max-width: 600px;
            text-align: center;
            position: relative;
        }
        .alert {
            border-radius: 8px;
            margin-bottom: 30px;
        }
        .btn-custom {
            margin-top: 20px;
            font-size: 1rem;
            padding: 10px 20px;
            border-radius: 8px;
        }
        .btn-primary-custom {
            background-color: #007bff;
            border: none;
        }
        .btn-primary-custom:hover {
            background-color: #0056b3;
        }
        .btn-secondary-custom {
            background-color: #6c757d;
            border: none;
        }
        .btn-secondary-custom:hover {
            background-color: #5a6268;
        }
        .header-image {
            position: absolute;
            top: -20px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
        }
    </style>
</head>
<body>
<div class="container">
    <img src="https://www.example.com/your-logo.png" alt="Logo" class="header-image"/>
    <c:choose>
        <c:when test="${messageType == 'success'}">
            <div class="alert alert-success" role="alert">
                <h4 class="alert-heading">Succès!</h4>
                <p>${message}</p>
                <hr>
                <p class="mb-0">Vous pouvez retourner à la <a href="RecuperUserServlet" class="btn btn-primary-custom btn-custom">page principale</a> ou continuer à gérer les <a href="SuppressionClient.jsp" class="btn btn-secondary-custom btn-custom">clients</a>.</p>
            </div>
        </c:when>
        <c:otherwise>
            <div class="alert alert-danger" role="alert">
                <h4 class="alert-heading">Erreur!</h4>
                <p>${message}</p>
                <hr>
                <p class="mb-0">Veuillez <a href="SuppressionClient.jsp" class="btn btn-primary-custom btn-custom">réessayer</a> ou contacter le <a href="support.jsp" class="btn btn-secondary-custom btn-custom">support</a> si le problème persiste.</p>
            </div>
        </c:otherwise>
    </c:choose>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/5.2.3/js/bootstrap.bundle.min.js"></script>
</body>
</html>
