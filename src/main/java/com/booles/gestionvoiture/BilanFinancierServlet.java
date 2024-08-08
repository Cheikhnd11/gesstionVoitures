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

@WebServlet("/BilanFinancierServlet")
public class BilanFinancierServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public BilanFinancierServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        float totalRevenue=retournerRevenue();
        request.setAttribute("totalRevenue", totalRevenue);
        request.getRequestDispatcher("bilanFinancier.jsp").forward(request, response);

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

}
