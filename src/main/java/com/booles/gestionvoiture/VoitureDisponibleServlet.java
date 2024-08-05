package com.booles.gestionvoiture;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/VoitureDisponibleServlet")
public class VoitureDisponibleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public VoitureDisponibleServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Voiture> voitures = null;
        try {
            voitures = RechercherVoitureDisponibles();
            request.setAttribute("voitures", voitures);
            request.getRequestDispatcher("VoitureDIsponiblePARKING.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
    }

    public List<Voiture> RechercherVoitureDisponibles() throws SQLException {
        List<Voiture> voitures = new ArrayList<>();
        String sql = "SELECT * FROM Voiture WHERE status='disponible'";

        try (Connection connection = DataBase.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                Voiture voiture = new Voiture();
                voiture.setImmatriculation(resultSet.getString("Immatriculation"));
                voiture.setMarque(resultSet.getString("marque"));
                voiture.setModele(resultSet.getString("modele"));
                voiture.setKilomeetrage(resultSet.getInt("kilomeetrage"));
                voiture.setAnneeDeMiseEnService(resultSet.getString("anneeDeMiseEnService"));
                voiture.setTypeCarburant(resultSet.getString("typeCarburant"));
                voiture.setCategorie(resultSet.getString("categorie"));
                voiture.setPrixDeLocationParJour(resultSet.getInt("prixDeLocationParJour"));
                voiture.setStatus(resultSet.getString("status"));
                voitures.add(voiture);
            }
        }
        return voitures;
    }
}
