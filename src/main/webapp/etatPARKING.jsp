<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 01/08/2024
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Etat du Parking - Bool's Agence</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="aff/assets/favicon.ico" />
    <!-- Bootstrap icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap) -->
    <link href="aff/css/styles.css" rel="stylesheet" />
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .navbar {
            background-color: #343a40;
        }
        .navbar-brand, .nav-link {
            color: #ffffff !important;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .navbar-brand:hover, .nav-link:hover {
            color: #d1d1d1 !important;
        }
        header {
            background: linear-gradient(to right, #007bff, #00d2ff);
            color: #ffffff;
            padding: 4rem 0;
            text-align: center;
        }
        header h1 {
            font-size: 3rem;
            font-weight: 700;
            text-shadow: 2px 2px 6px rgba(0, 0, 0, 0.5);
            margin-bottom: 1rem;
        }
        header p {
            font-size: 1.25rem;
            font-weight: 300;
            margin-bottom: 2rem;
        }
        .btn-custom {
            background-color: #007bff;
            color: #ffffff;
            border: none;
            border-radius: 25px;
            padding: 12px 24px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            font-weight: 600;
            letter-spacing: 0.5px;
        }
        .btn-custom:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }
        .btn-outline-light {
            border-color: #ffffff;
            color: #ffffff;
            transition: color 0.3s ease, border-color 0.3s ease;
        }
        .btn-outline-light:hover {
            color: #007bff;
            border-color: #007bff;
        }
        .card {
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            background-color: #ffffff;
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        .card-img-top {
            border-bottom: 2px solid #007bff;
            transition: transform 0.3s ease;
        }
        .card-img-top:hover {
            transform: scale(1.05);
        }
        .card-body {
            padding: 2rem;
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #333;
            transition: color 0.3s ease;
        }
        .card-title:hover {
            color: #007bff;
        }
        .card-text {
            color: #666;
            font-size: 1rem;
            line-height: 1.6;
            transition: color 0.3s ease;
        }
        .card-text:hover {
            color: #007bff;
        }
        .text-muted {
            font-size: 1rem;
            color: #666;
        }
        .text-primary {
            color: #007bff !important;
        }
        .bg-primary {
            background-color: #007bff !important;
        }
        footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 2rem 0;
            text-align: center;
        }
        footer a {
            color: #d1d1d1;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        footer a:hover {
            color: #ffffff;
        }
        .call-to-action {
            background: linear-gradient(to right, #007bff, #00d2ff);
            color: #ffffff;
            padding: 3rem;
            border-radius: 12px;
            text-align: center;
            margin-top: 2rem;
        }
        .call-to-action h2 {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 1rem;
        }
        .call-to-action p {
            font-size: 1.125rem;
            margin-bottom: 0;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container px-5">
        <a class="navbar-brand" href="index.html">Bool's Agence</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link" href="javascript:history.back()">Accueil</a></li>
                <li class="nav-item"><a class="nav-link" href="#">À Propos</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Contact</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Header -->
<header>
    <div class="container">
        <h1>ETAT DU PARKING</h1>
        <p>Découvrez toutes les voitures disponibles ou en location dans le parking en un seul clic !</p>
        <a class="btn btn-custom" href="ListeVoituresServlet">Voir les Voitures</a>
        <a class="btn btn-outline-light ms-3" href="#!">En Savoir Plus</a>
    </div>
</header>

<!-- Blog preview section -->
<section class="py-5">
    <div class="container px-5 my-5">
        <div class="text-center mb-4">
            <h2 class="fw-bolder">Nos Options de Voitures</h2>
            <p class="lead text-muted">Explorez nos différentes options de voitures disponibles.</p>
        </div>
        <div class="row gx-5">
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="img/retout.jpg" alt="Voitures Disponibles" />
                    <div class="card-body">
                        <div class="badge bg-primary text-white rounded-pill mb-2">DISPONIBLE</div>
                        <a class="text-decoration-none link-dark stretched-link" href="VoitureDisponibleServlet">
                            <h5 class="card-title">Les Voitures Disponibles</h5>
                        </a>
                        <p class="card-text">Consultez la liste des voitures actuellement disponibles pour location. Chaque voiture est vérifiée pour répondre aux normes les plus élevées.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="img/deux.jpg" alt="Nombre de Voitures" />
                    <div class="card-body">
                        <div class="badge bg-primary text-white rounded-pill mb-2">NOMBRE DE VOITURES</div>
                        <a class="text-decoration-none link-dark stretched-link" href="ListeVoituresServlet">
                            <h5 class="card-title">L'entreprise dispose <c:out value="${nombre}"/> voitures</h5>
                        </a>
                        <p class="card-text"><span>Apputez </span>pour voir la liste de toutes les voitures.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 mb-4">
                <div class="card h-100">
                    <img class="card-img-top" src="img/updateVoiture.png" alt="Voitures en Location" />
                    <div class="card-body">
                        <div class="badge bg-primary text-white rounded-pill mb-2">EN LOCATION</div>
                        <a class="text-decoration-none link-dark stretched-link" href="VoitureNonDisponibleServlet">
                            <h5 class="card-title">Les Voitures en Location</h5>
                        </a>
                        <p class="card-text">Voir les voitures actuellement en location. Assurez-vous de vérifier la disponibilité avant de réserver pour éviter toute surprise.</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="call-to-action mt-5">
            <h2>Votre Vie Privée, Notre Priorité</h2>
            <p>Satisfaction des clients est notre priorité chez Bool's Agence. Nous nous engageons à vous offrir la meilleure expérience possible.</p>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <div class="col-auto">
                <div class="small">Copyright &copy; Bool's Agence 2024</div>
            </div>
            <div class="col-auto">
                <a class="text-light small" href="politique.jsp">Privacy</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="text-light small" href="politique.jsp">Terms</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="text-light small" href="#!">Contact</a>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap core JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS -->
<script src="js/scripts.js"></script>
</body>
</html>

