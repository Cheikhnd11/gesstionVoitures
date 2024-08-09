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

@WebServlet("/SuppressionGestionnaireServlet")
public class SuppressionGestionnaireServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public SuppressionGestionnaireServlet() {
        super();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        supprimeGestionnaire(id);
        request.getRequestDispatcher("confirmationSupGestionnaire.jsp").forward(request, response);
    }

    public void supprimeGestionnaire(int id){
        String query="delete from Utilisateur where identifient= ?";
        try(Connection connection=DataBase.getConnection();
        PreparedStatement preparedStatement=connection.prepareStatement(query)){
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
