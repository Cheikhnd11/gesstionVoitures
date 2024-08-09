<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 31/07/2024
  Time: 01:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.time.LocalDate" %>
<%
    LocalDate currentDate = LocalDate.now();
%>

<html lang="fr">
<head>
    <title>Enregistrement de Location - Agence de Location</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #e9ecef;
            padding: 50px;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .main-title {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #007bff;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin-top: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .image-section {
            flex: 1;
            text-align: center;
            padding: 20px;
            border-right: 3px solid #28a745;
        }
        .image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .form-section {
            flex: 2;
            padding: 20px;
        }
        .field {
            margin-bottom: 15px;
            text-align: left;
        }
        .field label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #28a745;
        }
        .field input,
        .field select {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 2px solid #28a745;
            border-radius: 5px;
            transition: border-color 0.3s;
        }
        .field input:focus,
        .field select:focus {
            border-color: #007bff;
        }
        .btn-submit {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.1em;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .btn-submit:hover {
            background-color: #218838;
        }
        footer {
            margin-top: 30px;
            color: #6c757d;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="RecuperUserServlet"> Acceil</a>
</nav>

<div class="container">
    <div class="image-section">
        <img src="img/3.jpg" alt="Location de Voiture">
    </div>
    <div class="form-section">
        <h1 class="main-title">Enregistrement de Location</h1>
        <form action="EnregistrerLocationServlet" method="post">
            <div class="field">
                <label for="client">ID Client :</label>
                <input type="number" id="client" name="client">
            </div>
            <div class="field">
                <label for="voiture">Immatriculation Voiture :</label>
                <input type="text" id="voiture" name="voiture" value="${param.Immatriculation}" readonly>
            </div>
            <div class="field">
                <label for="dateDebut">Date de Début :</label>
                <input type="date" id="dateDebut" name="dateDebut" value="<%= currentDate %>">
            </div>
            <div class="field">
                <label for="dateFin">Date de Fin :</label>
                <input type="date" id="dateFin" name="dateFin">
            </div>
            <div class="field">
                <label for="prixParJour">Prix de location de cette voiyure par Jours :</label>
                <input type="number" id="prixParJour" name="prix" value="${param.prixDeLocationParJour}" readonly>
            </div>
            <div class="field">
                <label for="statutLocation">Statut de la Location :</label>
                <input type="text" id="statutLocation" name="statutLocation" value="en cours" readonly>
            </div>
            <div class="field">
                <label for="kilometrage">Kilométrage :</label>
                <input type="number" id="kilometrage" name="kilometrage" value="${param.kilomeetrage}" readonly>
            </div>
            <input type="submit" value="Enregistrer" class="btn-submit">
        </form>
    </div>
</div>

<footer class="text-center">
    <p>Bool's Agence &copy; 2023</p>
</footer>

</body>
</html>
