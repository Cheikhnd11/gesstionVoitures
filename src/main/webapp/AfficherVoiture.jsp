<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 23/07/2024
  Time: 02:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <title>Recherche de Voiture - Agence de Location</title>
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
            align-items: center;
            margin-top: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-section {
            flex: 1;
            text-align: center;
            padding: 20px;
            border-right: 3px solid #28a745;
        }
        .image-section {
            flex: 1;
            text-align: center;
            padding: 20px;
            border-left: 3px solid #28a745;
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
        .btn-search {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.1em;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .btn-search:hover {
            background-color: #218838;
        }
        footer {
            margin-top: 30px;
            color: #6c757d;
        }
        .aa {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.1em;
            background-color: #257a1b;
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .aa:hover {
            background-color: #dd0e34;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Bool's Agence</a>
</nav>

<div class="container">
    <div class="form-section">
        <h1 class="main-title">Recherche de Voiture</h1>
        <p>Recherchez une voiture enregistrée dans notre agence.</p><br><br>
        <form action="RechercherVoitureServlet" method="post">
            <div class="field">
                <label for="marque">Marque :</label>
                <input type="text" id="marque" name="marque">
            </div>
            <div class="field">
                <label for="NombredePlace">Nombre de Place :</label>
                <input type="text" id="NombredePlace" name="nombreDePlace">
            </div>
            <div class="field">
                <label for="kilometrage">Kilométrage :</label>
                <input type="number" id="kilometrage" name="kilometrage">
            </div>
            <div class="field">
                <label for="annee">Année de mise en circulation :</label>
                <input type="date" id="annee" name="annee">
            </div>
            <div class="field">
                <label for="carburant">Type de carburant :</label>
                <select id="carburant" name="carburant">
                    <option value="">Sélectionner</option>
                    <option value="Essence">Essence</option>
                    <option value="Diesel">Diesel</option>
                    <option value="Electrique">Électrique</option>
                    <option value="Hybride">Hybride</option>
                </select>
            </div>
            <div class="field">
                <label for="categorie">Catégorie :</label>
                <select id="categorie" name="categorie">
                    
                    <option value="Citadine">Citadine</option>
                    <option value="Berline">Berline</option>
                    <option value="SUV">SUV</option>
                    <option value="Utilitaire">Utilitaire</option>
                </select>
            </div>
            <input type="submit" value="Rechercher" class="btn-search">
        </form>
    </div>
    <div class="image-section">
        <img src="img/recherche.jpg" alt="Recherche Voiture"><br><br><br>
        <a href="javascript:history.back()" class="aa">Retour a la page d'acceuil</a>
    </div>
</div>

<footer class="text-center">
    <p>Bool's Agence &copy; 2023</p>
</footer>

</body>
</html>


</body>
</html>
