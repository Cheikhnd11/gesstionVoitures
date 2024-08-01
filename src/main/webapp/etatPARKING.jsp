<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 01/08/2024
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Etat du Parking</title>
</head>
<body>
<style>

    @import url('https://fonts.googleapis.com/css?family=Open+Sans');

    * {
        box-sizing: border-box;
    }

    body {
        background-color: #f6f5f7;
        font-family: 'Open Sans', sans-serif;
        margin-bottom: 50px;
    }

    .text-center {
        text-align: center;
    }

    .pricing-box-container {
        display: flex;
        align-items: center;
        justify-content: center;
        flex-wrap: wrap;
    }

    .pricing-box {
        background-color: #ffffff;
        box-shadow: 0px 2px 15px 0px rgba(0,0,0,0.5);
        border-radius: 4px;
        flex: 1;
        padding: 0 30px 30px;
        margin: 2%;
        min-width: 250px;
        max-width: 350px;
    }

    .pricing-box h5 {
        text-transform: uppercase;
    }

    .price {
        margin: 24px 0;
        font-size: 36px;
        font-weight: 900;
    }

    .price sub, .price sup {
        font-size: 16px;
        font-weight: 100;
    }

    .features-list {
        padding: 0;
        list-style-type: none;
    }

    .features-list li {
        font-weight: 100;
        padding: 12px 0;
        font-weight: 100;
    }

    .features-list li:not(:last-of-type) {
        border-bottom: 1px solid rgba(0, 0, 0, 0.1);
    }

    .btn-primary {
        border-radius: 25px;
        border: none;
        background-color: #EC1362;
        color: #ffffff;
        cursor: pointer;
        padding: 10px 15px;
        margin-top: 20px;
        text-transform: uppercase;
        transition: all 0.1s ease-in-out;
    }

    .btn-primary:hover {
        box-shadow: 0px 2px 15px 0px rgba(0,0,0,0.5);
        transform: translateY(-3px);
    }

    .pricing-box-bg-image {
        background-image: url('https://images.unsplash.com/photo-1550029402-226115b7c579?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=701&q=80');
        background-size: cover;
        background-position: center center;
        color: #ffffff;
    }

    .pricing-box-bg-image .features-list li {
        border-bottom-color: rgba(255, 255, 255, 1);
    }

    .pricing-box-bg-image .btn-primary {
        background-color: #ffffff;
        color: #000;
    }

    footer {
        background-color: #222;
        color: #fff;
        font-size: 14px;
        bottom: 0;
        position: fixed;
        left: 0;
        right: 0;
        text-align: center;
    }

    footer p {
        margin: 10px 0;
    }

    footer i {
        color: red;
    }

    footer a {
        color: #3C97BF;
        text-decoration: none;
    }
</style>
<h1 class="text-center">Découvrez Notre Sélection de Voitures de Location</h1>

<div class="pricing-box-container">
    <div class="pricing-box text-center">
        <h5>Voitures Disponibles à la Location</h5>
        <p class="price"><sup></sup>0<sub> disponibles</sub></p>
        <ul class="features-list">
            <li><strong>Luxueuses</strong> et Confortables</li>
            <li><strong>Économiques</strong> et Écologiques</li>
            <li><strong>Sécurité</strong> et Fiabilité</li>
        </ul>
        <a href="VoitureDIsponiblePARKING.jsp"> <button class="btn-primary">Voir plus D'information</button></a>
    </div>

    <div class="pricing-box pricing-box-bg-image text-center">
        <h5>Responsable</h5>

        <ul class="features-list">
            <li><strong>Véhicules de Prestige</strong></li>
            <li><strong>Assistance 24/7</strong></li>
            <li><strong>Entretien Inclus</strong></li>
            <li><strong>Service VIP</strong></li>
            <li><strong>Navigation GPS</strong></li>
            <li><strong>Wi-Fi Gratuit</strong></li>
        </ul>
    </div>

    <div class="pricing-box text-center">
        <h5>Voitures Non Louées</h5>
        <p class="price"><sup></sup>0<sub> disponibles</sub></p>
        <ul class="features-list">
            <li>Robustes et Fiables</li>
            <li><strong>100%</strong> Garantie de Satisfaction</li>
            <li>Modèles Rares</li>
            <li>Pure Plaisir de Conduite</li>
        </ul>
        <a href="VoitureNonDisponiblePARKING.jsp"><button class="btn-primary">Voir plus D'information</button></a>
    </div>
</div>


<footer>
    <p>Bool's Agence &copy; 2023</p>
</footer>
</body>
</html>
