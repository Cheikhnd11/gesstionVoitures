<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 31/07/2024
  Time: 02:09
  To change this template use File | Settings | File Templates.
--%>
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
            font-family: 'Arial', sans-serif;
            background-color: #f7f9fc;
            color: #333;
            line-height: 1.6;
        }
        .navbar {
            background-color: #1a1a1a;
        }
        .navbar-brand {
            font-size: 1.75rem;
            font-weight: bold;
            color: #ffffff !important;
        }
        .nav-link {
            color: #ffffff !important;
            font-weight: 500;
        }
        .nav-link:hover {
            color: #d1d1d1 !important;
        }
        .btn-primary-custom {
            background-color: #007bff;
            border: none;
            border-radius: 0.5rem;
            padding: 0.75rem 1.5rem;
            font-size: 1.125rem;
            font-weight: bold;
            color: white;
            transition: all 0.3s ease;
        }
        .btn-primary-custom:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn-outline-custom {
            border-color: #007bff;
            color: #007bff;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-outline-custom:hover {
            background-color: #007bff;
            color: white;
        }
        .card {
            border-radius: 0.75rem;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            min-width: 300px; /* Fixe une largeur minimale pour les cartes */
            flex: 1 1 300px; /* Permet aux cartes de s'ajuster */
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }
        .card-body {
            padding: 1.5rem;
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff;
        }
        .card-text {
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }
        .card-footer {
            background-color: #f1f3f5;
            border-top: 1px solid #e9ecef;
        }
        .badge-custom {
            background-color: #007bff;
            color: white;
        }
        .section-header {
            margin-bottom: 3rem;
        }
        .section-header h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #333;
        }
        .bg-primary-custom {
            background-color: #007bff;
            color: white;
            padding: 2rem;
            border-radius: 1rem;
            text-align: center;
        }
        .call-to-action {
            background: linear-gradient(135deg, #007bff 0%, #00d2ff 100%);
            color: white;
            padding: 2.5rem;
            border-radius: 1rem;
            text-align: center;
            margin-top: 2rem;
        }
        .call-to-action h2 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }
        .call-to-action p {
            font-size: 1.125rem;
        }
        .text-primary-custom {
            color: #007bff;
        }
        .bg-dark-custom {
            background-color: #343a40;
        }
        .text-dark-custom {
            color: #343a40;
        }
        .car-container {
            display: flex;
            flex-wrap: wrap; /* Permet aux cartes de passer à la ligne suivante */
            gap: 1rem;
            padding: 1rem 0;
        }
        /* Styles pour le tableau */
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
    </style>

</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Bool's Agence</a>
</nav>

<div class="container">
    <div class="image-section">
        <img src="img/parking.jpg" alt="Recherche Voiture">
    </div>
    <div class="results-section">
        <h1 class="main-title">Résultats de la Recherche</h1>

        <c:if test="${!empty voitures}">
            <table class="results-table">
                <thead>
                <tr>
                    <th>Immatriculation</th>
                    <th>Nobre de place</th>
                    <th>Marque</th>
                    <th>Modèle</th>
                    <th>Année de mise en service</th>
                    <th>Kilométrage</th>
                    <th>Type de Carburant</th>
                    <th>Catégorie</th>
                    <th>Prix de location par jour</th>
                    <th>Louer la voiture</th>
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
                        <td>
                            <c:choose>
                                <c:when test="${voiture.status != 'en cours de location'}">
                                    <a href="saisirInfoLocation.jsp?Immatriculation=${voiture.immatriculation}&kilomeetrage=${voiture.kilomeetrage}&prixDeLocationParJour=${voiture.prixDeLocationParJour}" class="btn btn-primary btn-sm">Louer</a>
                                </c:when>
                                <c:otherwise>
                                    <span>En cours de location!</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>


        <c:if test="${empty voitures}">
            <p class="no-results">Aucun résultat trouvé pour les critères de recherche fournis.</p>
        </c:if>
    </div>
</div>

<footer class="text-center">
    <p>Bool's Agence &copy; 2023</p>
</footer>

</body>
</html>
