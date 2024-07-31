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

@WebServlet("/RechercheVoitureByMatricule")
public class RechercheVoitureByMatricule extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(RechercheVoitureByMatricule.class.getName());

    public RechercheVoitureByMatricule() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String immatriculation = request.getParameter("matricule");

        if (immatriculation == null || immatriculation.trim().isEmpty()) {
            LOGGER.log(Level.WARNING, "L'immatriculation est manquante.");
            request.setAttribute("errorMessage", "L'immatriculation est manquante.");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
            return;
        }

        Voiture voiture = null;
        try {
            voiture = getVoitureByImmatriculation(immatriculation);
            if (voiture == null) {
                LOGGER.log(Level.INFO, "Voiture non trouvée pour l'immatriculation: {0}", immatriculation);
                request.setAttribute("errorMessage", "Voiture non trouvée.");
                request.getRequestDispatcher("Error.jsp").forward(request, response);
            } else {
                request.setAttribute("voiture", voiture);
                request.getRequestDispatcher("UpdateVoiture.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Erreur lors de la récupération de la voiture: {0}", e.getMessage());
            request.setAttribute("errorMessage", "Erreur lors de la récupération de la voiture: " + e.getMessage());
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }
    }

    private Voiture getVoitureByImmatriculation(String immatriculation) throws SQLException {
        String query = "SELECT * FROM Voiture WHERE immatriculation = ?";
        try (Connection con = DataBase.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, immatriculation);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Voiture voiture = new Voiture();
                    voiture.setImmatriculation(rs.getString("immatriculation"));
                    voiture.setNombreDePlace(rs.getInt("nombreDePlace"));
                    voiture.setMarque(rs.getString("marque"));
                    voiture.setModele(rs.getString("modele"));
                    voiture.setAnneeDeMiseEnService(rs.getString("anneeDeMiseEnService"));
                    voiture.setKilomeetrage(rs.getInt("kilomeetrage"));
                    voiture.setTypeCarburant(rs.getString("typeCarburant"));
                    voiture.setCategorie(rs.getString("categorie"));
                    voiture.setPrixDeLocationParJour((float) rs.getDouble("prixDeLocationParJour"));
                    return voiture;
                } else {
                    LOGGER.log(Level.INFO, "Aucune voiture trouvée pour l'immatriculation: {0}", immatriculation);
                    return null;
                }
            }
        } catch (SQLException e) {
            LOGGER.log(Level.SEVERE, "Erreur SQL lors de la récupération de la voiture pour l'immatriculation: {0}", immatriculation);
            throw e;
        }
    }
}
