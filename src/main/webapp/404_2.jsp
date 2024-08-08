<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 08/08/2024
  Time: 00:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>error</title>
</head>
<style>
    /*======================
    404 page
=======================*/


    .page_404{ padding:40px 0; background:#fff; font-family: 'Arvo', serif;
    }

    .page_404  img{ width:100%;}

    .four_zero_four_bg{

        background-image: url(https://cdn.dribbble.com/users/722246/screenshots/3066818/404-page.gif);
        height: 650px;
        background-position: center;
    }


    .four_zero_four_bg h1{
        font-size:80px;
    }

    .four_zero_four_bg h3{
        font-size:80px;
    }

    .link_404{
        color: #fff!important;
        padding: 10px 20px;
        background: #39ac31;
        margin: 20px 0;
        display: inline-block;}
    .contant_box_404{ margin-top:-50px;}
</style>
<body>
<section class="page_404">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 ">
                <div class="col-sm-10 col-sm-offset-1  text-center">
                    <div class="four_zero_four_bg">



                    </div>

                    <div class="contant_box_404">
                        <h3 class="h2">
                            la page est introuvable
                        </h3>

                        <p>veuillez bien reverifier votre saisie</p>

                        <a href="javascript:history.back()" class="link_404">Go to Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
