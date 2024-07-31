<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 31/07/2024
  Time: 00:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="fr">
<head>
    <title>Affichage Client - Agence de Location</title>
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
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #3498db;
        }
        th {
            background-color: #3498db;
            color: white;
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
        <img src="img/searche.jpg" alt="Recherche">
    </div>
    <div class="form-section">
        <h1 class="main-title">Liste des clients de L'Agence</h1>
        <p>Vous trouverez toutes les personnes ayant une inscription dans cette entreprise.</p><br><br>

        <div class="field">
        <c:if test="${!empty clients}">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Identifiant</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Âge</th>
                    <th>E-mail</th>
                    <th>Adresse</th>
                    <th>Téléphone</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="m" items="${clients}">
                    <tr>
                        <td><c:out value="${m.identifient}"/></td>
                        <td><c:out value="${m.nom}"/></td>
                        <td><c:out value="${m.prenom}"/></td>
                        <td><c:out value="${m.age}"/></td>
                        <td><c:out value="${m.email}"/></td>
                        <td><c:out value="${m.adresse}"/></td>
                        <td><c:out value="${m.telephone}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty clients}">
            <strong><p>Aucun client n'est dans la base de Donnees pour le moment</p></strong>
        </c:if>
        </div>

    </div>
</div>

<footer class="text-center">
    <p>Bool's Agence &copy; 2024</p>
</footer>

</body>
</html>