<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 17/07/2024
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content />
    <meta name="author" content />
    <title>Ajouter une Voiture - Bool's Agence</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="aff/assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="aff/css/styles.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
    <!-- Navigation-->
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
    <!-- Page content-->
    <section class="py-5">
        <div class="container px-5">
            <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                <div class="text-center mb-5">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-car-front"></i></div>
                    <h1 class="fw-bolder">Ajouter une Voiture</h1>
                    <p class="lead fw-normal text-muted mb-0">Veuillez saisir les informations de la voiture ci-dessous</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6">
                        <form action="VoitureServlet" method="post">
                            <!-- Immatriculation input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="text" name="Immatriculation" required placeholder="Immatriculation" />
                                <label><i class="bi bi-car-front"></i> Immatriculation *</label>
                                <div class="invalid-feedback">L'immatriculation est obligatoire</div>
                            </div>

                            <!-- Immatriculation input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="number" name="Nb_place" required placeholder="Immatriculation" />
                                <label><i class="bi bi-car-front"></i> Nombre de place *</label>
                                <div class="invalid-feedback">Le Nombre de place est obligatoire</div>
                            </div>
                            <!-- Marque input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="text" name="marque" required placeholder="Marque" />
                                <label><i class="bi bi-tag"></i> Marque *</label>
                                <div class="invalid-feedback">La marque est obligatoire</div>
                            </div>
                            <!-- Modèle input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="text" name="modele" required placeholder="Modèle" />
                                <label><i class="bi bi-car-front"></i> Modèle *</label>
                                <div class="invalid-feedback">Le modèle est obligatoire</div>
                            </div>
                            <!-- Année de mise en service input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="date" name="anneeDeMiseEnService" required placeholder="Année de Mise en Circulation" />
                                <label><i class="bi bi-calendar3"></i> Année de Mise en Circulation *</label>
                                <div class="invalid-feedback">L'année de mise en circulation est obligatoire</div>
                            </div>
                            <!-- Kilométrage input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="number" name="kilomeetrage" required placeholder="Kilométrage" />
                                <label><i class="bi bi-speedometer2"></i> Kilométrage *</label>
                                <div class="invalid-feedback">Le kilométrage est obligatoire</div>
                            </div>
                            <!-- Type de carburant input-->
                            <div class="form-floating mb-3">
                                <select class="form-control" name="typeCarburant" required>
                                    <option value="">Type de Carburant</option>
                                    <option value="Essence">Essence</option>
                                    <option value="Diesel">Diesel</option>
                                    <option value="Electrique">Électrique</option>
                                    <option value="Hybride">Hybride</option>
                                </select>
                                <label><i class="bi bi-fuel-pump"></i> Type de Carburant *</label>
                                <div class="invalid-feedback">Le type de carburant est obligatoire</div>
                            </div>
                            <!-- Catégorie input-->
                            <div class="form-floating mb-3">
                                <select class="form-control" name="categorie" required>
                                    <option value="">Catégorie</option>
                                    <option value="Citadine">Citadine</option>
                                    <option value="Berline">Berline</option>
                                    <option value="SUV">SUV</option>
                                    <option value="Utilitaire">Utilitaire</option>
                                </select>
                                <label><i class="bi bi-list"></i> Catégorie *</label>
                                <div class="invalid-feedback">La catégorie est obligatoire</div>
                            </div>
                            <!-- Prix de location par jour input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="number" name="prixDeLocationParJour" required placeholder="Prix de Location par Jour" />
                                <label><i class="bi bi-currency-dollar"></i> Prix de Location par Jour *</label>
                                <div class="invalid-feedback">Le prix de location par jour est obligatoire</div>
                            </div>
                            <!-- Statut en location input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="text" name="status" required placeholder="Statut en Location" value="disponible" />
                                <label><i class="bi bi-info-circle"></i> Statut en Location *</label>
                                <div class="invalid-feedback">Le statut en location est obligatoire</div>
                            </div>
                            <!-- Submit button-->
                            <div class="d-grid"><button class="btn btn-primary btn-lg" type="submit">Ajouter</button></div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Contact cards-->
            <div class="row gx-5 row-cols-2 row-cols-lg-4 py-5">
                <div class="col">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-chat-dots"></i></div>
                    <div class="h5 mb-2">Support</div>
                    <p class="text-muted mb-0">Chat en direct avec un de nos spécialistes de support.</p>
                </div>
                <div class="col">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-people"></i></div>
                    <div class="h5">Fonctionnalités</div>
                    <p class="text-muted mb-0">Explorez toutes les fonctionnalités de Bool's Agence.</p>
                </div>
                <div class="col">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-question-circle"></i></div>
                    <div class="h5">Support Technique</div>
                    <p class="text-muted mb-0">Pour tout problème, veuillez contacter le service technique.</p>
                </div>
                <div class="col">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-telephone"></i></div>
                    <div class="h5">Téléphone :</div>
                    <p class="text-muted mb-0">78-013-39-45</p>
                    <p class="text-muted mb-0">78-171-71-98</p>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- Footer-->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Bool's Agence 2024</div></div>
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
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="aff/js/scripts.js"></script>
</body>
</html>
