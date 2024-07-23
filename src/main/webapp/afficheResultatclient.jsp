<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 23/07/2024
  Time: 03:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <title>Résultats de la Recherche - Agence de Location</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f7f7f7;
            padding: 50px;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .main-title {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #ff5733;
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
            border-right: 3px solid #8e44ad;
        }
        .image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .results-section {
            flex: 2;
            padding: 20px;
        }
        .results-table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }
        .results-table th,
        .results-table td {
            padding: 12px;
            border: 1px solid #ddd;
        }
        .results-table th {
            background-color: #8e44ad;
            color: white;
        }
        .results-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        footer {
            margin-top: 30px;
            color: #6c757d;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Bool's Agence</a>
</nav>

<div class="container">
    <div class="image-section">
        <!-- Remplacez le lien ci-dessous par le lien de votre image -->
        <img src="img/resultatClient.jpg" alt="Recherche Client">
    </div>
    <div class="results-section">
        <h1 class="main-title">Résultats de la Recherche</h1>

        <%-- Logique JSP pour afficher les résultats de recherche --%>
        <%
            String clientId = request.getParameter("clientId");
            boolean hasResults = false; // Utilisez cette variable pour déterminer si des résultats existent

            // Simuler des résultats de recherche pour l'exemple
            // Remplacer par une logique réelle pour obtenir les résultats de la base de données
            if (clientId != null && !clientId.isEmpty()) {
                hasResults = true; // Remplacez cette ligne par une condition vérifiant la présence de résultats réels
            }

            if (hasResults) {
        %>
        <table class="results-table">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Email</th>
                <th>Téléphone</th>
            </tr>
            </thead>
            <tbody>
            <%-- Afficher les résultats réels ici --%>
            <tr>
                <td><%= clientId %></td>
                <td>Nom Exemple</td>
                <td>Prénom Exemple</td>
                <td>email@example.com</td>
                <td>0123456789</td>
            </tr>
            </tbody>
        </table>
        <% } else { %>
        <p>Aucun résultat trouvé pour l'ID de client fourni.</p>
        <% } %>
    </div>
</div>

<footer class="text-center">
    <p>Bool's Agence &copy; 2023</p>
</footer>

</body>
</html>
