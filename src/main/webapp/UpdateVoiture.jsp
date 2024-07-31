<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 31/07/2024
  Time: 19:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Mettre à jour une Voiture</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Montserrat:400,500,600,700|Poppins:400,500&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            user-select: none;
        }
        body {
            font-family: 'Poppins', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: #f2f2f2;
        }
        .container {
            display: flex;
            width: 80%;
            max-width: 1200px;
            background: #fff;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .image-section {
            width: 40%;
            background: url('update-image.jpg') no-repeat center center;
            background-size: cover;
        }
        .form-section {
            width: 60%;
            padding: 40px;
        }
        .form-section header {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 20px;
            color: #333;
        }
        .field {
            position: relative;
            height: 50px;
            width: 100%;
            display: flex;
            background: #f9f9f9;
            margin-top: 12px;
            border-radius: 5px;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
        }
        .field span {
            color: #007bff;
            width: 40px;
            line-height: 50px;
            text-align: center;
            font-size: 20px;
        }
        .field input, .field select {
            height: 100%;
            width: calc(100% - 40px);
            background: transparent;
            border: none;
            outline: none;
            color: #333;
            font-size: 16px;
        }
        .field input[type="submit"] {
            background: #007bff;
            border: none;
            color: white;
            font-size: 18px;
            letter-spacing: 1px;
            font-weight: 600;
            cursor: pointer;
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
            transition: background 0.3s ease;
        }
        .field input[type="submit"]:hover {
            background: #0056b3;
        }
        .message {
            margin-bottom: 20px;
            color: #dc3545;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="image-section">
        <!-- Vous pouvez mettre une image pertinente pour la mise à jour ici -->
    </div>
    <div class="form-section">
        <header>Mettre à jour une Voiture</header>
        <form action="UpdateVoitureServlet" method="post">
            <div class="field">
                <span class="fa fa-car"></span>
                <input type="text" name="immatriculation" value="${voiture.immatriculation}" readonly>
            </div>
            <div class="field">
                <span class="fa fa-users"></span>
                <input type="number" name="nombreDePlace" value="${voiture.nombreDePlace}">
            </div>
            <div class="field">
                <span class="fa fa-industry"></span>
                <input type="text" name="marque" value="${voiture.marque}">
            </div>
            <div class="field">
                <span class="fa fa-car-side"></span>
                <input type="text" name="modele" value="${voiture.modele}">
            </div>
            <div class="field">
                <span class="fa fa-calendar"></span>
                <input type="date" name="anneeDeMiseEnService" value="${voiture.anneeDeMiseEnService}">
            </div>
            <div class="field">
                <span class="fa fa-tachometer-alt"></span>
                <input type="number" name="kilometrage" value="${voiture.kilomeetrage}">
            </div>
            <div class="field">
                <span class="fa fa-gas-pump"></span>
                <input type="text" name="typeCarburant" value="${voiture.typeCarburant}">
            </div>
            <div class="field">
                <span class="fa fa-list-alt"></span>
                <input type="text" name="categorie" value="${voiture.categorie}">
            </div>
            <div class="field">
                <span class="fa fa-dollar-sign"></span>
                <input type="number" name="prixDeLocationParJour" value="${voiture.prixDeLocationParJour}">
            </div>
            <div class="field">
                <input type="submit" value="Mettre à jour">
            </div>
        </form>
        <div class="message">
            ${errorMessage}
        </div>
    </div>
</div>
</body>
</html>
