package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/UpdateClientServlet")
public class UpdateClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UpdateClientServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int identifient = Integer.parseInt(request.getParameter("identifient"));
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            int age = Integer.parseInt(request.getParameter("age"));
            String email = request.getParameter("email");
            String adresse = request.getParameter("adresse");
            String telephone = request.getParameter("telephone");

            System.out.println("UpdateClientServlet: Received parameters:");
            System.out.println("identifiant: " + identifient);
            System.out.println("nom: " + nom);
            System.out.println("prenom: " + prenom);
            System.out.println("age: " + age);
            System.out.println("email: " + email);
            System.out.println("adresse: " + adresse);
            System.out.println("telephone: " + telephone);

            updateClient(identifient, nom, prenom, age, email, adresse, telephone);
            response.sendRedirect("Confirmation.jsp"); // Redirection après mise à jour
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error updating client: " + e.getMessage());
            request.getRequestDispatcher("UpdateClient.jsp").forward(request, response);
        }
    }

    private void updateClient(int identifient, String nom, String prenom, int age, String email, String adresse, String telephone) throws SQLException {
        String query = "UPDATE Client SET nom = ?, prenom = ?, age = ?, email = ?, adresse = ?, telephone = ? WHERE identifient = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, nom);
            ps.setString(2, prenom);
            ps.setInt(3, age);
            ps.setString(4, email);
            ps.setString(5, adresse);
            ps.setString(6, telephone);
            ps.setInt(7, identifient);

            int rowsAffected = ps.executeUpdate();
            System.out.println("UpdateClientServlet: Rows affected: " + rowsAffected);
            if (rowsAffected == 0) {
                System.out.println("UpdateClientServlet: No rows were updated. Check if the identifiant exists in the database.");
            }
        }
    }
}
