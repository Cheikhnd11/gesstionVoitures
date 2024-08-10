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

@WebServlet("/RechercherVoitureByImtServlet")
public class RechercherVoitureByImtServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public RechercherVoitureByImtServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String voiture1 = request.getParameter("voiture");
        Voiture voiture = null;
       voiture=RechercherVoiture(voiture1);
        request.setAttribute("voiture", voiture);
        request.getRequestDispatcher("afficheResultatVoiture.jsp").forward(request, response);
    }

    public Voiture RechercherVoiture(String immatricalation) {
        Voiture voiture = null;
        String sql = "SELECT * FROM Voiture WHERE Immatriculation = ?";

        try (Connection connection = DataBase.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, immatricalation);

            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    voiture = new Voiture();
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
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return voiture;
    }
}
