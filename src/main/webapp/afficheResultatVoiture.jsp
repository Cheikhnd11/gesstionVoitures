<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        .aa {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.1em;
            background-color: #4b00bf;
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .aa:hover {
            background-color: #19af06;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Bool's Agence</a>
</nav>

<div class="container">
    <div class="image-section">
        <img src="img/parking.jpg" alt="Recherche Voiture"><br><br><br>
        <a href="javascript:history.back()" class="aa">page précédante</a>
    </div>
    <div class="results-section">
        <h1 class="main-title">Résultats de la Recherche</h1>

        <c:if test="${!empty voitures}">
            <table class="results-table">
                <thead>
                <tr>
                    <th>Immatriculation</th>
                    <th>Nombre de place</th>
                    <th>Marque</th>
                    <th>Modèle</th>
                    <th>Année de mise en service</th>
                    <th>Kilométrage</th>
                    <th>Type de Carburant</th>
                    <th>Catégorie</th>
                    <th>Prix de location par jour</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="voiture" items="${voitures}">
                    <tr>
                        <td><c:out value="${voiture.immatriculation}"/></td>
                        <td><c:out value="${voiture.nombreDePlace}"/></td>
                        <td><c:out value="${voiture.marque}"/></td>
                        <td><c:out value="${voiture.modele}"/></td>
                        <td><c:out value="${voiture.anneeDeMiseEnService}"/></td>
                        <td><c:out value="${voiture.kilomeetrage}"/></td>
                        <td><c:out value="${voiture.typeCarburant}"/></td>
                        <td><c:out value="${voiture.categorie}"/></td>
                        <td><c:out value="${voiture.prixDeLocationParJour}"/></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty voitures}">
            <p>Aucun résultat trouvé pour les critères de recherche fournis.</p>
        </c:if>
    </div>
</div>

<footer class="text-center">
    <p>Bool's Agence &copy; 2023</p>
</footer>

</body>
</html>
