<%@ page import="com.booles.gestionvoiture.Utilisateur" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 14/07/2024
  Time: 03:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Tableau de Bord du Chef d'Agence</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.3.0/css/all.css" integrity="sha384-p6n2/DsgTNzYDBvAdB7FnV+2jc79rpbXoyOkEiCx63u4Z1o2Y+E7MLjlMaVI+RCp" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
    <style>
        .sb-sidenav-menu-heading {
            font-size: 0.85rem;
            color: rgba(255, 255, 255, 0.5);
            letter-spacing: 1px;
            text-transform: uppercase;
        }
        .breadcrumb-item {
            font-weight: bold;
            text-transform: uppercase;
        }
    </style>
</head>
<body class="sb-nav-fixed">
<%
    Utilisateur user = (Utilisateur) request.getAttribute("user");
    String prenom = "";
    String nom = "";
    if (user != null) {
        prenom = user.getPrenom();
        nom = user.getNom();
    }
%>
<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand ps-3" href="#">Bool's Agence</a>
    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
</nav>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">Principal</div>
                    <a class="nav-link" href="#">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        Tableau de Bord
                    </a>
                    <div class="sb-sidenav-menu-heading">Informations</div>

                    <a class="nav-link" href="creatGestionnaire.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-parking"></i></div>
                        AJOUTER UN GESTIONNAIRE!
                    </a>

                    <a class="nav-link" href="ListeGestionnaireServlet">
                        <div class="sb-nav-link-icon"><i class="fas fa-parking"></i></div>
                        LISTE GESTIONNAIRES!
                    </a>

                    <a class="nav-link" href="index.jsp">
                        <div class="sb-nav-link-icon"><i class="fas fa-parking"></i></div>
                        DÉCONNEXION!
                    </a>


                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">Connecté en tant que:</div>
                Chef d'Agence
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h3 class="mt-4">Bienvenu(e), <%= prenom %> <strong><%= nom %><strong/></h3>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active">Mon Tableau de Bord</li>
                </ol>
                <div class="row">
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-primary text-white mb-4">
                            <div class="card-body">les voitures les plus recherchées</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="VoituresPlusRechercherServlet">Voir les Détails</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-success text-white mb-4">
                            <div class="card-body">État du Parking</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="NombreDeVoitureServlet">Voir les Détails</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-4 col-md-6">
                        <div class="card bg-danger text-white mb-4">
                            <div class="card-body">bilan financier mensuel</div>
                            <div class="card-footer d-flex align-items-center justify-content-between">
                                <a class="small text-white stretched-link" href="RevenuVoituresServlet">Voir les Détails</a>
                                <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                Graphique en Aire sur la satisfaction des Clients
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                        </div>
                    </div>
                    <div class="col-xl-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                Graphique en Barres de Location des voiture
                            </div>
                            <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <footer class="py-4 bg-light mt-auto">
            <div class="container-fluid px-4">
                <div class="d-flex align-items-center justify-content-between small">
                    <div class="text-muted">&copy; Bool's Agence 2024</div>
                    <div>
                        <a href="politique.jsp">Sous Contrat de Licence de l'UASZ</a>
                        &middot;
                        <a href="politique.jsp">Termes &amp; Conditions</a>
                    </div>
                </div>
            </div>
        </footer>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="assets/demo/chart-area-demo.js"></script>
<script src="assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>
</body>
</html>
