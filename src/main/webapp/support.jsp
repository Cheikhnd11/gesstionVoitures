<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 06/08/2024
  Time: 21:58
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Contactez les Administrateurs - Bool's Agence</title>
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="aff/assets/favicon.ico" />
    <!-- Bootstrap icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap) -->
    <link href="aff/css/styles.css" rel="stylesheet" />
    <!-- Custom Styles -->
    <style>
        .admin-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .admin-card:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        .admin-card .card-body {
            text-align: center;
        }
        .admin-card .card-body img {
            border-radius: 50%;
            width: 120px;
            height: 120px;
            object-fit: cover;
            margin-bottom: 1rem;
        }
        .bg-primary-custom {
            background-color: #007bff;
            color: white;
        }
        .section-header h2 {
            font-size: 2rem;
            font-weight: bold;
            margin-bottom: 1.5rem;
        }
        .contact-form {
            max-width: 600px;
            margin: 0 auto;
        }
        .contact-form textarea {
            resize: none;
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
                        <h1 class="display-5 fw-bolder text-white mb-2">Contactez les Administrateurs</h1>
                        <p class="lead fw-normal text-white-50 mb-4">Si vous rencontrez un problème persistant, veuillez contacter nos administrateurs.</p>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Admins section -->
    <section class="py-5">
        <div class="container px-5 my-5">
            <div class="text-center section-header">
                <h2 class="fw-bolder">Nos Administrateurs</h2>
            </div>

            <!-- Admins cards -->
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
                <c:forEach var="admin" items="${admins}">
                    <div class="col">
                        <div class="card admin-card h-100 shadow border-0">
                            <img src="${admin.photoUrl}" alt="${admin.name}" class="card-img-top">
                            <div class="card-body">
                                <h5 class="card-title">${admin.name}</h5>
                                <p class="card-text"><i class="bi bi-envelope"></i> <a href="mailto:${admin.email}" class="text-decoration-none">${admin.email}</a></p>
                                <p class="card-text"><i class="bi bi-telephone"></i> ${admin.phone}</p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Contact form -->
            <div class="text-center my-5">
                <h3 class="fw-bolder">Formulaire de Contact</h3>
                <p class="lead fw-normal">Utilisez le formulaire ci-dessous pour envoyer un message à nos administrateurs.</p>
                <form class="contact-form" action="SendContactMessageServlet" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Votre Nom</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Votre Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="message" class="form-label">Votre Message</label>
                        <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Envoyer le Message</button>
                </form>
            </div>

            <aside class="bg-primary-custom rounded-3 p-4 p-sm-5 mt-5">
                <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                    <div class="mb-4 mb-xl-0">
                        <div class="fs-3 fw-bold text-white">Votre satisfaction est notre priorité.</div>
                        <div class="text-white-50">Nous sommes là pour vous aider. N'hésitez pas à nous contacter.</div>
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
