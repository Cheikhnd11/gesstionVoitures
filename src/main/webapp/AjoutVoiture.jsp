<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 17/07/2024
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ajouter une Voiture</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700|Poppins:400,500&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            user-select: none;
        }
        .bg-img {
            background: url('');
            height: 100vh;
            background-size: cover;
            background-position: center;
        }
        .bg-img:after {
            position: absolute;
            content: '';
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: rgba(0,0,0,0.7);
        }
        .content {
            position: absolute;
            top: 50%;
            left: 50%;
            z-index: 999;
            text-align: center;
            padding: 60px 32px;
            width: 400px;
            transform: translate(-50%,-50%);
            background: rgba(255,255,255,0.04);
            box-shadow: -1px 4px 28px 0px rgba(0,0,0,0.75);
        }
        .content header {
            color: white;
            font-size: 33px;
            font-weight: 600;
            margin: 0 0 35px 0;
            font-family: 'Montserrat', sans-serif;
        }
        .field {
            position: relative;
            height: 45px;
            width: 100%;
            display: flex;
            background: rgba(255,255,255,0.94);
            margin-top: 16px;
        }
        .field span {
            color: #222;
            width: 40px;
            line-height: 45px;
        }
        .field input, .field select {
            height: 100%;
            width: 100%;
            background: transparent;
            border: none;
            outline: none;
            color: #222;
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
        }
        .field input[type="submit"] {
            background: #3498db;
            border: 1px solid #2691d9;
            color: white;
            font-size: 18px;
            letter-spacing: 1px;
            font-weight: 600;
            cursor: pointer;
            font-family: 'Montserrat', sans-serif;
            margin-top: 16px;
        }
        .field input[type="submit"]:hover {
            background: #2691d9;
        }
        .btn-back {
            display: inline-block;
            padding: 10px 20px;
            background-color: #555;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }

        .btn-back:hover {
            background-color: #333;
        }.btn-back {
             display: inline-block;
             padding: 10px 20px;
             background-color: #555;
             color: white;
             text-decoration: none;
             border-radius: 5px;
             margin-top: 10px;
             transition: background-color 0.3s ease;
         }


    </style>
</head>
<body>
<div class="bg-img">
    <div class="content">
        <header>Ajouter une Voiture</header>
        <form action="VoitureServlet" method="post">
            <div class="field">
                <span class="fa fa-car"></span>
                <input type="text" name="Immatriculation" required placeholder="Immatriculation">
            </div>
            <div class="field">
                <span class="fa fa-tag"></span>
                <input type="text" name="marque" required placeholder="Marque">
            </div>
            <div class="field">
                <span class="fa fa-car-side"></span>
                <input type="text" name="modele" required placeholder="Modèle">
            </div>
            <div class="field">
                <span class="fa fa-calendar-alt"></span>
                <input type="Date" name="anneeDeMiseEnService" required placeholder="Année de Mise en Circulation">
            </div>
            <div class="field">
                <span class="fa fa-tachometer-alt"></span>
                <input type="number" name="kilomeetrage" required placeholder="Kilométrage">
            </div>
            <div class="field">
                <span class="fa fa-gas-pump"></span>
                <select name="typeCarburant" required>
                    <option value="">Type de Carburant</option>
                    <option value="Essence">Essence</option>
                    <option value="Diesel">Diesel</option>
                    <option value="Electrique">Électrique</option>
                    <option value="Hybride">Hybride</option>
                </select>
            </div>
            <div class="field">
                <span class="fa fa-list"></span>
                <select name="categorie" required>
                    <option value="">Catégorie</option>
                    <option value="Citadine">Citadine</option>
                    <option value="Berline">Berline</option>
                    <option value="SUV">SUV</option>
                    <option value="Utilitaire">Utilitaire</option>
                </select>
            </div>
            <div class="field">
                <span class="fa fa-dollar-sign"></span>
                <input type="number" name="prixDeLocationParJour" required placeholder="Prix de Location par Jour">
            </div>
            <div class="field">
                <input type="submit" value="Ajouter">
            </div>
            <div class="field">
                <a href="javascript:history.back()" class="btn-back">Retour</a>
            </div>

        </form>
    </div>
</div>
</body>
</html>
