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
        int identifient = Integer.parseInt(request.getParameter("identifient"));
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        int age = Integer.parseInt(request.getParameter("age"));
        String email = request.getParameter("email");
        String adresse = request.getParameter("adresse");
        String telephone = request.getParameter("telephone");

        try {
            addNewClient(identifient, nom, prenom, age, email, adresse, telephone);
            request.setAttribute("message", "Client added successfully");
        } catch (SQLException e) {
            // Log the exception and set error message
            e.printStackTrace();
            request.setAttribute("message", "Error adding client: " + e.getMessage());
        }

        // Forward to JSP page with message
        request.getRequestDispatcher("gestionnaire.jsp").forward(request, response);
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
}
