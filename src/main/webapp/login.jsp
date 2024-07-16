<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
</head>
<body>
<form action="LoginServlet" method="post">
  <label for="email">Email:</label>
  <input type="email" name="email" id="email" required><br><br>
  <label for="password">password:</label>
  <input type="password" name="password" id="password" required><br><br>
  <input type="submit" value="Envoyer">
</form>
</body>
</html>
