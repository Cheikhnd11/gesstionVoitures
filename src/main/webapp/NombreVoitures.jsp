<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Voitures en Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .container {
            margin-top: 50px;
        }
        .card {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }
        .card-title {
            font-size: 1.5rem;
            color: #343a40;
        }
        .btn-custom {
            background-color: #007bff;
            color: #ffffff;
            border: none;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            color: #ffffff;
        }
        footer {
            margin-top: 50px;
            padding: 20px;
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="card">
                <h1 class="card-title">Nombre de Voitures en Stock</h1>
                <p class="card-text fs-2">
                    <strong><c:out value="${nombre}"/></strong>
                </p>
                <a class="btn btn-custom btn-lg" href="ListeVoitures.jsp">Afficher la Liste des Voitures</a>
            </div>
        </div>
    </div>
</div>

<footer>
    <p>&copy; 2024 Bool's Agence. Tous droits réservés.</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
