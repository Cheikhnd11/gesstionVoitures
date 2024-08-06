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


@WebServlet("/RechercheVoitureLOUER")
public class RechercheVoitureLOUER extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RechercheVoitureLOUER() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String marque = request.getParameter("marque");
        int kilometrage = Integer.parseInt(request.getParameter("kilometrage"));
        String annee = request.getParameter("annee");
        String carburant = request.getParameter("carburant");
        String categorie = request.getParameter("categorie");

        List<Voiture> voitures = RechercherVoiture(marque, kilometrage, annee, carburant, categorie);
        request.setAttribute("voitures", voitures);
        request.getRequestDispatcher("afficheResulatVoitureLouer.jsp").forward(request, response);
    }

    public List<Voiture> RechercherVoiture(String marque, int kilometrage, String annee, String carburant, String categorie) {
        List<Voiture> voitures = new ArrayList<>();
        String sql = "SELECT * FROM Voiture WHERE marque = ? AND kilomeetrage = ? AND anneeDeMiseEnService = ? AND typeCarburant = ? AND categorie = ?";

        try (Connection connection = DataBase.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, marque);
            preparedStatement.setInt(2, kilometrage);
            preparedStatement.setString(3, annee);
            preparedStatement.setString(4, carburant);
            preparedStatement.setString(5, categorie);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    Voiture voiture = new Voiture();
                    voiture.setImmatriculation(resultSet.getString("Immatriculation"));
                    voiture.setNombreDePlace(resultSet.getInt("nombreDePlace"));
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
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return voitures;
    }
}
