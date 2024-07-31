<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Confirmation</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #e9ecef;
        }
        .container {
            background-color: white;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            text-align: center;
            max-width: 800px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        @keyframes glow {
            0% {
                text-shadow: 0 0 5px rgba(0, 255, 0, 0.5);
            }
            100% {
                text-shadow: 0 0 20px rgba(0, 255, 0, 1);
            }
        }

        [anim="glow"]:not(.toggled) {
            animation: glow 600ms infinite alternate;
        }

        .image-section {
            flex: 1;
            text-align: center;
            padding: 20px;
        }
        .image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
        }
        .content-section {
            flex: 2;
            padding: 20px;
        }
        .content-section h2 {
            color: #28a745;
            margin-bottom: 20px;
        }
        .content-section p {
            font-size: 1.2em;
            margin-bottom: 20px;
        }
        .content-section a {
            display: inline-block;
            padding: 10px 20px;
            color: #fff;
            background-color: #007bff;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .content-section a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="image-section">
        <!-- Remplacez le lien ci-dessous par le lien de votre image ou icône -->
        <img src="img/confirmation.jpg" alt="Confirmation Image">
    </div>
    <div class="content-section">
        <h2 anim="glow">Confirmation</h2>
        <p><c:out value="${message}"/></p>
        <a href="gestionnaire.jsp" anim="glow">Retour au tableau de bord</a>
    </div>
</div>

<script>
    let anims = [...document.querySelectorAll("[anim]")];
    console.log(anims);
    let click = (el, cb) => el.addEventListener("click", cb);
    let toggle = (el) => el.classList.toggle("toggled");
    let clickTog = (el) => click(el, () => toggle(el));
    anims.map(clickTog);
</script>
</body>
</html>
