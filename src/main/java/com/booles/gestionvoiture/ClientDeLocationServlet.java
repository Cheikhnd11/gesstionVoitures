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

@WebServlet("/ClientDeLocationServlet")
public class ClientDeLocationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ClientDeLocationServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String voiture = request.getParameter("idVoiture");
        String message;

        if (voiture == null || voiture.trim().isEmpty()) {
            out.println("<h3>Le numéro de la voiture ne peut pas être vide !</h3>");
            return;
        }

        Voiture voitureObj = returnVoiture(voiture);
        if (voitureObj == null) {
            message= "Aucune voiture de matricule " + voiture + " n'est trouvée dans la base de données !";
            request.setAttribute("message", message);
            request.getRequestDispatcher("confirmationClientLoc.jsp").forward(request, response);
        }

        if (voitureObj.getStatus().equals("disponible")) {
            message= "Cette voiture de matricule " + voiture + " n'est pas en location !";
            request.setAttribute("message", message);
            request.getRequestDispatcher("confirmationClientLoc.jsp").forward(request, response);;
        }

        Location location = retournerLocation(voiture);
        if (location == null) {
            message="Aucune location trouvée pour la voiture de matricule " + voiture +" !";
            request.setAttribute("message", message);
            request.getRequestDispatcher("confirmationClientLoc.jsp").forward(request, response);;
        }

        int clientId = location.getClient();
        Client clients = returnClient(clientId);
        if (clients == null) {
            out.println("<h3>Aucun client trouvé avec l'identifiant " + clientId + " !</h3>");
            return;
        }

        request.setAttribute("client", clients);
        request.getRequestDispatcher("afficheResultatclient.jsp").forward(request, response);
    }

    public Location retournerLocation(String idVoiture) {
        Location location = null;
        String query = "SELECT * FROM Location WHERE voiture = ?";
        try (Connection connection = DataBase.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, idVoiture);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    location = new Location();
                    location.setClient(resultSet.getInt("client"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération de la location", e);
        }
        return location;
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
                    voiture.setStatus(rs.getString("status"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération de la voiture", e);
        }
        return voiture;
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
                    client.setNom(rs.getString("nom"));
                    client.setPrenom(rs.getString("prenom"));
                    client.setTelephone(rs.getString("telephone"));
                    client.setEmail(rs.getString("email"));
                    client.setAdresse(rs.getString("adresse"));
                    client.setAge(rs.getInt("age"));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération du client", e);
        }
        return client;
    }
}
