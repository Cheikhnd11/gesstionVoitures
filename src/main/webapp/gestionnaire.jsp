<%@ page import="com.booles.gestionvoiture.Utilisateur" %>
<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 17/07/2024
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tableau de Bord - Gestionnaire de Voitures</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        html, body, h1, h2, h3, h4, h5 {font-family: "Raleway", sans-serif}
        @keyframes blur {
            50% {
                filter: blur(20px);
                transform: skew(45deg);
            }
        }

        [anim="blur"]:not(.toggled) {
            animation: blur 5s infinite alternate;
        }

    </style>
</head>
<body class="w3-light-grey" style=" background: url('img/Fond (2).jpeg');
            height: 100vh;
            background-size: cover;
            background-position: center;">
<%
    Utilisateur user = (Utilisateur) request.getAttribute("user");
    String prenom = "";
    String nom = "";
    if (user != null) {
        prenom = user.getPrenom();
        nom = user.getNom();
    }
%>
<!-- Top container -->
<div class="w3-bar w3-top w3-dark-grey w3-large" style="z-index:4 ">
    <button class="w3-bar-item w3-button w3-hide-large w3-hover-none w3-hover-text-light-grey" onclick="w3_open();"><i class="fa fa-bars"></i> Menu</button>
    <span class="w3-bar-item w3-right">Bool's Agence</span>
</div>

<!-- Sidebar/menu -->
<nav  class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;)" id="mySidebar"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s4">
            <img src="https://www.w3schools.com/w3images/avatar2.png" class="w3-circle w3-margin-right" style="width:46px">
        </div>
        <div class="w3-col s8 w3-bar">
            <span>Bienvenue, <strong><%= prenom %> <%= nom %></strong></span><br>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i></a>
            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-user"></i></a>
        </div>
    </div>
    <hr>
    <div class="w3-container">
        <h5>Mises à jour & Recherche</h5>
    </div>
    <div class="w3-bar-block">
        <a href="" class="w3-bar-item w3-button w3-padding w3-blue"><i class="fa fa-dashboard fa-fw"></i> Aperçu</a>
        <a href="AfficheVoitureUpdate.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-car fa-fw"></i> Mettre à jour une voiture</a>
        <a href="afficherClientMise_a_jour.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-users fa-fw"></i> Mettre à jour un client</a>
        <a href="afficherClient.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-search fa-fw"></i> Rechercher un client</a>
        <a href="AfficherVoiture.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-search fa-fw"></i> Rechercher une voiture</a>
        <a href="rechercheClient.jsp" class="w3-bar-item w3-button w3-padding"><i class="fa fa-search fa-fw"></i> Afficher Client louant une voiture</a>
    </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="Fermer le menu" id="myOverlay"></div>

<!-- PAGE CONTENT -->
<div class="w3-main" style="margin-left:300px;margin-top:43px;">

    <!-- Header -->
    <header class="w3-container" style="padding-top:22px">
        <h5 anim=""><b><i class="fa fa-dashboard" anim=""></i> Mon tableau de bord</b></h5>
    </header>

    <div class="w3-row-padding w3-margin-bottom">
        <div class="w3-quarter">
            <div class="w3-container w3-red w3-padding-16">
                <div class="w3-left"><i class="fa fa-car w3-xxxlarge"></i></div>
                <div class="w3-clear"></div>
                <a href="AjoutVoiture.jsp"><h4>Ajouter une voiture</h4></a>
            </div>
        </div>
        <div class="w3-quarter">
            <div class="w3-container w3-blue w3-padding-16">
                <div class="w3-left"><i class="fa fa-user-plus w3-xxxlarge"></i></div>
                <div class="w3-clear"></div>
                <a href="AjoutClient.jsp"><h4>Enregistrer un client</h4></a>
            </div>
        </div>
        <div class="w3-quarter">
            <div class="w3-container w3-teal w3-padding-16">
                <div class="w3-left"><i class="fa fa-handshake-o w3-xxxlarge"></i></div>
                <div class="w3-clear"></div>
                <a href="RechercherLOUER.jsp"><h4>Louer une voiture</h4></a>
            </div>
        </div>
        <div class="w3-quarter">
            <div class="w3-container w3-orange w3-text-white w3-padding-16">
                <div class="w3-left"><i class="fa fa-list-alt w3-xxxlarge"></i></div>
                <div class="w3-clear"></div>
      <a href="etatPARKING.jsp"><h4>État du parking</h4></a>
            </div>
        </div>
    </div>
    <hr>

    <div class="w3-row-padding w3-margin-bottom">
        <div class="w3-quarter">
            <div class="w3-container w3-teal w3-padding-16" style="background-color: #0f5132">
                <div class="w3-left"><i class="fa fa-undo w3-xxxlarge"></i></div>
                <div class="w3-clear"></div>
                <a href="Retour.jsp"><h4>Retour de voiture</h4></a>
            </div>
        </div>
        <div class="w3-quarter">
            <div class="w3-container w3-orange w3-text-white w3-padding-16">
                <div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
                <div class="w3-clear"></div>
                <a href="ListClientsServlet"><h4>Liste des clients</h4></a>
            </div>
        </div>
        <div class="w3-quarter">
            <div class="w3-container w3-red w3-padding-16">
                <div class="w3-left"><i class="fa fa-trash w3-xxxlarge"></i></div>
                <div class="w3-clear"></div>
                <a href="SuppressionVoiture.jsp"><h4>Supprimer une voiture</h4></a>
            </div>
        </div>
        <div class="w3-quarter">
            <div class="w3-container w3-blue w3-padding-16">
                <div class="w3-left"><i class="fa fa-user-times w3-xxxlarge"></i></div>
                <div class="w3-clear"></div>
                <a href="SuppressionClient.jsp"><h4>Supprimer un client</h4></a>
            </div>
        </div>
    </div>

    <br><br><br><br><br><br>
    <div class="w3-container w3-dark-grey w3-padding-32">
        <div class="w3-row">
            <div class="w3-container w3-third">
                <h5 class="w3-bottombar w3-border-green">Géolocalisation</h5>
                <p>Langue - Français</p>
                <p>Pays - Sénégal</p>
                <p>Ville - Diourbel</p>
            </div>
            <div class="w3-container w3-third">
                <h5 class="w3-bottombar w3-border-red">Système</h5>
                <p>Agence</p>
                <p>Gestion de voitures</p>
            </div>
            <div class="w3-container w3-third">
                <h5 class="w3-bottombar w3-border-blue">Contact - Support Technique</h5>
                <p>ablayefaye@gmail.com</p>
                <p>cn7061611@gmail.com</p>
            </div>
        </div>
    </div>

    <!-- End page content -->
</div>

<script>
    // Script to open and close sidebar
    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }
</script>

</body>
</html>
