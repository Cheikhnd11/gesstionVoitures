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

@WebServlet("/SupprimerClientServlet")
public class SupprimerClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SupprimerClientServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String clientIdParam = request.getParameter("clientId");

        if (clientIdParam != null && !clientIdParam.isEmpty()) {
            try {
                int clientId = Integer.parseInt(clientIdParam);
                boolean success = deleteClient(clientId);

                if (success) {
                    // Rediriger vers confirmation.jsp
                    request.setAttribute("message", "Client supprimé avec succès");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/Confirmation.jsp");
                    dispatcher.forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Client non trouvé");
                }
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Format d'identifiant invalide");
            } catch (SQLException e) {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur de base de données: " + e.getMessage());
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Identifiant du client requis");
        }
    }

    private boolean deleteClient(int identifiant) throws SQLException {
        String query = "DELETE FROM Client WHERE identifient = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, identifiant);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        }
    }
}
