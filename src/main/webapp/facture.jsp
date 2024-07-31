<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 31/07/2024
  Time: 01:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<html lang="fr">
<head>
    <title>Facture de Location - Bool's Agence</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #e9ecef;
            padding: 50px;
        }
        .container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #007bff;
        }
        .section-title {
            font-size: 1.5em;
            margin-top: 20px;
            color: #28a745;
        }
        .info {
            margin-bottom: 15px;
        }
        .info span {
            font-weight: bold;
        }
        .total {
            font-size: 1.5em;
            color: #007bff;
        }
    </style>
</head>
<body>

<%
    // Simple information que j'ai simuler pour le test de la facture
    String clientName = "Ablaye FAYE";
    String clientEmail = "Ablayefaye274@gmail.com";
    String clientPhone = "78-013-39-45";

    String Immatriculation = "DL-1230-B";
    String nomVoiture = "Lamborghini";
    String Model = "Centenario";
    String anneeVoiture = "2020";
    String kilometrage = "15000";
    String TypeCarburant = "Essence";
    String VoitureCathegorie = "Citadine";

    String dateDebut = "2024-07-25";
    String dateFin = "2024-07-30";
    int dure = 5;
    double prix_par_jour = 50000;
    double Montant = dure * prix_par_jour;
%>

<div class="container">
    <h1 class="text-center">Facture de Location</h1>

    <div class="section-title">Informations Client</div>
    <div class="info"><span>Nom :</span> <%= clientName %></div>
    <div class="info"><span>Email :</span> <%= clientEmail %></div>
    <div class="info"><span>Téléphone :</span> <%= clientPhone %></div>

    <div class="section-title">Informations sur la Voiture</div>
    <div class="info"><span>Immatriculation :</span> <%= Immatriculation %></div>
    <div class="info"><span>Marque :</span> <%= nomVoiture %></div>
    <div class="info"><span>Modèle :</span> <%= Model %></div>
    <div class="info"><span>Année :</span> <%= anneeVoiture %></div>
    <div class="info"><span>Kilométrage :</span> <%= kilometrage %> km</div>
    <div class="info"><span>Type de Carburant :</span> <%= TypeCarburant %></div>
    <div class="info"><span>Catégorie :</span> <%= VoitureCathegorie %></div>

    <div class="section-title">Détails de la Location</div>
    <div class="info"><span>Date de Début :</span> <%= dateDebut %></div>
    <div class="info"><span>Date de Fin :</span> <%= dateFin %></div>
    <div class="info"><span>Durée :</span> <%= dure %> jours</div>
    <div class="info"><span>Prix de Location par Jour :</span> <%= prix_par_jour %>FCFA</div>
    <div class="info total"><span>Total :</span> <%= Montant %>FCFA</div>

    <div class="text-center">
        <button class="btn btn-success" onclick="window.print()">Imprimer la Facture</button>
    </div>
</div>

</body>
</html>s
