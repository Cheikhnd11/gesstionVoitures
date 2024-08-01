<%--
  Created by IntelliJ IDEA.
  User: fayea
  Date: 01/08/2024
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>s
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parking Voitures</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #333;
            color: white;
            padding: 1rem 0;
            text-align: center;
        }

        main {
            padding: 2rem;
        }

        .cars {
            margin-bottom: 2rem;
        }

        .cars h2 {
            border-bottom: 2px solid #333;
            padding-bottom: 0.5rem;
        }

        .car-container {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
            margin-top: 1rem;
        }

        .car {
            background-color: white;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: calc(70% - 1rem); /* Augmentez la largeur à 50% */
            text-align: center;
            padding: 2rem; /* Augmentez le rembourrage */
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
        }

        .car img {
            max-width: 100%;
            height: auto;
            border-bottom: 1px solid #ddd;
            margin-bottom: 1rem;
        }

        .car h3 {
            margin: 0.5rem 0;
        }

        .car p {
            margin: 0.5rem 0;
            color: #555;
        }

        .car i {
            font-size: 3rem;
            position: absolute;
            bottom: 1rem;
            right: 1rem;
            animation: move 2s infinite;
        }

        .rented {
            border-left: 4px solid #e74c3c;
            background-color: #ffefef;
        }

        .available {
            border-left: 4px solid #2ecc71;
            background-color: #effff4;
        }

        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 1rem 0;
            position: absolute;
            width: 100%;
            bottom: 0;
        }

        @keyframes move {
            0%, 100% {
                transform: translateX(0);
            }
            50% {
                transform: translateX(10px);
            }
        }
    </style>
</head>
<body>
<header>
    <h1>Voiture dans le PARKING</h1>
</header>
<main>
    <section class="cars">
        <h2>Voiture</h2>
        <div class="car-container rented">
            <c:forEach var="voiture" items="${voitures}">
                <c:if test="${voiture.status == 'disponibles'}">
                    <div class="car rented">
                        <h3>Marque: <c:out value="${voiture.marque}"/></h3>
                        <p>Modèle: <c:out value="${voiture.modele}"/></p>
                        <p>Immatriculation: <c:out value="${voiture.immatriculation}"/></p>
                        <p>Type de carburant: <c:out value="${voiture.typeCarburant}"/></p>
                        <p>Prix par jour: <c:out value="${voiture.prixDeLocationParJour}"/> €</p>
                        <i class="fa fa-car"></i>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </section>

</main>
<footer>
    <p>&copy; 2024 Gestion de Parking. Tous droits réservés.</p>
</footer>
<script>
    document.querySelectorAll('.car').forEach(car => {
        car.addEventListener('mouseover', () => {
            car.style.transform = 'scale(1.05)';
            car.style.boxShadow = '0 10px 20px rgba(0, 0, 0, 0.2)';
        });
        car.addEventListener('mouseout', () => {
            car.style.transform = 'scale(1)';
            car.style.boxShadow = '0 2px 4px rgba(0, 0, 0, 0.1)';
        });
    });
</script>
</body>
</html>
