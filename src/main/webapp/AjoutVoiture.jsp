<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 17/07/2024
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr" dir="ltr">
<head>
    <meta charset="utf-8">
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
            background: url('bg.jpg');
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
            width: 370px;
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
        }
        .field span {
            color: #222;
            width: 40px;
            line-height: 45px;
        }
        .field input {
            height: 100%;
            width: 100%;
            background: transparent;
            border: none;
            outline: none;
            color: #222;
            font-size: 16px;
            font-family: 'Poppins', sans-serif;
        }
        .space {
            margin-top: 16px;
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
        }
        .field input[type="submit"]:hover {
            background: #2691d9;
        }
    </style>
</head>
<body>
<div class="bg-img">
    <div class="content">
        <header>Ajouter une Voiture</header>
        <form action="#" method="POST">
            <div class="field">
                <span class="fa fa-car"></span>
                <input type="text" name="matricule" required placeholder="Matricule">
            </div>
            <div class="field space">
                <span class="fa fa-car"></span>
                <input type="text" name="nombreDePlace" required placeholder="Nombre de Place">
            </div>
            <div class="field space">
                <span class="fa fa-tag"></span>
                <input type="text" name="marque" required placeholder="Marque">
            </div>
            <div class="field space">
                <span class="fa fa-car"></span>
                <input type="text" name="model" required placeholder="Model">
            </div>
            <div class="field space">
                <span class="fa fa-tag"></span>
                <input type="number" name="anneeDeMiseEnService" required placeholder="Année de mise en service">
            </div>
            <div class="field space">
                <span class="fa fa-tag"></span>
                <input type="text" name="kilomeetrage" required placeholder="Kilométrage">
            </div>
            <div class="field space">
                <span class="fa fa-palette"></span>
                <input type="text" name="typeCarburant" required placeholder="Type de Carburant">
            </div>
            <div class="field space">
                <span class="fa fa-info-circle"></span>
                <input type="text" name="categorie" required placeholder="categorie">
            </div>
            <div class="field space">
                <span class="fa fa-dollar-sign"></span>
                <input type="number" name="prixDeLocationParJour" required placeholder="Prix de Location par jour">
            </div>
            <div class="field space">
                <input type="submit" value="Ajouter">
            </div>
        </form>
    </div>
</div>
</body>
</html>

