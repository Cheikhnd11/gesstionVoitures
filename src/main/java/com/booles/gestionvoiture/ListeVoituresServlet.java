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

@WebServlet("/ListeVoituresServlet")
public class ListeVoituresServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public ListeVoituresServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Voiture> voitures = null;
        try {
            voitures = listeVoitures();
            request.setAttribute("voitures", voitures);
            request.getRequestDispatcher("listeVoitures.jsp").forward(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }

    }

    public List<Voiture> listeVoitures() throws SQLException {
        List<Voiture> voitures = new ArrayList<>();
        String sql = "SELECT * FROM Voiture";

        try (Connection connection = DataBase.getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

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
        return voitures;
    }
}
