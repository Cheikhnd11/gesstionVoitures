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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/SupprimerClientServlet")
public class SupprimerClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SupprimerClientServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int clientIdParam = Integer.parseInt(request.getParameter("clientId"));
        Client client = null;
        client=returnClient(clientIdParam);

        if (client == null) {
            request.setAttribute("messageType", "error");
            request.setAttribute("message","Ops! Ce client n'existe pas dans la base!");
        }else {
            try {
                deleteClient(clientIdParam);
                request.setAttribute("messageType", "success");
                request.setAttribute("message", "Client supprimée avec succès !");
            } catch (SQLException e) {
                request.setAttribute("messageType", "error");
                request.setAttribute("message", "Erreur lors de la suppression du client : " + e.getMessage());
            }
        }
        request.getRequestDispatcher("confirmationSupClient.jsp").forward(request, response);

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
    public Client returnClient(int idClient) {
        Client client = null;
        String query = "SELECT * FROM Client WHERE identifient = ?";
        try (Connection connection = DataBase.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, idClient);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    client = new Client();
                    client.setIdentifiant(rs.getInt("identifient"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération du client", e);
        }
        return client;
    }
}
