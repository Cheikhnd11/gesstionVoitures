package com.booles.gestionvoiture;

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

@WebServlet("/RechercherClientServlet")
public class RechercherClientServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int identifient;
        try {
            identifient = Integer.parseInt(request.getParameter("clientId"));
        } catch (NumberFormatException e) {
            // Gérer le cas où l'ID n'est pas un entier valide
            request.setAttribute("error", "Identifiant client invalide.");
            request.getRequestDispatcher("afficherClient.jsp").forward(request, response);
            return;
        }

        Client client = null;
        try {
            client=RechercherClient(identifient);

           if (client != null) {
                request.setAttribute("client", client);
                request.getRequestDispatcher("afficheResultatclient.jsp").forward(request, response);
            } else {
                // Utilisateur non trouvé
                request.setAttribute("identifient", identifient);
                request.getRequestDispatcher("afficheResultatclient.jsp").forward(request, response);
            }
        } catch (IOException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Client RechercherClient(int idClient) throws SQLException {
        Client client = null;
        String sql = "SELECT * FROM Client WHERE identifient = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, idClient);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    client = new Client();
                    client.setIdentifient(rs.getInt("identifient"));
                    client.setNom(rs.getString("nom"));
                    client.setPrenom(rs.getString("prenom"));
                    client.setAge(rs.getInt("age"));
                    client.setEmail(rs.getString("email"));
                    client.setAdresse(rs.getString("adresse"));
                    client.setTelephone(rs.getString("telephone"));
                }
            }
        }
        return client;
    }

}
