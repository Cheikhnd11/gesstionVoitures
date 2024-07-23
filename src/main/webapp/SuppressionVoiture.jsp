<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Supprimer un Client</title>
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
            background-color: #f7f7f7;
        }
        .container {
            display: flex;
            background-color: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            max-width: 800px;
            width: 100%;
        }
        .image-section {
            flex: 1;
            text-align: center;
            padding: 20px;
            border-right: 3px solid #3498db;
        }
        .image-section img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
        }
        .form-section {
            flex: 2;
            padding: 20px;
        }
        .form-section h2 {
            color: #3498db;
            margin-bottom: 20px;
        }
        .field {
            margin-bottom: 15px;
        }
        .field label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .field input {
            width: 100%;
            padding: 10px;
            box-sizing: border-box;
            border: 2px solid #3498db;
            border-radius: 5px;
        }
        .field input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        .field input[type="submit"]:hover {
            background-color: #2980b9;
        }
        .result {
            margin-top: 20px;
            color: #ff5733;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-section">
        <h2>Supprimer un Client</h2>
        <form action="SupprimerVoiture" method="post">
            <div class="field">
                <label for="clientId">ID du Client :</label>
                <input type="text" id="clientId" name="matricule" required>
            </div>
            <div class="field">
                <input type="submit" value="Supprimer">
            </div>
        </form>
        <div id="result" class="result"></div>
    </div>
    <div class="image-section">
        <img src="img/del1.jpg" alt="Supprimer un Client">
    </div>
</div>
</body>
</html>
