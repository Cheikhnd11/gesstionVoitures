<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html lang="en">

<head>
    <!-- Basic -->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <!-- Site Metas -->
    <title>Bienvenue - Bool's Automobile</title>

    <!-- Slider Stylesheet -->
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="acc/css/bootstrap.css" />

    <!-- Fonts style -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,700&display=swap" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="acc/css/style.css" rel="stylesheet" />
    <!-- Responsive style -->
    <link href="acc/css/responsive.css" rel="stylesheet" />
</head>

<body>
<div class="hero_area">
    <!-- Header section starts -->
    <header class="header_section">
        <div class="container-fluid">
            <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
                <a class="navbar-brand" href="index.html">
                    <span>Bool's Automobile</span>
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <div class="d-flex ml-auto flex-column flex-lg-row align-items-center">
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link" href="login.jsp">Account</a>
                            </li>
                        </ul>
                        <div class="user_option">
                            <a href="login.jsp">
                                <img src="acc/images/user.png" alt="User">
                            </a>
                            <form class="form-inline my-2 my-lg-0 ml-0 ml-lg-4 mb-3 mb-lg-0">
                                <button class="btn my-2 my-sm-0 nav_search-btn" type="submit"></button>
                            </form>
                        </div>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!-- End header section -->

    <!-- Slider section -->
    <section class="slider_section position-relative">
        <div class="container">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row">
                            <div class="col">
                                <div class="detail-box">
                                    <h2>Welcome to</h2>
                                    <h1>Bool's Automobile</h1>
                                    <p>Explorez notre vaste sélection de véhicules de qualité supérieure, adaptés à tous vos besoins de transport.</p>

                                    <a href="login.jsp">Connexion</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col">
                                <div class="detail-box">
                                    <h2>Dalal Jam si</h2>
                                    <h1>Bool's Automobile</h1>
                                    <p>Profitez de nos offres spéciales sur la location de voitures et découvrez le confort et la sécurité de nos services.</p>

                                    <a href="login.jsp">Connexion</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col">
                                <div class="detail-box">
                                    <h2>Bienvenue sur</h2>
                                    <h1>Bool's Automobile</h1>
                                    <p>Chez Bool's Automobile, nous nous engageons à offrir un service client exceptionnel et des voitures de location fiables.</p>

                                    <a href="login.jsp">Connexion</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End slider section -->
</div>

<!-- Who we are section -->
<section class="who_section">
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="img-box">
                    <img src="acc/images/who-img.jpg" alt="Who We Are">
                </div>
            </div>
            <div class="col-md-7">
                <div class="detail-box">
                    <div class="heading_container">
                        <h2>Que Dois-je faire?</h2>
                    </div>
                    <p>Pour pouvoir acceder aux différent tableaux de bord veuillez vous connecter avec les identifie qui vous a etais fournit par le support technique</p>
                    <a href="#">En Savoir Plus</a>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End who we are section -->

<!-- Contact section -->
<section class="contact_section layout_padding">
    <div class="container">
        <div class="heading_container">
            <h2>Contact le Service Technique</h2>
        </div>
        <div class="contact-form">
            <form action="#">
                <div>
                    <input type="text" placeholder="Full Name">
                </div>
                <div>
                    <input type="text" placeholder="Phone Number">
                </div>
                <div>
                    <input type="email" placeholder="Email Address">
                </div>
                <div>
                    <textarea placeholder="Message" class="input_message"></textarea>
                </div>
                <div class="d-flex justify-content-center">
                    <button type="submit" class="btn_on-hover">Envoyer</button>
                </div>
            </form>
        </div>
        <div class="map_img-box">
            <img src="img/pngegg.png" alt="Map">
        </div>
    </div>
</section>
<!-- End contact section -->

<!-- Info section -->
<section class="info_section">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="info_contact">
                    <h5>Bool's Agence</h5>
                    <div>
                        <img src="acc/images/location-white.png" width="18px" alt="Location">
                        <p>Diourbel - Sénégal</p>
                    </div>
                    <div>
                        <img src="acc/images/telephone-white.png" width="12px" alt="Telephone">
                        <p>78 013 39 45 / 78 171 71 98</p>
                    </div>
                    <div>
                        <img src="acc/images/envelope-white.png" width="18px" alt="Email">
                        <p>BoolVoiture@gmail.com</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="info_info">
                    <h5>Informations</h5>
                    <p>Pour tous question merci de contacter le service technique qui est en disposition h24.</p>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- End info section -->

<!-- Footer section -->
<section class="container-fluid footer_section">
    <p>&copy; 2024 All Rights Reserved By Bool's Agence - UASZ</p>
</section>
<!-- End footer section -->

<!-- JS scripts -->
<script src="acc/js/jquery-3.4.1.min.js"></script>
<script src="acc/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script>
    $(".owl-carousel").owlCarousel({
        loop: true,
        margin: 0,
        navText: [],
        center: true,
        autoplay: true,
        autoplayHoverPause: true,
        responsive: {
            0: {
                items: 1
            },
            1000: {
                items: 3
            }
        }
    });
</script>
</body>

</html>
