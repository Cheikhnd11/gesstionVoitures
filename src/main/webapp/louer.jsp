<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 31/07/2024
  Time: 01:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <title>Louer Voiture - Agence de Location</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            padding: 50px;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .main-title {
            font-size: 2.5em;
            margin-bottom: 20px;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 30px;
        }
        .image-section {
            flex: 1;
            text-align: center;
            padding: 20px;
            border-right: 2px solid #3498db;
        }
        .form-section {
            flex: 2;
            padding: 20px;
            border-left: 2px solid #3498db;
        }
        .image-section img {
            max-width: 100%;
            height: auto;
        }
        .field {
            margin-bottom: 15px;
        }
        .field label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .field input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 2px solid #3498db;
            border-radius: 5px;
        }
        .btn-login {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.1em;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 5px;
        }
        .btn-login:hover {
            background-color: #2980b9;
        }
        footer {
            margin-top: 30px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Bool's Agence</a>
</nav>

<div class="container">
    <div class="image-section">
        <!-- Remplacez le lien ci-dessous par le lien de votre image ou icône -->
        <img src="img/4.jpg" alt="Recherche">
    </div>
    <div class="form-section">
        <h1 class="main-title">Pour louer une Voiture c'est  ici</h1>
        <div>
            <a href="RechercherLOUER.jsp" class="btn-login">Rechercher la voiture si elle est Disponible</a>
        </div>

    </div>
</div>

<footer class="text-center">
    <p>Bool's Agence &copy; 2023</p>
</footer>

</body>
</html>
