package com.booles.gestionvoiture;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/SupprimerVoiture")
public class SuppressionVoiture extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String voitureMatricule = request.getParameter("matricule");

        if (voitureMatricule != null && !voitureMatricule.isEmpty()) {
            try {
                boolean success = deleteVoiture(voitureMatricule);

                if (success) {
                    // Rediriger vers confirmation.jsp
                    request.setAttribute("message", "Voiture supprimée avec succès");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/Confirmation.jsp");
                    dispatcher.forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Voiture non trouvée");
                }
            } catch (SQLException e) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur de base de données: " + e.getMessage());
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Immatriculation de la voiture requise");
        }
    }

    private boolean deleteVoiture(String immatriculation) throws SQLException {
        String query = "DELETE FROM voiture WHERE Immatriculation = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, immatriculation);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }
}
