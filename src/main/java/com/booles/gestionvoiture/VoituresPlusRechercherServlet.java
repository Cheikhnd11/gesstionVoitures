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
import java.util.ArrayList;
import java.util.List;

@WebServlet("/VoituresPlusRechercherServlet")
public class VoituresPlusRechercherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public VoituresPlusRechercherServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Voiture> voitures = obtenirVoituresRecherchees();
        request.setAttribute("voitures", voitures);
        request.getRequestDispatcher("voituresRecherchees.jsp").forward(request, response);
    }

    public List<Voiture> obtenirVoituresRecherchees() {
        List<Voiture> voitures = new ArrayList<>();
        String query = "SELECT * FROM Voiture ORDER BY nombreRecherche DESC";
        try (Connection connection = DataBase.getConnection();
             PreparedStatement ps = connection.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Voiture voiture = new Voiture();
                voiture.setImmatriculation(rs.getString("Immatriculation"));
                voiture.setNombreRecherche(rs.getInt("nombreRecherche"));
                voiture.setNombreDePlace(rs.getInt("nombreDePlace"));
                voiture.setMarque(rs.getString("marque"));
                voiture.setModele(rs.getString("modele"));
                voiture.setKilomeetrage(rs.getInt("kilomeetrage"));
                voiture.setAnneeDeMiseEnService(rs.getString("anneeDeMiseEnService"));
                voiture.setTypeCarburant(rs.getString("typeCarburant"));
                voiture.setCategorie(rs.getString("categorie"));
                voiture.setPrixDeLocationParJour(rs.getInt("prixDeLocationParJour"));
                voiture.setStatus(rs.getString("status"));
                voitures.add(voiture);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Erreur lors de la récupération des voitures les plus recherchées", e);
        }
        return voitures;
    }
}
