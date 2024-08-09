<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 09/08/2024
  Time: 00:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur</title>
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
    </style>
</head>
<body>
<div class="container">
    <div class="alert alert-danger" role="alert">
        <h4 class="alert-heading">Erreur!</h4>
        <p>${errorMessage}</p>
        <hr>
        <p class="mb-0">
            <a href="creatGestionnaire.jsp" class="btn btn-primary btn-custom">Veillez ressayer</a>
        </p>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
