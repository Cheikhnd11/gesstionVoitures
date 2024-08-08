<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Les Voitures Dispo - Bool's Agence</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="aff/assets/favicon.ico" />
    <!-- Bootstrap icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap) -->
    <link href="aff/css/styles.css" rel="stylesheet" />
    <!-- Custom Styles -->
    <style>
        .btn-client {
            background-color: #007bff; /* Couleur principale */
            color: white;
            border: none;
            border-radius: 0.375rem;
            padding: 0.5rem 1rem;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .btn-client:hover {
            background-color: #0056b3; /* Couleur au survol */
            transform: translateY(-2px);
        }
        .btn-client:active {
            background-color: #004085; /* Couleur lors du clic */
            transform: translateY(0);
        }
        .card-body {
            position: relative;
        }
        .card-footer {
            text-align: center;
        }
        .card-footer form {
            margin: 0;
        }
        .card-footer .btn-client {
            width: 100%;
        }
        .car-container {
            display: flex;
            flex-wrap: wrap; /* Permet aux cartes de passer à la ligne suivante */
            gap: 1rem;
        }
        .card {
            flex: 1 1 300px; /* Permet aux cartes de s'ajuster */
            min-width: 300px; /* Fixe une largeur minimale pour les cartes */
            max-width: 100%; /* Assure que les cartes ne dépassent pas leur conteneur */
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out; /* Transition pour l'effet de survol */
        }
        .card:hover {
            transform: translateY(-10px); /* Déplace la carte vers le haut */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* Ajoute une ombre portée pour l'effet de survol */
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
                        <h1 class="display-5 fw-bolder text-white mb-2">Les Voitures Louées</h1>
                        <p class="lead fw-normal text-white-50 mb-4">Retrouvez toutes les voitures de l'Agence qui ont été louées !</p>
                    </div>
                </div>
                <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                    <img class="img-fluid rounded-3 my-5" src="img/3.jpg" alt="..." />
                </div>
            </div>
        </div>
    </header>

    <!-- Blog preview section -->
    <section class="py-5">
        <div class="container px-5 my-5">
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-8 col-xl-6">
                    <div class="text-center">
                        <h2 class="fw-bolder">Les Voitures qui sont en Location</h2>
                    </div>
                </div>
            </div>

            <c:choose>
                <c:when test="${voitures!=null}">
            <!-- Zone d'affichage des voitures -->
            <c class="car-container">
                <c:forEach var="voiture" items="${voitures}">
                    <div class="card h-100 shadow border-0">
                        <div class="card-body p-4">
                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">Marque: <c:out value="${voiture.marque}"/></div>
                            <a class="text-decoration-none link-dark stretched-link">
                                <h5 class="card-title mb-3">Modèle: <c:out value="${voiture.modele}"/></h5>
                            </a>
                            <p class="card-text mb-0">Immatriculation: <c:out value="${voiture.immatriculation}"/></p>
                            <p class="card-text mb-0">Nombre de places: <c:out value="${voiture.nombreDePlace}"/></p>
                            <p class="card-text mb-0">Année de mise en Service: <c:out value="${voiture.anneeDeMiseEnService}"/></p>
                            <p class="card-text mb-0">Kilométrage: <c:out value="${voiture.kilomeetrage}"/></p>
                            <p class="card-text mb-0">Catégorie: <c:out value="${voiture.categorie}"/></p>
                            <p class="card-text mb-0">Type de carburant: <c:out value="${voiture.typeCarburant}"/></p>
                            <p class="card-text mb-0">Prix par jour: <c:out value="${voiture.prixDeLocationParJour}"/> FCFA</p>
                            <p class="card-text mb-0">Statut: <c:out value="${voiture.status}"/></p>
                        </div>
                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                            <form action="ClientDeLocationServlet" method="post">
                                <input type="hidden" name="idVoiture" value="${voiture.immatriculation}">
                                <button type="submit" class="btn-client"><i class="bi bi-person-fill"></i> Afficher Client</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
                    </c:when>
                <c:otherwise>
                    pas de voiture en location pour le moment!
                </c:otherwise>
                    </c:choose>
            </div>


            <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
                <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                    <div class="mb-4 mb-xl-0">
                        <div class="fs-3 fw-bold text-white">Votre vie privée, notre priorité.</div>
                        <div class="text-white-50">Satisfaction des clients, la priorité de Bool's Agence.</div>
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
                <a class="link-light small" href="politique.jsp">Privacy</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="politique.jsp">Terms</a>
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
