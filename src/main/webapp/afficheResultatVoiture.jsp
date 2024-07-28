<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 23/07/2024
  Time: 03:21
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
            background-color: #28a745;
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
        <img src="img/parking.jpg" alt="Recherche Voiture">
    </div>
    <div class="results-section">
        <h1 class="main-title">Résultats de la Recherche</h1>

        <%-- Logique JSP pour afficher les résultats de recherche --%>
        <%
            String marque = request.getParameter("marque");
            String kilometrage = request.getParameter("kilometrage");
            String annee = request.getParameter("annee");
            String carburant = request.getParameter("carburant");
            String categorie = request.getParameter("categorie");
            boolean hasResults = false; // Utilisez cette variable pour déterminer si des résultats existent

            // Simuler des résultats de recherche pour l'exemple
            // Remplacer par une logique réelle pour obtenir les résultats de la base de données
            if (marque != null || kilometrage != null || annee != null || carburant != null || categorie != null) {
                hasResults = true; // Remplacez cette ligne par une condition vérifiant la présence de résultats réels
            }

            if (hasResults) {
        %>
        <table class="results-table">
            <thead>
            <tr>
                <th>Marque</th>
                <th>Kilométrage</th>
                <th>Année</th>
                <th>Carburant</th>
                <th>Catégorie</th>
            </tr>
            </thead>
            <tbody>
            <%-- Afficher les résultats réels ici --%>
            <tr>
                <td><%= marque %></td>
                <td><%= kilometrage %></td>
                <td><%= annee %></td>
                <td><%= carburant %></td>
                <td><%= categorie %></td>
            </tr>
            </tbody>
        </table>
        <% } else { %>
        <p>Aucun résultat trouvé pour les critères de recherche fournis.</p>
        <% } %>
    </div>
</div>

<footer class="text-center">
    <p>Bool's Agence &copy; 2023</p>
</footer>

</body>
</html>
