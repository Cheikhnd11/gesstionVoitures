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

@WebServlet("/RevenuVoituresServlet")
public class RevenuVoituresServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Appel de la méthode pour obtenir les données
        List<RevenuVoiture> revenus = obtenirRevenusVoitures();
        List<RevenuClient> revenuClients=obtenirRevenusClients();

        float totalRevenue=retournerRevenue();
        // Ajout des données à la requête
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("revenuClients", revenuClients);
        request.setAttribute("revenus", revenus);

        // Transfert vers la JSP
        request.getRequestDispatcher("bilanFinancier.jsp").forward(request, response);
    }

    private List<RevenuVoiture> obtenirRevenusVoitures() {
        List<RevenuVoiture> revenus = new ArrayList<>();
        String sql = "SELECT v.immatriculation, SUM(l.montantTotal) AS revenuTotal " +
                "FROM location l " +
                "JOIN voiture v ON l.voiture = v.immatriculation " +
                "WHERE MONTH(l.dateDebut) = MONTH(CURRENT_DATE()) " +
                "AND YEAR(l.dateDebut) = YEAR(CURRENT_DATE()) " +
                "GROUP BY v.immatriculation";

        try (Connection connection = DataBase.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                String immatriculation = resultSet.getString("immatriculation");
                double revenuTotal = resultSet.getDouble("revenuTotal");
                revenus.add(new RevenuVoiture(immatriculation, revenuTotal));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return revenus;
    }
    public float retournerRevenue(){
        double totalRevenu = 0.0;
        String sql = "SELECT SUM(montantTotal) AS total_revenu FROM location WHERE MONTH(dateDebut) = MONTH(CURRENT_DATE()) AND YEAR(dateDebut) = YEAR(CURRENT_DATE())";
        try(Connection connection = DataBase.getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery()) {

            if(resultSet.next()){
                totalRevenu = resultSet.getDouble("total_revenu");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return (float) totalRevenu;
    }

    private List<RevenuClient> obtenirRevenusClients() {
        List<RevenuClient> revenus = new ArrayList<>();
        String sql = "SELECT client, SUM(montantTotal) AS revenuTotal " +
                "FROM location " +
                "WHERE MONTH(dateDebut) = MONTH(CURRENT_DATE()) " +
                "AND YEAR(dateDebut) = YEAR(CURRENT_DATE()) " +
                "GROUP BY client";

        try (Connection connection = DataBase.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql);
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                int clientId = resultSet.getInt("client");
                double revenuTotal = resultSet.getDouble("revenuTotal");
                revenus.add(new RevenuClient(clientId, revenuTotal));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return revenus;
    }

}
