<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 17/07/2024
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ajouter / Mettre à jour un Client</title>
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

        <form action="UpdateClientServlet" method="post">
            <div class="field">
                <span class="fa fa-id-badge"></span>
                <input type="text" name="identifient" value="<c:out value='${client.identifient}'/>" readonly>
            </div>
            <div class="field">
                <span class="fa fa-user"></span>
                <input type="text" name="nom" value="<c:out value='${client.nom}'/>">
            </div>
            <div class="field">
                <span class="fa fa-user"></span>
                <input type="text" name="prenom" value="<c:out value='${client.prenom}'/>">
            </div>
            <div class="field">
                <span class="fa fa-calendar"></span>
                <input type="number" name="age" value="<c:out value='${client.age}'/>">
            </div>
            <div class="field">
                <span class="fa fa-envelope"></span>
                <input type="email" name="email" value="<c:out value='${client.email}'/>">
            </div>
            <div class="field">
                <span class="fa fa-map-marker-alt"></span>
                <input type="text" name="adresse" value="<c:out value='${client.adresse}'/>">
            </div>
            <div class="field">
                <span class="fa fa-phone"></span>
                <input type="tel" name="telephone" value="<c:out value='${client.telephone}'/>">
            </div>
            <div class="field">
                <input type="submit" value="Mettre a jour">

            </div>
        </form>
    </div>
</div>
</body>
</html>
