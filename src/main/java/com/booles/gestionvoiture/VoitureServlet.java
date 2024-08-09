package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet("/VoitureServlet")
public class VoitureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public VoitureServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String immatriculation = request.getParameter("Immatriculation");
        String nbPlaceStr = request.getParameter("Nb_place");
        String marque = request.getParameter("marque");
        String modele = request.getParameter("modele");
        String anneeDeMiseEnService = request.getParameter("anneeDeMiseEnService");
        String kilometrageStr = request.getParameter("kilomeetrage");
        String typeCarburant = request.getParameter("typeCarburant");
        String categorie = request.getParameter("categorie");
        String prixDeLocationParJourStr = request.getParameter("prixDeLocationParJour");
        String status = request.getParameter("status");

        String message = "";
        String messageType = "success"; // Default message type
        String redirectPage = "confirmationAjoutVoiture.jsp"; // Page de confirmation

        try {
            if (immatriculation == null || marque == null || modele == null ||
                    nbPlaceStr == null || kilometrageStr == null || typeCarburant == null ||
                    categorie == null || prixDeLocationParJourStr == null) {
                throw new IllegalArgumentException("Tous les paramètres sont requis.");
            }

            int nbPlace = Integer.parseInt(nbPlaceStr);
            int kilometrage = Integer.parseInt(kilometrageStr);
            double prixDeLocationParJour = Double.parseDouble(prixDeLocationParJourStr);

            Voiture voiture = returnVoiture(immatriculation);
            if (voiture != null) {
                message = "La voiture de matricule: " + immatriculation + " existe déjà dans l'entreprise!";
                messageType = "error"; // Set message type to error
            } else {
                addNewVoiture(immatriculation, nbPlace, marque, modele, anneeDeMiseEnService, kilometrage, typeCarburant, categorie, prixDeLocationParJour, status);
                message = "La voiture a été ajoutée avec succès.";
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            message = "Format de nombre invalide : " + e.getMessage();
            messageType = "error"; // Set message type to error
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            message = "Paramètres manquants ou invalides : " + e.getMessage();
            messageType = "error"; // Set message type to error
        } catch (SQLException e) {
            e.printStackTrace();
            message = "Erreur lors de l'ajout de la voiture : " + e.getMessage();
            messageType = "error"; // Set message type to error
        }

        request.setAttribute("message", message);
        request.setAttribute("messageType", messageType);
        request.getRequestDispatcher(redirectPage).forward(request, response);
    }

    private void addNewVoiture(String immatriculation, int nbPlace, String marque, String modele, String anneeDeMiseEnService, int kilometrage, String typeCarburant, String categorie, double prixDeLocationParJour, String status) throws SQLException {
        String query = "INSERT INTO Voiture (Immatriculation, nombreDePlace, marque, modele, anneeDeMiseEnService, kilomeetrage, typeCarburant, categorie, prixDeLocationParJour, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DataBase.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, immatriculation);
            ps.setInt(2, nbPlace);
            ps.setString(3, marque);
            ps.setString(4, modele);
            ps.setString(5, anneeDeMiseEnService);
            ps.setInt(6, kilometrage);
            ps.setString(7, typeCarburant);
            ps.setString(8, categorie);
            ps.setDouble(9, prixDeLocationParJour);
            ps.setString(10, status);
            ps.executeUpdate();
        }
    }

    private Voiture returnVoiture(String idVoiture) {
        Voiture voiture = null;
        String query = "SELECT * FROM Voiture WHERE Immatriculation = ?";
        try (Connection connection = DataBase.getConnection();
             PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, idVoiture);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    voiture = new Voiture();
                    voiture.setMarque(rs.getString("marque"));
                    // You can set other fields if needed
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return voiture;
    }
}
