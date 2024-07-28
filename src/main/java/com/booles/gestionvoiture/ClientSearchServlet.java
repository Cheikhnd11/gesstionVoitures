package com.booles.gestionvoiture;

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
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/ClientSearchServlet")
public class ClientSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ClientSearchServlet.class.getName());

    public ClientSearchServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String clientIdStr = request.getParameter("id");
        logger.log(Level.INFO, "Client ID received: {0}", clientIdStr);

        if (clientIdStr == null || clientIdStr.trim().isEmpty()) {
            logger.log(Level.WARNING, "Client ID is missing.");
            request.setAttribute("errorMessage", "Client ID is missing.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
            return;
        }

        Client client = null;
        try {
            int clientId = Integer.parseInt(clientIdStr);
            client = getClientById(clientId);
            if (client == null) {
                logger.log(Level.WARNING, "Client not found for ID: {0}", clientId);
                request.setAttribute("errorMessage", "Client not found.");
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            } else {
                logger.log(Level.INFO, "Client found: {0}", client);
                request.setAttribute("client", client);
                request.getRequestDispatcher("UpdateClient.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            logger.log(Level.SEVERE, "Invalid Client ID format: {0}", clientIdStr);
            request.setAttribute("errorMessage", "Invalid Client ID format.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error retrieving client", e);
            request.setAttribute("errorMessage", "Error retrieving client: " + e.getMessage());
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

    private Client getClientById(int clientId) throws SQLException {
        String query = "SELECT * FROM Client WHERE identifient = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            logger.log(Level.INFO, "Executing query to retrieve client with ID: {0}", clientId);
            ps.setInt(1, clientId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Client client = new Client();
                    client.setIdentifiant(rs.getInt("identifient"));
                    client.setNom(rs.getString("nom"));
                    client.setPrenom(rs.getString("prenom"));
                    client.setAge(rs.getInt("age"));
                    client.setEmail(rs.getString("email"));
                    client.setAdresse(rs.getString("adresse"));
                    client.setTelephone(rs.getString("telephone"));
                    logger.log(Level.INFO, "Client data retrieved: {0}", client);
                    return client;
                } else {
                    logger.log(Level.WARNING, "No client found for ID: {0}", clientId);
                    return null; // Client not found
                }
            }
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Error during database operation", e);
            throw e;
        }
    }
}
