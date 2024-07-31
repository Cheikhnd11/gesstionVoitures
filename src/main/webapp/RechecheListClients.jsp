<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 30/07/2024
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Listes des clients</title>
</head>
<body>
    <fieldset>
        <legend>Recherche d'un client</legend>
    <form action="ListClientsServlet" method="post">

        for="identifient" > Identifiant</label>
        <input type="number" name="identifiant" autofocus required>
        <input type="submit" value="">
    </form>
    </fieldset>
</body>
</html>
