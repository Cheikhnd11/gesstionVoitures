<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.booles.gestionvoiture.RevenuVoiture" %>
<%@ page import="com.booles.gestionvoiture.RevenuClient" %>
<html lang="fr">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Bilan Financier - Bool's Agence</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="aff/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="aff/css/styles.css" rel="stylesheet" />
    <!-- Custom styles for this page-->
    <style>
        body {
            font-family: 'Arial', sans-serif;
        }
        .revenue-table th, .revenue-table td {
            text-align: center;
            vertical-align: middle;
        }
        .revenue-table {
            margin-top: 20px;
        }
        .no-data {
            text-align: center;
            font-style: italic;
            color: #6c757d;
        }
        .btn-details {
            margin: 2px;
            padding: 8px 12px;
            font-size: 14px;
        }
        .btn-details i {
            margin-right: 5px;
        }
        .card-body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 10px;
            overflow: hidden;
        }
        .header-img {
            border-radius: 15px;
        }
        .table th {
            background-color: #343a40;
            color: white;
        }
        .table-striped tbody tr:nth-of-type(odd) {
            background-color: #f2f2f2;
        }
        .table-striped tbody tr:hover {
            background-color: #e9ecef;
        }
        .footer {
            background-color: #343a40;
            color: white;
            padding: 15px 0;
        }
        .footer a {
            color: #adb5bd;
        }
        .footer a:hover {
            color: white;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container px-5">
            <a class="navbar-brand" href="#">Bool's Agence</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="javascript:history.back()">Tableau de bord</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-5">
            <div class="row gx-5 align-items-center justify-content-center">
                <div class="col-lg-8 col-xl-7 col-xxl-6">
                    <div class="my-5 text-center text-xl-start">
                        <h1 class="display-5 fw-bolder text-white mb-2">Pour tous Informations sur le Bilan Financier</h1>
                        <p class="lead fw-normal text-white-50 mb-4">C'est ici !!</p>
                    </div>
                </div>
                <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center">
                    <img class="img-fluid header-img" src="img/fall.jpg" alt="Bilan Financier" />
                </div>
            </div>
        </div>
    </header>

    <!-- Blog preview section-->
    <section class="py-5">
        <div class="container px-5 my-5">
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-8 col-xl-6">
                    <div class="text-center">
                        <h2 class="fw-bolder">Le Bilan Financier</h2>
                        <p class="lead fw-normal text-muted">Voici les revenus générés par chaque voiture et chaque client pour le mois en cours.</p>
                    </div>
                </div>
            </div>

            <!-- La zone d'affichage du bilan financier -->
            <div class="row gx-5">
                <div class="col-lg-12 mb-5">
                    <div class="card h-100 shadow border-0">
                        <div class="card-body p-4">
                            <!-- Affichage du revenu total -->
                            <h4 class="text-center mb-4">Revenu Total du Mois: <c:out value="${totalRevenue}"/> fcfa</h4>
                            <hr/>

                            <!-- Table to display voiture revenue -->
                            <h5 class="text-center mb-4">Revenus par Voiture</h5>
                            <table class="table table-striped table-bordered revenue-table">
                                <thead>
                                <tr>
                                    <th>Immatriculation</th>
                                    <th>Revenu Total (FCFA)</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="revenu" items="${revenus}">
                                    <tr>
                                        <td><c:out value="${revenu.immatriculation}"/></td>
                                        <td><c:out value="${revenu.revenuTotal}"/> fcfa</td>
                                        <td>
                                            <form action="RechercherVoitureByImtServlet" method="post">
                                                <input type="hidden" name="voiture" value="${revenu.immatriculation}">
                                                <button type="submit" class="btn btn-primary btn-details"><i class="bi bi-car-front"></i> Afficher Voiture</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty revenus}">
                                    <tr>
                                        <td colspan="3" class="no-data">Aucun revenu à afficher pour le mois en cours.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>

                            <!-- Table to display client revenue -->
                            <h5 class="text-center mb-4">Revenus par Client</h5>
                            <table class="table table-striped table-bordered revenue-table">
                                <thead>
                                <tr>
                                    <th>ID Client</th>
                                    <th>Revenu Total (FCFA)</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="revenuClient" items="${revenuClients}">
                                    <tr>
                                        <td><c:out value="${revenuClient.clientId}"/></td>
                                        <td><c:out value="${revenuClient.revenuTotal}"/> fca</td>
                                        <td>
                                            <form action="RechercherClientServlet" method="post">
                                                <input type="hidden" name="clientId" value="${revenuClient.clientId}">
                                                <button type="submit" class="btn btn-primary btn-details"><i class="bi bi-person-fill"></i> Afficher Client</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty revenuClients}">
                                    <tr>
                                        <td colspan="3" class="no-data">Aucun revenu par client à afficher pour le mois en cours.</td>
                                    </tr>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
                <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
                    <div class="mb-4 mb-xl-0">
                        <div class="fs-3 fw-bold text-white">Votre vie Privée, notre Priorité.</div>
                        <div class="text-white-50">Satisfaction des clients est la priorité de Bool's Automobile.</div>
                    </div>
                </div>
            </aside>
        </div>
    </section>
</main>
<!-- Footer-->
<footer class="footer">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto">
                <div class="small m-0 text-white">Copyright &copy; Bool's_Agence 2024</div>
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
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>
