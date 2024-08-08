<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content />
    <meta name="author" content />
    <title>Ajouter un Client - Bool's Agence</title>
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
            <a class="navbar-brand" href="#">Bool's Agence</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item"><a class="nav-link" href="javascript:history.back()">Tableau de bord</a></li>

                </ul>
            </div>
        </div>
    </nav>
    <!-- Page content-->
    <section class="py-5">
        <div class="container px-5">
            <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                <div class="text-center mb-5">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-person-plus"></i></div>
                    <h1 class="fw-bolder">AJOUTER UN CLIENT</h1>
                    <p class="lead fw-normal text-muted mb-0">Saisissez les Informations ici !</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-8 col-xl-6">
                        <form action="ClientServlet" method="post">
                            <!-- Nom input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="text" name="nom" data-sb-validations="required" />
                                <label>Nom *</label>
                                <div class="invalid-feedback" data-sb-feedback="nom:required">Le nom est obligatoire</div>
                            </div>
                            <!-- Prenom input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="text" name="prenom" data-sb-validations="required" />
                                <label>Prénom *</label>
                                <div class="invalid-feedback" data-sb-feedback="prenom:required">Le prénom est obligatoire</div>
                            </div>
                            <!-- Age input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="number" name="age" data-sb-validations="required" />
                                <label>Âge *</label>
                                <div class="invalid-feedback" data-sb-feedback="age:required">L'âge est obligatoire</div>
                            </div>
                            <!-- Email input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="email" name="email" data-sb-validations="required" />
                                <label>Email *</label>
                                <div class="invalid-feedback" data-sb-feedback="email:required">L'email est obligatoire</div>
                            </div>
                            <!-- Adresse input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="text" name="adresse" data-sb-validations="required" />
                                <label>Adresse *</label>
                                <div class="invalid-feedback" data-sb-feedback="adresse:required">L'adresse est obligatoire</div>
                            </div>
                            <!-- Telephone input-->
                            <div class="form-floating mb-3">
                                <input class="form-control" type="tel" name="telephone" data-sb-validations="required" />
                                <label>Téléphone *</label>
                                <div class="invalid-feedback" data-sb-feedback="telephone:required">Le numéro de téléphone est obligatoire</div>
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
                    <p class="text-muted mb-0">Chattez en direct avec un de nos spécialistes de support.</p>
                </div>
                <div class="col">
                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-people"></i></div>
                    <div class="h5">Une multitude de fonctionnalités</div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="aff/js/scripts.js"></script>
<!-- SB Forms JS -->
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>
</html>
