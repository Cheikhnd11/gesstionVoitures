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
        .btn-primary-custom {
            background-color: #007bff; /* Couleur principale */
            border: none;
            border-radius: 0.375rem;
            padding: 0.75rem 1.5rem;
            font-size: 1.125rem;
            font-weight: bold;
            color: white;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-primary-custom:hover {
            background-color: #0056b3; /* Couleur au survol */
            transform: translateY(-2px);
        }
        .btn-outline-custom {
            border-color: #007bff;
            color: #007bff;
            font-weight: bold;
        }
        .btn-outline-custom:hover {
            background-color: #007bff;
            color: white;
        }
        .card {
            border-radius: 0.75rem;
            overflow: hidden;
        }
        .card-body {
            padding: 1.5rem;
        }
        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
        }
        .card-text {
            font-size: 1rem;
            margin-bottom: 0.5rem;
        }
        .card-footer {
            background-color: #f8f9fa;
            border-top: 1px solid #dee2e6;
        }
        .badge-custom {
            background-color: #007bff;
            color: white;
        }
        .section-header {
            margin-bottom: 3rem;
        }
        .section-header h2 {
            font-size: 2rem;
            font-weight: bold;
        }
        .bg-primary-custom {
            background-color: #007bff;
            color: white;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="index.html">Bool's Agence</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
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
                        <h1 class="display-5 fw-bolder text-white mb-2">Les Voitures Disponibles</h1>
                        <p class="lead fw-normal text-white-50 mb-4">Retrouvez toutes les voitures disponibles dans notre parking !</p>
                        <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                            <a class="btn btn-primary-custom btn-lg px-4 me-sm-3" href="#features">Let's Go</a>
                            <a class="btn btn-outline-custom btn-lg px-4" href="#!">En Savoir plus</a>
                        </div>
                    </div>
                </div>
                <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="img/parking.jpg" alt="Parking" /></div>
            </div>
        </div>
    </header>

    <!-- Blog preview section -->
    <section class="py-5">
        <div class="container px-5 my-5">
            <div class="text-center section-header">
                <h2 class="fw-bolder">Les Voitures Disponibles à la Location</h2>
            </div>

            <!-- Zone d'affichage des voitures -->
            <c:forEach var="voiture" items="${voitures}">
                <div class="row gx-5 mb-4">
                    <div class="col-lg-4">
                        <div class="card h-100 shadow border-0">
                            <div class="card-body">
                                <div class="badge badge-custom bg-gradient rounded-pill mb-2">Marque: <c:out value="${voiture.marque}"/></div>
                                <a class="text-decoration-none link-dark stretched-link">
                                    <h5 class="card-title mb-3">Modèle: <c:out value="${voiture.modele}"/></h5>
                                </a>
                                <p class="card-text mb-0">Immatriculation: <c:out value="${voiture.immatriculation}"/></p>
                                <p class="card-text mb-0">Nombre de places: <c:out value="${voiture.nombreDePlace}"/></p>
                                <p class="card-text mb-0">Année de mise en service: <c:out value="${voiture.anneeDeMiseEnService}"/></p>
                                <p class="card-text mb-0">Kilométrage: <c:out value="${voiture.kilomeetrage}"/></p>
                                <p class="card-text mb-0">Catégorie: <c:out value="${voiture.categorie}"/></p>
                                <p class="card-text mb-0">Type de carburant: <c:out value="${voiture.typeCarburant}"/></p>
                                <p class="card-text mb-0">Prix par jour: <c:out value="${voiture.prixDeLocationParJour}"/> FCFA</p>
                                <p class="card-text mb-0">Statut: <c:out value="${voiture.status}"/></p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <aside class="bg-primary-custom rounded-3 p-4 p-sm-5 mt-5">
                <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                    <div class="mb-4 mb-xl-0">
                        <div class="fs-3 fw-bold">Votre vie privée, notre priorité.</div>
                        <div>Satisfaction des clients, la priorité de Bool's Agence.</div>
                    </div>
                </div>
            </aside>
        </div>
    </section>
</main>
<!-- Footer -->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="small m-0 text-white">Copyright &copy; Bool's Agence 2024</div>
            </div>
            <div class="col-auto">
                <a class="link-light small" href="#!">Privacy</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="#!">Terms</a>
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
