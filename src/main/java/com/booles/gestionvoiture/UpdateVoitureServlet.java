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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Date;

@WebServlet("/UpdateVoitureServlet")
public class UpdateVoitureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(UpdateVoitureServlet.class.getName());
    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");

    public UpdateVoitureServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String immatriculation = request.getParameter("immatriculation");
        String nombreDePlaceStr = request.getParameter("nombreDePlace");
        String marque = request.getParameter("marque");
        String modele = request.getParameter("modele");
        String anneeDeMiseEnServiceStr = request.getParameter("anneeDeMiseEnService");
        String kilometrageStr = request.getParameter("kilometrage");
        String typeCarburant = request.getParameter("typeCarburant");
        String categorie = request.getParameter("categorie");
        String prixDeLocationParJourStr = request.getParameter("prixDeLocationParJour");

        try {
            int nombreDePlace = Integer.parseInt(nombreDePlaceStr);
            // Conversion de l'année en date complète
            Date anneeDeMiseEnService = new Date(DATE_FORMAT.parse(anneeDeMiseEnServiceStr + "-01-01").getTime());
            int kilometrage = Integer.parseInt(kilometrageStr);
            double prixDeLocationParJour = Double.parseDouble(prixDeLocationParJourStr);

            updateVoiture(immatriculation, nombreDePlace, marque, modele, anneeDeMiseEnService, kilometrage, typeCarburant, categorie, prixDeLocationParJour);
            LOGGER.log(Level.INFO, "Voiture avec immatriculation {0} mise à jour avec succès.", immatriculation);
            response.sendRedirect("Confirmation.jsp");
        } catch (NumberFormatException e) {
            LOGGER.log(Level.WARNING, "Erreur de format de nombre: {0}", e.getMessage());
            request.setAttribute("errorMessage", "Erreur lors de la mise à jour de la voiture: " + e.getMessage());
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } catch (ParseException e) {
            LOGGER.log(Level.WARNING, "Erreur de format de date: {0}", e.getMessage());
            request.setAttribute("errorMessage", "Erreur lors de la mise à jour de la voiture: " + e.getMessage());
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Erreur SQL lors de la mise à jour de la voiture: {0}", e.getMessage());
            request.setAttribute("errorMessage", "Erreur lors de la mise à jour de la voiture: " + e.getMessage());
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

    private void updateVoiture(String immatriculation, int nombreDePlace, String marque, String modele, Date anneeDeMiseEnService, int kilomeetrage, String typeCarburant, String categorie, double prixDeLocationParJour) throws SQLException {
        String query = "UPDATE Voiture SET nombreDePlace = ?, marque = ?, modele = ?, anneeDeMiseEnService = ?, kilomeetrage = ?, typeCarburant = ?, categorie = ?, prixDeLocationParJour = ? WHERE immatriculation = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, nombreDePlace);
            ps.setString(2, marque);
            ps.setString(3, modele);
            ps.setDate(4, anneeDeMiseEnService);
            ps.setInt(5, kilomeetrage);
            ps.setString(6, typeCarburant);
            ps.setString(7, categorie);
            ps.setDouble(8, prixDeLocationParJour);
            ps.setString(9, immatriculation);
            ps.executeUpdate();
            LOGGER.log(Level.INFO, "Exécution de la mise à jour SQL réussie pour la voiture avec immatriculation: {0}", immatriculation);
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Erreur lors de l'exécution de la mise à jour SQL pour l'immatriculation: {0}", immatriculation);
            throw e;
        }
    }
}
