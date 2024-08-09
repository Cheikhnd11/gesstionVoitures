package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/CreatGestionnaireServlet")
public class CreatGestionnaireServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CreatGestionnaireServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int identifiant;
        String psw = request.getParameter("password");
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        int age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String role = request.getParameter("role");

        identifiant = retournerNombreUtilisateur() + 1;

        try {
            ajouterGestionnaire(identifiant, nom, prenom, age, email, adresse, role,psw);
            // Redirection vers la page de confirmation après ajout réussi
            response.sendRedirect("confirmationGestionnaire.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Erreur lors de l'ajout du gestionnaire : " + e.getMessage());
            request.getRequestDispatcher("errorPage.jsp").forward(request, response);
        }
    }

    public void ajouterGestionnaire(int identifiant, String nom, String prenom, int age, String email, String adresse, String role, String psw) throws SQLException {
        String query = "INSERT INTO Utilisateur VALUES(?,?,?,?,?,?,?,?)";
        try (Connection connection = DataBase.getConnection();
             PreparedStatement pst = connection.prepareStatement(query)) {
            pst.setInt(1, identifiant);
            pst.setString(2, nom);
            pst.setString(3, prenom);
            pst.setInt(4, age);
            pst.setString(5, email);
            pst.setString(6, adresse);
            pst.setString(7, role);
            pst.setString(8,psw );
            pst.executeUpdate();
        }
    }

    public int retournerNombreUtilisateur() {
        int nombre = 0;
        String query = "SELECT COUNT(identifient) AS nombre FROM Utilisateur";

        try (Connection connection = DataBase.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            if (resultSet.next()) {
                nombre = resultSet.getInt("nombre");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération du nombre de clients: " + e.getMessage(), e);
        }

        return nombre;
    }
}
