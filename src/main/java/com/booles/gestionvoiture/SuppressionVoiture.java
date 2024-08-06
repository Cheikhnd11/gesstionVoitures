package com.booles.gestionvoiture;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/SuppressionVoiture")
public class SuppressionVoiture extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String voitureMatricule = request.getParameter("matricule");

        Voiture voiture = returnVoiture(voitureMatricule);
        if (voiture == null) {
            request.setAttribute("messageType", "error");
            request.setAttribute("message", "Oups! Cette voiture (" + voitureMatricule + ") n'est pas dans la base de données !");
        } else {
            try {
                deleteVoiture(voitureMatricule);
                request.setAttribute("messageType", "success");
                request.setAttribute("message", "Voiture supprimée avec succès !");
            } catch (SQLException e) {
                request.setAttribute("messageType", "error");
                request.setAttribute("message", "Erreur lors de la suppression de la voiture : " + e.getMessage());
            }
        }
        request.getRequestDispatcher("conf.jsp").forward(request, response);
    }

    private void deleteVoiture(String immatriculation) throws SQLException {
        String query = "DELETE FROM voiture WHERE Immatriculation = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, immatriculation);
            ps.executeUpdate();
        }
    }

    public Voiture returnVoiture(String idVoiture) {
        Voiture voiture = null;
        String query = "SELECT * FROM Voiture WHERE Immatriculation = ?";
        try (Connection connection = DataBase.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, idVoiture);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    voiture = new Voiture();
                    voiture.setMarque(rs.getString("marque"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return voiture;
    }
}

