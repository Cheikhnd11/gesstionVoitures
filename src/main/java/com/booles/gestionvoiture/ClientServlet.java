package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ClientServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET request or redirect to POST
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int identifient = 0;
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        int age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String telephone = request.getParameter("telephone");

        try {
            identifient = retournerNombreClient() + 1;
            addNewClient(identifient, nom, prenom, age, email, adresse, telephone);
            request.setAttribute("message", "Client ajouté avec succès.");
            request.setAttribute("messageType", "success");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Erreur lors de l'ajout du client: " + e.getMessage());
            request.setAttribute("messageType", "error");
        }

        request.getRequestDispatcher("confirmationAjoutClient.jsp").forward(request, response);
    }


    private void addNewClient(int identifient, String nom, String prenom, int age, String email, String adresse, String telephone) throws SQLException {
        String query = "INSERT INTO Client (identifient, nom, prenom, age, email, adresse, telephone) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, identifient);
            ps.setString(2, nom);
            ps.setString(3, prenom);
            ps.setInt(4, age);
            ps.setString(5, email);
            ps.setString(6, adresse);
            ps.setString(7, telephone);
            ps.executeUpdate();
        }
    }
    public int retournerNombreClient() {
        int nombre = 0;
        String query = "SELECT COUNT(identifient) AS nombre FROM Client";

        try (Connection connection = DataBase.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            if (resultSet.next()) {
                nombre = resultSet.getInt("nombre");
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération du nombre de client: " + e.getMessage(), e);
        }

        return nombre;
    }
}
