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
        .message {
            margin-bottom: 20px;
            color: #f00;
        }
    </style>
</head>
<body>
<div class="bg-img">
    <div class="content">
        <header><c:choose>
            <c:when test="${not empty client.identifiant}">Modifier un Client</c:when>
            <c:otherwise>Ajouter un Client</c:otherwise>
        </c:choose></header>
        <c:if test="${not empty message}">
            <div class="message"><c:out value="${message}"/></div>
        </c:if>
        <form action="ClientServlet" method="post">
            <!-- Champ caché pour indiquer l'action -->
            <input type="hidden" name="action" value="<c:choose>
                <c:when test="${not empty client.identifiant}">update</c:when>
                <c:otherwise>add</c:otherwise>
            </c:choose>">

            <div class="field">
                <span class="fa fa-id-badge"></span>
                <input type="text" name="identifiant" required placeholder="Identifiant" value="<c:out value='${client.identifiant}'/>">
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
                <input type="submit" value="<c:choose>
                    <c:when test="${not empty client.identifiant}">Mettre à jour</c:when>
                    <c:otherwise>Ajouter</c:otherwise>
                </c:choose>">
            </div>
        </form>
    </div>
</div>
</body>
</html>
