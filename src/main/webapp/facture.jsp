<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<div class="container">
    <h1 class="text-center">Facture de Location</h1>

    <div class="section-title">Informations Client</div>
    <div class="info"><span>Nom :</span><c:out value="${client.nom}"/></div>
    <div class="info"><span>Prenom :</span><c:out value="${client.prenom}"/></div>
    <div class="info"><span>Téléphone :</span><c:out value="${client.telephone}"/></div>

    <div class="section-title">Informations sur la Voiture</div>
    <div class="info"><span>Immatriculation :</span><c:out value="${location.voiture}"/></div>
    <div class="info"><span>Marque :</span><c:out value="${voiture.marque}"/></div>
    <div class="info"><span>Kilométrage :</span><c:out value="${location.kilometrage}"/> km</div>

    <div class="section-title">Détails de la Location</div>
    <div class="info"><span>Montant total de la location :</span><c:out value="${location.montantTotal}"/>  Cfa</div>
    <div class="info"><span>Date de Début :</span><c:out value="${location.dateDebut}"/></div>
    <div class="info"><span>Date de Fin :</span><c:out value="${location.dateFin}"/></div>
    <div class="info"><span>Nombre de Jours :</span><c:out value="${location.nombreJour}"/></div> jours</div>

    <div class="text-center">
        <button class="btn btn-success" onclick="window.print()">Imprimer la Facture</button>
    </div>
</div>

</body>
</html>
