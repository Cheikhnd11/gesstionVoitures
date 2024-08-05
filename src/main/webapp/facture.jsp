<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Facture de Location - Bool's Agence</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #9cd0dd;
            padding: 50px;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #ffffff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .logo {
            position: absolute;
            top: 20px;
            left: 20px;
        }
        .responsable-info {
            text-align: right;
            margin-top: -20px;
        }
        h1 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }
        .section-title {
            font-size: 1.5em;
            margin-top: 20px;
            color: #28a745;
            border-bottom: 2px solid #007bff;
            padding-bottom: 5px;
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
        .btn-back {
            margin-top: 20px;
        }
        .signature {
            margin-top: 50px;
            display: flex;
            justify-content: space-between;
            border-top: 2px solid #007bff;
            padding-top: 20px;
            font-size: 1.2em;
        }
        .signature div {
            width: 45%;
            text-align: center;
        }
        .signature h5 {
            margin: 0;
            font-weight: bold;
            color: #007bff;
        }
        .signature .label {
            color: #28a745;
            font-size: 1.2em;
            font-weight: normal;
        }
        .btn-print {
            margin-top: 20px;
            animation: shake 0.5s;
            animation-iteration-count: infinite;
        }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            50% { transform: translateX(5px); }
            75% { transform: translateX(-5px); }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="logo">
        <img style="width: 240px; height: 150px;" src="img/pngegg.png" alt="Logo">
    </div>
    <div class="responsable-info">
        <div>Responsable :</div>
        <div>Nom: <c:out value="${responsable.nom}"/></div>
        <div>Prénom: <c:out value="${responsable.prenom}"/></div>
        <div>Email: <c:out value="${responsable.email}"/></div>
    </div>
    <h1>Facture N° : <c:out value="${location.idLocation}"/></h1><br><br><br>

    <div class="section-title">Informations Client</div>
    <div class="info"><span>Nom :</span> <c:out value="${client.nom}"/></div>
    <div class="info"><span>Prénom :</span> <c:out value="${client.prenom}"/></div>
    <div class="info"><span>Téléphone :</span> <c:out value="${client.telephone}"/></div>

    <div class="section-title">Informations sur la Voiture</div>
    <div class="info"><span>Immatriculation :</span> <c:out value="${location.voiture}"/></div>
    <div class="info"><span>Marque :</span> <c:out value="${voiture.marque}"/></div>
    <div class="info"><span>Kilométrage :</span> <c:out value="${location.kilometrage}"/> km</div>

    <div class="section-title">Détails de la Location</div>
    <div class="info"><span>Montant total de la location :</span> <c:out value="${location.montantTotal}"/></div>
    <div class="info"><span>Date de Début :</span> <c:out value="${location.dateDebut}"/></div>
    <div class="info"><span>Date de Fin :</span> <c:out value="${location.dateFin}"/></div>
    <div class="info"><span>Nombre de Jours :</span> <c:out value="${location.nombreJour}"/> jours</div>

    <div class="signature">
        <div>
            <h5>Responsable :</h5>

        </div>
        <div>
            <h5>Client :</h5>

        </div>
    </div>

    <br><br><br><br>
    <div class="text-center">
        <button class="btn btn-success btn-print" onclick="window.print()">Imprimer la Facture</button>
    </div>
    <div class="text-center">
        <button class="btn btn-secondary btn-back" onclick="window.history.back()">Retour</button>
    </div>
</div>

</body>
</html>
