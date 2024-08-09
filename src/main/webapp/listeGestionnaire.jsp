<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="fr">
<head>
    <title>Affichage Client - Agence de Location</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #f4f4f9;
            padding: 50px;
        }
        .navbar {
            margin-bottom: 20px;
        }
        .navbar-brand {
            font-size: 1.8em;
            color: #ffffff;
        }
        .main-title {
            font-size: 2.5em;
            margin-bottom: 20px;
            color: #333;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            margin-top: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .image-section {
            flex: 1;
            text-align: center;
            padding: 20px;
            border-right: 3px solid #007bff;
        }
        .form-section {
            flex: 2;
            padding: 20px;
        }
        .image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .btn-client {
            background-color: #ff003b;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-client:hover {
            background-color: #e60023;
            transform: translateY(-2px);
        }
        .btn-client:active {
            background-color: #b3001a;
            transform: translateY(0);
        }
        table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-bottom: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #dee2e6;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #e9ecef;
        }
        footer {
            margin-top: 30px;
            padding: 10px;
            background-color: #343a40;
            color: #ffffff;
            text-align: center;
            border-top: 1px solid #e9ecef;
        }
        .btn-back {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 1.1em;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .btn-back:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Bool's Agence</a>
</nav>

<div class="container">
    <div class="image-section">
        <img src="img/searche.jpg" alt="Recherche">
        <a class="btn-back" href="javascript:history.back()">Page précédente</a>
    </div>
    <div class="form-section">
        <h1 class="main-title">Liste des gestionnaires de l'Agence</h1>

        <c:if test="${!empty utilisateurs}">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Identifiant</th>
                    <th>Nom</th>
                    <th>Prénom</th>
                    <th>Âge</th>
                    <th>E-mail</th>
                    <th>Adresse</th>
                    <th>Rôle</th>
                    <th>Mot de passe</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="m" items="${utilisateurs}">
                    <tr>
                        <td><c:out value="${m.identifient}"/></td>
                        <td><c:out value="${m.nom}"/></td>
                        <td><c:out value="${m.prenom}"/></td>
                        <td><c:out value="${m.age}"/></td>
                        <td><c:out value="${m.email}"/></td>
                        <td><c:out value="${m.adresse}"/></td>
                        <td><c:out value="${m.role}"/></td>
                        <td><c:out value="${m.password}"/></td>
                        <td>
                            <form action="SuppressionGestionnaireServlet" method="post">
                                <input type="hidden" name="id" value="${m.identifient}">
                                <button type="submit" class="btn-client">Supprimer</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${empty utilisateurs}">
            <strong><p>Aucun gestionnaire n'est dans la base de données pour le moment.</p></strong>
        </c:if>
    </div>
</div>

<footer>
    <p>Bool's Agence &copy; 2024</p>
</footer>

</body>
</html>
