<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 08/08/2024
  Time: 00:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur 404</title>
    <style>
        /*======================
        404 page
        =======================*/
        .page_404 {
            padding: 40px 0;
            background: #fff;
            font-family: "Arvo", serif;
        }

        .page_404 img {
            width: 100%;
        }

        .four_zero_four_bg {
            background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
            height: 400px;
            background-position: center;
        }

        .four_zero_four_bg h1 {
            font-size: 80px;
        }

        .four_zero_four_bg h3 {
            font-size: 80px;
        }

        .link_404 {
            color: #fff !important;
            padding: 10px 20px;
            background: #39ac31;
            margin: 20px 0;
            display: inline-block;
            text-decoration: none;
        }

        .contant_box_404 {
            margin-top: -50px;
        }

        .text-center {
            text-align: center;
        }
    </style>
</head>
<body>
<section class="page_404">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 text-center">
                <div class="four_zero_four_bg">
                    <h1 class="text-center">404</h1>
                </div>
                <div class="contant_box_404">
                    <h3 class="h2">
                        Il semble que vous soyez perdu
                    </h3>
                    <p>La page que vous recherchez n'est pas disponible !</p>
                    <a href="javascript:history.back()" class="link_404">page précedante</a>
                </div>
            </div>
        </div>
    </div>
</section>
</body>
</html>