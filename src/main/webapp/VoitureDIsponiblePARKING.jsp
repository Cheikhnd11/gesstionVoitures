<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Les Voitures Disponibles - Bool's Agence</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="aff/assets/favicon.ico" />
    <!-- Bootstrap icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap) -->
    <link href="aff/css/styles.css" rel="stylesheet" />
    <!-- Custom Styles -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7f9fc;
            color: #333;
            line-height: 1.6;
        }
        .navbar {
            background-color: #1a1a1a;
        }
        .navbar-brand {
            font-size: 1.75rem;
            font-weight: bold;
            color: #ffffff !important;
        }
        .nav-link {
            color: #ffffff !important;
            font-weight: 500;
        }
        .nav-link:hover {
            color: #d1d1d1 !important;
        }
        .btn-primary-custom {
            background-color: #007bff;
            border: none;
            border-radius: 0.5rem;
            padding: 0.75rem 1.5rem;
            font-size: 1.125rem;
            font-weight: bold;
            color: white;
            transition: all 0.3s ease;
        }
        .btn-primary-custom:hover {
            background-color: #0056b3;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .btn-outline-custom {
            border-color: #007bff;
            color: #007bff;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        .btn-outline-custom:hover {
            background-color: #007bff;
            color: white;
        }
        .card {
            border-radius: 0.75rem;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            min-width: 300px; /* Fixe une largeur minimale pour les cartes */
            flex: 1 1 300px; /* Permet aux cartes de s'ajuster */
        }
        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 12px rgba(0, 0, 0, 0.2);
        }
        .card-body {
            padding: 1.5rem;
        }
        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff;
        }
        .card-text {
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }
        .card-footer {
            background-color: #f1f3f5;
            border-top: 1px solid #e9ecef;
        }
        .badge-custom {
            background-color: #007bff;
            color: white;
        }
        .section-header {
            margin-bottom: 3rem;
        }
        .section-header h2 {
            font-size: 2.5rem;
            font-weight: 700;
            color: #333;
        }
        .bg-primary-custom {
            background-color: #007bff;
            color: white;
            padding: 2rem;
            border-radius: 1rem;
            text-align: center;
        }
        .call-to-action {
            background: linear-gradient(135deg, #007bff 0%, #00d2ff 100%);
            color: white;
            padding: 2.5rem;
            border-radius: 1rem;
            text-align: center;
            margin-top: 2rem;
        }
        .call-to-action h2 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }
        .call-to-action p {
            font-size: 1.125rem;
        }
        .text-primary-custom {
            color: #007bff;
        }
        .bg-dark-custom {
            background-color: #343a40;
        }
        .text-dark-custom {
            color: #343a40;
        }
        .car-container {
            display: flex;
            flex-wrap: wrap; /* Permet aux cartes de passer à la ligne suivante */
            gap: 1rem;
            padding: 1rem 0;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark-custom">
        <div class="container px-5">
            <a class="navbar-brand" href="index.html">Bool's Agence</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="RecuperUserServlet">Accueil</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.html">À Propos</a></li>
                    <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Header -->
    <header class="bg-dark py-5">
        <div class="container px-5">
            <div class="row gx-5 align-items-center justify-content-center">
                <div class="col-lg-8 col-xl-7 col-xxl-6">
                    <div class="my-5 text-center text-xl-start">
                        <h1 class="display-4 fw-bold text-white mb-2">Les Voitures Disponibles</h1>
                        <p class="lead fw-normal text-white-50 mb-4">Découvrez les voitures disponibles dans l'<strong>ENTREPRISE</strong>. Pour donner unn retour au clients !</p>
                    </div>
                </div>
                <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                    <img class="img-fluid rounded-3 my-5" src="img/parking.jpg" alt="Parking" />
                </div>
            </div>
        </div>
    </header>

    <!-- Blog preview section -->
    <section class="py-5">
        <div class="container px-5 my-5">
            <div class="text-center section-header">
                <h2 class="fw-bold">Voitures Disponibles à la Location</h2>
            </div>

            <!-- Zone d'affichage des voitures -->
            <div class="car-container">
                <c:if test="${voitures!=null}">
                <c:forEach var="voiture" items="${voitures}">
                    <div class="card">
                        <div class="card-body">
                            <div class="badge badge-custom rounded-pill mb-2">Marque: <c:out value="${voiture.marque}"/></div>
                            <a class="text-decoration-none link-dark stretched-link">
                                <h5 class="card-title mb-3">Modèle: <c:out value="${voiture.modele}"/></h5>
                            </a>
                            <p class="card-text mb-0">Immatriculation: <c:out value="${voiture.immatriculation}"/></p>
                            <p class="card-text mb-0">Places: <c:out value="${voiture.nombreDePlace}"/></p>
                            <p class="card-text mb-0">Année: <c:out value="${voiture.anneeDeMiseEnService}"/></p>
                            <p class="card-text mb-0">Kilométrage: <c:out value="${voiture.kilomeetrage}"/> km</p>
                            <p class="card-text mb-0">Catégorie: <c:out value="${voiture.categorie}"/></p>
                            <p class="card-text mb-0">Carburant: <c:out value="${voiture.typeCarburant}"/></p>
                            <p class="card-text mb-0">Prix/jour: <c:out value="${voiture.prixDeLocationParJour}"/> FCFA</p>
                            <p class="card-text mb-0">Statut: <c:out value="${voiture.status}"/></p>
                        </div>
                    </div>
                </c:forEach>
                </c:if>
            </div>
            <c:if test="${voitures==null}">
                <c:out value="aucune voitures n'est disponible pour le moment !"/>
            </c:if>

            <aside class="call-to-action mt-5">
                <h2>Votre vie privée, notre priorité.</h2>
                <p>Nous nous engageons à offrir une expérience client exceptionnelle en mettant la satisfaction de nos clients au cœur de notre démarche.</p>
            </aside>
        </div>
    </section>
</main>
<!-- Footer -->
<footer class="bg-dark-custom py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="small m-0 text-white">Copyright &copy; Bool's Agence 2024</div>
            </div>
            <div class="col-auto">
                <a class="link-light small" href="politique.jsp">Confidentialité</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="politique.jsp">Conditions</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="#!">Contact</a>
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
