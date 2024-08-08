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
            background-color: #f4f7f6;
            padding: 50px;
            font-family: 'Arial', sans-serif;
        }

        .navbar {
            margin-bottom: 30px;
            border-bottom: 2px solid #007bff;
        }

        .navbar-brand {
            font-weight: bold;
        }

        .navbar-nav .nav-link {
            color: #ffffff !important;
            font-weight: bold;
        }

        .navbar-nav .nav-link:hover {
            color: #007bff !important;
        }

        .main-title {
            font-size: 2.5em;
            color: #007bff;
            margin-bottom: 20px;
            text-align: center;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin-top: 20px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
            transition: transform 0.3s;
        }

        .image-section img:hover {
            transform: scale(1.05);
        }

        .results-section {
            flex: 2;
            padding: 20px;
        }

        .results-table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            background-color: #ffffff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .results-table th,
        .results-table td {
            padding: 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .results-table th {
            background-color: #007bff;
            color: white;
            font-weight: bold;
        }

        .results-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .results-table tr:hover {
            background-color: #e9ecef;
        }

        footer {
            margin-top: 30px;
            text-align: center;
            color: #6c757d;
            font-size: 0.9em;
        }

        .button-back {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.1em;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s, transform 0.3s;
            text-decoration: none;
            display: inline-block;
        }

        .button-back:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        .highlight-text {
            color: #007bff;
            font-weight: bold;
            font-style: italic;
        }

        .info-box {
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .info-box h2 {
            font-size: 1.5em;
            color: #333;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Bool's Agence</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="RecuperUserServlet">Accueil</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="about.html">À Propos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="contact.html">Contact</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container">
    <div class="image-section">
        <img src="img/parking.jpg" alt="Recherche Voiture">
        <br><br>
        <a href="javascript:history.back()" class="button-back">Page Précédente</a>
    </div>
    <div class="results-section">
        <p class="main-title">🔍 Découvrez les Véhicules les Plus Recherchés ! 🔍</p>

        <div class="info-box">
            <h2>🚗 Liste Triée par Ordre Décroissant 🚗</h2>
            <p>Explorez notre <span class="highlight-text">liste triée par ordre décroissant</span> des véhicules qui suscitent le plus d’intérêt auprès de notre clientèle. Cette liste vous révèle les modèles les plus convoités, vous offrant une vue claire des préférences actuelles de vos clients.</p>
        </div>

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
                    <th>Nombre de location</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="voiture" items="${voitures}">
                    <tr>
                        <td><c:out value="${voiture.immatriculation}"/></td>
                        <td><c:out value="${voiture.nombreDePlace}"/> plce</td>
                        <td><c:out value="${voiture.marque}"/></td>
                        <td><c:out value="${voiture.modele}"/></td>
                        <td><c:out value="${voiture.anneeDeMiseEnService}"/></td>
                        <td><c:out value="${voiture.kilomeetrage}"/> km</td>
                        <td><c:out value="${voiture.typeCarburant}"/></td>
                        <td><c:out value="${voiture.categorie}"/></td>
                        <td><c:out value="${voiture.prixDeLocationParJour}"/> €</td>
                        <td><c:out value="${voiture.nombreRecherche}"/> fois</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>

        <c:if test="${empty voitures}">
            <p>Pas de voitures recherchees pour le moment .</p>
        </c:if>
    </div>
</div>

<footer>
    <p>Bool's Agence &copy; 2023</p>
</footer>

</body>
</html>
